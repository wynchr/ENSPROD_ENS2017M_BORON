Class CHUBXL.DATA.MsgParsingDefinitionSAVE Extends %Persistent [ ClassType = persistent, ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
Production ENSPROD

VERSION
-------
DAM	13/04/2018	Initial Version
--------------------------------------------------------------------------------------------------------------------------------
*/
Relationship msgParsingFields As CHUBXL.DATA.MsgParsingFieldDefinition [ Cardinality = children, Inverse = msgParsingDefinition ];

/// name of definition
Property name As %String(TRUNCATE = 1);

Property identityString As %String(TRUNCATE = 1);

Property identityPosition As %String(TRUNCATE = 1);

Property destinationClass As %String(TRUNCATE = 1);

Property delimited As %Boolean [ InitialExpression = 0 ];

Property delimiter As %String(TRUNCATE = 1);

ClassMethod List()
{
	set rs=##class(%Library.ResultSet).%New()
	set SQL="Select * from CHUBXL_DATA.MsgParsingDefinition"
	Set st=rs.Prepare(SQL)
	
	Do rs.Execute()
	
	s i=0	
	while (rs.Next() '= 0) {
		s out=""
		s out=out_"ID : "_$get(rs.Data("ID"))
		s out=out_" name : "_$get(rs.Data("name"))
		s out=out_" identityString : "_$get(rs.Data("identityString"))
		s out=out_" identityPosition : "_$get(rs.Data("identityPosition"))
		s out=out_" destinationClass : "_$get(rs.Data("destinationClass"))
		s out=out_" delimited : "_$get(rs.Data("delimited"))
		s out=out_" delimiter : "_$get(rs.Data("delimiter"))
		w out,!
	}
	
	Do rs.Close()
	Kill rs
	
	quit $$$OK
}

Storage Default
{
<Data name="MsgParsingDefinitionSAVEDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
<Value name="3">
<Value>identityString</Value>
</Value>
<Value name="4">
<Value>identityPosition</Value>
</Value>
<Value name="5">
<Value>destinationClass</Value>
</Value>
<Value name="6">
<Value>delimited</Value>
</Value>
<Value name="7">
<Value>delimiter</Value>
</Value>
</Data>
<DataLocation>^CHUBXL.DATA.MsgParsingD3558D</DataLocation>
<DefaultData>MsgParsingDefinitionSAVEDefaultData</DefaultData>
<IdLocation>^CHUBXL.DATA.MsgParsingD3558D</IdLocation>
<IndexLocation>^CHUBXL.DATA.MsgParsingD3558I</IndexLocation>
<StreamLocation>^CHUBXL.DATA.MsgParsingD3558S</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
