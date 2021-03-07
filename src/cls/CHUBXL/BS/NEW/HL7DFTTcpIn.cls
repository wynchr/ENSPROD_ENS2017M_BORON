Class CHUBXL.BS.NEW.HL7DFTTcpIn Extends EnsLib.HL7.Service.TCPService
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
		
		s NoIdx=pOriginalDoc.GetValueAt("MSH:MessageControlID",,.tSC)
		$$$TRACE("NoIdx : "_NoIdx)
		$$$TRACE("Message : "_pOriginalDoc.RawContent)

		s %rsDB = ##class(%Library.ResultSet).%New(),ERROR=""
    	/*s %qDB = "select * from CHUBXL_WS_Response.genericApiXmlResponse where NoSeq="_NoIdx
    	$$$TRACE("SQL : "_%qDB)
    	s status=%rsDB.Prepare(%qDB)
    	s status=%rsDB.Execute()
    	While (%rsDB.Next()) {
	   		s NoDos=%rsDB.Data("NOSEQ")
	   		$$$TRACE("NoDos : "_NoDos)
			s ERROR=%rsDB.Data("ERROR")
	   		$$$TRACE("ERROR : "_ERROR)
	    }*/
	    
		$$$TRACE("NoDos : "_NoIdx)
		s MessageWS=$g(^IRIS.dulio2(NoIdx))
		s NoDos=NoIdx
		s ERROR=MessageWS
	    $$$TRACE("NoDos : "_NoDos)
		$$$TRACE("ERROR : "_ERROR)
	    s tSC=##class(CHUBXL.DT.AckToDentAdminDFT).Transform(pReplyDocument,.NewpReplyDocument) ;,ERROR=""
		i ERROR'="" {
		  s archErrorFileName=..FileErrorArchivePath_"\"_##class(Ens.Util.File).CreateTimestamp("HL7TCPINERR","%f-%Y%m%d.hl7")
		  If ('##class(%Library.File).Exists(archErrorFileName)) { 
			  if ('##class(%Library.File).DirectoryExists(..FileErrorArchivePath)) {
			     Set tSC=##class(%Library.File).CreateDirectoryChain(..FileErrorArchivePath) 
				 s:('tSc) tSC= $system.Status.Error(5000,"Cannot create "_..FileErrorArchivePath)
			  }
		  }
   		  s st=NewpReplyDocument.SetValueAt("AE","MSA:AcknowledgmentCode")
   		  s st=NewpReplyDocument.SetValueAt($p(ERROR,"&",2),"MSA:TextMessage")
   		  s st=NewpReplyDocument.SetValueAt(ERROR,"ERR:ErrorCodeandLocation(1).codeidentifyingerror")
   		  $$$TRACE("New Reply : "_NewpReplyDocument.RawContent)
		  s:(tSC) tSC=##super(NewpReplyDocument, pOriginalDoc )
		  s tSc=pOriginalDoc.OutputToFile(archErrorFileName,0)
		  s tSc=NewpReplyDocument.OutputToFile(archErrorFileName,0)
		}
		i ERROR="" s:(tSC) tSC=##super(NewpReplyDocument, pOriginalDoc )
   		s ^IRIS.dulio1($h)=NewpReplyDocument.RawContent
		s %rsDB = ##class(%Library.ResultSet).%New(),ERROR=""
    	/*s %qDB = "delete from CHUBXL_WS_Response.genericApiXmlResponse where NoSeq="_NoIdx
    	s status=%rsDB.Prepare(%qDB)
    	s status=%rsDB.Execute()*/
    	k ^IRIS.dulio2(NoIdx)

		if (tSC) {
			if ((..FileArchivePath '= "")&&($IsObject(pReplyDocument))&& ($IsObject(pReplyDocument.FindSegment("MSA")))) {
				;$$$TRACE(" Version : "_pReplyDocument.TypeVersion_":"_pReplyDocument.Name)
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
