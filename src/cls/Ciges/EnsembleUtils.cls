Include Ensemble

/// Méthode utilitaires liées à Ensemble/HealthShare
Class Ciges.EnsembleUtils Extends Ciges.CspUtils
{

/// Retourne le moment de la dernière activité du connecteur
ClassMethod getConfigItemLastActivity(configItem As %String = "") As %TimeStamp
{
	q:($ZSTRIP(configItem,"*W")="") ""
	q $$$timeUTCtoLocal($$$GetHostMonitor(configItem,$$$eMonitorLastActivity))
}

/// Le connecteur est-il activé ?
ClassMethod isConfigItemEnabled(configItem As %String = "") As %Boolean
{
	q:($ZSTRIP(configItem,"*W")="") 0
	q $G($$$ConfigIsEnabled(configItem),0)
}

/// Retourne le nombre de messages actuellement dans la file d'attente du connecteur
ClassMethod getConfigItemQueueCount(configItem As %String = "") As %Integer
{
	q:($ZSTRIP(configItem,"*W")="") 0
	s count=$G($$$EnsQueue(configItem,0,"count"))
	s:(count="") count=0
	q count
}

/// Retourne diverses informations sur la production active
ClassMethod getProductionInfo(Output production As %Binary, getCSPInfo As %Boolean = 0) As %Status
{
	// GetProductionStatus met un entier dans productionStatus :
	// 0 - eProductionStateUnknown
	// 1 - eProductionStateRunning
	// 2 - eProductionStateStopped
	// 3 - eProductionStateSuspended
	// 4 - eProductionStateTroubled
	// 5 - eProductionStateNetworkStopped
	s sc=##class(Ens.Director).GetProductionStatus(.productionName,.productionStatus)
	s productionName=##class(Ens.Director).GetActiveProductionName()
	if (productionName'="") {
		s productionStatus=$s((productionStatus>=1) && (productionStatus<=4):productionStatus,1:-2)
		s productionNeedUpdate=##class(Ens.Director).ProductionNeedsUpdate(.updateReason)
		s:(productionNeedUpdate="") productionNeedUpdate=0
		// Si la production est troublée ou suspendue, Ensemble considère qu'elle a besoin d'être mise à jour
		s:((productionStatus'=1) && (productionStatus'=2)) productionNeedUpdate=0
		s:(productionNeedUpdate) productionStatus=-1
		s environmentList=$lb("","LIVE","TEST","DEVELOPMENT","FAILOVER")
		s environmentLabelList=$lb("","Production","Test","Développement","Bascule")
		s environmentPosition=$lf(environmentList,$g(^%SYS("SystemMode")))
		s environment=$lg(environmentLabelList,environmentPosition)
		s production("name")=productionName
		s production("status")=productionStatus
		s production("environment")=environment
		if (getCSPInfo) {
			s production("showStatusButton")=(($G(production("status"))=-1) || (($G(production("status"))>=1) && ($G(production("status"))<=4)))
			s statusButtonText=""
			s statusAlertText=""
			s statusAlertClass="alert-danger"
			s statusAlertIcon="fa-exclamation-triangle"
			if (production("status")=-1) {
				s statusButtonText=$$$Text("Mettre à jour")
				s statusAlertText=$$$Text("La production doit être mise à jour")
			} elseif (production("status")=1) {
				s statusButtonText=$$$Text("Arrêter")
				s statusAlertText=$$$Text("La production est démarrée")
				s statusAlertClass="alert-success"
				s statusAlertIcon="fa-check-circle"
			} elseif (production("status")=2) {
				s statusButtonText=$$$Text("Démarrer")
				s statusAlertText=$$$Text("La production est arrêtée")
			} elseif (production("status")=3) {
				s statusButtonText=$$$Text("Démarrer")
				s statusAlertText=$$$Text("La production est suspendue")
				s statusAlertClass="alert-warning"
			} elseif (production("status")=4) {
				s statusButtonText=$$$Text("Récupérer")
				s statusAlertText=$$$Text("La production est troublée")
			} else {
				s statusAlertText=$$$Text("Le statut de la production est inconnu, aucune action possible")
			}
			s production("statusButtonText")=statusButtonText
			s production("statusAlertText")=statusAlertText
			s production("statusAlertClass")=statusAlertClass
			s production("statusAlertIcon")=statusAlertIcon
		}
	}
	q $$$OK
}

/// Retourne les connecteurs de la production active<br/>
/// Retourne aussi la liste des catégories de ces connecteurs
ClassMethod getProductionConnectorsInfo(Output connectors As %Binary) As %Status
{
	s visibleConnectorTypes=$LFS(##class(Application.Parameter).getParameter("ENSEMBLE","MONITORING","VISIBLECONNECTORTYPES"),"|")
	s productionName=##class(Ens.Director).GetActiveProductionName()
	d ##class(EnsPortal.Utils).ProductionItems(productionName,.pItemTab,.pColNames)
	// pColNames = $lb("name","hostType","enabled","position","status","connectStatus","id","commentOrClassname","classname","busPartner","category","isMissingClass")
	if ($D(pItemTab)>0) {
		s kItem=$o(pItemTab(""),1,configItem)
		while (kItem'="") {
			if ($lf(visibleConnectorTypes,$lg(configItem,2))>0) {
				s name=$lg(configItem,1)
				s status=$case($LG(configItem,5),"ok":"bg-success","error":"bg-danger","retry":"bg-warning",:"active")
				s lastActivity=..getConfigItemLastActivity(name)
				s:(($LG(configItem,5)="ok") && (##class(Ciges.Param.ActivityChecker).isConfigItemInactive(name,lastActivity))) status="primary"
				s connectors($lg(configItem,2),name)=$LB(status,$S(lastActivity'="":$zdt($zdth(lastActivity,3),4),1:""),..getConfigItemQueueCount(name),$lg(configItem,11))
				if ($lg(configItem,11)'="") {
					s categoriesList=$lfs($lg(configItem,11),",")
					s p=0
					while ($listnext(categoriesList,p,category)) {
						s:(category'="") connectors("categories",category)=category
					}
				}
			}
			s kItem=$o(pItemTab(kItem),1,configItem)
		}
	}
	q $$$OK
}

ClassMethod getAllQueues(Output queues As %Binary) As %Status
{
	s productionName=##class(Ens.Director).GetActiveProductionName()
	d ##class(EnsPortal.Utils).ProductionItems(productionName,.pItemTab,.pColNames)
	// pColNames = $lb("name","hostType","enabled","position","status","connectStatus","id","commentOrClassname","classname","busPartner","category","isMissingClass")
	if ($D(pItemTab)>0) {
		s kItem=$o(pItemTab(""),1,configItem)
		while (kItem'="") {
			s name=$lg(configItem,1)
			s queueCount=..getConfigItemQueueCount(name)
			if (+queueCount>0) {
				s status=$case($LG(configItem,5),"ok":"bg-success","error":"bg-danger","retry":"bg-warning",:"active")
				s lastActivity=..getConfigItemLastActivity(name)
				s:(($LG(configItem,5)="ok") && (##class(Ciges.Param.ActivityChecker).isConfigItemInactive(name,lastActivity))) status="primary"
				s queues(queueCount,$I(queues(queueCount)))=$LB(name,status,$S(lastActivity'="":$zdt($zdth(lastActivity,3),4),1:""),queueCount)
			}
			s kItem=$o(pItemTab(kItem),1,configItem)
		}
	}
	q $$$OK
}

}
