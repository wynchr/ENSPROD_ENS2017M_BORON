Class CHUBXL.BP.NEW.WishDftRouting Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BP Wish DFT

VERSION
-------
DAM	30/08/2019	Initial Version

REQUEST
-------
	CHUBXL.DATA.WishDft

SOURCE
------
	Wish

DESTINATION
-----------
	WS DFT

MESSAGES
--------
	CHUBXL.DATA.WishDft

PROCESS
-------	
	=> WishDFTAllPhaDlmWsOut					
											
OPTIMISATION
------------
- No process for Response ?

SOURCE
------
CHUBXL.BP.InfohosRouting

--------------------------------------------------------------------------------------------------------------------------------
*/
Method OnRequest(pRequest As EnsLib.HL7.Message, Output pResponse As Ens.Response) As %Status
{
	Set $ZT="Trap",tSC=$$$OK
	s tSC=##class(CHUBXL.DATA.genericApiXml).saveMessage(pRequest,"Recup",.MsgOut)
	s tSC = ..SendRequestSync("DentAdminDftBruDlmWsOut",MsgOut,.pResponse,100)  Quit:$$$ISERR(tSC) tSC
	;s x=pResponse.RawContent
	$$$TRACE("Reponse : * "_pResponse_" *")

	;$$$TRACE("Message : *"_pResponse.ResponseInfo.Message_"*")
	;$$$TRACE("ClientMessageId : *"_pResponse.ResponseInfo.ClientMessageId_"*")
	;$$$TRACE("MessageId : *"_pResponse.ResponseInfo.MessageId_"*")
Exit
	Quit tSC
Trap
 	Write $ZError,!
 	$$$TRACE("Error BP - InfohosRouting : "_$ZError)
	Set $ZT="",tSC=$$$EnsSystemError Goto Exit
}

Storage Default
{
<Type>%Library.CacheStorage</Type>
}

}
