Class CHUBXL.BS.NEW.EcareHl7FcpIn Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BS ECARE HL7 Fcp

VERSION
-------
CWY	24/07/2018	Initial Version
CWY	30/07/2018	Add comment
DAM 06/08/2018	Adapte with generic FilePath

MESSAGES
--------
CHUBXL.MSG.HL7EcareFile (HL7 + RTF File)

PROCESS
-------
	=> EcareBruDocRouting

OPTIMISATION
------------
- Fill HL7 message in BP
- Review Process status R like P - Dixit Dulio & Guy !!!!!!!
- Add Metrics ?

SOURCE
------
CHUBXL.BS.EcareFile

--------------------------------------------------------------------------------------------------------------------------------
*/
Property FileArchivePath As %String(TRUNCATE = 1) [ InitialExpression = "E:\dataPROD\Ecare\archive" ];

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
	//	s message="Ecare : ERROR - HL7 file doesn't exist - Get from Ecare("_FileName_".hl7"_" at "_$zdt($h)_")"
	//	d ..SendAlert(##class(Ens.AlertRequest).%New($LB("Ecare Error - HL7 file doesn't exist : "_FileName_".hl7"_" at "_$zdt($h)_")",message)))	
	//	s tSC=$$$EnsSystemError
		Quit tSC
	}

	//------------------------------
	// Get & Fill HL7 message
	//------------------------------

	s HL7File=##class(CHUBXL.MSG.HL7EcareFile).%New()
	s HL7File.HL7 = ##class(EnsLib.HL7.Message).ImportFromFile(FileName_".hl7")
	
	d HL7File.HL7.DocTypeSet("2.3:ORU_R01")
	//d HL7File.HL7.DocTypeSet(HL7File.HL7.TypeVersion_":"_HL7File.HL7.Name)
	
	$$$TRACE("HL7 Name : "_HL7File.HL7.Name)
	$$$TRACE("HL7 RawContent : "_HL7File.HL7.RawContent)
	$$$TRACE("HL7 RawContent length : "_$l(HL7File.HL7.RawContent))
	s message=$p($p(HL7File.HL7.RawContent,"OBX",2),"|",6)
	$$$TRACE("Message : "_message)
	$$$TRACE("Message length : "_$l(message))
	$$$TRACE("HL7 Identifier : "_HL7File.HL7.Identifier)
	$$$TRACE("HL7 Name : "_HL7File.HL7.Name)
	$$$TRACE("HL7 TypeVersion : "_HL7File.HL7.TypeVersion)
	$$$TRACE("HL7 HospitalService : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PV1grp.PV1:HospitalService",,.tSC)_" tSC:"_tSC)
	$$$TRACE("HL7 ControlID : "_HL7File.HL7.GetValueAt("MSH:MessageControlID",,.tSC)_" tSC:"_tSC)	
	$$$TRACE("HL7 PatientIDInternalID : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PID:PatientIDInternalID",,.tSC)_" tSC:"_tSC)
	$$$TRACE("HL7 ObservationValue : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationValue",,.tSC)_" tSC:"_tSC)
	s msg=HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationValue")
	;$$$TRACE("HL7 message RTF : "_$system.Encryption.Base64Decode(msg))
	$$$TRACE("Longueur : "_$l(HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationValue")))
	
	Set file=##class(%File).%New(FileName_".RTF")
	Do file.Open("WSN")
	Do file.Write($system.Encryption.Base64Decode(message))
	Do file.Close()
	;d HL7File.HL7.SetValueAt("","PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationValue")
	
	//------------------------------
	// Get RTF data
	//------------------------------

	Set ResultStatus = "", ResultStatus2 = "", ResultStatus3 = $p($p(HL7File.HL7.RawContent,"OBX",2),"|",12)
	Set ResultStatus = HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus",,.tSC)
	Set ResultStatus2 = HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBR:ResultStatus",,.tSC)
	d HL7File.HL7.SetValueAt(ResultStatus3,"PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservResultStatus")  		

	$$$TRACE("HL7 ResultStatus (1): "_ResultStatus)
	$$$TRACE("HL7 ResultStatus (2): "_ResultStatus2)
	$$$TRACE("HL7 ResultStatus (3): "_ResultStatus3)
	$$$TRACE("HL7 ResultStatus (4): "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationResultStatus",,.tSC))
	$$$TRACE("HL7 ResultStatus (5): "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservResultStatus",,.tSC))

	// Process status R like P - Dixit Dulio & Guy
	
	If ResultStatus = "R" {
		s ResultStatus = "P"
		d HL7File.HL7.SetValueAt("P","PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus")
		d HL7File.HL7.SetValueAt("P","PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservResultStatus") 		
		d HL7File.HL7.SetValueAt("P","PIDgrpgrp(1).ORCgrp(1).OBXgrp(2).OBX:ObservResultStatus") 
		d HL7File.HL7.SetValueAt("P","PIDgrpgrp(1).ORCgrp(1).OBXgrp(3).OBX:ObservResultStatus") 
	}
	If ResultStatus2 = "R" {
		s ResultStatus2 = "P"
		d HL7File.HL7.SetValueAt("P","PIDgrpgrp(1).ORCgrp(2).OBR:ResultStatus")
		d HL7File.HL7.SetValueAt("P","PIDgrpgrp(1).ORCgrp(2).OBXgrp(1).OBX:ObservResultStatus") 		
		d HL7File.HL7.SetValueAt("P","PIDgrpgrp(1).ORCgrp(2).OBXgrp(2).OBX:ObservResultStatus") 
		d HL7File.HL7.SetValueAt("P","PIDgrpgrp(1).ORCgrp(2).OBXgrp(3).OBX:ObservResultStatus") 		
	}

	If ((ResultStatus = "P") ! (ResultStatus = "F") ! (ResultStatus2 = "P") ! (ResultStatus2 = "F")) {
		Set stream=##class(%FileCharacterStream).%New()	
		Set stream.Filename=FileName_".RTF"
		d HL7File.File.CopyFrom(stream)
		d HL7File.%Save()
		$$$TRACE("ID:"_HL7File.%Id())
	}

	//------------------------------
	// Route message
	//------------------------------
	
	// Send Msg to BP  **** $system.Encryption.Base64Decode(msg) *****

	$$$TRACE("Envoi vers EcareRouting")
	s tSC=..SendRequestAsync("EcareBruDocRouting",HL7File)	

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
	
	If ResultStatus '= "I" {
		s Ext="RTF"
		s From=FileName_"."_Ext
		s To=..Adapter.ArchivePath_$p(FileName,"\",$l(FileName,"\"))_"."_Ext
		d ##class(%Library.File).CopyFile(From,To)
		d ##class(%Library.File).Delete(From)
		$$$TRACE("Archive "_Ext_" File To:"_To)
	}
	
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
