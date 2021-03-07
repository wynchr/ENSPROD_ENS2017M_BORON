Class CHUBXL.BS.NEW.HL7ADRTcpIn Extends EnsLib.HL7.Service.TCPService
{

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Property FileArchivePath As %String(MAXLEN = 255);

Property FileErrorArchivePath As %String(MAXLEN = 255);

Parameter SETTINGS = "AddToMetric,FileArchivePath,FileErrorArchivePath";

Method SendReply(pReplyDocument As EnsLib.EDI.Document, pOriginalDoc As EnsLib.EDI.Document = {$$$NULLOREF}) As %Status
{
	try {
		s tSC=$$$OK
		// Test and  create ArchivePath
		i (..FileArchivePath '= "") {
			s archFileName=..FileArchivePath_"\"_##class(Ens.Util.File).CreateTimestamp("HL7TCPIN","%f-%Y%m%d.hl7")
			If ('##class(%Library.File).Exists(archFileName)) { 
				if ('##class(%Library.File).DirectoryExists(..FileArchivePath)) {
					Set tSC=##class(%Library.File).CreateDirectoryChain(..FileArchivePath) 
					s:('tSc) tSC= $system.Status.Error(5000,"Cannot create "_..FileArchivePath)
				}
			}
			//$$$TRACE("Set ArchivePath to : "_archFileName)
		}
		i (..FileErrorArchivePath '= "")&&(tSC) {
			s archErrorFileName=..FileErrorArchivePath_"\"_##class(Ens.Util.File).CreateTimestamp("HL7TCPINERR","%f-%Y%m%d.hl7")
			If ('##class(%Library.File).Exists(archErrorFileName)) { 
				if ('##class(%Library.File).DirectoryExists(..FileErrorArchivePath)) {
					Set tSC=##class(%Library.File).CreateDirectoryChain(..FileErrorArchivePath) 
					s:('tSc) tSC= $system.Status.Error(5000,"Cannot create "_..FileErrorArchivePath)
				}
			}
			//$$$TRACE("Set ArchivePath to : "_archFileName)
		}
		
		s NoIdx=pOriginalDoc.GetValueAt("QRD:WhoSubjectFilter(1)",,.tSC)
		$$$TRACE("NoIdx : "_NoIdx)

		s %rsDB = ##class(%Library.ResultSet).%New()
		s %qDB = "select * from CHUBXL_DB_WISH.HOS where NSEJ="_$e(NoIdx,1,9)
    	;s %qDB = "select * from CHUBXL_DB_WISH.PASSAGE where VINSEJ="_$e(NoIdx,1,9)_" and VIPASS = "_+$e(NoIdx,10,12)
    	$$$TRACE("SQL : "_%qDB)
    	s status=%rsDB.Prepare(%qDB)
    	s status=%rsDB.Execute()
    	While (%rsDB.Next()) {
	   		s NoDos=%rsDB.Data("CBMRN")
			$$$TRACE("NoDos : "_NoDos)
	    }

		
		s %rsDB = ##class(%Library.ResultSet).%New()
    	s %qDB = "select * from CHUBXL_DB_WISH.PATIENTS where pbmrn="_NoDos
    	s status=%rsDB.Prepare(%qDB)
    	s status=%rsDB.Execute()
    	While (%rsDB.Next()) {
	   		s NomPre=%rsDB.Data("PBNAME")
			s NomPat=$$SPN($$SPND($p(NomPre,",",1)))
			s PrePat=$$SPN($$SPND($p(NomPre,",",2)))
	   		
			s %LineOut="PID|||"_$tr($j(%rsDB.Data("PBMRN"),9)," ","0")_"||"_NomPat_"^"_PrePat_"||"_%rsDB.Data("PBDOB")_"|"_%rsDB.Data("PBSEX")_"|||"_$$SPN(%rsDB.Data("PBADDR"))_"^^^^"_$e(%rsDB.Data("PBZIP"),1,4)_"^"_$$SPN(%rsDB.Data("CPAY"))_"||"_$$SPN(%rsDB.Data("PBPHON"))_"||"_$$SPN(%rsDB.Data("CLNG"))_"|"_$$SPN(%rsDB.Data("PBMARI"))_"|||"_$$SPN(%rsDB.Data("PBNPI"))_"|"_$$SPN(%rsDB.Data("NIDE"))_"|||"_$$SPN(%rsDB.Data("LNAI"))_"|||||"_$$SPN(%rsDB.Data("PBNATN"))_"|"_$$SPN(%rsDB.Data("DETC4"))_"|"_$$SPN(%rsDB.Data("PBDETH"))_"|||"_$$SPN(%rsDB.Data("PBRGDT"))_"00||"
			$$$TRACE("PID : "_%LineOut)
	    }
		
		$$$TRACE("Old Reply : "_pReplyDocument.RawContent)
		s tSC=##class(CHUBXL.DT.AckToDentAdmin).Transform(pReplyDocument,.NewpReplyDocument)
		s x=NewpReplyDocument.SetValueAt(%LineOut,"EVNgrp(1).PID")
		s x=NewpReplyDocument.SetValueAt("QRD||","QRD")
		s x=NewpReplyDocument.SetValueAt("PV1|||||||||||||||||||"_$e(NoIdx,1,9),"EVNgrp(1).PV1")
		s ^IRIS.dulio1($h)=NewpReplyDocument.RawContent
		s:(tSC) tSC=##super(NewpReplyDocument, pOriginalDoc )
		$$$TRACE("New Reply : "_NewpReplyDocument.RawContent)
		$$$TRACE("New Reply : "_pReplyDocument.RawContent)
		$$$TRACE("Original : "_pOriginalDoc.RawContent)
		;s:(tSC) tSC=##super(pReplyDocument, pOriginalDoc )

		if (tSC) {
			if ((..FileArchivePath '= "")&&($IsObject(pReplyDocument))&& ($IsObject(pReplyDocument.FindSegment("MSA")))) {
				$$$TRACE(" Version : "_pReplyDocument.TypeVersion_":"_pReplyDocument.Name)
				s pReplyDocument.DocType=pReplyDocument.TypeVersion_":"_pReplyDocument.Name // Hack pour pouvoir tester les valeurs dans les segments
				s ackCode=pReplyDocument.GetValueAt("MSA:AcknowledgmentCode",,.tSc)
				;$$$TRACE("ackCode : "_ackCode)
				s ackCode=$p($p(pReplyDocument.RawContent,"MSA|",2),"|",1)
				;$$$TRACE("ReplyDocument : "_pReplyDocument.RawContent)
				;$$$TRACE("Ack : "_ackCode)
				if ($E(ackCode,2,2)="A") {	; accepted-> send to archive
					;$$$TRACE("Entry ********* : "_archFileName)
					s tSc=pOriginalDoc.OutputToFile(archFileName,0)
					s:('tSc) tSC= $system.Status.Error(5000,"Cannot archive message in "_archFileName)
				}
				if (($E(ackCode,2,2)="R") ! ($E(ackCode,2,2)="E")){	; error or rejected !!
					//$$$TRACE("Archive Error or Rejected Messages !")
					s tSc=pOriginalDoc.OutputToFile(archErrorFileName,0)
					s:('tSc) tSC= $system.Status.Error(5000,"Cannot archive message in "_archErrorFileName)
					s tSc=pReplyDocument.OutputToFile(archErrorFileName,0)
					s:('tSc) tSC= $system.Status.Error(5000,"Cannot archive error message in "_archErrorFileName)
				}
			}			
		}
	}
	catch (e) {
		s tSC=e.AsStatus()
	}
	q tSC
SPN(SPE)
    F II=$L(SPE):-1:1 S LET=$E(SPE,II) Q:LET'=" " 
    S SPE=$E(SPE,1,II) 
    QUIT SPE
SPND(SPE)
    F II=1:1:$L(SPE) S LET=$E(SPE,II) Q:LET'=" " 
    S SPE=$E(SPE,II,$l(SPE)) 
    QUIT SPE
}

}
