Class CHUBXL.BS.NEW.AgfaHl7TcpIn Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BS Agfa HL7 Tcp

VERSION
-------
CWY	24/07/2018	Initial Version
CWY	30/07/2018	Add comment

ADAPTER
-------
CHUBXL.AD.TCPInboundDelimitedAdaper

MESSAGES
--------
CHUBXL.DATA.RawMessageStream

PROCESS
-------
	// BRUGMANN
	
	AgfaBruRdvHl7TcpIn => AgfaAllRdvRouting
	AgfaBruImgHl7TcpIn => AgfaAllImgRouting
	AgfaBruDocHl7TcpIn => AgfaAllDocRouting
	
	// HUDERF
	
	AgfaHudRdvHl7TcpIn => AgfaAllRdvRouting
	AgfaHudImgHl7TcpIn => AgfaAllImgRouting
	AgfaHudDocHl7TcpIn => AgfaAllDocRouting

OPTIMISATION
------------
- A migrer vers MLLP quand Agfa sera pret

SOURCE
------
CHUBXL.BS.QuadratORMHUDTcpIn
CHUBXL.BS.QuadratORUTcpIn
CHUBXL.BS.QuadratRVTcpIn
--------------------------------------------------------------------------------------------------------------------------------
*/
Property FileArchivePath As %String(TRUNCATE = 1) [ InitialExpression = "D:\DATA\ENS\DATA\QuadratRV\archive" ];

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter ADAPTER = "CHUBXL.AD.TCPInboundDelimitedAdaper";

Parameter SETTINGS = "AddToMetric,FileArchivePath";

Method OnProcessInput(pInput As CHUBXL.DATA.RawMessageStream, pOutput As %RegisteredObject) As %Status
{
	s tsc=$$$OK
	
	//------------------------------
	// Create stream with payLoad
	//------------------------------
	
	s tCharStream=##class(%GlobalCharacterStream).%New()	
	d tCharStream.CopyFrom(pInput.payLoad)
	
	//------------------------------
	// Archive incoming data	
	//------------------------------
	
	i ..FileArchivePath '= "" {
		// Set dir name
		s dir=..FileArchivePath_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		// Create dir if not exist
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		$$$TRACE("dir:"_dir)
		// Set File Sequence
		i '$d(^CHUBXL.FileSeq(..%ConfigName)) s ^CHUBXL.FileSeq(..%ConfigName)=0
		S ^CHUBXL.FileSeq(..%ConfigName)=^CHUBXL.FileSeq(..%ConfigName) + 1
		// Set fileName
		s FileExt="HL7"
		s FileName=""
		s FileName=FileName_..%ConfigName_"_"
		s FileName=FileName_$tr($j(^CHUBXL.FileSeq(..%ConfigName),7)," ","0")
		s FileName=dir_"\"_FileName_"."_FileExt
		$$$TRACE("Writing to Archive File : "_FileName)		
		// Copy stream to file	
		Set file=##class(%FileCharacterStream).%New()
		Set file.Filename=FileName
		do tCharStream.Rewind()
		d file.CopyFrom(tCharStream)
		d file.%Save()
	}
	
	//------------------------------
	// Route message
	//------------------------------
	
	// BRUGMANN
	s:..%ConfigName="AgfaBruRdvHl7TcpIn" tsc=..SendRequestAsync("AgfaAllRdvRouting",pInput)	
	s:..%ConfigName="AgfaBruImgHl7TcpIn" tsc=..SendRequestAsync("AgfaAllImgRouting",pInput)	
	s:..%ConfigName="AgfaBruDocHl7TcpIn" tsc=..SendRequestAsync("AgfaAllDocRouting",pInput)	
	// HUDERF
	s:..%ConfigName="AgfaHudRdvHl7TcpIn" tsc=..SendRequestAsync("AgfaAllRdvRouting",pInput)	
	s:..%ConfigName="AgfaHudImgHl7TcpIn" tsc=..SendRequestAsync("AgfaAllImgRouting",pInput)
	s:..%ConfigName="AgfaHudDocHl7TcpIn" tsc=..SendRequestAsync("AgfaAllDocRouting",pInput)	
	
	q:('tsc)

	//------------------------------
	// Set Metrics
	//------------------------------
		
	d:(tsc) ##class(Ens.BusinessMetric).SetMetric("CHUBXLGeneralMetric","lastMessageReceived",$ZDT($h,3),..%ConfigName)	
		
	Quit tsc
}

}
