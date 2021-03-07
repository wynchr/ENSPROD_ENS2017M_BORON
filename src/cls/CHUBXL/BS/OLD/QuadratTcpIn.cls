Class CHUBXL.BS.OLD.QuadratTcpIn Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

Property FileArchivePath As %String(TRUNCATE = 1) [ InitialExpression = "D:\DATA\ENS\Test\QUADRAT\archive" ];

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter ADAPTER = "CHUBXL.AD.TCPInboundDelimitedAdaper";

Property parser As %XML.Reader;

Parameter SETTINGS = "AddToMetric,FileArchivePath";

Method OnProcessInput(pInput As CHUBXL.DATA.RawMessageStream, pOutput As %RegisteredObject) As %Status
{
	$$$TRACE(" *********************** ")
	s tSC=$$$OK	
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
		
		s message="TcpIn Error : Get message from Quadrat ("_..%ConfigName_" at "_$zdt($h)_") : "_$system.Status.GetOneErrorText(tSC)_"Msg:"_tMsg
		d ..SendAlert(##class(Ens.AlertRequest).%New($LB("Quadrat TcpIn : "_..%ConfigName_" at "_$zdt($h),message)))
		// Force tSC to OK
		s tSC=$$$OK
		q tSC
		
	}	
	;q:('tSC) tSC
	
	// Archive incoming data	
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
		s OldFileName=FileName
		s FileName=dir_"\"_FileName_".XML"
		
		$$$TRACE("Writing to Archive File : "_FileName)		
			
		Set file=##class(%FileCharacterStream).%New()
		Set file.Filename=FileName
		do tCharStream.Rewind()
		d file.CopyFrom(tCharStream)
		d file.%Save()

	}
	
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
	s tSC=..SendRequestAsync("AgfaMvAllDocRouting",tRequest)
	i +tRequest.MSH.NHOP=27 {
		;$$$TRACE("*********** <<<<<<<<<< HUDERF OK >>>>>>>>>>>>>>> **********")
		;s FileName="G:\dataPREP\QUADRAT\in\"_OldFileName_".XML"
		;Set file=##class(%FileCharacterStream).%New()
		;Set file.Filename=FileName
		;do tCharStream.Rewind()
		;d file.CopyFrom(tCharStream)
		;d file.%Save()
		;s tSC=..SendRequestAsync("QuadratHUDDPIHL7TcpOutPreProd",pInput)
	}
	
	d:(tSC) ##class(Ens.BusinessMetric).SetMetric("CHUBXLGeneralMetric","lastMessageReceived",$ZDT($h,3),..%ConfigName)
	
	Quit tSC
}

}
