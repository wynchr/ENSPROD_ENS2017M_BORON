Class CHUBXL.BS.NEW.DiamicHl7FcpIn Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BS DIAMIC HL7 Fcp

VERSION
-------
CWY	24/07/2018	Initial Version
CWY	30/07/2018	Add comment
DAM 06/08/2018  Adapte with generic FilePath

MESSAGES
--------
CHUBXL.MSG.HL7DiamicFile (HL7 + RTF File)

PROCESS
-------
	=> DiamicAllDocRouting

OPTIMISATION
------------
- Fill HL7 message in BP
- Review Process status R like P - Dixit Dulio & Guy !!!!!!!
- Add Metrics ?

SOURCE
------
CHUBXL.BS.DiamicFile

--------------------------------------------------------------------------------------------------------------------------------
*/
Property FileArchivePath As %String(TRUNCATE = 1) [ InitialExpression = "D:\DATA\ENS\Test\DIAMIC\archive" ];

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
		s message="Diamic : ERROR - HL7 file doesn't exist - Get from DIAMIC("_FileName_".hl7"_" at "_$zdt($h)_")"
		d ..SendAlert(##class(Ens.AlertRequest).%New($LB("DIAMIC Error - HL7 file doesn't exist : "_FileName_".hl7"_" at "_$zdt($h)_")",message)))	
		s tSC=$$$EnsSystemError
		Quit tSC
	}

	//------------------------------
	// Get & Fill HL7 message
	//------------------------------
	
	s HL7File=##class(CHUBXL.MSG.HL7DiamicFile).%New()
	s HL7File.HL7 = ##class(EnsLib.HL7.Message).ImportFromFile(FileName_".hl7")
	
	d HL7File.HL7.DocTypeSet("2.3:ORU_R01")
	;d HL7File.HL7.DocTypeSet(HL7File.HL7.TypeVersion_":"_HL7File.HL7.Name)
	
	$$$TRACE("HL7 Name : "_HL7File.HL7.Name)
	$$$TRACE("HL7 RawContent : "_HL7File.HL7.RawContent)
	$$$TRACE("HL7 Identifier : "_HL7File.HL7.Identifier)
	$$$TRACE("HL7 Name : "_HL7File.HL7.Name)
	$$$TRACE("HL7 TypeVersion : "_HL7File.HL7.TypeVersion)
	$$$TRACE("HL7 HospitalService : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PV1grp.PV1:HospitalService",,.tSC)_" tSC:"_tSC)
	$$$TRACE("HL7 ControlID : "_HL7File.HL7.GetValueAt("MSH:MessageControlID",,.tSC)_" tSC:"_tSC)	
	$$$TRACE("HL7 PatientIDInternalID : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PID:PatientIDInternalID",,.tSC)_" tSC:"_tSC)
	
	s ValueType=HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ValueType")
	s ObsValue=HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationValue()")
	$$$TRACE("ValueType : "_ValueType)
	$$$TRACE("ObsValue : "_ObsValue)
	$$$TRACE("Longueur : "_$l(HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationValue")))
	
	i (ValueType="FT") & (ObsValue'="") {
	  Set file=##class(%File).%New(FileName_".RTF")
	  Do file.Open("WSN")
	  Do file.Write($tr(ObsValue,"é","e"))
	  Do file.Close()
	  }	
	
	//------------------------------
	// Get RTF data
	//------------------------------

	Set ResultStatus = "", ResultStatus2 = ""
	Set ResultStatus = HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus",,.tSC)
	Set ResultStatus2 = HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBR:ResultStatus",,.tSC)
	
	$$$TRACE("HL7 ResultStatus (1): "_ResultStatus)
	$$$TRACE("HL7 ResultStatus (2): "_ResultStatus2)

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

	If ((ResultStatus = "P") ! (ResultStatus = "F") ! (ResultStatus2 = "P") ! (ResultStatus2 = "F") ! (ResultStatus = "I")) {
		Set stream=##class(%FileCharacterStream).%New()
		Set stream.Filename=FileName_".RTF"
		d HL7File.File.CopyFrom(stream)
		d HL7File.%Save()
		$$$TRACE("ID:"_HL7File.%Id())
	}

	//------------------------------
	// Route message
	//------------------------------

	s tSC=..SendRequestAsync("DiamicAllDocRouting",HL7File)	
	
	//------------------------------
	// Set Metrics
	//------------------------------
	
	d:(tSC) ##class(Ens.BusinessMetric).SetMetric("CHUBXLGeneralMetric","lastMessageReceived",$ZDT($h,3),..%ConfigName)	

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
	s To1="G:\PREP\Diamic\in\"_$p(FileName,"\",$l(FileName,"\"))_"."_Ext
	d ##class(%Library.File).CopyFile(From,To)
	d ##class(%Library.File).CopyFile(From,To1)
	d ##class(%Library.File).Delete(From)
	$$$TRACE("Archive "_Ext_" File To:"_To)
	
	s Ext="RTF"
	s From=FileName_"."_Ext
	s To=..Adapter.ArchivePath_$p(FileName,"\",$l(FileName,"\"))_"."_Ext
	s To1="G:\PREP\Diamic\in\"_$p(FileName,"\",$l(FileName,"\"))_"."_Ext
	d ##class(%Library.File).CopyFile(From,To)
	d ##class(%Library.File).CopyFile(From,To1)
	d ##class(%Library.File).Delete(From)
	$$$TRACE("Archive "_Ext_" File To:"_To)
	
	Set file=##class(%File).%New("G:\PREP\Diamic\in\"_$p(FileName,"\",$l(FileName,"\"))_".ok")
	d file.Open("WSN")
	d file.WriteLine("")
	d file.Close()

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
