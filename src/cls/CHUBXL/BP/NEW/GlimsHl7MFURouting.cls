Class CHUBXL.BP.NEW.GlimsHl7MFURouting Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BP GLIMS HL7 MFU

VERSION
-------
CWY	24/07/2018	Initial Version
CWY	31/07/2018	Add comment
CWY	08/07/2019	Add MFU to BDoc
DAM	11/02/2021	Add Cosite

REQUEST
-------
	CHUBXL.DATA.RawMessageStream

SOURCE
------
	GLIMS
		CHUBXL.DATA.RawMessageStream 
	
DESTINATION
-----------
	???
	
MESSAGES
--------
	CHUBXL.DATA.RawMessageStream

PROCESS
-------	

	GlimsAllMFHl7FcpIn
	GlimsAllMFHl7TcpIn	=> GlimsGlimsBruMFUHl7FcpOut

OPTIMISATION
------------
- No more Tcp ????
- GlimsAllMFHl7FcpIn do nothing ?????

SOURCE
------
CHUBXL.BP.GlimsHL7MFURouting

--------------------------------------------------------------------------------------------------------------------------------
*/
/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As CHUBXL.DATA.RawMessageStream, Output pResponse As Ens.Response) As %Status
{
	
	Set $ZTrap = "ErrorTrap", tSC=$$$OK	

	$$$TRACE("Start BP GlimsHL7MFURouting")

	s tClassName = pRequest.%ClassName(1)
	s tSourceConfigName = ..%PrimaryRequestHeader.SourceConfigName
	s tTargetConfigName = ..%PrimaryRequestHeader.TargetConfigName
	
	$$$TRACE("ClassName : "_tClassName)
	$$$TRACE("SourceConfigName : "_tSourceConfigName)
	$$$TRACE("TargetConfigName : "_tTargetConfigName)

	If (tSourceConfigName = "GlimsAllMFUHl7FcpIn" ) {
		$$$TRACE("HL7Msg : "_pRequest.RawContent)
		s tSC = ..SendRequestAsync("GlimsBdocBruLabHl7TcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
		s tSC = ..SendRequestAsync("GlimsBdocHudLabHl7TcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
		$$$TRACE("Msg sent to BDoc")
	}
	Elseif (tSourceConfigName = "GlimsAllMFUHl7TcpIn" ) {
		$$$TRACE("HL7Msg : "_pRequest.payLoad)
		s tSC = ..SendRequestAsync("GlimsGlimsBruMFUHl7FcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
		$$$TRACE("Msg sent to Mediweb Brugmann")
	}
	Elseif (tSourceConfigName = "GlimsAllRsbCsvFcpIn" ) {
		$$$TRACE("HL7Msg : ********************************")
		s pObjBru=##class(CHUBXL.DATA.RawMessageStream).%New()
		s pObjHud=##class(CHUBXL.DATA.RawMessageStream).%New()
		s NoLine=1,Piece=0,Piece1=0,NewFicBru="",NewFicHud="",seq=1
		While 'pRequest.payLoad.AtEnd {
			Set line=pRequest.payLoad.ReadLine()
			i NoLine=1 {
				s idx=1,NewFicBru=line_$c(13)_$c(10),NewFicHud=line_$c(13)_$c(10)
				f  s var=$p(line,",",idx) q:(var="")!(Piece'=0)  s:var="TestCode1" Piece=idx s:var="SpecimenId1" Piece1=idx s idx=idx+1
				$$$TRACE("TestCode1   : "_Piece_"------------------")
				$$$TRACE("SpecimenId1 : "_Piece1_"------------------")
			}
			i NoLine'=1,Piece'=0,Piece1'=0 {
				w "*"_$p(line,",",Piece)_"*","*"_$p(line,",",Piece1),!,$p(line,",",Piece),!,$p(line,",",Piece1),!
				s Spec=$p(line,",",Piece),Site=$e($p(line,",",Piece1),1,10)
				i (Spec="94500-6")!(Spec="94309-2") {
					i (Site="LHUB-ULB_2")!(Site="LHUB-ULB_8") {
						s:(Site="LHUB-ULB_2") tSC=##class(CHUBXL.WS.Cosite.Request.GetUserLinkRequest).saveMessage(line,Piece_"~"_Piece1,.MsgOut)
						s:(Site="LHUB-ULB_8") tSC=##class(CHUBXL.WS.Cosite.Request.GetUserLinkRequest1).saveMessage(line,Piece_"~"_Piece1,.MsgOut)
						s:(Site="LHUB-ULB_2") tSC1 = ..SendRequestSync("GlimsAbruBruCovidCsvWsOut",MsgOut,.pResponse,100)
						s:(Site="LHUB-ULB_8") tSC1 = ..SendRequestSync("GlimsAbruHudCovidCsvWsOut",MsgOut,.pResponse,100)
						s Rep=pResponse.GetUserLinkResult.userlinks.GetAt(1)
						$$$TRACE("Response : ^^^^^^"_Rep_"^^^^")
						s ^ambdul6(+$g(seq))=Rep_"~"_line s seq=seq+1
						i +tSC1 {
						i Rep'="" {
							s EndDate=pResponse.GetUserLinkResult.userlinks.GetAt(1).enddate.date
 							s EndTime=pResponse.GetUserLinkResult.userlinks.GetAt(1).enddate.time
							i EndDate'<$p($h,",",1)	{
								i Site="LHUB-ULB_2" s NewFicBru=NewFicBru_line_$c(13)_$c(10)
								i Site="LHUB-ULB_8" s NewFicHud=NewFicHud_line_$c(13)_$c(10)
							}
							s ^ambdul6(+$g(seq)-1)=Rep_"~"_line_"~"_EndDate
						}
						}
 						
					}
				}
			}
			w !,NoLine," - ",line,!
			s NoLine=NoLine+1
		}
		$$$TRACE("HL7Msg : "_pRequest.payLoad)
		$$$TRACE("HL7Msg : "_pObjBru.payLoad)
		$$$TRACE("New fichier : "_NewFicBru)
		d pObjBru.payLoad.Write(NewFicBru)
		s NbLig=0
		While 'pObjBru.payLoad.AtEnd {
			Set line=pObjBru.payLoad.ReadLine(),NbLig=NbLig+1
			w !,line,!
		}
		d pObjHud.payLoad.Write(NewFicHud)
		s NbLig1=0
		While 'pObjHud.payLoad.AtEnd {
			Set line=pObjHud.payLoad.ReadLine(),NbLig1=NbLig1+1
			w !,line,!
		}
		
		i NbLig>1 s tSC = ..SendRequestAsync("GlimsAbruBruCovidCsvFcpOut",pObjBru)  Quit:$$$ISERR(tSC) tSC
		i NbLig1>1 s tSC = ..SendRequestAsync("GlimsAbruHudCovidCsvFcpOut",pObjHud)  Quit:$$$ISERR(tSC) tSC
	}
	Else {
		$$$LOGWARNING("Unsupported message received :"_tSourceConfigName)
	}
					
Exit	
	Quit tSC

ErrorTrap
 
 	Set $ZTrap = ""
 	Write $ZError,!
 	$$$TRACE("Error BP - GlimsMB : "_$ZError)
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
<Data name="GlimsHl7MFURoutingDefaultData">
<Subscript>"GlimsHl7MFURouting"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>GlimsHl7MFURoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
