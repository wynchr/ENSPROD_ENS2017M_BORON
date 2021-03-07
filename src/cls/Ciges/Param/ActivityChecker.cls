Class Ciges.Param.ActivityChecker Extends %Persistent
{

/// Nom du connecteur
Property configItemName As %String;

/// Délais d'inactivité pendant les heures de bureaux
Property businessHourTimeout As %Integer;

/// Délais d'inactivité en dehors des heures de bureaux
Property offHourTimeout As %Integer;

/// Ce délais est-il activé ?
Property active As %Boolean;

Index activityCheckerIdx On configItemName [ Unique ];

/// Un connecteur doit-il être consideré comme inactif ?
/// params :
/// <ul>
///  <li>configItemName : nom du connecteur</li>
///  <li>configItemLastActivity : dernière activité du connecteur</li>
/// </ul>
ClassMethod isConfigItemInactive(configItemName As %String = "", configItemLastActivity As %TimeStamp = "") As %Boolean
{
	q:((configItemName="") || (configItemLastActivity="")) 0
	q:('##class(Ciges.EnsembleUtils).isConfigItemEnabled(configItemName)) 1
	s activity=..activityCheckerIdxOpen(configItemName)
	q:('$ISOBJECT(activity)) 0
	s dayOfWeek=$ZD($H,10) // On considère le weekend comme étant en dehors des heures de bureaux
	q:((dayOfWeek>5) && ('##class(Application.Parameter).getParameter("ENSEMBLE","ACTIVITYCHECKER","ALERTINWEEKEND",0))) 0
	// On récupère les heures de bureaux en minutes, et on les transforme en heures et finalement en timestamp pour les comparaisons
	s workingHourFrom=##class(Application.Parameter).getParameter("ENSEMBLE","ACTIVITYCHECKER","BUSINESSHOURFROM")
	s:(workingHourFrom'="") workingHourFrom=workingHourFrom_":00"
	s workingHourFromH=$ZTH(workingHourFrom,2)
	s workingHourTo=##class(Application.Parameter).getParameter("ENSEMBLE","ACTIVITYCHECKER","BUSINESSHOURTO")
	s:(workingHourTo'="") workingHourTo=workingHourTo_":00"
	s workingHourToH=$ZTH(workingHourTo,2)
	s activityTimeOutProperty=$S((workingHourFromH<$P($H,",",2)) && ($P($H,",",2)<workingHourToH) && (dayOfWeek<=5):"businessHourTimeout",1:"offHourTimeout")
	s inactivityTimeout=$PROPERTY(activity,activityTimeOutProperty)
	if (+inactivityTimeout>0) {
		q:($SYSTEM.SQL.DATEDIFF("mi",$ZDTH(configItemLastActivity,3),$H)>inactivityTimeout) 1
	}
	q 0
}

Storage Default
{
<Data name="ActivityCheckerDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>configItemName</Value>
</Value>
<Value name="3">
<Value>businessHourTimeout</Value>
</Value>
<Value name="4">
<Value>offHourTimeout</Value>
</Value>
<Value name="5">
<Value>active</Value>
</Value>
</Data>
<DataLocation>^Ciges.Param.ActivityCheckerD</DataLocation>
<DefaultData>ActivityCheckerDefaultData</DefaultData>
<ExtentSize>100000</ExtentSize>
<IdLocation>^Ciges.Param.ActivityCheckerD</IdLocation>
<IndexLocation>^Ciges.Param.ActivityCheckerI</IndexLocation>
<StreamLocation>^Ciges.Param.ActivityCheckerS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
