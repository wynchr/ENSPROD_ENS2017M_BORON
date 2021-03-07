Class CHUBXL.BP.NEW.AgfaDocXmlRouting Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BP AGFA Doc XML (MV)
VERSION
-------
CWY	24/07/2018	Initial Version
CWY	31/07/2018	Add comment

REQUEST
-------
	Ens.Request

SOURCE
------
	AGFA
		CHUBXL.MSG.ResultQuadrat

DESTINATION
-----------
	MV
	
MESSAGES
--------
	CHUBXL.MSG.ResultQuadrat 

PROCESS
-------
		OBR.RESULTSTATUS)="F" ! OBR.RESULTSTATUS="C" ! OBR.RESULTSTATUS="D"
			CHUBXL.DT.ResultQuadratToMv	=> AgfaMvAllDocXmlFcpOut


OPTIMISATION
------------
- review ConvertProtocole(msg) => NOT USED

SOURCE
------
CHUBXL.BP.QuadratRouting

--------------------------------------------------------------------------------------------------------------------------------
*/
/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As Ens.Request, Output pResponse As Ens.Response) As %Status
{
	Set $ZT="Trap",tSC=$$$OK
	
	$$$TRACE("Start BP AgfaDocXmlRouting")
	
	//------------------------------
	// Test Source
	//------------------------------
	
	s tClassName=pRequest.%ClassName(1)
	
	if (tClassName="CHUBXL.MSG.ResultQuadrat") {
		$$$TRACE("Routing Msg "_tClassName)
		$$$TRACE("NHOP="_pRequest.MSH.NHOP_" STATUS="_pRequest.OBR.RESULTSTATUS)

		// Send to MEDICAL VIEWER
		if (((pRequest.OBR.RESULTSTATUS)="F") ! ((pRequest.OBR.RESULTSTATUS)="C") ! ((pRequest.OBR.RESULTSTATUS)="D")) {
			s tSC=##class(CHUBXL.DT.ResultQuadratToMv).Transform(pRequest,.MvMsg)  Quit:$$$ISERR(tSC) tSC
			s tSC($G(MvMsg)'="") =..SendRequestAsync("AgfaMvAllDocXmlFcpOut",MvMsg)  Quit:$$$ISERR(tSC) tSC		
			$$$TRACE("Msg sent to Medical Viewer")
		}

	}
	//-- Unknown message --------------------------------------------------------------------------------------	
	else {
		$$$LOGWARNING("Unsupported message received :"_tClassName)
	}	
	
Exit
	Quit tSC
Trap
	Set $ZT="",tSC=$$$EnsSystemError Goto Exit

	//------------------------------
	// Conversion
	//------------------------------
		
ConvertProtocole(msg)
	Set stream=##class(%GlobalCharacterStream).%New()
	While 'msg.AtEnd {
		s line=msg.Read()
		s line=##class(Ens.Util.FunctionSet).ReplaceStr(line,"&lt;","<")
		s line=##class(Ens.Util.FunctionSet).ReplaceStr(line,"&gt;",">")
		s line=##class(Ens.Util.FunctionSet).ReplaceStr(line,"&amp;","&")
		d stream.Write(line)
	}
	d stream.%Save()
		
	quit stream
}

Method OnResponse(request As Ens.Request, ByRef response As Ens.Response, callrequest As Ens.Request, callresponse As Ens.Response, pCompletionKey As %String) As %Status
{
	;$$$TRACE("Dummy Asynchronous request returned")
	Set response=##class(Ens.StringResponse).%New()
	Quit $$$OK
}

Storage Default
{
<Data name="AgfaDocXmlRoutingDefaultData">
<Subscript>"AgfaDocXmlRouting"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>AgfaDocXmlRoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
