Class CHUBXL.BS.NEW.Hl7MllpTcpIn Extends EnsLib.HL7.Service.TCPService
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BS HL7 MLLP

VERSION
-------
DAM	13/04/2018	Initial Version
CWY	24/07/2018	Initial Version

OPTIMISATION
------------

SOURCE
------
CHUBXL.BS.HL7TcpIn

--------------------------------------------------------------------------------------------------------------------------------
*/
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Property FileArchivePath As %String(MAXLEN = 255);

Property FileErrorArchivePath As %String(MAXLEN = 255);

Parameter SETTINGS = "AddToMetric,FileArchivePath,FileErrorArchivePath";

Method SendReply(pReplyDocument As EnsLib.EDI.Document, pOriginalDoc As EnsLib.EDI.Document = {$$$NULLOREF}) As %Status
{
	try {
		s tSC=$$$OK 
		h 1				;CWY Why ???
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
		$$$TRACE("== TcpIn ==================")
		s:(tSC) tSC=##super(pReplyDocument, pOriginalDoc )
		$$$TRACE("Config : "_..%ConfigName)
		d:(tSC) ##class(Ens.BusinessMetric).SetMetric("ChubxlGeneralMetric","lastMessageReceived",$ZDT($h,3),..%ConfigName)
		;$$$TRACE("tSC : "_tSC)
		
		
		if (tSC) {
			if ((..FileArchivePath '= "")&&($IsObject(pReplyDocument))&& ($IsObject(pReplyDocument.FindSegment("MSA")))) {
				
				$$$TRACE("Version : "_pReplyDocument.TypeVersion_":"_pReplyDocument.Name)
				
				s pReplyDocument.DocType=pReplyDocument.TypeVersion_":"_pReplyDocument.Name // Hack pour pouvoir tester les valeurs dans les segments
				
				s ackCode=pReplyDocument.GetValueAt("MSA:AcknowledgmentCode",,.tSc)
				$$$TRACE("ackCode1 : "_ackCode)
				
				s ackCode=$p($p(pReplyDocument.RawContent,"MSA|",2),"|",1)
				$$$TRACE("ReplyDocument : "_pReplyDocument.RawContent)
				$$$TRACE("AckCode2 : "_ackCode)
				s MsgReply=pReplyDocument.RawContent
				s IdMsg=$p(pOriginalDoc.RawContent,"|",10)
				$$$TRACE("IdMsg : "_IdMsg)
				
				if ($E(ackCode,2,2)="A") {	; accepted-> send to archive
					s tSc=pOriginalDoc.OutputToFile(archFileName,0)
					s:('tSc) tSC= $system.Status.Error(5000,"Cannot archive message in "_archFileName)
					i ..%ConfigName="WishBruAdtHl7TcpIn" s ^IRIS.dulio(..%ConfigName,"OK",$zd($h,8),0)=$g(^IRIS.dulio(..%ConfigName,"OK",$zd($h,8),0))+1
					i ..%ConfigName="WishHudAdtHl7TcpIn" s ^IRIS.dulio(..%ConfigName,"OK",$zd($h,8),0)=$g(^IRIS.dulio(..%ConfigName,"OK",$zd($h,8),0))+1
					i +IdMsg'>+$g(^IRIS.dulio(..%ConfigName,"OK",$zd($h,8),1)) {
					  s ^IRIS.dulio(..%ConfigName,"OK",$zd($h,8),+IdMsg)=$g(^IRIS.dulio(..%ConfigName,"OK",$zd($h,8),+IdMsg))+1
					  s ^IRIS.dulio(..%ConfigName,"OK",$zd($h,8),+IdMsg)=^IRIS.dulio(..%ConfigName,"OK",$zd($h,8),+IdMsg)_"~"_$g(ackCode)_"~"_$g(MsgReply)
					}
					s ^IRIS.dulio(..%ConfigName,"OK",$zd($h,8),1)=+IdMsg
				}
				if (($E(ackCode,2,2)="R") ! ($E(ackCode,2,2)="E")){	; error or rejected !!
					//$$$TRACE("Archive Error or Rejected Messages !")
					s tSc=pOriginalDoc.OutputToFile(archErrorFileName,0)
					s:('tSc) tSC= $system.Status.Error(5000,"Cannot archive message in "_archErrorFileName)
					s tSc=pReplyDocument.OutputToFile(archErrorFileName,0)
					s:('tSc) tSC= $system.Status.Error(5000,"Cannot archive error message in "_archErrorFileName)
					i ..%ConfigName="WishBruAdtHl7TcpIn" s ^IRIS.dulio(..%ConfigName,"NOK",$zd($h,8),0)=$g(^IRIS.dulio(..%ConfigName,"NOK",$zd($h,8),0))+1
					i ..%ConfigName="WishHudAdtHl7TcpIn" s ^IRIS.dulio(..%ConfigName,"NOK",$zd($h,8),0)=$g(^IRIS.dulio(..%ConfigName,"NOK",$zd($h,8),0))+1
				}
			}
			
		}
	}
	catch (e) {
		s tSC=e.AsStatus()
	}
	
	q tSC
}

}
