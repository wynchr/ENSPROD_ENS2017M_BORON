Class Ciges.Message.Alert Extends Ens.Request
{

/// Header du message qui a généré l'alerte
Property messageHeader As Ens.MessageHeader;

/// Alerte générée par le système
Property alertRequest As Ens.AlertRequest;

/// Type de l'alerte
/// <ul>
///  <li>"activityChecker" : email à utiliser pour indiquer un problème avec les délais d'inactivités</li>
///  <li>"" : email à utiliser pour les autres alertes</li>
/// </ul>
Property alertType As %String;

/// Liste des adresses mail de l'alertes, séparées par des ";", ou des ","
Property recipients As %String(MAXLEN = "");

Storage Default
{
<Data name="AlertDefaultData">
<Subscript>"Alert"</Subscript>
<Value name="1">
<Value>messageHeader</Value>
</Value>
<Value name="2">
<Value>alertRequest</Value>
</Value>
<Value name="3">
<Value>alertType</Value>
</Value>
<Value name="4">
<Value>recipients</Value>
</Value>
</Data>
<DefaultData>AlertDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
