Class CHUBXL.BP.OLD.QuadratORURouting Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As CHUBXL.DATA.RawMessageStream, Output pResponse As Ens.Response) As %Status
{
	
	Set $ZTrap = "ErrorTrap", tSC=$$$OK	

	$$$TRACE("Start BP AgfaAllDocRouting")

	s tClassName = pRequest.%ClassName(1)
	s tSourceConfigName = ..%PrimaryRequestHeader.SourceConfigName
	s tTargetConfigName = ..%PrimaryRequestHeader.TargetConfigName
	
	$$$TRACE("ClassName : "_tClassName)
	$$$TRACE("SourceConfigName : "_tSourceConfigName)
	$$$TRACE("TargetConfigName : "_tTargetConfigName)
	s NHop=26
	if tSourceConfigName = "AgfaHudDocHl7TcpIn" s NHop=27

	If (tSourceConfigName = "AgfaBruDocHl7TcpIn" ) ! (tSourceConfigName = "AgfaHudDocHl7TcpIn" )  ! (tSourceConfigName = "AgfaBruDocHl7TcpInNew" ) {

		d pRequest.payLoad.Rewind()
		s lig=1
		  While 'pRequest.payLoad.AtEnd { 
		        s rec=pRequest.payLoad.ReadLine()
		        i rec["|",lig=1 s lineHL7=$p(rec,"|",1,$l(rec,"|")),rec=$p($p(rec,"|",$l(rec,"|")),"^",5) w "----",$e(rec,1,5),"-----"
		        i rec["|",lig'=1 s lineHL7=$g(lineHL7)_$p(rec,"|",2,99),rec=$p(rec,"|",1)
		        s lig=lig+1
		  }

		s HL7File=##class(CHUBXL.MSG.HL7EcareFile).%New()
		d pRequest.payLoad.Rewind()
		s HL7File.HL7=##class(EnsLib.HL7.Message).ImportFromLibraryStream(pRequest.payLoad)
		;s HL7File.HL7.DocType=HL7File.HL7.TypeVersion_":"_$p(HL7File.HL7.Name,"_",1,2)
		s HL7File.HL7.DocType="2.6:"_$p(HL7File.HL7.Name,"_",1,2)
		// On récupère le résultat dans un stream qui a été décodé
		s NumUrg=HL7File.HL7.FindSegmentValues("PV1:19")
		//HL7File.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PV1grp.PV1:VisitNumber.ID",,.tSC)
		$$$TRACE("NumUrg : "_NumUrg)
		i NumUrg'="",$d(^CHUBXL.FiltreUrg(NumUrg)) {
		  s NumUrg=NumUrg_"000"
		  $$$TRACE("New NumUrg : "_NumUrg)
		  s status0=HL7File.HL7.SetValueAt(NumUrg,"PIDgrpgrp(1).PIDgrp.PV1grp.PV1:VisitNumber.ID")
		}
		s NewPos=1
		i HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBXgrp(1).OBX:ObservationValue.ChannelSamplingFrequency",,.tSC)'="" s NewPos=2
		i HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(3).OBXgrp(1).OBX:ObservationValue.ChannelSamplingFrequency",,.tSC)'="" s NewPos=3
		i HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(4).OBXgrp(1).OBX:ObservationValue.ChannelSamplingFrequency",,.tSC)'="" s NewPos=4
		i HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(5).OBXgrp(1).OBX:ObservationValue.ChannelSamplingFrequency",,.tSC)'="" s NewPos=5
		i HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(6).OBXgrp(1).OBX:ObservationValue.ChannelSamplingFrequency",,.tSC)'="" s NewPos=6
		i HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(7).OBXgrp(1).OBX:ObservationValue.ChannelSamplingFrequency",,.tSC)'="" s NewPos=7
		i HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(8).OBXgrp(1).OBX:ObservationValue.ChannelSamplingFrequency",,.tSC)'="" s NewPos=8
		i HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(9).OBXgrp(1).OBX:ObservationValue.ChannelSamplingFrequency",,.tSC)'="" s NewPos=9

		s sc=HL7File.HL7.GetFieldStreamBase64(.OBXResultStream,"PIDgrpgrp(1).ORCgrp("_NewPos_").OBXgrp(1).OBX:ObservationValue.ChannelSamplingFrequency",.pRemain,0)

		// On copie le stream décodé dans le fichier
		d HL7File.File.CopyFrom(OBXResultStream)
		
		s status0=HL7File.HL7.SetValueAt("RP","PIDgrpgrp(1).ORCgrp("_NewPos_").OBXgrp(1).OBX:ValueType")
		s status0=HL7File.HL7.SetValueAt("","PIDgrpgrp(1).ORCgrp("_NewPos_").OBXgrp(1).OBX:ObservationValue.ChannelSamplingFrequency")
		
		s reste=$p($p(lineHL7,"OBX",2),"|",7,99)

		;s tSC1=HL7File.HL7.SetValueAt(reste,"PIDgrpgrp(1).ORCgrp("_NewPos_").OBXgrp(1).OBX:7")
		
		$$$TRACE("NHop : "_NHop)
		if NHop=26 {
		   s tSC = ..SendRequestAsync("AgfaBdocBruDocHl7FcpOut",HL7File)  Quit:$$$ISERR(tSC) tSC
		   $$$TRACE("Pos : **"_NewPos_"**")
		   s tSC = ..SendRequestAsync("AgfaBdocprepBruDocHl7FcpOut",HL7File)  Quit:$$$ISERR(tSC) tSC
		   $$$TRACE("Msg sent to DPI Brugmann")
		}
		if NHop=27 {
		   s tSC = ..SendRequestAsync("AgfaBdocHudDocHl7FcpOut",HL7File)  Quit:$$$ISERR(tSC) tSC
		   $$$TRACE("Pos : **"_NewPos_"**")
		   s tSC = ..SendRequestAsync("AgfaBdocprepHudDocHl7FcpOut",HL7File)  Quit:$$$ISERR(tSC) tSC
		   $$$TRACE("Msg sent to DPI HUDERF")
		}
	}
	Else {
		$$$LOGWARNING("Unsupported message received :"_tSourceConfigName)
	}
					
Exit	
	Quit tSC

ErrorTrap
 
 	Set $ZTrap = ""
 	Write $ZError,!
 	$$$TRACE("Error BP - QuadratRVToDPI : "_$ZError)
	Set tSC=$$$EnsSystemError Goto Exit
}

Method OnResponse(request As Ens.Request, ByRef response As Ens.Response, callrequest As Ens.Request, callresponse As Ens.Response, pCompletionKey As %String) As %Status
{
	$$$TRACE("Dummy Asynchronous request returned")
	Set response=callresponse
	Quit $$$OK
}

Storage Default
{
<Data name="QuadratORURoutingDefaultData">
<Subscript>"QuadratORURouting"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>QuadratORURoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
