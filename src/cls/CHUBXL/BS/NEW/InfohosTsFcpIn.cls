Class CHUBXL.BS.NEW.InfohosTsFcpIn Extends Ens.BusinessService [ ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BS INFOHOS TS

VERSION
-------
CWY	24/07/2018	Initial Version
CWY	30/07/2018	Add comment

MESSAGES
--------
CHUBXL.DATA.InfohosPresc (InfohosPresc)

PROCESS
-------
		=> InfohosTsAllPhaRouting


OPTIMISATION
------------
- %BinaryStream ?
- Add Metrics ?

SOURCE
------
CHUBXL.BS.InfohosMultiFile

--------------------------------------------------------------------------------------------------------------------------------
*/
Property FileArchivePath As %String(TRUNCATE = 1) [ InitialExpression = "E:\dataTEST\Infohos\archive" ];

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter ADAPTER = "EnsLib.File.InboundAdapter";

Parameter SETTINGS = "AddToMetric,FileArchivePath";

Method OnProcessInput(pInput As %BinaryStream, pOutput As %RegisteredObject) As %Status
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
	// Fill message
	//------------------------------
		
	s tSC=##class(CHUBXL.DATA.InfohosPresc).saveMessage(pInput,"InfohosPresc",.rawMsg)
	q:('tSC) 	
	
	//------------------------------
	// Route message
	//------------------------------
	
	s tSC=..SendRequestAsync("InfohosTsAllPhaRouting",rawMsg)
	
	
	Quit tSC
}

}
