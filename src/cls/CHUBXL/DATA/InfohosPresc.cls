Class CHUBXL.DATA.InfohosPresc Extends (%Persistent, %XML.Adaptor, Ens.Request) [ ClassType = persistent, Inheritance = right, ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "CHUBXL.WS.Response.AddJournalEntryResponse";

Property RequestInfo As CHUBXL.WS.HealthConnect.common.RequestInfoType;

Property Data As %xsd.base64Binary;

Property JournalType As %String;

ClassMethod saveMessage(pMessage As %Stream, pSource As %String, pObj As CHUBXL.DATA.InfohosPresc) As %Status
{
	$$$TRACE("Message : "_pMessage)
	s msg=pMessage.Read()
	$$$TRACE("Message : "_msg)
	s pObj=..%New()
	s cl=##class(CHUBXL.WS.HealthConnect.common.RequestInfoType).%New()
	s cl.ClientMessageId="klkl"
	s cl.ClientMessageId="Brugmann"
    s cl.ApplicationToken="aec620be-84cf-4c2b-8e8d-252c516abde1"
	;"c1e1294a-b07b-46ee-9399-be91715b5f7e"
	s cl.UserId="7906"
	s cl.Language="FR"
	s pObj.RequestInfo=cl
	s pObj.Data=msg //$system.Encryption.Base64Encode(msg)
	s pObj.JournalType="kmehr"
	//s st=pObj.%Save()
	$$$TRACE("saveMessage ("_pMessage.Size_" length) for "_pSource)
	//d pObj.Data.Rewind()
	$$$TRACE("Message ("_pObj.Data_")")
	q $$$OK
}

Storage Default
{
<Data name="InfohosPrescDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>RequestInfo</Value>
</Value>
<Value name="3">
<Value>Data</Value>
</Value>
<Value name="4">
<Value>JournalType</Value>
</Value>
</Data>
<DataLocation>^CHUBXL.DATA.InfohosPrescD</DataLocation>
<DefaultData>InfohosPrescDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^CHUBXL.DATA.InfohosPrescD</IdLocation>
<IndexLocation>^CHUBXL.DATA.InfohosPrescI</IndexLocation>
<StreamLocation>^CHUBXL.DATA.InfohosPrescS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
