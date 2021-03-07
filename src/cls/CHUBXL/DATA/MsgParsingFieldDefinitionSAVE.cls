Class CHUBXL.DATA.MsgParsingFieldDefinitionSAVE Extends %Persistent [ ClassType = persistent, ProcedureBlock ]
{

Relationship msgParsingDefinition As CHUBXL.DATA.MsgParsingDefinition [ Cardinality = parent, Inverse = msgParsingFields ];

Property name As %String(TRUNCATE = 1);

Property fieldPosition As %Integer;

Property fieldLength As %Integer;

Property trimTrail As %Boolean [ InitialExpression = 1 ];

ClassMethod List()
{
	set rs=##class(%Library.ResultSet).%New()
	set SQL="Select * from CHUBXL_DATA.MsgParsingFieldDefinition"
	Set st=rs.Prepare(SQL)
	
	Do rs.Execute()
	
	s i=0	
	while (rs.Next() '= 0) {
		s out=""
		s out=out_"ID : "_$get(rs.Data("ID"))
		s out=out_" name : "_$get(rs.Data("name"))
		s out=out_" fieldPosition : "_$get(rs.Data("fieldPosition"))
		s out=out_" fieldLength : "_$get(rs.Data("fieldLength"))
		s out=out_" trimTrail : "_$get(rs.Data("trimTrail"))
		w out,!
	}
	
	Do rs.Close()
	Kill rs
	
	quit $$$OK
}

Storage Default
{
<Data name="MsgParsingFieldDefinitionSAVEDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
<Value name="3">
<Value>fieldPosition</Value>
</Value>
<Value name="4">
<Value>fieldLength</Value>
</Value>
<Value name="5">
<Value>trimTrail</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("msgParsingFields")</DataLocation>
<DefaultData>MsgParsingFieldDefinitionSAVEDefaultData</DefaultData>
<IdLocation>^CHUBXL.DATA.MsgParsingD634EC("msgParsingFields")</IdLocation>
<IndexLocation>^CHUBXL.DATA.MsgParsingF6741I</IndexLocation>
<StreamLocation>^CHUBXL.DATA.MsgParsingF6741S</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
