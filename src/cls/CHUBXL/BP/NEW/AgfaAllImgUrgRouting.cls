Class CHUBXL.BP.NEW.AgfaAllImgUrgRouting Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BP Agfa RIS Brugmann ORM vers Ecare

VERSION
-------
DAM	11/09/2018	Initial Version

REQUEST
-------
	Ens.Request

SOURCE
------
	AGFA RIS Brugmann

DESTINATION
-----------
	ECARE

PROCESS
-------	
	SourceConfigName = AgfaBruImgUrgHl7TcpIn
				=> AgfaEcareBruImgHl7TcpOut
OPTIMISATION
------------
- $$$TRACE("Source configuration name : "_SourceConfigName)

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
	
	$$$TRACE("Start BP EcareBruImgRouting")
	s tClassName=pRequest.%ClassName(1)
	
	s SourceConfigName=..%PrimaryRequestHeader.SourceConfigName
	s TargetConfigName=..%PrimaryRequestHeader.TargetConfigName
	$$$TRACE("ClassName : "_pRequest.%ClassName(1))
	$$$TRACE("SourceConfigName : "_SourceConfigName)
	$$$TRACE("TargetConfigName : "_TargetConfigName)
	
	//------------------------------
	// Test Source
	//------------------------------
	
	if (SourceConfigName="AgfaBruImgUrgHl7TcpIn") {
		$$$TRACE("Source configuration name : "_SourceConfigName)
		s tSC = ..SendRequestAsync("AgfaEcareBruImgHl7TcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
		$$$TRACE("Msg sent to Ecare")
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
<Data name="AgfaAllImgUrgRoutingDefaultData">
<Subscript>"AgfaAllImgUrgRouting"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>AgfaAllImgUrgRoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
