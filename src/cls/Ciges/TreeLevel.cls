Class Ciges.TreeLevel Extends (%Persistent, %XML.Adaptor)
{

Relationship nodes As Ciges.TreeLevel [ Cardinality = many, Inverse = topNode ];

Relationship topNode As Ciges.TreeLevel [ Cardinality = one, Inverse = nodes ];

Property isTop As %Boolean [ Calculated, SqlComputeCode = {set {isTop}=({topNode}="")}, SqlComputed ];

Property nOrder As %Integer [ InitialExpression = 0 ];

Property nLevel As %Integer;

Index isTopIdx On isTop;

Method isTopGet() As %Boolean
{
		q (..topNode="")
}

Method getLevel(currLevel As %String = "") As %Integer
{
	if (..topNode="") {
			q $i(currLevel)
	}
	else {
		q ..topNode.getLevel($i(currLevel))
	}
}

Index topNodeIndex On topNode;

Method %OnAddToSaveSet(depth As %Integer = 3, insert As %Integer = 0, callcount As %Integer = 0) As %Status [ Private, ProcedureBlock = 1 ]
{
	s ..nLevel=..getLevel() 
	q $$$OK
}

Method html(targetId As %String) As %Status
{
	q $$$OK
}

Storage Default
{
<Data name="TreeLevelDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>nLevel</Value>
</Value>
<Value name="3">
<Value>nOrder</Value>
</Value>
<Value name="4">
<Value>topNode</Value>
</Value>
</Data>
<DataLocation>^Ciges.TreeLevelD</DataLocation>
<DefaultData>TreeLevelDefaultData</DefaultData>
<ExtentSize>100000</ExtentSize>
<IdLocation>^Ciges.TreeLevelD</IdLocation>
<IndexLocation>^Ciges.TreeLevelI</IndexLocation>
<StreamLocation>^Ciges.TreeLevelS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
