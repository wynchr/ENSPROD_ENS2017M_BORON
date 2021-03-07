/// Regroupement d'utilisateurs
Class Application.Profile.Group Extends %Persistent [ SqlTableName = zGroup ]
{

Property name As %String;

Property description As %String(MAXLEN = "");

Property params As Application.Profile.Parameter;

Index groupProfileIdx On name [ Unique ];

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

Query qryAllGroups() As %SQLQuery(CONTAINID = 1)
{
SELECT %ID, name FROM zGroup
 ORDER BY name
}

Storage Default
{
<Data name="GroupDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
<Value name="3">
<Value>description</Value>
</Value>
<Value name="4">
<Value>params</Value>
</Value>
</Data>
<DataLocation>^Application.Profile.GroupD</DataLocation>
<DefaultData>GroupDefaultData</DefaultData>
<ExtentSize>100000</ExtentSize>
<IdLocation>^Application.Profile.GroupD</IdLocation>
<IndexLocation>^Application.Profile.GroupI</IndexLocation>
<StreamLocation>^Application.Profile.GroupS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
