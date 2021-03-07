Include (Ensemble, EnsUI)

Class CHUBXL.MET.GeneralMetric Extends Ens.BusinessMetric [ ClassType = "", ProcedureBlock ]
{

/// état du job surveillé
Property state As Ens.DataType.Metric(UNITS = "State");

/// état du job surveillé ( numérique )
/// 0 - erreur 1 - Retry ou Disabled 2 - OK
Property numState As Ens.DataType.Metric(UNITS = "State");

/// mémorise le dernier état reconnu
Property lastState As Ens.DataType.Metric(UNITS = "State");

/// mémorise le $H du précédent état au format odbc
Property lastStateTS As %TimeStamp;

/// Délai en secondes avant l'envoi d'une alerte
Property delay As Ens.DataType.Metric(UNITS = "Seconds");

/// Secondes entre le format zts et $h
Property ztsDiff As %Integer;

Property connectionName As Ens.DataType.Metric(UNITS = "Name");

Property lastActivity As Ens.DataType.Metric(UNITS = "Date/Time");

Property lastMessageReceived As Ens.DataType.Metric(UNITS = "Date/Time");

Property lastMessageInterval As Ens.DataType.Metric(UNITS = "Date/Time");

/// How many seconds spent since last msg sent/received 
Property lastActivityInterval As Ens.DataType.Metric(UNITS = "Date/Time");

/// How many message treated since last bs/BO start
Property messageTotal As Ens.DataType.Metric(UNITS = "Messages");

/// How many message in queue
Property queueTotal As Ens.DataType.Metric(UNITS = "Messages");

ClassMethod OnGetInstances(ByRef pInstSet As %String) As %Status
{
	k pInstSet
	s prodName=$$$EnsRuntime("Name")
	
	s sc=..GetProcessNames(prodName,.Names)
	s k=$O(Names(""))
	while (k'="") {
		Set pInstSet($i(pInstSet)) = k
		s k=$O(Names(k))
	}
   	
	Quit $$$OK
}

/// Renvoie un array mumps contenant les noms à surveiller pour une production
ClassMethod GetProcessNames(productionName As %String, Output Names As %Binary) As %Status
{
	s sc=""
	k Names
	s prod=##class(Ens.Config.Production).%OpenId(productionName,-1,.sc)
	q:prod="" sc
	for i=1:1:prod.Items.Count() {
		s tItem=prod.Items.GetAt(i)
		if ((tItem.ClassName'=..%ClassName(1))&&(tItem.ClassName'="EnsLib.MsgRouter.RoutingEngine")) { // cannot add self or Ens.Alert
				s addToMetric=0
				Set tName = tItem.Name
				try {
					for iSet=1:1:tItem.Settings.Count() {
						s:(tItem.Settings.GetAt(iSet).Name="AddToMetric") addToMetric=tItem.Settings.GetAt(iSet).Value
					}
				}
				catch e {
					s addToMetric=0
				}
				s:(addToMetric) Names(tName)=$$$ConfigTypeName(tItem.BusinessType())
			}
	}
	q sc
}

/// initialize Business Host object
Method %OnNew(pConfigName As %String) As %Status
{
	s tSC=##super(pConfigName)
	/// Daylight Savings ?
	SET stamp=$ZTIMESTAMP,clock=$HOROLOG
	SET clocksecs=$EXTRACT(clock,7,11)
	SET stampsecs=$EXTRACT(stamp,7,11)-($ZTIMEZONE*60)
	IF (clocksecs=stampsecs) {
	   s daylight=0
	}
	ELSE {
	   	s daylight=(clocksecs-stampsecs)\3600
	}
	s inc=daylight+((-$ztz)\60)	
	s ..ztsDiff=inc*3600
	q tSC
}

Method OnCalculateMetrics() As %Status
{
	
	// pas de possibilité d'utiliser un init, comment récupérer le paramètre de %Instance ??
	if (..state="") { 
		s ..connectionName=..%Instance
		d ..setState()
		s ..lastState=..state
		s ..lastStateTS=$zdatetime($H,3)
		s ..delay=60
	}
	else {
		d ..checkState()
	}
	d ..checkMessage()
	s ..queueTotal=$G(^Ens.Queue(..connectionName,0,"count"),0)
	s ..messageTotal=$G(^Ens.HostMonitorRoot(..connectionName,"%Count"),0)
	
	s ..lastActivity=$system.SQL.DATEADD("ss",..ztsDiff,$G(^Ens.HostMonitorRoot(..connectionName,"%LastActivity"),$ZDT($h,3)))
	s ..lastActivityInterval=$number($system.SQL.DATEDIFF("ss",..lastActivity,$zdatetime($h,3)),0)
	s:(..lastMessageReceived'="") ..lastMessageInterval=$number($system.SQL.DATEDIFF("ss",..lastMessageReceived,$zdatetime($h,3)),0)
	;s ..lastMessageReceived=$tr(..lastMessageReceived,":"," ")

	Quit $$$OK
}

/// Send Alert if state change & state delay matches
Method checkState()
{
	d ..setState()
	if (..state'=..lastState) {
		if ($system.SQL.DATEDIFF("ss",..lastStateTS,$zdatetime($H,3))>..delay) {
			s message="Changement d'état pour "_..connectionName_":"_..state
			//$$$LOGWARNING(message) 
			// envoi des alertes
			d ..SendAlert(##class(Ens.AlertRequest).%New($LB(..connectionName,message)))
			s ..lastState=..state
			s ..lastStateTS=$zdatetime($H,3)
		}
	}
}

/// vérifie que les messages "marqueurs" obnt bien été reçus dans les limites prédéterminées
/// sinon ->alerte
Method checkMessage()
{
	if ($D(^CHUBXL.MessageCheck(..connectionName))'=0) {
		s lastMessage=$G(^CHUBXL.MessageCheck(..connectionName))
		s lastMessageInterval=$number($system.SQL.DATEDIFF("ss",lastMessage,$zdatetime($h,3)),0)
		s ^CHUBXL.MessageCheck(..connectionName,"diff")=lastMessageInterval		
		if (lastMessageInterval>1200) {
			if (($G(^CHUBXL.MessageCheck(..connectionName,"alert"))'=1)) {
				s message="Pas de Message Check reçu dans les limites prédéterminées pour  "_..connectionName
				d ..SendAlert(##class(Ens.AlertRequest).%New($LB(..connectionName,message)))
				s ^CHUBXL.MessageCheck(..connectionName,"alert")=1
			}
		}
		else {
			if ($G(^CHUBXL.MessageCheck(..connectionName,"alert"))=1) {
				s message="Message Check reçu pour  "_..connectionName
				d ..SendAlert(##class(Ens.AlertRequest).%New($LB(..connectionName,message)))
				k ^CHUBXL.MessageCheck(..connectionName,"alert")
			}
		}		
	}
}

Method setState()
{
	s ..numState=0
	if ($G(^Ens.Runtime("ConfigItem",..connectionName,"IsEnabled"))=0) {
		s ..state="Disabled"
		s ..numState=1
	}
	elseif ($G(^CacheTemp.EnsHostMonitor("ENSEMBLE",..connectionName,"%Status"))'="") {
		s ..state=$G(^CacheTemp.EnsHostMonitor("ENSEMBLE",..connectionName,"%Status"))
		s:(..state="OK") ..numState=2
		If $G($$$ConfigSetting(..connectionName,"Adapter","StayConnected")) {
			Set j="" 
			For { 
				Set j=$O($$$EnsHostMonitorRoot(..connectionName,$$$eMonitorJob,j)) Quit:""=j
				Set c = $$$GetJobMonitor(..connectionName,j,$$$eMonitorConnected)
				If (c '= "") {
					If (+c) {
						s ..state="OK"
					}
					ElseIf $e(c)="." { ; "." means "listening for a connection"
						s ..state="Error / listening"
					}
					Else {
						s ..state="Error"
						Quit
					}
				}
				else {
					s ..state="Error"
				}
			}
		}
	}

	else {
		s ..state="Unknown"
	}
}

/// Renvoie les valeurs de la métrique sous forme SQL
Query QryMetricProperties(MetricName As %String, connectionNameFilter As %String, categoryFilter As %String = "") As %Query(ROWSPEC = "isRunning:%Boolean,lastUpdate:%StringTimeStamp,rangeLower:%String,rangeUpper:%String,thresholdLower:%String,thresholdUpper:%String,connectionName:%String,delay:%Integer,lastActivity:%StringTimeStamp,lastActivityInterval:%Integer,lastMessageInterval:%Integer,lastMessageReceived:%StringTimeStamp,lastState:%String,messageTotal:%Integer,numState:%Integer,queueTotal:%Integer,state:%String,category:%String")
{
}

ClassMethod QryMetricPropertiesExecute(ByRef qHandle As %Binary, MetricName As %String = "dummy", connectionNameFilter As %String = "", categoryFilter As %String = "") As %Status
{
	s qHandle("MetricName")=MetricName
	S qHandle("ConnectionName")=""
	s qHandle("connectionNameFilter")=$G(connectionNameFilter)
	s qHandle("categoryFilter")=$G(categoryFilter)
	Quit $$$OK
}

ClassMethod QryMetricPropertiesClose(ByRef qHandle As %Binary) As %Status [ PlaceAfter = QryMetricPropertiesExecute ]
{
	Quit $$$OK
}

ClassMethod QryMetricPropertiesFetch(ByRef qHandle As %Binary, ByRef Row As %List, ByRef AtEnd As %Integer = 0) As %Status [ PlaceAfter = QryMetricPropertiesExecute ]
{
	s Row=""
	
	s connection=$O(^Ens.Metrics(qHandle("MetricName"),qHandle("ConnectionName")))
	if (connection="") {
		s AtEnd=1
	}
	else {
		s qHandle("ConnectionName")=connection
		while (qHandle("ConnectionName")'="") {
			s propName=$O(^Ens.Metrics(qHandle("MetricName"),qHandle("ConnectionName"),""))
			while (propName'="") {
				s val=$G(^Ens.Metrics(qHandle("MetricName"),qHandle("ConnectionName"),propName))
				if ((propName="lastActivity")||(propName="lastMessage")) s val=$zdatetime($ZDATETIMEH(val,3,1),3,1)	// retirer les décimales
				s Row=$S((Row=""):$LB(val),1:Row_$LB(val))
				s propName=$O(^Ens.Metrics(qHandle("MetricName"),qHandle("ConnectionName"),propName))
			}
			// fin des propriétés du métrique
			// ajout des propriétés "production"
			s prod=##class(Ens.Config.Production).%OpenId($$$EnsRuntime("Name"))
			for i=1:1:prod.Items.Count() {
				s tItem=prod.Items.GetAt(i)
				if tItem.Name=qHandle("ConnectionName") s val=tItem.Category
			}
			s Row=$S($D(Row)=0:$LB(val),1:Row_$LB(val))
			/// Traitement des filtres.
			s hasFilter=($G(qHandle("connectionNameFilter"))'="")
			s hasFilter=(hasFilter)||($G(qHandle("categoryFilter"))'="")
			if ('hasFilter) {	// no filter
				q
			}
			else {
				s flgFilter=0 /// flag de test sur les filtres
				// trt connectionName
				if (($G(qHandle("connectionNameFilter"))'="")) {				
					;if $zcvt($E(qHandle("ConnectionName"),1,$L(qHandle("connectionNameFilter"))),"U")=$zcvt(qHandle("connectionNameFilter"),"U") {
					if ($F($zcvt($LG(Row,7),"U"),$zcvt(qHandle("connectionNameFilter"),"U"))'=0) {
						s flgFilter=1
					}
					else {
						s Row=""
					}
				}
				if (($G(qHandle("categoryFilter"))'=""))&&($G(Row)'="") {
					if ($F($zcvt($LG(Row,18),"U"),$zcvt(qHandle("categoryFilter"),"U"))'=0) {
						s flgFilter=1
					}
					else {
						s Row=""
					}
				}				
				q:(flgFilter)
			}
			s qHandle("ConnectionName")=$O(^Ens.Metrics(qHandle("MetricName"),qHandle("ConnectionName")))
		}
		if $G(Row)="" s AtEnd=1
	}
	Quit $$$OK
}

}
