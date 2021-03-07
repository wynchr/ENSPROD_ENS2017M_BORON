Class CHUBXL.BP.OLD.InfohosTSRouting Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

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
