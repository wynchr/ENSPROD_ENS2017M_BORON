Class CHUBXL.BS.OLD.QuadratORMHUDTcpIn Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

Property FileArchivePath As %String(TRUNCATE = 1) [ InitialExpression = "G:\dataPREP\QUADRATORM\archive\HUD" ];

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter ADAPTER = "CHUBXL.AD.TCPInboundDelimitedAdaper";

Parameter SETTINGS = "AddToMetric,FileArchivePath";

Method OnProcessInput(pInput As CHUBXL.DATA.RawMessageStream, pOutput As %RegisteredObject) As %Status
{
	s tsc=$$$OK
	s tCharStream=##class(%GlobalCharacterStream).%New()	
	d tCharStream.CopyFrom(pInput.payLoad)
	
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
		s FileName=dir_"\"_FileName_".HL7"
		
		$$$TRACE("Writing to Archive File : "_FileName)		
			
		Set file=##class(%FileCharacterStream).%New()
		Set file.Filename=FileName
		do tCharStream.Rewind()
		d file.CopyFrom(tCharStream)
		d file.%Save()
	}
	
	s tsc=..SendRequestAsync("AgfaAllImgRouting",pInput)	
	
	q:('tsc)
		
	d:(tsc) ##class(Ens.BusinessMetric).SetMetric("CHUBXLGeneralMetric","lastMessageReceived",$ZDT($h,3),..%ConfigName)	
		
	Quit tsc
}

}
