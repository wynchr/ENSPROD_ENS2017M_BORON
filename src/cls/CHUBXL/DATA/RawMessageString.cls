Class CHUBXL.DATA.RawMessageString Extends (%Persistent, %XML.Adaptor) [ ClassType = persistent, Inheritance = right, ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
Production ENSPROD

VERSION
-------
DAM	13/04/2018	Initial Version

REMARQUES
---------
Encore Utilisé que pour ENDOBASE (CHUBXL.DT.QHL7toQXML) => pas beaucoup de messages
--------------------------------------------------------------------------------------------------------------------------------
*/
Property creationTS As %TimeStamp [ InitialExpression = {$zdatetime($h,3)} ];

Property source As %String(TRUNCATE = 1);

Property file As %String(TRUNCATE = 1);

Property payLoad As %String(MAXLEN = 32000, TRUNCATE = 1);

ClassMethod saveMessage(pMessage As %String, pSource As %String, pFile As %String, pObj As CHUBXL.DATA.RawMessageString) As %Status
{
	s pObj=..%New()
	s pObj.payLoad=pMessage
	s pObj.source=pSource
	s pObj.file=pFile
	s st=pObj.%Save()
	q st
}

ClassMethod ListAllMessage(pSource As %String)
{
	set rs=##class(%Library.ResultSet).%New()
	set SQL="Select * from CHUBXL_DATA.RawMessageString where lower(source) like '%"_pSource_"%'"
	Set st=rs.Prepare(SQL)
	
	Do rs.Execute()
	
	s i=0	
	while (rs.Next() '= 0) {
		s i=i+1
		Write "* "_i_" (RawMessageString) ***************************",!
		s out=""
		s out=out_"ID : "_$get(rs.Data("ID"))
		s out=out_" creationTS : "_$get(rs.Data("creationTS"))
		s out=out_" source : "_$get(rs.Data("source"))
		s out=out_" file : "_$get(rs.Data("file"))
		w out,!
		
		s pID=$get(rs.Data("ID"))
		s msg=##class(CHUBXL.DATA.RawMessageString).%OpenId(pID)
 		;w msg.%Id(),!
		w "--- Start of Text ---",!
		Set line=msg.payLoad
		if line '= "" {
				w line,!
			}
	
		w "--- End of Text ---",!
		h 1
	}
	
	Do rs.Close()
	Kill rs
	
	quit $$$OK
}

Storage Default
{
<Data name="RawMessageStringDefaultData">
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
<Value>file</Value>
</Value>
<Value name="5">
<Value>payLoad</Value>
</Value>
</Data>
<DataLocation>^CHUBXL.DATA.RawMessageStringD</DataLocation>
<DefaultData>RawMessageStringDefaultData</DefaultData>
<IdLocation>^CHUBXL.DATA.RawMessageStringD</IdLocation>
<IndexLocation>^CHUBXL.DATA.RawMessageStringI</IndexLocation>
<StreamLocation>^CHUBXL.DATA.RawMessageStringS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
