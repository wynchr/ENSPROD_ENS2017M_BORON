/// Régulation des envois d'alertes
Class Ciges.BP.AlertRegulator Extends Ens.BusinessProcess [ ClassType = persistent ]
{

/// Interval d'envoi de mail pour le même module (en minutes)
Property sendInterval As %Integer [ InitialExpression = 30, Required ];

/// Business operation chargée d'envoyer les mails d'alertes
Property target As %String;

/// Nom du business service chargé de vérifier les délais d'inactivité<br/>
/// Ce connecteur utilise la classe <class>Ciges.BS.ActivityChecker</class>
Property activityCheckerConfigName As %String;

Parameter SETTINGS = "sendInterval:Basic,target:Basic:selector?context={Ens.ContextSearch/ProductionItems?targets=1&productionName=@productionId},activityCheckerConfigName:Basic:selector?context={Ens.ContextSearch/ProductionItems?services=1&productionName=@productionId}";

Method OnRequest(pRequest As Ens.AlertRequest, Output pResponse As Ens.Response) As %Status
{
	s sc=$$$OK
	try {
		s source=pRequest.SourceConfigName
		s sendAlert=0
		//S'il n'y a pas encore eu d'alerte 
		if ('$D(^Ensemble.LastAlert(source))) {
			s sendAlert=1
		} else {
			s lastDate=$g(^Ensemble.LastAlert(source))
			s sendAlert=($System.SQL.DATEDIFF("mi",lastDate,$H)>..sendInterval)
		}
		if (sendAlert) {
			s ^Ensemble.LastAlert(source)=$H
			s alertType=$S(..activityCheckerConfigName=..%PrimaryRequestHeader.SourceConfigName:"activityChecker",1:"")
			s alert=##class(Ciges.Message.Alert).%New()
			s alert.messageHeader=..%PrimaryRequestHeader
			s alert.alertRequest=pRequest
			s alert.recipients=##class(Ciges.Param.ConfigItemEmail).getEmailsString(source,alertType)
			$$$TOE(sc,..SendRequestAsync(..target,alert))
		}
	} catch (ex) {
		s sc=ex.AsStatus()
	}
	q sc
}

/// Handle a 'Response'
Method OnResponse(request As %Library.Persistent, ByRef response As %Library.Persistent, callrequest As %Library.Persistent, callresponse As %Library.Persistent, pCompletionKey As %String) As %Status
{
	Quit $$$OK
}

ClassMethod OnGetConnections(Output pArray As %String, pItem As Ens.Config.Item)
{
	Do ##super(.pArray,pItem)
    If pItem.GetModifiedSetting("target",.tValue)  {
	    For i=1:1:$L(tValue,",")  {
		    Set tOne=$ZStrip($P(tValue,",",i),"<>W") 
            Continue:""=tOne  Set pArray(tOne)="" 
        }
    }
}

Storage Default
{
<Data name="AlertRegulatorDefaultData">
<Subscript>"AlertRegulator"</Subscript>
<Value name="1">
<Value>sendInterval</Value>
</Value>
<Value name="2">
<Value>target</Value>
</Value>
<Value name="3">
<Value>activityCheckerConfigName</Value>
</Value>
</Data>
<DefaultData>AlertRegulatorDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
