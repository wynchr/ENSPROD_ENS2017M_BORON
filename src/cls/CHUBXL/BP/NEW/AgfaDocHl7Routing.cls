Class CHUBXL.BP.NEW.AgfaDocHl7Routing Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BP AGFA Doc ORU HL7

VERSION
-------
CWY	24/07/2018	Initial Version
CWY	31/07/2018	Add comment

REQUEST
-------
	CHUBXL.DATA.RawMessageStream

SOURCE
------
	AGFA
		AgfaBruDocHl7TcpIn
		AgfaHudDocHl7TcpIn
		AgfaBruDocHl7TcpInNew

DESTINATION
-----------
	BDOC
	
MESSAGES
--------
	CHUBXL.DATA.RawMessageStream => CHUBXL.MSG.HL7EcareFile

PROCESS
-------
		AgfaBruDocHl7TcpIn ! AgfaHudDocHl7TcpIn ! AgfaBruDocHl7TcpInNew
			BRUGMANN
			   			AgfaBdocBruDocHl7FcpOut
			  			AgfaBdocprepBruDocHl7FcpOut

			HUDERF
			   			AgfaBdocHudDocHl7FcpOut
			   			AgfaBdocprepHudDocHl7FcpOut

OPTIMISATION
------------
- Replace CHUBXL.DATA.RawMessageStream by Ens.Request
- Why CHUBXL.MSG.HL7EcareFile and not HL7File ????
- Process NumUrg ^CHUBXL.FiltreUrg

SOURCE
------
	CHUBXL.BP.QuadratORURouting

