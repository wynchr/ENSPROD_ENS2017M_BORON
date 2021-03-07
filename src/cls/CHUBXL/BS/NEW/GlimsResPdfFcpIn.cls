Class CHUBXL.BS.NEW.GlimsResPdfFcpIn Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BS GLIMS PDF Fcp

VERSION
-------
DAM	05/09/2019	Initial Version

MESSAGES
--------
CHUBXL.DATA.RawMessageStream

PROCESS
-------
	=> GlimsAllDocResRouting
	
OPTIMISATION
------------
- A réécrire

SOURCE
------


--------------------------------------------------------------------------------------------------------------------------------
*/
Property FileArchivePath As %String(TRUNCATE = 1) [ InitialExpression = "D:\DATA\ENS\DATA\GLIMS\archive" ];

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter ADAPTER = "EnsLib.File.InboundAdapter";

Parameter SETTINGS = "AddToMetric,FileArchivePath";

Method OnProcessInput(pInput As %RegisteredObject, pOutput As %RegisteredObject) As %Status
{
	s tSC=$$$OK	
	
	//------------------------------
	// Set ArchivePath
	//------------------------------
	
	$$$TRACE("FileName : "_pInput.Attributes("Filename"))
	If ##class(%Library.File).Exists(pInput.Attributes("Filename")) {
	   $$$TRACE("HL7 file exist and hang : "_pInput.Attributes("Filename"))
	   H 1
	}

	i ..FileArchivePath '= "" {
		s dir=..FileArchivePath_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		$$$TRACE("Set ArchivePath to : "_dir)
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s ..Adapter.ArchivePath=dir
	}

	s FileName = $p($p(pInput.Attributes("Filename"),"\",$l(pInput.Attributes("Filename"),"\")),".",1,$l(pInput.Attributes("Filename"),".")-1)
	$$$TRACE("FileName : "_FileName)
	s FileName2=$p(FileName,"_",4)
	$$$TRACE("FileName2 : "_FileName2)
	Set PDFFile=##class(CHUBXL.DATA.RawMessageStream).%New()
	Set stream=##class(%FileCharacterStream).%New()
	Set stream.Filename=pInput.Attributes("Filename")
	d PDFFile.payLoad.CopyFrom(stream)
	s PDFFile.source=FileName
	d PDFFile.%Save()
			
	//------------------------------
	// Route message
	//------------------------------		
		
	s tSC=..SendRequestAsync("GlimsAllLabRouting",PDFFile)

	//------------------------------
	// Trap Routing Error
	//------------------------------    
    
    if ('tSC) {
        s message="FileCopy : ERROR - Get from "_..%ConfigName_"("_pInput.Attributes("Filename")_" at "_$zdt($h)_")"
        d ..SendAlert(##class(Ens.AlertRequest).%New($LB(..%ConfigName_" : "_pInput.Attributes("Filename")_" at "_$zdt($h)_")",message)))   
    }

	Quit tSC

SPN(SPE)
    F II=$L(SPE):-1:1 S LET=$E(SPE,II) Q:LET'=" " 
    S SPE=$E(SPE,1,II) 
    QUIT SPE
}

}
