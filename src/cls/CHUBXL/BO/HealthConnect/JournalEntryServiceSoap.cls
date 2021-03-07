Class CHUBXL.BO.HealthConnect.JournalEntryServiceSoap Extends Ens.BusinessOperation [ ProcedureBlock ]
{

Parameter ADAPTER = "EnsLib.SOAP.OutboundAdapter";

Method AddAttachedJournalEntry(pRequest As CHUBXL.WS.Request.AddAttachedJournalEntryRequest, Output pResponse As CHUBXL.WS.Response.AddAttachedJournalEntryResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "CHUBXL.WS.HealthConnect.JournalEntryServiceSoap"
 Set tSC = ..Adapter.InvokeMethod("AddAttachedJournalEntry",.ResponseInfo,pRequest.RequestInfo,pRequest.AttachmentID,pRequest.JournalType)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.ResponseInfo=ResponseInfo
 Quit $$$OK
}

Method AddJournalEntry(pRequest As CHUBXL.DATA.InfohosPresc, Output pResponse As CHUBXL.WS.Response.AddJournalEntryResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "CHUBXL.WS.HealthConnect.JournalEntryServiceSoap"
 Set tSC = ..Adapter.InvokeMethod("AddJournalEntry",.ResponseInfo,pRequest.RequestInfo,pRequest.Data,pRequest.JournalType)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.ResponseInfo=ResponseInfo
 Quit $$$OK
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="CHUBXL.WS.Request.AddAttachedJournalEntryRequest">
		<Method>AddAttachedJournalEntry</Method>
	</MapItem>
	<MapItem MessageType="CHUBXL.DATA.InfohosPresc">
		<Method>AddJournalEntry</Method>
	</MapItem>
</MapItems>
}

}
