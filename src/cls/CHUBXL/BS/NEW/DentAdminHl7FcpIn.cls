Class CHUBXL.BS.NEW.DentAdminHl7FcpIn Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BS DentAdmin HL7 Fcp

VERSION
-------
CWY	24/07/2018	Initial Version
CWY	30/07/2018	Add comment
DAM 06/08/2018  Adapte with generic FilePath

MESSAGES
--------
CHUBXL.MSG.HL7AstraiaFile (HL7 + File)

PROCESS
-------
	=> DentAdminDocHl7Routing
	
OPTIMISATION
------------
- Fill HL7 message in BP
- Review Process status R like P - Dixit Dulio & Guy !!!!!!!
- Add Metrics ?


SOURCE
------
CHUBXL.BS.BDocFile

--------------------------------------------------------------------------------------------------------------------------------
*/
Property FileArchivePath As %String(TRUNCATE = 1) [ InitialExpression = "G:\PROD\DentAdmin\archive\Bru" ];

Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter ADAPTER = "EnsLib.File.InboundAdapter";

Parameter SETTINGS = "AddToMetric,FileArchivePath";

Property message As %GlobalBinaryStream;

Method OnProcessInput(pInput As %RegisteredObject, pOutput As %RegisteredObject) As %Status
{
	s tSC=$$$OK	
	
	//------------------------------
	// Set ArchivePath
	//------------------------------
	$$$TRACE("*************************************************************")
	i ..FileArchivePath '= "" {
		s dir=..FileArchivePath_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s ..Adapter.ArchivePath=dir
		$$$TRACE("Set ArchivePath to : "_dir)
	}
		
	//------------------------------
	// Get OK File
	//------------------------------
	
	$$$TRACE("FileName: "_pInput.Attributes("Filename"))
	$$$TRACE("FileSpec: "_..Adapter.FileSpec)
		
	s FileName = ..Adapter.FilePath_$p($p(pInput.Attributes("Filename"),"\",$l(pInput.Attributes("Filename"),"\")),".",1)
	
	$$$TRACE("FileName Prefix : "_FileName)
	
	//------------------------------
	// Get HL7 data
	//------------------------------
	
	If '##class(%Library.File).Exists(FileName_".hl7") {
		$$$TRACE("Warning - HL7 file doesn't exist : "_FileName_".hl7")
		Quit tSC
	}
	
	s NewFile=##class(%Library.File).%New(FileName_".hl7")
	$$$TRACE("Taille : "_NewFile.Size)
	d NewFile.Rewind()
	d NewFile.Open()
	
	
	// CWY quid ZRW ?
	
	s msgHL7="",msgZRW="",EndHL7=0,message="",message2=""
	while ('NewFile.AtEnd) {
		s NewLine=NewFile.ReadLine()
		i $e(NewLine,1,3)="OBX" s EndHL7=1,OldLine=NewLine,NewLine=$p($p(NewLine,"|",6),"^",5),msgHL7=msgHL7_$p(OldLine,"|",1,5)_"|"
		i 'EndHL7 s msgHL7=msgHL7_NewLine_$c(13)
		i EndHL7 {
		  $$$TRACE("NewLine : "_NewLine) 
		  i NewLine["|" {
			s msgHL7=msgHL7_$p(NewLine,"|",2,99)
			s NewLine=$p(NewLine,"|",1)
		  }
		  s message=message_$system.Encryption.Base64Decode(NewLine)
		  s message2=message2_NewLine
		}
	}
	d NewFile.Close()
	s message=$system.Encryption.Base64Decode(message2)
	
	//------------------------------
	// Get & Fill HL7 message
	//------------------------------
	
	s HL7File=##class(CHUBXL.MSG.HL7DentAdminFile).%New()
	s HL7File.HL7 = ##class(EnsLib.HL7.Message).ImportFromString(msgHL7,.tSC)
	s HL7File.Msg = message
	d HL7File.HL7.DocTypeSet("2.4:ORU_R01")
	
	Set ResultStatus = ""
	Set ResultStatus = HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus",,.tSC)

	$$$TRACE("HL7 ResultStatus (1): "_ResultStatus)

	// Send Msg to BP  **** $system.Encryption.Base64Decode(msg) *****
	
	s TreeNote=HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:UniversalServiceIdentifier",,.tSC)
	s DateRep=HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:ObservationDateTime",,.tSC)
	s DateRep=$e(DateRep,7,8)_"/"_$e(DateRep,5,6)_"/"_$e(DateRep,1,4)_" à "_$e(DateRep,9,10)_":"_$e(DateRep,11,12)_":"_$e(DateRep,13,14)

	$$$TRACE("Envoi vers DentAdminRouting")
	s tSC1=HL7File.HL7.SetValueAt("DentAdmin","PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationIdentifier.identifierST")

	s FileNameOut=FileName
	s FileNameOut=$p(FileNameOut,"\",$l(FileNameOut,"\"))
	d ##class(%Library.File).Delete(FileName_".HL7")
	Set file=##class(%File).%New(FileName_".HL7")
	Do file.Open("WSN")
	Do file.Write(msgHL7)
	Do file.Close()
	Set file=##class(%File).%New(FileName_".PDF")
	Do file.Open("WSN")
	Do file.Write(message)
	Do file.Close()
	
	Set stream=##class(%FileCharacterStream).%New()	
	Set stream.Filename=FileName_".PDF"
	d HL7File.File.CopyFrom(stream)
	d HL7File.%Save()
	//------------------------------
	// Route message
	//------------------------------
	
	s tSC=..SendRequestAsync("DentAdminBruDocRouting",HL7File)	

	//------------------------------
	// Close Object
	//------------------------------
	
	k HL7File ; Close Object
		
	//------------------------------
	// Archive incoming data	
	//------------------------------
	
	s Ext="hl7"
	s From=FileName_"."_Ext
	s To=..Adapter.ArchivePath_$p(FileName,"\",$l(FileName,"\"))_"."_Ext
	d ##class(%Library.File).CopyFile(From,To)
	d ##class(%Library.File).Delete(From)
	$$$TRACE("Archive "_Ext_" File To:"_To)
	
	s Ext="PDF"
	s From=FileName_"."_Ext
	s To=..Adapter.ArchivePath_$p(FileName,"\",$l(FileName,"\"))_"."_Ext
	d ##class(%Library.File).CopyFile(From,To)
	d ##class(%Library.File).Delete(From)
	$$$TRACE("Archive "_Ext_" File To:"_To)

	//------------------------------
	// Trap Routing Error
	//------------------------------    
    
    if ('tSC) {
        s message="FileCopy : ERROR - Get from "_..%ConfigName_"("_pInput.Attributes("Filename")_" at "_$zdt($h)_")"
        d ..SendAlert(##class(Ens.AlertRequest).%New($LB(..%ConfigName_" : "_pInput.Attributes("Filename")_" at "_$zdt($h)_")",message)))   
    }
		
	Quit tSC
}

}
