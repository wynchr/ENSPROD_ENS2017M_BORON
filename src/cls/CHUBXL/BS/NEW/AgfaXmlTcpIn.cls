Class CHUBXL.BS.NEW.AgfaXmlTcpIn Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BS Agfa XML

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
Correlate("RECORD","CHUBXL.MSG.ResultQuadrat")

PROCESS
-------
	=> AgfaMvAllDocRouting

OPTIMISATION
------------
- A migrer vers MLLP quand Agfa sera pret

SOURCE
------
CHUBXL.BS.QuadratTcpIn

--------------------------------------------------------------------------------------------------------------------------------
*/
Property FileArchivePath As %String(TRUNCATE = 1) [ InitialExpression = "D:\DATA\ENS\Test\Agfa\archive" ];

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter ADAPTER = "CHUBXL.AD.TCPInboundDelimitedAdaper";

Property parser As %XML.Reader;

Parameter SETTINGS = "AddToMetric,FileArchivePath";

Method OnProcessInput(pInput As CHUBXL.DATA.RawMessageStream, pOutput As %RegisteredObject) As %Status
{
	$$$TRACE(" *********************** ")
	s tSC=$$$OK	
	
	//------------------------------
	// Create stream with payLoad
	//------------------------------
	
	
	s tMsg=pInput.payLoad.Read(20000)
	d pInput.payLoad.Rewind()
	$$$TRACE("processing stream from tcp Size : "_pInput.payLoad.Size)
	$$$TRACE("processing stream from tcp PayLoad : "_tMsg)
	
	s:('..parser) ..parser=##class(%XML.Reader).%New()
	$$$TRACE("parser created")
	s tCharStream=##class(%GlobalCharacterStream).%New()	
	d tCharStream.CopyFrom(pInput.payLoad)
	d tCharStream.Rewind()	
	
	s tSC=..parser.OpenStream(tCharStream)
	if ($system.Status.IsError(tSC)) {
		$$$TRACE("tSC:"_tSC)
		$$$TRACE("tSC+:"_$system.Status.GetOneErrorText(tSC))
		;$$$LOGERROR($system.Status.GetOneErrorText(tSC))
		
		s message="TcpIn Error : Get message from Agfa ("_..%ConfigName_" at "_$zdt($h)_") : "_$system.Status.GetOneErrorText(tSC)_"Msg:"_tMsg
		d ..SendAlert(##class(Ens.AlertRequest).%New($LB("Agfa TcpIn : "_..%ConfigName_" at "_$zdt($h),message)))
		// Force tSC to OK
		s tSC=$$$OK
		q tSC
		
	}	
	;q:('tSC) tSC
	
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
		s FileExt="XML"
		s FileName=""
		s FileName=FileName_..%ConfigName_"_"
		s FileName=FileName_$tr($j(^CHUBXL.FileSeq(..%ConfigName),7)," ","0")
		s OldFileName=FileName
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
	// Correlate XML Message
	//------------------------------
	
	$$$TRACE("stream....")
	d ..parser.Correlate("RECORD","CHUBXL.MSG.ResultQuadrat")
	$$$TRACE("correlate...")
	d ..parser.Next(.tRequest,.tSC)
	if ($system.Status.IsError(tSC)) {
		$$$LOGERROR($system.Status.GetOneErrorText(tSC))
	}	
	else {
		$$$TRACE("Correlate Ok")
	}
	Quit:('tSC) tSC	
	
	d tRequest.rawMsgSetObjectId(pInput.%Id())
	d tRequest.%Save()
		
	//------------------------------
	// Route message
	//------------------------------

	s tSC=..SendRequestAsync("AgfaMvAllDocRouting",tRequest)

	//------------------------------
	// Set Metrics
	//------------------------------
	
	d:(tSC) ##class(Ens.BusinessMetric).SetMetric("CHUBXLGeneralMetric","lastMessageReceived",$ZDT($h,3),..%ConfigName)
	
	Quit tSC
}

}
