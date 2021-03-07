Class CHUBXL.DATA.RawMessageStream Extends (%Persistent, %XML.Adaptor, Ens.Request) [ ClassType = persistent, Inheritance = right, ProcedureBlock ]
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
Property creationTS As %TimeStamp [ InitialExpression = {$zdatetime($h,3)} ];

Property source As %String(TRUNCATE = 1);

Property payLoad As %GlobalBinaryStream;

ClassMethod saveMessage(pMessage As %Stream, pSource As %String, pObj As CHUBXL.DATA.RawMessageStream) As %Status
{
	s pObj=..%New()
	d pObj.payLoad.CopyFrom(pMessage)
	s pObj.source=pSource
	s st=pObj.%Save()
	$$$TRACE("saveMessage ("_pMessage.Size_" length) for "_pSource)
	d pObj.payLoad.Rewind()
	$$$TRACE("Message ("_pObj.payLoad.Read(30000)_")")
	q st
}

ClassMethod ListAllMessage(pSource As %String)
{
	set rs=##class(%Library.ResultSet).%New()
	set SQL="Select * from CHUBXL_DATA.RawMessageStream where lower(source) like '%"_pSource_"%'"
	Set st=rs.Prepare(SQL)
	
	Do rs.Execute()
	
	s i=0	
	while (rs.Next() '= 0) {
		s i=i+1
		Write "* "_i_" (RawMessageStream) ***************************",!
		s out=""
		s out=out_"ID : "_$get(rs.Data("ID"))
		s out=out_" creationTS : "_$get(rs.Data("creationTS"))
		s out=out_" source : "_$get(rs.Data("source"))
		w out,!
		
		s pID=$get(rs.Data("ID"))
		s msg=##class(CHUBXL.DATA.RawMessageStream).%OpenId(pID)
 		;w msg.%Id(),!
		w "--- Start of Text ---",!
		While ('msg.payLoad.AtEnd) {
			Set line=msg.payLoad.ReadLine()
			if line '= "" {
				w line,!
			}
		}
		w "--- End of Text ---",!
		
	}
	
	Do rs.Close()
	Kill rs
	
	quit $$$OK
}

Storage Default
{
<Data name="RawMessageStreamDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>creationTS</Value>
</Value>
<Value name="3">
<Value>source</Value>
</Value>
<Value name="4">
<Value>payLoad</Value>
</Value>
</Data>
<DataLocation>^CHUBXL.DATA.RawMessageStreamD</DataLocation>
<DefaultData>RawMessageStreamDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^CHUBXL.DATA.RawMessageStreamD</IdLocation>
<IndexLocation>^CHUBXL.DATA.RawMessageStreamI</IndexLocation>
<StreamLocation>^CHUBXL.DATA.RawMessageStreamS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
