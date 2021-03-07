Class CHUBXL.BS.NEW.GlimsHl7TcpIn Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BS GLIMS HL7 Tcp

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
	GlimsBruLabHl7TcpIn	=> GlimsAllLabRouting
	GlimsHudLabHl7TcpIn	=> GlimsAllLabRouting
	GlimsAllMFUHl7TcpIn	=> GlimsAllMFURouting
	
OPTIMISATION
------------
A migrer vers MLLP quand Agfa sera pret

SOURCE
------
CHUBXL.BS.GlimsTcpIn
CHUBXL.BS.GlimsMFUTcpIn

--------------------------------------------------------------------------------------------------------------------------------
*/
Property FileArchivePath As %String(TRUNCATE = 1) [ InitialExpression = "D:\DATA\ENS\DATA\GLIMS\archive" ];

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
		s dir=..FileArchivePath_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		$$$TRACE("dir:"_dir)
	
		// Set File Sequence
		i '$d(^CHUBXL.FileSeq(..%ConfigName)) s ^CHUBXL.FileSeq(..%ConfigName)=0
		S ^CHUBXL.FileSeq(..%ConfigName)=^CHUBXL.FileSeq(..%ConfigName) + 1

		// Set fileName
		s FileName=""
		s FileName=FileName_..%ConfigName_"_"
		s FileName=FileName_$tr($j(^CHUBXL.FileSeq(..%ConfigName),7)," ","0")
		s FileName=dir_"\"_FileName_".HL7"
		
		$$$TRACE("Writing to Archive File : "_FileName)		
			
		Set file=##class(%FileCharacterStream).%New()
		Set file.Filename=FileName
		do tCharStream.Rewind()
		d file.CopyFrom(tCharStream)
		d file.%Save()
	}
	
	//------------------------------
	// Route message
	//------------------------------
	
	s:..%ConfigName="GlimsBruLabHl7TcpIn" tsc=..SendRequestAsync("GlimsAllLabRouting",pInput)	
	s:..%ConfigName="GlimsHudLabHl7TcpIn" tsc=..SendRequestAsync("GlimsAllLabRouting",pInput)

	s:..%ConfigName="GlimsAllMFUHl7TcpIn" tsc=..SendRequestAsync("GlimsAllMFURouting",pInput)	
	
	q:('tsc)

	//------------------------------
	// Set Metrics
	//------------------------------
			
	d:(tsc) ##class(Ens.BusinessMetric).SetMetric("CHUBXLGeneralMetric","lastMessageReceived",$ZDT($h,3),..%ConfigName)	
		
	Quit tsc
}

}
