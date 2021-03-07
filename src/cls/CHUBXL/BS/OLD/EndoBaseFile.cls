Class CHUBXL.BS.OLD.EndoBaseFile Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

Property FileArchivePath As %String(TRUNCATE = 1) [ InitialExpression = "G:\dataPROD\EndoBase\archive\HUD" ];

Property FileProdPath As %String(TRUNCATE = 1) [ InitialExpression = "G:\dataPROD\EndoBase\archive\HUD" ];

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter ADAPTER = "EnsLib.File.InboundAdapter";

Parameter SETTINGS = "AddToMetric,FileArchivePath,FileProdPath";

Method OnProcessInput(pInput As %RegisteredObject, pOutput As %RegisteredObject) As %Status
{

	s tSC=$$$OK	
	
	// Set ArchivePath
	
	i ..FileArchivePath '= "" {
		s dir=..FileArchivePath_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s ..Adapter.ArchivePath=dir
		$$$TRACE("Set ArchivePath to : "_dir)
	}
		
	// Get OK File
	
	$$$TRACE("FileName: "_pInput.Attributes("Filename"))
	$$$TRACE("FileSpec: "_..Adapter.FileSpec)
		
	s FileName = ..Adapter.FilePath_"\"_$p($p(pInput.Attributes("Filename"),"\",$l(pInput.Attributes("Filename"),"\")),".hl7",1)
	s FileName = ..Adapter.FilePath_$p($p(pInput.Attributes("Filename"),"\",$l(pInput.Attributes("Filename"),"\")),".",1)
	
	$$$TRACE("FileName Prefix : "_FileName)
	
	// Get HL7 data
	
	s NHop=27
	If '##class(%Library.File).Exists(FileName_".hl7") {
		$$$TRACE("Warning - HL7 file doesn't exist : "_FileName_".hl7")
		Quit tSC
	}
	
	s NewFile=##class(%Library.File).%New(FileName_".hl7")
	$$$TRACE("Taille : "_NewFile.Size)
	d NewFile.Rewind()
	d NewFile.Open()
	d NewFile.Close()
	
	s HL7File=##class(CHUBXL.MSG.HL7DPIFile).%New()
	s HL7File.HL7 = ##class(EnsLib.HL7.Message).ImportFromFile(FileName_".hl7",.tSC)
	
	d HL7File.HL7.DocTypeSet("2.4:ORU_R01")
	
	$$$TRACE("HL7 Name : "_HL7File.HL7.Name)
	$$$TRACE("HL7 Identifier : "_HL7File.HL7.Identifier)
	$$$TRACE("HL7 Name : "_HL7File.HL7.Name)
	$$$TRACE("HL7 TypeVersion : "_HL7File.HL7.TypeVersion)
	$$$TRACE("HL7 HospitalService : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PV1grp.PV1:HospitalService",,.tSC)_" tSC:"_tSC)
	$$$TRACE("HL7 ControlID : "_HL7File.HL7.GetValueAt("MSH:MessageControlID",,.tSC)_" tSC:"_tSC)	
	$$$TRACE("HL7 PIDgrpgrp(1).PIDgrp.PID:PatientID.ID : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PID:PatientID.ID",,.tSC)_" tSC:"_tSC)
	$$$TRACE("HL7 ObservationValue : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationValue",,.tSC)_" tSC:"_tSC)
	$$$TRACE("Longueur : "_$l(HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationValue")))

	s TagAgfa= HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationIdentifier.identifierST",,.tSC)
	$$$TRACE("TagAgfa : *"_TagAgfa_"*")
	$$$TRACE("NHop : *"_NHop_"*")
	i $tr(TagAgfa," ")'="" {
	  s rec=$g(^CHUBXL.ConvArboBDoc(NHop,TagAgfa))
	  s NewRec="^"_TagAgfa_"^"_$tr($p(rec,"~",1,3),"~","^")
	  s tSC1=HL7File.HL7.SetValueAt(NewRec,"PIDgrpgrp(1).ORCgrp(1).OBR:UniversalServiceIdentifier")
	  s tSC1=HL7File.HL7.SetValueAt($p(rec,"~",4),"PIDgrpgrp(1).ORCgrp(1).OBR:PlacerField1")
	  s tSC1=HL7File.HL7.SetValueAt($p(rec,"~",5),"PIDgrpgrp(1).ORCgrp(1).OBR:PlacerField2")
	}


	Set ResultStatus = "", ResultStatus2 = ""
	Set ResultStatus = HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus",,.tSC)
	Set ResultStatus2 = HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBR:ResultStatus",,.tSC)

	$$$TRACE("HL7 ResultStatus (1): "_ResultStatus)
	$$$TRACE("HL7 ResultStatus (2): "_ResultStatus2)
	$$$TRACE("HL7 ResultStatus (3): ")
	$$$TRACE("HL7 ResultStatus (4): "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationResultStatus",,.tSC))
	$$$TRACE("HL7 ResultStatus (5): "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationResultStatus",,.tSC))

	$$$TRACE("Envoi vers BDOcRouting")

	s FileNameOut=$p(HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationValue()",,.tSC),".",1)
	$$$TRACE("FileNameOut 0 : "_FileNameOut)
	s FileNameOut=$p(FileNameOut,"/",$l(FileNameOut,"/"))
	s FileName=$p(FileName,"\",$l(FileName,"\"))
	d ##class(%Library.File).Rename(..Adapter.FilePath_FileNameOut_".PDF",FileName_".PDF")
	$$$TRACE("FileNameOut 1 : "_FileNameOut)
	s tSC1=HL7File.HL7.SetValueAt(..FileProdPath_FileName_".PDF","PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationValue()")
	s tSC1=HL7File.HL7.SetValueAt(HL7File.HL7.GetValueAt("MSH:ProcessingID",,.tSC),"MSH:MessageControlID")
	s tSC1=HL7File.HL7.SetValueAt(NHop,"MSH:SendingFacility.namespaceID")

	Set stream=##class(%FileCharacterStream).%New()
	$$$TRACE("FileName*** : "_FileName)
	Set stream.Filename=FileName_".PDF"
	d HL7File.File.CopyFrom(stream)
	d HL7File.%Save()
	$$$TRACE("ID:"_HL7File.%Id())
	
	s tSC=..SendRequestAsync("EndobaseHudDocRouting",HL7File)	
	
	k HL7File ; Close Object
		
	// Add move file $$$$
	
	s Ext="hl7"
	s From=FileName_"."_Ext
	s To=..Adapter.ArchivePath_$p(FileName,"/",$l(FileName,"/"))_"."_Ext
	d ##class(%Library.File).CopyFile(From,To)
	d ##class(%Library.File).Delete(From)
	$$$TRACE("Archive "_Ext_" File To:"_To)
	
	s Ext="PDF"
	s From=FileName_"."_Ext
	s To=..Adapter.ArchivePath_$p(FileName,"/",$l(FileName,"/"))_"."_Ext
	d ##class(%Library.File).CopyFile(From,To)
	d ##class(%Library.File).Delete(From)
	$$$TRACE("Archive "_Ext_" File From:"_FileName_"."_Ext)
	$$$TRACE("Archive "_Ext_" File To:"_To)

	if ('tSC) {
		s message="FileCopy BDoc : ERROR - Get from BDoc("_pInput.Attributes("Filename")_" at "_$zdt($h)_")"
		d ..SendAlert(##class(Ens.AlertRequest).%New($LB("BDoc IN : "_pInput.Attributes("Filename")_" at "_$zdt($h)_")",message)))	
		}
		
	Quit tSC
}

}
