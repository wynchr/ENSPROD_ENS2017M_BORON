Class WordAutomationProxy.Utils Extends System.Object [ ProcedureBlock ]
{

Parameter IMPORTTIMESTAMP As STRING = "9/09/2013 12:31:42";

Method %OnNew(ByRef p0 As %ObjectHandle) As %Status
{
	If '$D(p0) If ($IO["TCP") { Quit $$$OK } Else { Set x=$$$ERROR($$$RemoteGatewayError,"Gateway instance must be supplied") Zt "JGTW" }
	Quit ..%Constructor(p0,"WordAutomationProxy.Utils",0)
}

ClassMethod convert(ByRef p0 As %ObjectHandle, ByRef p1 As %ObjectHandle, ByRef p2 As %ObjectHandle) As %ObjectHandle
{
	Quit ..%SR(p0,"convert","WordAutomationProxy.Utils",p1,p2)
}

}