--------------------------------------------------------------------------------------------------------------------------------
*/
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As CHUBXL.DATA.RawMessageStream, Output pResponse As Ens.Response) As %Status
{
	
	Set $ZTrap = "ErrorTrap", tSC=$$$OK	

	$$$TRACE("Start BP AgfaDocHl7Routing")

	s tClassName = pRequest.%ClassName(1)
	s tSourceConfigName = ..%PrimaryRequestHeader.SourceConfigName
	s tTargetConfigName = ..%PrimaryRequestHeader.TargetConfigName
	
	$$$TRACE("ClassName : "_tClassName)
	$$$TRACE("SourceConfigName : "_tSourceConfigName)
	$$$TRACE("TargetConfigName : "_tTargetConfigName)
	s Instance=$p($SYSTEM,":",2)
	
	if (tSourceConfigName = "AgfaBruDocHl7TcpIn") ! (tSourceConfigName = "AgfaBruDocHl7TcpInNew" ) {
	   s NHop=26
	}
	if tSourceConfigName = "AgfaHudDocHl7TcpIn" {
	   s NHop=27
	}

	//------------------------------
	// Test Source
	//------------------------------

	If (tSourceConfigName = "AgfaBruDocHl7TcpIn" ) ! (tSourceConfigName = "AgfaHudDocHl7TcpIn" )  ! (tSourceConfigName = "AgfaBruDocHl7TcpInNew" ) {

		i (tSourceConfigName '= "AgfaeiBruDocHl7TcpIn") & (tSourceConfigName '= "AgfaBruDocHl7TcpIn") & (tSourceConfigName '= "AgfaHudDocHl7TcpIn") {
		  d pRequest.payLoad.Rewind()
		  s lig=1
		  While 'pRequest.payLoad.AtEnd { 
		        s rec=pRequest.payLoad.ReadLine()
		        i rec["|",lig=1 s lineHL7=$p(rec,"|",1,$l(rec,"|")),rec=$p($p(rec,"|",$l(rec,"|")),"^",5) w "----",$e(rec,1,5),"-----"
		        i rec["|",lig'=1 s lineHL7=$g(lineHL7)_$p(rec,"|",2,99),rec=$p(rec,"|",1)
		        s lig=lig+1
		  }

		  // CWY Why ECARE and not HL7File
		  s HL7File=##class(CHUBXL.MSG.HL7EcareFile).%New()
		  d pRequest.payLoad.Rewind()
		  s HL7File.HL7=##class(EnsLib.HL7.Message).ImportFromLibraryStream(pRequest.payLoad)
		}
		else {
		  s tmp=pRequest.RawContent
		  s HL7File=##class(CHUBXL.MSG.HL7EcareFile).%New()
		  s HL7File.HL7=##class(EnsLib.HL7.Message).ImportFromString(tmp,.tSC)
		}
		
		s HL7File.HL7.DocType="2.6:"_$p(HL7File.HL7.Name,"_",1,2)
		if tSourceConfigName = "AgfaBruDocHl7TcpIn" {
	       s:Instance="ENS2017M" tSC = ..SendRequestAsync("AgfaBdocBruDocHl7TcpFwdPrep",HL7File.HL7)  Quit:$$$ISERR(tSC) tSC
	    }
	    if tSourceConfigName = "AgfaHudDocHl7TcpIn" {
	       s:Instance="ENS2017M" tSC = ..SendRequestAsync("AgfaBdocHudDocHl7TcpFwdPrep",HL7File.HL7)  Quit:$$$ISERR(tSC) tSC
	       s:Instance="ENS2017M" tSC = ..SendRequestAsync("AgfaPacsOnWebHudDocHl7TcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
	    }
		// Process NumUrg
		s NumUrg=HL7File.HL7.FindSegmentValues("PV1:19")
		$$$TRACE("NumUrg : "_NumUrg)
		i NumUrg'="",$d(^CHUBXL.FiltreUrg(NumUrg)) {
		  s NumUrg=NumUrg_"000"
		  $$$TRACE("New NumUrg : "_NumUrg)
		  s status0=HL7File.HL7.SetValueAt(NumUrg,"PIDgrpgrp(1).PIDgrp.PV1grp.PV1:VisitNumber.ID")
		}
		s NewPos=1,NewRtf=""
		s NewRtf=HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationValue",,.tSC)
		i NewRtf="" s NewRtf=HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBXgrp(1).OBX:ObservationValue.ChannelSamplingFrequency",,.tSC),NewPos=2
		i NewRtf="" s NewRtf=HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(3).OBXgrp(1).OBX:ObservationValue.ChannelSamplingFrequency",,.tSC),NewPos=3
		i NewRtf="" s NewRtf=HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(4).OBXgrp(1).OBX:ObservationValue.ChannelSamplingFrequency",,.tSC),NewPos=4
		i NewRtf="" s NewRtf=HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(5).OBXgrp(1).OBX:ObservationValue.ChannelSamplingFrequency",,.tSC),NewPos=5
		i NewRtf="" s NewRtf=HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(6).OBXgrp(1).OBX:ObservationValue.ChannelSamplingFrequency",,.tSC),NewPos=6
		i NewRtf="" s NewRtf=HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(7).OBXgrp(1).OBX:ObservationValue.ChannelSamplingFrequency",,.tSC),NewPos=7
		i NewRtf="" s NewRtf=HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(8).OBXgrp(1).OBX:ObservationValue.ChannelSamplingFrequency",,.tSC),NewPos=8
		i NewRtf="" s NewRtf=HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(9).OBXgrp(1).OBX:ObservationValue.ChannelSamplingFrequency",,.tSC),NewPos=9

		s sc=HL7File.HL7.GetFieldStreamBase64(.OBXResultStream,"PIDgrpgrp(1).ORCgrp("_NewPos_").OBXgrp(1).OBX:ObservationValue.ChannelSamplingFrequency",.pRemain,0)
		$$$TRACE("tttttttttttttttttt : "_$g(OBXResultStream)_"*********")
		d HL7File.File.CopyFrom($g(OBXResultStream))
		
		s status0=HL7File.HL7.SetValueAt("RP","PIDgrpgrp(1).ORCgrp("_NewPos_").OBXgrp(1).OBX:ValueType")
		s status0=HL7File.HL7.SetValueAt("","PIDgrpgrp(1).ORCgrp("_NewPos_").OBXgrp(1).OBX:ObservationValue.ChannelSamplingFrequency")
		
		s reste=$p($p($g(lineHL7),"OBX",2),"|",7,99)

	//------------------------------
	// Send to BO
	//------------------------------
		
		$$$TRACE("NHop : "_NHop)
		
		if NHop=26 {
		   s:Instance="ENS2017M" tSC = ..SendRequestAsync("AgfaBdocBruDocHl7FcpOut",HL7File)  Quit:$$$ISERR(tSC) tSC
		   s:Instance="ENS2017PREP" tSC = ..SendRequestAsync("AgfaBdocBruDocHl7FcpFwd",HL7File)  Quit:$$$ISERR(tSC) tSC
		   $$$TRACE("Pos : **"_NewPos_"**")
		   $$$TRACE("Msg sent to DPI Brugmann")
		}
		
		if NHop=27 {
		   s:Instance="ENS2017M" tSC = ..SendRequestAsync("AgfaBdocHudDocHl7FcpOut",HL7File)  Quit:$$$ISERR(tSC) tSC
		   s:Instance="ENS2017PREP" tSC = ..SendRequestAsync("AgfaBdocHudDocHl7FcpFwd",HL7File)  Quit:$$$ISERR(tSC) tSC
		   $$$TRACE("Pos : **"_NewPos_"**")
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
 	$$$TRACE("Error BP - AgfaDocVToDPI : "_$ZError)
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
<Data name="AgfaDocHl7RoutingDefaultData">
<Subscript>"AgfaDocHl7Routing"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>AgfaDocHl7RoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
