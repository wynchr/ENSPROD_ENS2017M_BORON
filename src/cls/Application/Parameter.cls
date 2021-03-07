/// Paramétrage utile pour toute l'application
Class Application.Parameter Extends (%Persistent, %XML.Adaptor)
{

/// Module du paramètre
Property pModule As %String(MAXLEN = 500);

/// 2e niveau de spécificité du paramètre
Property pDomain As %String(MAXLEN = 500);

/// 3e niveau de spécificité du paramètre
Property pName As %String(MAXLEN = 500);

/// Libell du paramètre	
Property libel As %String(MAXLEN = 3000);

/// Le paramètre peut-il être édité par les clients ?
Property editable As %Boolean [ InitialExpression = 0 ];

/// Valeur du paramètre
Property pValue As %String(MAXLEN = 500);

Index parameterIdx On (pModule, pDomain, pName) [ Unique ];

ClassMethod openParameter(pModule As %String = "", pDomain As %String = "", pName As %String = "") As Application.Parameter
{
	q:((pModule="") && (pDomain="") && (pName="")) ""
	s pModule=$zcvt(pModule,"U")
	s pDomain=$zcvt(pDomain,"U")
	s pName=$zcvt(pName,"U")
	&sql(select ID into :theID from Application.Parameter where pModule=:pModule and pDomain=:pDomain and pName=:pName)
	q:(SQLCODE'=0) ""
	q ..%OpenId(theID)
}

ClassMethod getParameter(pModule As %String = "", pDomain As %String = "", pName As %String = "", defaultValue As %String = "") As %String
{
	q:((pModule="") && (pDomain="") && (pName="")) ""
	s pModule=$zcvt(pModule,"U")
	s pDomain=$zcvt(pDomain,"U")
	s pName=$zcvt(pName,"U")
	&sql(select pValue into :theValue from Application.Parameter where pModule=:pModule and pDomain=:pDomain and pName=:pName)
	q:(SQLCODE'=0) defaultValue
	q theValue
}

ClassMethod setParameter(pModule As %String = "", pDomain As %String = "", pName As %String = "", pLibel As %String = "", pValue As %String = "", editable As %Boolean = 0) As %Status
{
	s pModule=$zcvt(pModule,"U")
	s pDomain=$zcvt(pDomain,"U")
	s pName=$zcvt(pName,"U")
	s parameter=..openParameter(pModule,pDomain,pName)
	if ('$ISOBJECT(parameter)) {
		s parameter=..%New()
		s parameter.pModule=pModule
		s parameter.pDomain=pDomain
		s parameter.pName=pName
	}
	s:(pLibel'="") parameter.libel=pLibel
	s parameter.editable=editable
	s parameter.pValue=pValue
	q parameter.%Save()
}

Storage Default
{
<Data name="ParameterDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>pModule</Value>
</Value>
<Value name="3">
<Value>pDomain</Value>
</Value>
<Value name="4">
<Value>pName</Value>
</Value>
<Value name="5">
<Value>libel</Value>
</Value>
<Value name="6">
<Value>editable</Value>
</Value>
<Value name="7">
<Value>pValue</Value>
</Value>
</Data>
<DataLocation>^Application.ParameterD</DataLocation>
<DefaultData>ParameterDefaultData</DefaultData>
<ExtentSize>100000</ExtentSize>
<IdLocation>^Application.ParameterD</IdLocation>
<IndexLocation>^Application.ParameterI</IndexLocation>
<StreamLocation>^Application.ParameterS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
