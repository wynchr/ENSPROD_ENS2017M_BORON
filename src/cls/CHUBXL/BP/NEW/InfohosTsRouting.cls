Class CHUBXL.BP.NEW.InfohosTsRouting Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BP INHOHOS Art XML (SendRequestSync)
VERSION
-------
CWY	24/07/2018	Initial Version
CWY	01/08/2018	Add comment

REQUEST
-------
	CHUBXL.DATA.InfohosPresc

SOURCE
------
	INFOHOS

DESTINATION
-----------
	WS Tmestamping

MESSAGES
--------
	CHUBXL.DATA.InfohosPresc

PROCESS
-------	
	=> InfohosTsAllPhaDlmWsOut					
											
OPTIMISATION
------------
- No process for Response ?

SOURCE
------
CHUBXL.BP.InfohosRouting

--------------------------------------------------------------------------------------------------------------------------------
*/
Method OnRequest(pRequest As CHUBXL.DATA.InfohosPresc, Output pResponse As Ens.Response) As %Status
{
	Set $ZT="Trap",tSC=$$$OK
	s tSC = ..SendRequestSync("InfohosTsAllPhaDlmWsOut",pRequest,.pResponse,100)  Quit:$$$ISERR(tSC) tSC
	$$$TRACE("Code : * "_pResponse.ResponseInfo.Code_"*")
	$$$TRACE("Message : *"_pResponse.ResponseInfo.Message_"*")
	$$$TRACE("ClientMessageId : *"_pResponse.ResponseInfo.ClientMessageId_"*")
	$$$TRACE("MessageId : *"_pResponse.ResponseInfo.MessageId_"*")
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
