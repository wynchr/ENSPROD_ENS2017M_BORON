Class CHUBXL.BP.NEW.AgfaRdvHl7Routing Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BP AGFA Rdv SIU HL7
VERSION
-------
CWY	24/07/2018	Initial Version
CWY	31/07/2018	Add comment
DAM	01/03/2021	Ajout interface Ophtalmologie

REQUEST
-------
	CHUBXL.DATA.RawMessageStream

SOURCE
------
	AGFA
		AgfaHudRdvHl7TcpIn
		AgfaBruRdvHl7TcpIn
		AgfaBruRdvHl7TcpInNew

DESTINATION
-----------
	BDOC,WISH
	
MESSAGES
--------
	CHUBXL.DATA.RawMessageStream => EnsLib.HL7.Message

PROCESS
-------
		BRUGMANN
			AgfaBruRdvHl7TcpIn	=> AgfaWishBruRdvHl7FcpOut
			AgfaBruRdvHl7TcpIn	=> AgfaBdocBruRdvHl7TcpOut
			AgfaBruRdvHl7TcpIn	=> AgfaBdocBruRdvHl7TcpFwdPrep	(PROD)
			AgfaBruRdvHl7TcpIn	=> AgfaBdocBruRdvHl7TcpFwd		(PREP)
		
		HUDERF
			AgfaHudRdvHl7TcpIn	=> AgfaBdocHudRdvHl7TcpOut
			AgfaHudRdvHl7TcpIn	=> AgfaBdocHudRdvHl7TcpFwdPrep	(PROD)
			AgfaBruRdvHl7TcpIn	=> AgfaBdocHudRdvHl7TcpFwd		(PREP)
			AgfaHudRdvHl7TcpIn (Status'="COMPLETE")&(TypeRV'["RADIOLOGIE HUDERF") 	=> AgfaWishHudRdvHl7FcpOut


OPTIMISATION
------------
- Replace CHUBXL.DATA.RawMessageStream by Ens.Request
- condition s:(Status'="COMPLETE")&(TypeRV'["RADIOLOGIE HUDERF") ????????????

SOURCE
------
CHUBXL.BP.QuadratRVHL7Routing

--------------------------------------------------------------------------------------------------------------------------------
*/
/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As CHUBXL.DATA.RawMessageStream, Output pResponse As Ens.Response) As %Status
{
	
	Set $ZTrap = "ErrorTrap", tSC=$$$OK	

	$$$TRACE("Start BP AgfaRdvHl7Routing")

	s tClassName = pRequest.%ClassName(1)
	s tSourceConfigName = ..%PrimaryRequestHeader.SourceConfigName
	s tTargetConfigName = ..%PrimaryRequestHeader.TargetConfigName
	s Instance=$p($SYSTEM,":",2)
	
	$$$TRACE("ClassName : "_tClassName)
	$$$TRACE("SourceConfigName : "_tSourceConfigName)
	$$$TRACE("TargetConfigName : "_tTargetConfigName)

	//------------------------------
	// Test Source
	//------------------------------

	If (tSourceConfigName = "AgfaHudRdvHl7TcpIn") ! (tSourceConfigName = "AgfaBruRdvHl7TcpIn") ! (tSourceConfigName = "AgfaBruRdvHl7TcpInNew") ! (tSourceConfigName = "AgfaHudRdvHl7TcpInNew") {
		i (tSourceConfigName '= "AgfaBruRdvHl7TcpIn") & (tSourceConfigName '= "AgfaHudRdvHl7TcpIn") {
			  d pRequest.payLoad.Rewind()
			  s tmp=pRequest.payLoad.Read(3500000)
			  s tmp=$tr(tmp,$c(13),$c(10))
			  s HL7Msg = ##class(EnsLib.HL7.Message).ImportFromString(tmp,.tSC)
		}
		else {
			  s tmp=pRequest.RawContent
			  s HL7Msg=##class(EnsLib.HL7.Message).ImportFromString(tmp,.tSC)
		}
		
		s HL7Msg.DocType=HL7Msg.TypeVersion_":"_HL7Msg.Name
		s msgtype=HL7Msg.GetValueAt("MSH:MessageType.messagetype",,.tSC)
		s Status=HL7Msg.FindSegmentValues("SCH:25")
		s TypeRV=HL7Msg.FindSegmentValues("AIL(1):3.9")
		
		;$$$TRACE("HL7 MessageType BP : "_msgtype)
		;$$$TRACE("Name : "_HL7Msg.Name)
		;$$$TRACE("Version : "_HL7Msg.TypeVersion)
		;$$$TRACE("HL7Msg : "_HL7Msg.RawContent)
		$$$TRACE("Statut rendez-vous : ***"_Status_"***")
		$$$TRACE("Type rendez-vous : ***"_TypeRV_"***")
		
	//------------------------------
	// Send to BO
	//------------------------------		
		
		// BRUGMANN
		i tSourceConfigName = "AgfaBruRdvHl7TcpIn",Instance="ENS2017M" s tSC = ..SendRequestAsync("AgfaBdocBruRdvHl7TcpOut",HL7Msg)  Quit:$$$ISERR(tSC) tSC	
		i tSourceConfigName = "AgfaBruRdvHl7TcpIn",Instance="ENS2017M" s tSC = ..SendRequestAsync("AgfaBdocBruRdvHl7TcpFwdPrep",HL7Msg)  Quit:$$$ISERR(tSC) tSC
		i tSourceConfigName = "AgfaBruRdvHl7TcpIn",Instance="ENS2017M" s tSC = ..SendRequestAsync("AgfaWishBruRdvHl7FcpOut",HL7Msg)  Quit:$$$ISERR(tSC) tSC
		i tSourceConfigName = "AgfaBruRdvHl7TcpIn",Instance="ENS2017PREP" {
		  s tSC = ..SendRequestAsync("AgfaBdocBruRdvHl7TcpFwd",HL7Msg)  Quit:$$$ISERR(tSC) tSC
		  s tSC = ..SendRequestAsync("AgfaNewBdocBruRdvHl7TcpFwd",HL7Msg)  Quit:$$$ISERR(tSC) tSC
		}
		i tSourceConfigName = "AgfaBruRdvHl7TcpInNew",Instance="ENS2017PREP" {
		  s tSC = ..SendRequestAsync("AgfaBdocBruRdvHl7TcpFwd",HL7Msg)  Quit:$$$ISERR(tSC) tSC
		  s tSC = ..SendRequestAsync("AgfaNewBdocBruRdvHl7TcpFwd",HL7Msg)  Quit:$$$ISERR(tSC) tSC
		}
		i tSourceConfigName = "AgfaBruRdvHl7TcpIn",Instance="ENS2017PREP",TypeRV="OPHTALMOLOGIE" s tSC = ..SendRequestAsync("AgfaOphtalmoBruRdvHl7Tcp",HL7Msg)  Quit:$$$ISERR(tSC) tSC

		i tSourceConfigName = "AgfaBruRdvHl7TcpIn",Instance="ENS2017M",$p(TypeRV,"<>",1)="OPHTALMOLOGIE" s tSC = ..SendRequestAsync("AgfaOphtalmoBruRdvHl7Tcp",HL7Msg)  Quit:$$$ISERR(tSC) tSC
		i tSourceConfigName = "AgfaBruRdvHl7TcpIn",Instance="ENS2017M",$p(TypeRV,"<>",1)="HORUS" s tSC = ..SendRequestAsync("AgfaOphtalmoBruRdvHl7Tcp",HL7Msg)  Quit:$$$ISERR(tSC) tSC
		
		// HUDERF
		i tSourceConfigName = "AgfaHudRdvHl7TcpIn",Instance="ENS2017M" s tSC = ..SendRequestAsync("AgfaBdocHudRdvHl7TcpOut",HL7Msg)  Quit:$$$ISERR(tSC) tSC
		i tSourceConfigName = "AgfaHudRdvHl7TcpIn",Instance="ENS2017M" s tSC = ..SendRequestAsync("AgfaBdocHudRdvHl7TcpFwdPrep",HL7Msg)  Quit:$$$ISERR(tSC) tSC
		i tSourceConfigName = "AgfaHudRdvHl7TcpIn",Instance="ENS2017M" s:(Status'="COMPLETE")&(TypeRV'["RADIOLOGIE HUDERF") tSC = ..SendRequestAsync("AgfaWishHudRdvHl7FcpOut",HL7Msg)  Quit:$$$ISERR(tSC) tSC
		i tSourceConfigName = "AgfaHudRdvHl7TcpIn",Instance="ENS2017PREP" {
		  s tSC = ..SendRequestAsync("AgfaBdocHudRdvHl7TcpFwd",HL7Msg)  Quit:$$$ISERR(tSC) tSC
		  s tSC = ..SendRequestAsync("AgfaNewBdocHudRdvHl7TcpFwd",HL7Msg)  Quit:$$$ISERR(tSC) tSC
		}
		i tSourceConfigName = "AgfaHudRdvHl7TcpInNew",Instance="ENS2017PREP" {
		  s tSC = ..SendRequestAsync("AgfaBdocHudRdvHl7TcpFwd",HL7Msg)  Quit:$$$ISERR(tSC) tSC
		  s tSC = ..SendRequestAsync("AgfaNewBdocHudRdvHl7TcpFwd",HL7Msg)  Quit:$$$ISERR(tSC) tSC
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
<Data name="AgfaRdvHl7RoutingDefaultData">
<Subscript>"AgfaRdvHl7Routing"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>AgfaRdvHl7RoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
