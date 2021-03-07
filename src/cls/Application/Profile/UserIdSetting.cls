/// Paramètres utilisateur liés à la navigation dans l'application
Class Application.Profile.UserIdSetting Extends %Persistent
{

Property name As %String;

Property valueString As %String(MAXLEN = "");

Property valueStream As %GlobalCharacterStream;

Relationship userId As Application.Profile.UserId [ Cardinality = parent, Inverse = settings ];

Storage Default
{
<Data name="UserIdSettingDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
<Value name="3">
<Value>valueString</Value>
</Value>
<Value name="4">
<Value>valueStream</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("settings")</DataLocation>
<DefaultData>UserIdSettingDefaultData</DefaultData>
<ExtentSize>100000</ExtentSize>
<IdLocation>^Application.Profile.UserIdC("settings")</IdLocation>
<IndexLocation>^Application46EA.UserIdSettingI</IndexLocation>
<StreamLocation>^Application46EA.UserIdSettingS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
