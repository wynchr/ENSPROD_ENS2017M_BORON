Class CHUBXL.BO.WishDFT.PostFinancialTransactionSoap Extends Ens.BusinessOperation [ ProcedureBlock ]
{

Parameter ADAPTER = "EnsLib.SOAP.OutboundAdapter";

Method genericApiXml(pRequest As CHUBXL.DATA.genericApiXml, Output pResponse As EnsLib.HL7.Message) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "CHUBXL.WS.WishDFT.GenericApiXmlSoap"
 Set tSC = ..Adapter.InvokeMethod("genericApiXml",.ResponseInfo,pRequest.UserId,pRequest.Password,pRequest.XmlParam)  Quit:$$$ISERR(tSC) tSC
 ;Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 s NewResponse=##class(EnsLib.HL7.Message).%New()
 s NewResponse.DocType="2.4:ACK"
 s tSC1=NewResponse.SetValueAt("MSH|^~\&|EnsembleHL7|ISC|VN^Vendor_Name|17^Practice Name|201905131629||ACK^P03|53651|P|2.4","MSH") 
 s tSC1=NewResponse.SetValueAt("MSA|AA|53651","MSA")
 s tSC1=NewResponse.SetValueAt("","ERR")
 s RTCD=$P($p(ResponseInfo,"</RTCD>",1),"<RTCD>",2)
 s RTMSG=$P($p(ResponseInfo,"</RTMSG>",1),"<RTMSG>",2)
 $$$TRACE("RTCD : *"_RTCD_"*")
 $$$TRACE("RTMSG : *"_RTMSG_"*")
 i RTCD'="" {
   s st=NewResponse.SetValueAt("AE","MSA:AcknowledgmentCode")
   s Msg="Statut 1 : "_st
   s st=NewResponse.SetValueAt(RTCD_" - "_RTMSG,"MSA:TextMessage")
   s Msg=Msg_" Statut 2 : "_st
   s st=NewResponse.SetValueAt(RTCD_" - "_RTMSG,"ERR:ErrorCodeandLocation(1).codeidentifyingerror")
   $$$TRACE(Msg_" Statut 3 : "_st)
 }
 Set tSC = pRequest.NewResponse(NewResponse)  Quit:$$$ISERR(tSC) tSC
 s MsgResp=##class(CHUBXL.WS.Response.genericApiXmlResponse).%New()
 s Error=""
 i +RTCD s Error=RTCD
 i ($tr(RTMSG," ")'="") s Error=Error_"&"_RTMSG
 s MsgResp.ERROR=Error
 s MsgResp.NOSEQ=pRequest.NoSeq
 s x=MsgResp.%Save()
 s ^IRIS.dulio2(pRequest.NoSeq)=Error
 $$$TRACE("NoSeq : "_pRequest.NoSeq)
 $$$TRACE("Statut : "_x)
 $$$TRACE("Message : "_ResponseInfo)
 $$$TRACE("Code : "_RTCD)
 $$$TRACE("Libellé : "_RTMSG)
 $$$TRACE("Réponse : "_NewResponse.RawContent)
 Quit $$$OK
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="CHUBXL.DATA.genericApiXml">
		<Method>genericApiXml</Method>
	</MapItem>
</MapItems>
}

}
