Class CHUBXL.BS.NEW.OpthHCUMFcpIn Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BS BDOC HC Fcp

VERSION
-------
CWY	24/07/2018	Initial Version
CWY	30/07/2018	Add comment

MESSAGES
---------
CHUBXL.DATA.RawMessageStream (bdocMB)

PROCESS
-------
	=> BdocAllHcRouting

OPTIMISATION
------------
- change bdocMB in OpthHCUM

SOURCE
------
CHUBXL.BS.BDocMBFile

--------------------------------------------------------------------------------------------------------------------------------
*/
Property FileArchivePath As %String(TRUNCATE = 1) [ InitialExpression = "D:\DATA\ENS\Test\MEDIBRIDGE\archive" ];

Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter ADAPTER = "EnsLib.File.InboundAdapter";

Parameter SETTINGS = "AddToMetric,FileArchivePath";

Method OnProcessInput(pInput As %RegisteredObject, pOutput As %RegisteredObject) As %Status
{
    s tSC=$$$OK 
    
	//------------------------------
	// Archive incoming data	
	//------------------------------
    
    i ..FileArchivePath '= "" {
	    // Set dir name
        s dir=..FileArchivePath_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
        $$$TRACE("Set ArchivePath to : "_dir)
        // Create dir if not exist
        If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
        s ..Adapter.ArchivePath=dir
    }
    
	//------------------------------
	// Create RawMessageStream
	//------------------------------
	
	s tSC=##class(CHUBXL.DATA.RawMessageStream).saveMessage(pInput,"OphtHCUM",.rawMsg)
    q:('tSC)    
    
	//------------------------------
	// Route message
	//------------------------------
    
    s tSC=..SendRequestAsync("HCUMRouting",rawMsg)   

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
