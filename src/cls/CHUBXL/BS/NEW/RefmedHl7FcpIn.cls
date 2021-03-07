Class CHUBXL.BS.NEW.RefmedHl7FcpIn Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BS REFMED HL7 

VERSION
-------
CWY	24/07/2018	Initial Version
CWY	30/07/2018	Add comment

MESSAGES
--------
CHUBXL.DATA.RawMessageStream (medecin)

PROCESS
-------
	=> RefmedAllMedRouting

OPTIMISATION
------------
- Add Metrics ?

SOURCE
------
CHUBXL.BS.MedecinMultiFile

--------------------------------------------------------------------------------------------------------------------------------
*/
Property FileArchivePath As %String(TRUNCATE = 1) [ InitialExpression = "E:\dataPROD\MEDECIN\archive" ];

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter ADAPTER = "EnsLib.File.InboundAdapter";

Parameter SETTINGS = "AddToMetric,FileArchivePath";

Method OnProcessInput(pInput As %FileCharacterStream, pOutput As %RegisteredObject) As %Status
{
	s tSC=$$$OK	
	
	//------------------------------
	// Set ArchivePath
	//------------------------------
	
	$$$TRACE("File : "_pInput.Attributes("Filename"))
	
	i ..FileArchivePath '= "" {
		s dir=..FileArchivePath_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		$$$TRACE("Set ArchivePath to : "_dir)
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s ..Adapter.ArchivePath=dir
	}
			
	//------------------------------
	// Get RawMessage
	//------------------------------	

	s tSC=##class(CHUBXL.DATA.RawMessageStream).saveMessage(pInput,"medecin",.rawMsg) Quit:$$$ISERR(tSC) tSC


	//------------------------------
	// Route message
	//------------------------------
	
	s tSC=..SendRequestAsync("RefmedAllMedRouting",rawMsg)	
		
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
