Class CHUBXL.BS.NEW.RsbEventXmlFcpIn Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BS RSBEVENT XML

VERSION
-------
CWY	24/07/2018	Initial Version
CWY	30/07/2018	Add comment

MESSAGES
--------
CHUBXL.DATA.RawMessageStream (RsbEvent)

PROCESS
-------
	=> RsbEventAllRouting

OPTIMISATION
------------
- Adapte with generic FilePath
- Add Metrics ?
- Z:Drive = %SYS:%ZSTART =d $zf(-1,"net use z: \\10.29.15.250\rswshare\Receive\Notifications\EvenementsCentraux  /user:ABRUMED\USEREVCENT EvECenT@ /persistent:yes")

SOURCE
------
CHUBXL.BS.RsbEventFile

--------------------------------------------------------------------------------------------------------------------------------
*/
Property FileArchivePath As %String(TRUNCATE = 1) [ InitialExpression = "D:\DATA\ENS\Test\MEDIBRIDGE\archive" ];

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
	
	i ..FileArchivePath '= "" {
		s dir=..FileArchivePath_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		$$$TRACE("Set ArchivePath to : "_dir)
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s ..Adapter.ArchivePath=dir
	}
	
	//------------------------------
	// Get RawMessage
	//------------------------------
	
	$$$TRACE("Toto : "_pInput)
	s tSC=##class(CHUBXL.DATA.RawMessageStream).saveMessage(pInput,"RsbEvent",.rawMsg)
	q:('tSC) 	
	
	//------------------------------
	// Route message
	//------------------------------
	
	s tSC=..SendRequestAsync("RsbEventAllRouting",rawMsg)	
	
	
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
