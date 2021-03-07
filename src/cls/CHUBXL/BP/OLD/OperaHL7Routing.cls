Class CHUBXL.BP.OLD.OperaHL7Routing Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As EnsLib.HL7.Message, Output pResponse As Ens.Response) As %Status
{
	
	Set $ZTrap = "ErrorTrap", tSC=$$$OK	

	;$$$TRACE("Start BP MVHL7Routing")

	s tClassName = pRequest.%ClassName(1)
	s tSourceConfigName = ..%PrimaryRequestHeader.SourceConfigName
	s tTargetConfigName = ..%PrimaryRequestHeader.TargetConfigName
	
	$$$TRACE("ClassName : "_tClassName)
	$$$TRACE("SourceConfigName : "_tSourceConfigName)
	$$$TRACE("TargetConfigName : "_tTargetConfigName)

	If (tSourceConfigName = "OperaAllRdvHl7TcpIn" ) {
    	s NewMessHL7Out=##class(EnsLib.HL7.Message).%New(),NewMessHL7Out.DocType="2.3.1:SIU_S12"
    	;s NewMessHL7Out=pRequest.ImportFromString(pRequest.RawContent)
    	s nHop=+pRequest.FindSegmentValues("SCH:22")
		$$$TRACE("NoDos : "_pRequest.FindSegmentValues("PID:3"))
		$$$TRACE("pRequest : "_pRequest.RawContent)
		s ok=0
		i pRequest.RawContent=NewMessHL7Out.RawContent s ok=1
		$$$TRACE("nHop : "_nHop)
		$$$TRACE("ok : "_ok)
		s var=""
		s MSH=pRequest.FindSegmentValues("MSH") i $tr(MSH," ")'="" s var=var_MSH_$c(13) ;s tSC1=NewMessHL7Out.SetValueAt(MSH,"MSH") $$$TRACE(tSC1) 
		s EVN=pRequest.FindSegmentValues("EVN") i $tr(EVN," ")'="" s var=var_EVN_$c(13) ;s tSC1=NewMessHL7Out.SetValueAt(EVN,"EVN") $$$TRACE(tSC1)
		s PID=pRequest.FindSegmentValues("PID") i $tr(PID," ")'="" s var=var_PID_$c(13) ;s tSC1=NewMessHL7Out.SetValueAt(PID,"PID") $$$TRACE(tSC1)
		S SCH=pRequest.FindSegmentValues("SCH") i $tr(SCH," ")'="" s var=var_SCH_$c(13) ;s tSC1=NewMessHL7Out.SetValueAt(SCH,"SCH") $$$TRACE(tSC1)
		s PV1=pRequest.FindSegmentValues("PV1") i $tr(PV1," ")'="" s var=var_PV1_$c(13) ;s tSC1=NewMessHL7Out.SetValueAt(PV1,"PV1") $$$TRACE(tSC1)
		s PV2=pRequest.FindSegmentValues("PV2") i $tr(PV2," ")'="" s var=var_PV2_$c(13) ;s tSC1=NewMessHL7Out.SetValueAt(PV2,"PV2") $$$TRACE(tSC1)
		s AIS1=pRequest.FindSegmentValues("AIS(1)") i $tr(AIS1," ")'="" s var=var_AIS1_$c(13) ;tSC1=NewMessHL7Out.SetValueAt(AIS1,"AIS(1)") $$$TRACE(tSC1)
		s AIS2=pRequest.FindSegmentValues("AIS(2)") i $tr(AIS2," ")'="" s var=var_AIS2_$c(13) ;tSC1=NewMessHL7Out.SetValueAt(AIS2,"AIS(2)") $$$TRACE(tSC1)
		s AIS3=pRequest.FindSegmentValues("AIS(3)") i $tr(AIS3," ")'="" s var=var_AIS3_$c(13) ;tSC1=NewMessHL7Out.SetValueAt(AIS3,"AIS(3)") $$$TRACE(tSC1)
		s AIS4=pRequest.FindSegmentValues("AIS(4)") i $tr(AIS4," ")'="" s var=var_AIS4_$c(13) ;tSC1=NewMessHL7Out.SetValueAt(AIS4,"AIS(4)") $$$TRACE(tSC1)
		s AIS5=pRequest.FindSegmentValues("AIS(5)") i $tr(AIS5," ")'="" s var=var_AIS5_$c(13) ;tSC1=NewMessHL7Out.SetValueAt(AIS5,"AIS(5)") $$$TRACE(tSC1)
		s AIL1=pRequest.FindSegmentValues("AIL(1)") i $tr(AIL1," ")'="" s var=var_..CorVar1(AIL1)_$c(13) ;s tSC1=NewMessHL7Out.SetValueAt(AIL1,"AIL(1)") $$$TRACE(tSC1)
		s AIL2=pRequest.FindSegmentValues("AIL(2)") i $tr(AIL2," ")'="" s var=var_..CorVar1(AIL2)_$c(13) ;s tSC1=NewMessHL7Out.SetValueAt(AIL2,"AIL(2)") $$$TRACE(tSC1)
		s AIL3=pRequest.FindSegmentValues("AIL(3)") i $tr(AIL3," ")'="" s var=var_..CorVar1(AIL3)_$c(13) ;s tSC1=NewMessHL7Out.SetValueAt(AIL3,"AIL(3)") $$$TRACE(tSC1)
		s AIL4=pRequest.FindSegmentValues("AIL(4)") i $tr(AIL4," ")'="" s var=var_..CorVar1(AIL4)_$c(13) ;s tSC1=NewMessHL7Out.SetValueAt(AIL4,"AIL(4)") $$$TRACE(tSC1)
		s AIL5=pRequest.FindSegmentValues("AIL(5)") i $tr(AIL5," ")'="" s var=var_..CorVar1(AIL5)_$c(13) ;s tSC1=NewMessHL7Out.SetValueAt(AIL5,"AIL(5)") $$$TRACE(tSC1)
		s AIP1=pRequest.FindSegmentValues("AIP(1)") i $tr(AIP1," ")'="" s var=var_AIP1_$c(13) ;s tSC1=NewMessHL7Out.SetValueAt(AIP1,"AIP(1)") $$$TRACE(tSC1)
		s AIP2=pRequest.FindSegmentValues("AIP(2)") i $tr(AIP2," ")'="" s var=var_AIP2_$c(13) ;s tSC1=NewMessHL7Out.SetValueAt(AIP2,"AIP(2)") $$$TRACE(tSC1)
		s AIP3=pRequest.FindSegmentValues("AIP(3)") i $tr(AIP3," ")'="" s var=var_AIP3_$c(13) ;s tSC1=NewMessHL7Out.SetValueAt(AIP3,"AIP(3)") $$$TRACE(tSC1)
		s AIP4=pRequest.FindSegmentValues("AIP(4)") i $tr(AIP4," ")'="" s var=var_AIP4_$c(13) ;s tSC1=NewMessHL7Out.SetValueAt(AIP4,"AIP(4)") $$$TRACE(tSC1)
		s AIP5=pRequest.FindSegmentValues("AIP(5)") i $tr(AIP5," ")'="" s var=var_AIP5_$c(13) ;s tSC1=NewMessHL7Out.SetValueAt(AIP5,"AIP(5)") $$$TRACE(tSC1)
		s NTE1=pRequest.FindSegmentValues("NTE(1)") i $tr(NTE1," ")'="" s var=var_..CorVar(NTE1)_$c(13) ;s tSC1=NewMessHL7Out.SetValueAt(NTE1,"NTE(1)") $$$TRACE(tSC1)
		s NTE2=pRequest.FindSegmentValues("NTE(2)") i $tr(NTE2," ")'="" s var=var_..CorVar(NTE2)_$c(13) ;s tSC1=NewMessHL7Out.SetValueAt(NTE2,"NTE(2)") $$$TRACE(tSC1)
		s NTE3=pRequest.FindSegmentValues("NTE(3)") i $tr(NTE3," ")'="" s var=var_..CorVar(NTE3)_$c(13) ;s tSC1=NewMessHL7Out.SetValueAt(NTE3,"NTE(3)") $$$TRACE(tSC1)
		s NTE4=pRequest.FindSegmentValues("NTE(4)") i $tr(NTE4," ")'="" s var=var_..CorVar(NTE4)_$c(13) ;s tSC1=NewMessHL7Out.SetValueAt(NTE4,"NTE(4)") $$$TRACE(tSC1)
		s NTE5=pRequest.FindSegmentValues("NTE(5)") i $tr(NTE5," ")'="" s var=var_..CorVar(NTE5)_$c(13) ;s tSC1=NewMessHL7Out.SetValueAt(NTE5,"NTE(5)") $$$TRACE(tSC1)
		s NewMessHL7Out=pRequest.ImportFromString(var)
		$$$TRACE("NewMessHL7Out : "_NewMessHL7Out.RawContent)	
		s ok=0
		i pRequest.RawContent=NewMessHL7Out.RawContent s ok=1
		$$$TRACE("ok : "_ok)
		i nHop=26 {
		  s tSC = ..SendRequestAsync("AgfaBdocBruRdvHl7TcpOut",NewMessHL7Out)  Quit:$$$ISERR(tSC) tSC
		  s tSC = ..SendRequestAsync("AgfaBdocBruRdvHl7TcpFwd",NewMessHL7Out)  Quit:$$$ISERR(tSC) tSC
		}
		i nHop=27 {
		  s tSC = ..SendRequestAsync("AgfaBdocHudRdvHl7TcpOut",NewMessHL7Out)  Quit:$$$ISERR(tSC) tSC
		  ;s tSC = ..SendRequestAsync("AgfaBdocHudRdvHl7TcpFwd",NewMessHL7Out)  Quit:$$$ISERR(tSC) tSC
		}
		
		$$$TRACE("Msg sent to DPI")
	}
	Else {
		$$$LOGWARNING("Unsupported message received :"_tSourceConfigName)
	}
					
Exit	
	Quit tSC

ErrorTrap
 
 	Set $ZTrap = ""
 	Write $ZError,!
 	$$$TRACE("Error BP - MVMB : "_$ZError)
	Set tSC=$$$EnsSystemError Goto Exit
}

ClassMethod CorVar(var As %String = "") As %String
{
	s var=$p(var,"|",1,3)_"|"_$p($p(var,"|",4),"^",2,99)_"|"_$p(var,"|",5,99)
	q var
}

ClassMethod CorVar1(var As %String = "") As %String
{
	s NewVar=$p(var,"|",4),$p(NewVar,"^",9)=$p(NewVar,"^",2),$p(NewVar,"^",2)=""
	s var=$p(var,"|",1,3)_"|"_NewVar_"|"_$p(var,"|",5,99)
	q var
}

Method OnResponse(request As Ens.Request, ByRef response As Ens.Response, callrequest As Ens.Request, callresponse As Ens.Response, pCompletionKey As %String) As %Status
{
	$$$TRACE("Dummy Asynchronous request returned")
	Set response=callresponse
	Quit $$$OK
}

Storage Default
{
<Data name="OperaHL7RoutingDefaultData">
<Subscript>"OperaHL7Routing"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>OperaHL7RoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
