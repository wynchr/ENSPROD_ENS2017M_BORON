Class CHUBXL.BS.NEW.GlimsHl7FcpInSAVE Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BS GLIMS HL7 Fcp

VERSION
-------
CWY	24/07/2018	Initial Version
CWY	30/07/2018	Add comment

MESSAGES
--------
CHUBXL.DATA.RawMessageStream (glims)

PROCESS
-------
	GlimsAllLabHl7FcpIn	=> GlimsAllLabRouting
	GlimsAllMFUHl7FcpIn	=> GlimsAllMFURouting
	
OPTIMISATION
------------
- No archiving ???


SOURCE
------
CHUBXL.BS.GlimsHL7File
CHUBXL.BS.GlimsHL7MFUFile

--------------------------------------------------------------------------------------------------------------------------------
*/
Property FileArchivePath As %String(TRUNCATE = 1) [ InitialExpression = "D:\DATA\ENS\DATA\GLIMS\archive" ];

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
	
	i ..FileArchivePath '= "" {
		s dir=..FileArchivePath_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		$$$TRACE("Set ArchivePath to : "_dir)
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s ..Adapter.ArchivePath=dir
	}
			
	;s msgLine=""
	;while ('pInput.AtEnd) {
	;	s msgLine=msgLine_pInput.Read(32000)
	;}
	
	//------------------------------
	// Create RawMessageStream
	//------------------------------	

	s tSC=##class(CHUBXL.DATA.RawMessageStream).saveMessage(pInput,"glims",.rawMsg) Quit:$$$ISERR(tSC) tSC
	$$$TRACE("Record : "_rawMsg)
	
	//------------------------------
	// Route message
	//------------------------------
		
	s:..%ConfigName="GlimsAllLabHl7FcpIn" tsc=..SendRequestAsync("GlimsAllLabRouting",pInput)	
	s:..%ConfigName="GlimsAllMFUHl7FcpIn" tsc=..SendRequestAsync("GlimsAllMFURouting",pInput)	
	
	//------------------------------
	// Trap Routing Error
	//------------------------------
    
    if ('tSC) {
        s message="FileCopy : ERROR - Get from "_..%ConfigName_"("_pInput.Attributes("Filename")_" at "_$zdt($h)_")"
        d ..SendAlert(##class(Ens.AlertRequest).%New($LB(..%ConfigName_" : "_pInput.Attributes("Filename")_" at "_$zdt($h)_")",message)))   
    }
    
	//------------------------------
	// Sednd to Metrics
	//------------------------------
	    
	d:(tSC) ##class(Ens.BusinessMetric).SetMetric("CHUBXLGeneralMetric","lastMessageReceived",$ZDT($h,3),..%ConfigName)	

	Quit tSC
}

}
