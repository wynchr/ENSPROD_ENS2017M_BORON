/// Paramètres par défaut des utilisateurs
Class Application.Profile.Default Extends %Persistent [ SqlTableName = zDefault ]
{

Property name As %String;

Property description As %String(MAXLEN = "");

Property params As Application.Profile.Parameter;

Index defaultProfileIdx On name [ Unique ];

/// Récupère le paramètre demandé
Method getParam(paramName As %String = "") As %String
{
	q:(paramName="") ""
	s prop=$PROPERTY(..params,paramName)
	if ($ISOBJECT(prop)) {
		if (prop.%IsA("%Collection.AbstractIterator")) {
			q:($METHOD(prop,"Count")>0) prop
		} else {
			q prop.%Id()
		}
	} else {
		q:(prop'="") prop
	}
	q ""
}

Query qryAllDefaults() As %SQLQuery(CONTAINID = 1)
{
SELECT %ID, name FROM zDefault
 ORDER BY name
}

Storage Default
{
<Data name="DefaultDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>params</Value>
</Value>
<Value name="3">
<Value>name</Value>
</Value>
<Value name="4">
<Value>description</Value>
</Value>
</Data>
<DataLocation>^Application.Profile.DefaultD</DataLocation>
<DefaultData>DefaultDefaultData</DefaultData>
<ExtentSize>100000</ExtentSize>
<IdLocation>^Application.Profile.DefaultD</IdLocation>
<IndexLocation>^Application.Profile.DefaultI</IndexLocation>
<StreamLocation>^Application.Profile.DefaultS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
