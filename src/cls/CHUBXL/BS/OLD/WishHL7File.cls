Class CHUBXL.BS.OLD.WishHL7File Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

Property FileArchivePath As %String(TRUNCATE = 1) [ InitialExpression = "G:\dataPROD\Wish\archive" ];

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter ADAPTER = "EnsLib.File.InboundAdapter";

Parameter SETTINGS = "AddToMetric,FileArchivePath";

Method OnProcessInput(pInput As %RegisteredObject, pOutput As %RegisteredObject) As %Status
{
	s tSC=$$$OK	
	
	i ..FileArchivePath '= "" {
		s dir=..FileArchivePath_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s ..Adapter.ArchivePath=dir
		$$$TRACE("Set ArchivePath to : "_dir)
	}
		
	// Get OK File
	
	$$$TRACE("FileName:"_pInput.Attributes("Filename"))
		
	s FileName = pInput.Attributes("Filename")
	;..Adapter.FilePath_"\"_$p($p(pInput.Attributes("Filename"),"\",6),".",1)
	;s FileName = ..Adapter.FilePath_$p($p(pInput.Attributes("Filename"),"\",6),".",1)
	
	$$$TRACE("FileName Prefix : "_FileName)
	
	// Get HL7 data
	
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
	s tSC=..SendRequestAsync("WishAllAdtRouting",HL7File)	
	d:(tSC) ##class(Ens.BusinessMetric).SetMetric("ChubxlGeneralMetric","lastMessageReceived",$ZDT($h,3),..%ConfigName)	

	if ('tSC) {
		s message="FileCopy Wish : ERROR - Get from Wish("_pInput.Attributes("Filename")_" at "_$zdt($h)_")"
		d ..SendAlert(##class(Ens.AlertRequest).%New($LB("Wish IN : "_pInput.Attributes("Filename")_" at "_$zdt($h)_")",message)))	
	}
		
	Quit tSC
}

}
