/// Liste les adresses mails vers lesquelles il faut envoyer les alertes des connecteurs de la production
Class Ciges.Param.ConfigItemEmail Extends %Persistent
{

/// Nom du connecteur
Property configItem As %String(MAXLEN = "");

/// Type de l'alerte
/// <ul>
///  <li>"activityChecker" : email à utiliser pour indiquer un problème avec les délais d'inactivités</li>
///  <li>"" : email à utiliser pour les autres alertes</li>
/// </ul>
Property alertType As %String;

Property email As %String(MAXLEN = "");

Index configItemIdx On configItem;

Index alertTypeIdx On alertType;

/// Retourne les adresse emails vers lesquelles envoyer des alertes, sous forme de string
ClassMethod getEmailsString(configItem As %String = "", alertType As %String = "", sep As %String = ";") As %String
{
	s emailList=..getEmailsList(configItem,alertType)
	q $LTS(emailList,sep)
}

/// Retourne les adresse emails vers lesquelles envoyer des alertes, sous forme de liste
ClassMethod getEmailsList(configItem As %String = "", alertType As %String = "") As %List
{
	s emailList=""
	s stat=##class(%SQL.Statement).%New()
	d stat.%Prepare("select email,alertType from Ciges_Param.ConfigItemEmail where configItem=?")
	s rs=stat.%Execute(configItem)
	while (rs.%Next()) {
		s:(rs.%Get("alertType")=alertType) emailList=emailList_$LB(rs.%Get("email"))
	}
	q emailList
}

Storage Default
{
<Data name="ConfigItemEmailDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>configItem</Value>
</Value>
<Value name="3">
<Value>alertType</Value>
</Value>
<Value name="4">
<Value>email</Value>
</Value>
</Data>
<DataLocation>^Ciges.Param.ConfigItemEmailD</DataLocation>
<DefaultData>ConfigItemEmailDefaultData</DefaultData>
<ExtentSize>100000</ExtentSize>
<IdLocation>^Ciges.Param.ConfigItemEmailD</IdLocation>
<IndexLocation>^Ciges.Param.ConfigItemEmailI</IndexLocation>
<StreamLocation>^Ciges.Param.ConfigItemEmailS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
