Class CHUBXL.BS.NEW.PlusXmlFcpIn Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BS PLUS XML

VERSION
-------
CWY	24/07/2018	Initial Version
CWY	30/07/2018	Add comment
DAM 06/08/2018	Adapte with generic FilePath

MESSAGES
--------
CHUBXL.MSG.ResultPLUS (XML)

PROCESS
-------
	=> PlusAllDocRouting

OPTIMISATION
------------
- Fill HL7 message in BP
- Add Metrics ?

SOURCE
------
CHUBXL.BS.PLUSFile

--------------------------------------------------------------------------------------------------------------------------------
*/
Property FileArchivePath As %String(TRUNCATE = 1) [ InitialExpression = "G:\dataPROD\BDoc\archive\HUD" ];

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
	
	$$$TRACE("FileName: "_pInput.Attributes("Filename"))
	$$$TRACE("FileSpec: "_..Adapter.FileSpec)

	s FileName = ..Adapter.FilePath_$p($p(pInput.Attributes("Filename"),"\",$l(pInput.Attributes("Filename"),"\")),".",1)
	
	$$$TRACE("FileName Prefix : "_FileName)
	
	//------------------------------
	// Get HL7 data
	//------------------------------
	
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

	//------------------------------
	// Route message
	//------------------------------
		
	s tSC=..SendRequestAsync("PlusAllDocRouting",XMLFile)	
		
	//------------------------------
	// Close Object
	//------------------------------
			
	k XMLFile ; Close Object
		
	//------------------------------
	// Archive incoming data	
	//------------------------------
	
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
