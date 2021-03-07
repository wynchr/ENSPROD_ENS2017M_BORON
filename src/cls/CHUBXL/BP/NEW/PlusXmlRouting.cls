Class CHUBXL.BP.NEW.PlusXmlRouting Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BP PLUS XML

VERSION
-------
CWY	24/07/2018	Initial Version
CWY	01/08/2018	Add comment

REQUEST
-------
	Ens.Request

SOURCE
------
	PLUS

DESTINATION
-----------
	MV

MESSAGES
--------
	CHUBXL.MSG.ResultPLUS

PROCESS
-------	
	CHUBXL.MSG.ResultPLUS
				=> PlusMvAllDocXmlFcpOut
OPTIMISATION
------------
- $$$TRACE("Routing Msg "_tClassName)

SOURCE
------
CHUBXL.BP.PLUSRouting

--------------------------------------------------------------------------------------------------------------------------------
*/
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As Ens.Request, Output pResponse As Ens.Response) As %Status
{

	Set $ZT="Trap",tSC=$$$OK
	
	$$$TRACE("Start BP PlusXmlRouting")
	s tClassName=pRequest.%ClassName(1)
	
	$$$TRACE("ClassName : "_pRequest.%ClassName(1))
	$$$TRACE("SourceConfigName : "_..%PrimaryRequestHeader.SourceConfigName)
	$$$TRACE("TargetConfigName : "_..%PrimaryRequestHeader.TargetConfigName)
	
	//------------------------------
	// Test Source
	//------------------------------
	
	if (tClassName="CHUBXL.MSG.ResultPLUS") {
		$$$TRACE("Routing Msg "_tClassName)
		s tSC = ..SendRequestAsync("PlusMvAllDocXmlFcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
		$$$TRACE("Msg sent to Medical Viewer")
	}
	
	//-- Unknown message --------------------------------------------------------------------------------------	
	else {
		$$$LOGWARNING("Unsupported message received :"_tClassName)
	}
	
Exit
	Quit tSC
Trap
	Set $ZT="",tSC=$$$EnsSystemError Goto Exit
}

Method OnResponse(request As Ens.Request, ByRef response As Ens.Response, callrequest As Ens.Request, callresponse As Ens.Response, pCompletionKey As %String) As %Status
{
	Set response=##class(Ens.StringResponse).%New()
	Quit $$$OK
}

Storage Default
{
<Data name="PlusXmlRoutingDefaultData">
<Subscript>"PlusXmlRouting"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>PlusXmlRoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
