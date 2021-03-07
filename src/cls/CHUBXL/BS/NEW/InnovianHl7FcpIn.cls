Class CHUBXL.BS.NEW.InnovianHl7FcpIn Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BS Innovian HL7 Fcp

VERSION
-------
DAM	28/01/2020	Initial Version
DAM	30/03/2020	Initial Version
DAM	30/11/2020	Initial Version

MESSAGES
--------
CHUBXL.MSG.HL7InnovianFile (HL7 + PDF File)

PROCESS
-------
	=> InnovianHudDocRouting

OPTIMISATION
------------
- Fill HL7 message in BP
- Add Metrics ?

SOURCE
------
CHUBXL.BS.OperaHl7FcpIn

--------------------------------------------------------------------------------------------------------------------------------
*/
Property FileArchivePath As %String(TRUNCATE = 1) [ InitialExpression = "G:\PROD\Innovian\archive" ];

Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter ADAPTER = "EnsLib.File.InboundAdapter";

Parameter SETTINGS = "AddToMetric,FileArchivePath";

Method OnProcessInput(pInput As %RegisteredObject, pOutput As %RegisteredObject) As %Status
{
	s tSC=$$$OK	
	
	//------------------------------
	// Set ArchivePath
	//------------------------------
	
	i ..FileArchivePath '= "" {
		s dir=..FileArchivePath_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s ..Adapter.ArchivePath=dir
		$$$TRACE("Set ArchivePath to : "_dir)
	}
	
	//------------------------------
	// Get OK File
	//------------------------------
	
	$$$TRACE("FileName:"_pInput.Attributes("Filename"))
		
	s FileName = ..Adapter.FilePath_$p($p(pInput.Attributes("Filename"),"\",$l(pInput.Attributes("Filename"),"\")),".",1)
	
	$$$TRACE("FileName Prefix : "_FileName)
	
	//------------------------------
	// Get HL7 data
	//------------------------------
	
	If '##class(%Library.File).Exists(FileName_".hl7") {
		$$$TRACE("Warning - HL7 file doesn't exist : "_FileName_".hl7")
		s message="Innovian : ERROR - HL7 file doesn't exist - Get from Innovian("_FileName_".hl7"_" at "_$zdt($h)_")"
		d ..SendAlert(##class(Ens.AlertRequest).%New($LB("Innovian Error - HL7 file doesn't exist : "_FileName_".hl7"_" at "_$zdt($h)_")",message)))	
		s tSC=$$$EnsSystemError
		Quit tSC
	}
	
	//------------------------------
	// Get & Fill HL7 message
	//------------------------------
	
	s HL7File=##class(CHUBXL.MSG.HL7InnovianFile).%New()
	s HL7File.HL7 = ##class(EnsLib.HL7.Message).ImportFromFile(FileName_".hl7")
	
	d HL7File.HL7.DocTypeSet("2.4:ORU_R01")
	
	$$$TRACE("HL7 Name : "_HL7File.HL7.Name)
	$$$TRACE("HL7 RawContent : "_HL7File.HL7.RawContent)
	$$$TRACE("HL7 Identifier : "_HL7File.HL7.Identifier)
	$$$TRACE("HL7 Name : "_HL7File.HL7.Name)
	$$$TRACE("HL7 TypeVersion : "_HL7File.HL7.TypeVersion)
	$$$TRACE("HL7 HospitalService : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PV1grp.PV1:HospitalService",,.tSC)_" tSC:"_tSC)
	$$$TRACE("HL7 ControlID : "_HL7File.HL7.GetValueAt("MSH:MessageControlID",,.tSC)_" tSC:"_tSC)	
	$$$TRACE("HL7 PatientIDInternalID : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PID:PatientID.ID",,.tSC)_" tSC:"_tSC)
	
	s tHop=##class(CHUBXL.DT.Utils).getNHop(HL7File.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PID:PatientIdentifierList(1).ID",,.tSC))
	
	//------------------------------
	// Get PDF data
	//------------------------------

	Set ResultStatus = "", ResultStatus2 = ""
	Set ResultStatus = HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus",,.tSC)
	Set ResultStatus2 = HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBR:ResultStatus",,.tSC)
	Set NumDem = HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:FillerOrderNumber.entityidentifier",,.tSC)
		
	d HL7File.HL7.SetValueAt(NumDem,"MSH:MessageControlID")
	d HL7File.HL7.SetValueAt(tHop,"PIDgrpgrp(1).PIDgrp.PV1grp.PV1:ServicingFacility")
	d HL7File.HL7.SetValueAt("","PIDgrpgrp(1).ORCgrp(1).OBR:CollectorIdentifier(1).IDnumberST")
	d HL7File.HL7.SetValueAt("ORU^R01","MSH:MessageType")
	
	$$$TRACE("HL7 ResultStatus (1): "_ResultStatus)
	$$$TRACE("HL7 ResultStatus (2): "_ResultStatus2)

	If ((ResultStatus = "P") ! (ResultStatus = "F")) {
		Set stream=##class(%FileCharacterStream).%New()
		Set stream.Filename=FileName_".PDF"
		d HL7File.File.CopyFrom(stream)
		d HL7File.%Save()
		$$$TRACE("ID:"_HL7File.%Id())
	}

	//------------------------------
	// Route message
	//------------------------------

	s tSC=..SendRequestAsync("InnovianHudDocRouting",HL7File)	
	
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
