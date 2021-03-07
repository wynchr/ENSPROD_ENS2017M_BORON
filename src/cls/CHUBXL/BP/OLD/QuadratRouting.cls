Class CHUBXL.BP.OLD.QuadratRouting Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As Ens.Request, Output pResponse As Ens.Response) As %Status
{

	Set $ZT="Trap",tSC=$$$OK
	
	$$$TRACE("Start BP ResultRouting")
	s tClassName=pRequest.%ClassName(1)
	
	//-- QUADRAT -----------------------------------------------------------------------------------------------
	if (tClassName="CHUBXL.MSG.ResultQuadrat") {
		$$$TRACE("Routing Msg "_tClassName)
		$$$TRACE("NHOP="_pRequest.MSH.NHOP_" STATUS="_pRequest.OBR.RESULTSTATUS)

		;=> Allgeier Medical Viewer
		if (((pRequest.OBR.RESULTSTATUS)="F")  !((pRequest.OBR.RESULTSTATUS)="C")){
			s tSC=##class(CHUBXL.DT.ResultQuadratToMv).Transform(pRequest,.MvMsg)  Quit:$$$ISERR(tSC) tSC
			s tSC($G(MvMsg)'="") =..SendRequestAsync("AgfaMvAllDocXmlFcpOut",MvMsg)  Quit:$$$ISERR(tSC) tSC		
			$$$TRACE("Msg sent to Medical Viewer")
		}

		if pRequest.OBR.RESULTSTATUS="D" {
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
<Data name="QuadratRoutingDefaultData">
<Subscript>"QuadratRouting"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>QuadratRoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
