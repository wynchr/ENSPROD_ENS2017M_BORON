Class CHUBXL.BS.OLD.ICIPFile Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

Property FileArchivePath As %String(TRUNCATE = 1) [ InitialExpression = "E:\dataPROD\ICIP\archive" ];

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter ADAPTER = "EnsLib.File.InboundAdapter";

Parameter SETTINGS = "AddToMetric,FileArchivePath";

Method OnProcessInput(pInput As %RegisteredObject, pOutput As %RegisteredObject) As %Status
{

	s tSC=$$$OK	
	
	// Set ArchivePath
	
	// Set ArchivePath
	
	i ..FileArchivePath '= "" {
		s dir=..FileArchivePath_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s ..Adapter.ArchivePath=dir
		$$$TRACE("Set ArchivePath to : "_dir)
	}
		
	// Get OK File
	
	$$$TRACE("FileName:"_pInput.Attributes("Filename"))
		
	s FileName = ..Adapter.FilePath_"\"_$p($p(pInput.Attributes("Filename"),"\",5),".",1)
	s FileName = ..Adapter.FilePath_$p($p(pInput.Attributes("Filename"),"\",5),".",1)
	
	$$$TRACE("FileName Prefix : "_FileName)
	
	// Get HL7 data
	
	If '##class(%Library.File).Exists(FileName_".hl7") {
		$$$TRACE("Warning - HL7 file doesn't exist : "_FileName_".hl7")
		s message="ICIP : ERROR - HL7 file doesn't exist - Get from ICIP("_FileName_".hl7"_" at "_$zdt($h)_")"
		d ..SendAlert(##class(Ens.AlertRequest).%New($LB("ICIP Error - HL7 file doesn't exist : "_FileName_".hl7"_" at "_$zdt($h)_")",message)))	
		s tSC=$$$EnsSystemError
		Quit tSC
	}
	
	s HL7File=##class(CHUBXL.MSG.HL7ICIPFile).%New()
	s HL7File.HL7 = ##class(EnsLib.HL7.Message).ImportFromFile(FileName_".hl7")
	
	d HL7File.HL7.DocTypeSet("2.3:ORU_R01")
	;d HL7File.HL7.DocTypeSet(HL7File.HL7.TypeVersion_":"_HL7File.HL7.Name)
	
	$$$TRACE("HL7 Name : "_HL7File.HL7.Name)
	$$$TRACE("HL7 RawContent : "_HL7File.HL7.RawContent)
	$$$TRACE("HL7 Identifier : "_HL7File.HL7.Identifier)
	$$$TRACE("HL7 Name : "_HL7File.HL7.Name)
	$$$TRACE("HL7 TypeVersion : "_HL7File.HL7.TypeVersion)
		
	;s seg=HL7File.HL7.FindSegment("MSH",.index,.sc)
	;$$$TRACE("HL7 Segment MSH : "_seg.OutputToString())
	;k seg s seg=HL7File.HL7.FindSegment("PID",.index,.sc)
	;$$$TRACE("HL7 Segment PID : "_seg.OutputToString())
	;k seg s seg=HL7File.HL7.FindSegment("OBR",.index,.sc)
	;$$$TRACE("HL7 Segment OBR : "_seg.OutputToString())
	;k seg s seg=HL7File.HL7.FindSegment("OBX",.index,.sc)
	;$$$TRACE("HL7 Segment OBX : "_seg.OutputToString())

	$$$TRACE("HL7 HospitalService : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PV1grp.PV1:HospitalService",,.tSC)_" tSC:"_tSC)
	$$$TRACE("HL7 ControlID : "_HL7File.HL7.GetValueAt("MSH:MessageControlID",,.tSC)_" tSC:"_tSC)	
	$$$TRACE("HL7 PatientIDInternalID : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PID:PatientIDInternalID",,.tSC)_" tSC:"_tSC)
	
	// Get PDF data

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

	If ((ResultStatus = "P") ! (ResultStatus = "F") ! (ResultStatus2 = "P") ! (ResultStatus2 = "F")) {
		Set stream=##class(%FileCharacterStream).%New()
		Set stream.Filename=FileName_".PDF"
		d HL7File.File.CopyFrom(stream)
		d HL7File.%Save()
		$$$TRACE("ID:"_HL7File.%Id())
	}

	// Send Msg to BP

	s tSC=..SendRequestAsync("IcipHudDocRouting",HL7File)	
	
	k HL7File ; Close Object
		
	// Add move file $$$$
	
	s Ext="hl7"
	s From=FileName_"."_Ext
	s To=..Adapter.ArchivePath_$p(FileName,"\",$l(FileName,"\"))_"."_Ext
	d ##class(%Library.File).CopyFile(From,To)
	d ##class(%Library.File).Delete(From)
	$$$TRACE("Archive "_Ext_" File To:"_To)
	
	If ResultStatus '= "I" {
		s Ext="PDF"
		s From=FileName_"."_Ext
		s To=..Adapter.ArchivePath_$p(FileName,"\",$l(FileName,"\"))_"."_Ext
		d ##class(%Library.File).CopyFile(From,To)
		d ##class(%Library.File).Delete(From)
		$$$TRACE("Archive "_Ext_" File To:"_To)
	}
	if ('tSC) {
		s message="FileCopy ICIP : ERROR - Get from ICIP("_pInput.Attributes("Filename")_" at "_$zdt($h)_")"
		d ..SendAlert(##class(Ens.AlertRequest).%New($LB("ICIP IN : "_pInput.Attributes("Filename")_" at "_$zdt($h)_")",message)))	
		}
		
	Quit tSC
}

}
