Class CHUBXL.BS.OLD.PLUSFile Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

Property FileArchivePath As %String(TRUNCATE = 1) [ InitialExpression = "G:\dataPROD\BDoc\archive\HUD" ];

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter ADAPTER = "EnsLib.File.InboundAdapter";

Parameter SETTINGS = "AddToMetric,FileArchivePath";

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
		
	s FileName = ..Adapter.FilePath_"\"_$p($p(pInput.Attributes("Filename"),"\",5),".xml",1)
	s FileName = ..Adapter.FilePath_$p($p(pInput.Attributes("Filename"),"\",5),".",1)
	
	$$$TRACE("FileName Prefix : "_FileName)
	
	// Get HL7 data
	
	If '##class(%Library.File).Exists(FileName_".PDF") {
		$$$TRACE("Warning - HL7 file doesn't exist : "_FileName_".PDF")
		Quit tSC
	}
	
	s XMLFile=##class(CHUBXL.MSG.ResultPLUS).%New()

	Set XMLFile.FileName=$p(FileName,"\",5)
	Set stream=##class(%FileCharacterStream).%New()
	Set stream.Filename=FileName_".xml"
	d XMLFile.XML.CopyFrom(stream)
	d XMLFile.%Save()

	Set stream=##class(%FileCharacterStream).%New()
	Set stream.Filename=FileName_".PDF"
	d XMLFile.Blob.CopyFrom(stream)
	d XMLFile.%Save()
	$$$TRACE("ID:"_XMLFile.%Id())
	
	s tSC=..SendRequestAsync("PlusAllDocRouting",XMLFile)	
	
	k XMLFile ; Close Object
		
	// Add move file $$$$
	
	s Ext="xml"
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

	if ('tSC) {
		s message="FileCopy BDoc : ERROR - Get from BDoc("_pInput.Attributes("Filename")_" at "_$zdt($h)_")"
		d ..SendAlert(##class(Ens.AlertRequest).%New($LB("BDoc IN : "_pInput.Attributes("Filename")_" at "_$zdt($h)_")",message)))	
		}
		
	Quit tSC
}

}
