Class CHUBXL.BO.Cosite.DetailPatient Extends Ens.BusinessOperation [ ProcedureBlock ]
{

Parameter ADAPTER = "EnsLib.SOAP.OutboundAdapter";

Method GetUserLink(pRequest As CHUBXL.WS.Cosite.Request.GetUserLinkRequest, Output pResponse As CHUBXL.WS.Cosite.Response.GetUserLinkResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "CHUBXL.WS.Cosite.MainSoap"
 Set tSC = ..Adapter.InvokeMethod("GetUserLink",.GetUserLinkResult,pRequest.Requete,pRequest.TimeoutEnSecondes) Quit:$$$ISERR(tSC) tSC

 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.GetUserLinkResult=$get(GetUserLinkResult)

 Quit $$$OK
}

Method GetUserLink1(pRequest As CHUBXL.WS.Cosite.Request.GetUserLinkRequest, Output pResponse As CHUBXL.WS.Cosite.Response.GetUserLinkResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "CHUBXL.WS.Cosite.MainSoap1"
 Set tSC = ..Adapter.InvokeMethod("GetUserLink1",.GetUserLinkResult,pRequest.Requete,pRequest.TimeoutEnSecondes) Quit:$$$ISERR(tSC) tSC

 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.GetUserLinkResult=$get(GetUserLinkResult)

 Quit $$$OK
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="CHUBXL.WS.Cosite.Request.GetUserLinkRequest">
		<Method>GetUserLink</Method>
	</MapItem>
	<MapItem MessageType="CHUBXL.WS.Cosite.Request.GetUserLinkRequest1">
		<Method>GetUserLink1</Method>
	</MapItem>
</MapItems>
}

}
