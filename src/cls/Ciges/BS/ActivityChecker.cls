Class Ciges.BS.ActivityChecker Extends Ens.BusinessService
{

Parameter ADAPTER = "Ens.InboundAdapter";

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject) As %Status
{
	s sc=$$$OK
	try {
		s rs=##class(%ResultSet).%New()
		d rs.Prepare("select configItemName from Ciges_Param.ActivityChecker")
		d rs.Execute()
		while (rs.Next()) {
			s lastActivity=##class(Ciges.EnsembleUtils).getConfigItemLastActivity(rs.Data("configItemName"))
			// On envoie une alerte pour les connecteurs activés dans la production qui n'ont plus d'activités depuis un certain temps
			if ((##class(Ciges.EnsembleUtils).isConfigItemEnabled(rs.Data("configItemName"))) && (##class(Ciges.Param.ActivityChecker).isConfigItemInactive(rs.Data("configItemName"),lastActivity))) {
				s diff=$SYSTEM.SQL.DATEDIFF("mi",lastActivity,$ZDT($H,3))
				s alert=##class(Ens.AlertRequest).%New()
				s alert.AlertText="Le connecteur "_rs.Data("configItemName")_" n'est plus actif depuis le "_$ZDT($ZDTH(lastActivity,3),4)_" (soit depuis "_diff_" minutes)"
				s alert.SourceConfigName=rs.Data("configItemName")
				d ..SendAlert(alert)
			}
		}
		d rs.Close()
		
	} catch (ex) {
		s sc=ex.AsStatus()
	}
	q sc
}

}
