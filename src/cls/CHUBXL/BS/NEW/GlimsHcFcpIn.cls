Class CHUBXL.BS.NEW.GlimsHcFcpIn Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BS GLIMS HC Fcp

VERSION
-------
CWY	24/07/2018	Initial Version
CWY	30/07/2018	Add comment

MESSAGES
---------
CHUBXL.DATA.RawMessageStream (bdocMB)

PROCESS
-------
	=> GlimsAllHcRouting

OPTIMISATION
------------
- change glimsMB in glimsHC ????

SOURCE
------
CHUBXL.BS.GlimsMBFile

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
		s dir=..FileArchivePath_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		$$$TRACE("Set ArchivePath to : "_dir)
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s ..Adapter.ArchivePath=dir
	}
	
	//------------------------------
	// Create RawMessageStream
	//------------------------------
		
	s tSC=##class(CHUBXL.DATA.RawMessageStream).saveMessage(pInput,"glimsMB",.rawMsg)
	q:('tSC) 
	
	//------------------------------
	// Route message
	//------------------------------
		
	s tSC=..SendRequestAsync("GlimsAllHcRouting",rawMsg)	
	
	
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
