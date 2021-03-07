Class CHUBXL.BO.OLD.HL7TcpOut Extends EnsLib.HL7.Operation.TCPOperation
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
Production ENSPROD

VERSION
-------
DAM	13/04/2018	Initial Version
--------------------------------------------------------------------------------------------------------------------------------
*/
/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Property FileArchivePath As %String(MAXLEN = 255);

Property FileErrorArchivePath As %String(MAXLEN = 255);

Parameter SETTINGS = "AddToMetric,FileArchivePath,FileErrorArchivePath";

Method SendMessage(pMsgOut As EnsLib.HL7.Message, Output pMsgIn As EnsLib.HL7.Message, pExpectedSequenceNumber As %String) As %Status
{
	try {
		s tSC=$$$OK
		// Test and  create ArchivePath
		i (..FileArchivePath '= "") {
			s archFileName=..FileArchivePath_"\"_##class(Ens.Util.File).CreateTimestamp("HL7TCPOUT","%f-%Y%m%d.hl7")
			If ('##class(%Library.File).Exists(archFileName)) { 
				if ('##class(%Library.File).DirectoryExists(..FileArchivePath)) {
					Set tSC=##class(%Library.File).CreateDirectoryChain(..FileArchivePath) 
					s:('tSc) tSC= $system.Status.Error(5000,"Cannot create "_..FileArchivePath)
				}
			}
			//$$$TRACE("Set ArchivePath to : "_archFileName)
		}
		i (..FileErrorArchivePath '= "")&&(tSC) {
			s archErrorFileName=..FileErrorArchivePath_"\"_##class(Ens.Util.File).CreateTimestamp("HL7TCPOUTERR","%f-%Y%m%d.hl7")
			If ('##class(%Library.File).Exists(archErrorFileName)) { 
				if ('##class(%Library.File).DirectoryExists(..FileErrorArchivePath)) {
					Set tSC=##class(%Library.File).CreateDirectoryChain(..FileErrorArchivePath) 
					s:('tSc) tSC= $system.Status.Error(5000,"Cannot create "_..FileErrorArchivePath)
				}
			}
			//$$$TRACE("Set ArchivePath to : "_archFileName)
		}
		
		s:(tSC) tSC=##super(pMsgOut, .pMsgIn, pExpectedSequenceNumber)
		
		$$$TRACE("== TcpOut ==================")
		$$$TRACE("pMsgIn : "_pMsgIn.RawContent)
		$$$TRACE("pMsgOut : "_pMsgOut.RawContent)
		
		if (tSC) {
			if ((..FileArchivePath '= "")&&($IsObject(pMsgIn))&& ($IsObject(pMsgIn.FindSegment("MSA")))) {
				s pMsgIn.DocType=pMsgIn.TypeVersion_":"_pMsgIn.Name // Hack pour pouvoir tester les valeurs dans les segments
				
				s ackCode=pMsgIn.GetValueAt("MSA:AcknowledgmentCode",,.tSc)
				$$$TRACE("ackCode1 : "_ackCode)
				
				s ackCode=$p($p(pMsgIn.RawContent,"MSA|",2),"|",1)
				$$$TRACE("ackCode2 : "_ackCode)
				
				if ($E(ackCode,2,2)="A") {	; accepted-> send to archive
					s tSc=pMsgOut.OutputToFile(archFileName,0)
					s:('tSc) tSC= $system.Status.Error(5000,"Cannot archive message in "_archFileName)
				}
				if (($E(ackCode,2,2)="R") ! ($E(ackCode,2,2)="E")){	; error or rejected !!
					//$$$TRACE("Archive Error or Rejected Messages !")
					s tSc=pMsgOut.OutputToFile(archErrorFileName,0)
					s:('tSc) tSC= $system.Status.Error(5000,"Cannot archive message in "_archErrorFileName)
					s tSc=pMsgIn.OutputToFile(archErrorFileName,0)
					s:('tSc) tSC= $system.Status.Error(5000,"Cannot archive error message in "_archErrorFileName)
				}
			}			
		}
		d ##class(Ens.BusinessMetric).SetMetric("ChubxlGeneralMetric","lastMessageReceived",$ZDT($h,3),..%ConfigName)	

	}
	catch (e) {
		s tSC=e.AsStatus()
	}
	q tSC
}

}
