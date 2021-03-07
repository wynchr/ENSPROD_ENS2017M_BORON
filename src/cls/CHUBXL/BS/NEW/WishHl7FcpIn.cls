Class CHUBXL.BS.NEW.WishHl7FcpIn Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BS WISH HL7

VERSION
-------
CWY	24/07/2018	Initial Version
CWY	30/07/2018	Add comment

MESSAGES
--------
EnsLib.HL7.Message (HL7)

PROCESS
-------
	=> WishAllAdtRouting

OPTIMISATION
------------
- Adapte with generic FilePath

SOURCE
------
CHUBXL.BS.WishHL7File

--------------------------------------------------------------------------------------------------------------------------------
*/
Property FileArchivePath As %String(TRUNCATE = 1) [ InitialExpression = "G:\dataPROD\Wish\archive" ];

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
	
	$$$TRACE("FileName:"_pInput.Attributes("Filename"))
		
	s FileName = pInput.Attributes("Filename")
	
	$$$TRACE("FileName Prefix : "_FileName)
	
	//------------------------------
	// Get HL7 data
	//------------------------------
	
	If '##class(%Library.File).Exists(FileName) {
		$$$TRACE("Warning - HL7 file doesn't exist : "_FileName)
		s message="Wish : ERROR - HL7 file doesn't exist - Get from Wish("_FileName_" at "_$zdt($h)_")"
		d ..SendAlert(##class(Ens.AlertRequest).%New($LB("Wish Error - HL7 file doesn't exist : "_FileName_" at "_$zdt($h)_")",message)))	
		s tSC=$$$EnsSystemError
		Quit tSC
	}
	
	s HL7File=##class(EnsLib.HL7.Message).ImportFromFile(FileName)
	$$$TRACE("Statut : "_tSC)
	d HL7File.DocTypeSet("2.5:ADT_A01")
	
	
	//------------------------------
	// Route message
	//------------------------------
	s MsgId=HL7File.FindSegmentValues("MSH:10")
	$$$TRACE("MsgId : "_MsgId)
	f idx=1:1 {
 	s val=HL7File.FindSegmentValues("IN1("_idx_"):1")
 	$$$TRACE("N° sequence : "_idx_" - Données : *"_val_"*")
 	q:$tr(val," ")=""
	}

	
	;s tSC=..SendRequestAsync("WishAllAdtRouting",HL7File)	
	
	//------------------------------
	// Set Metrics
	//------------------------------	
	
	d:(tSC) ##class(Ens.BusinessMetric).SetMetric("ChubxlGeneralMetric","lastMessageReceived",$ZDT($h,3),..%ConfigName)	

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
