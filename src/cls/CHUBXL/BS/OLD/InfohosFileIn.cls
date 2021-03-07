Class CHUBXL.BS.OLD.InfohosFileIn Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

Property FileArchivePath As %String(TRUNCATE = 1) [ InitialExpression = "D:\DATA\ENS\Test\MEDIBRIDGE\archive" ];

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter ADAPTER = "EnsLib.File.InboundAdapter";

Parameter SETTINGS = "AddToMetric,FileArchivePath";

Method OnProcessInput(pInput As %RegisteredObject, pOutput As %RegisteredObject) As %Status
{

	s tSC=$$$OK	
	
	// Set ArchivePath
	$$$TRACE("Fichier : "_pInput.Attributes("Filename"))
	i ..FileArchivePath '= "" {
		s dir=..FileArchivePath_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		$$$TRACE("Set ArchivePath to : "_dir)
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s ..Adapter.ArchivePath=dir
	}
	
	s FileName=$p(pInput.Attributes("Filename"),"\",$l(pInput.Attributes("Filename"),"\"))
	s tSC=##class(CHUBXL.DATA.RawMessageStream).saveMessage(pInput,FileName,.rawMsg)
	q:('tSC) 	
	s tSC=..SendRequestAsync("InfohosSpeAllPhaRouting",rawMsg)	
	
	
	if ('tSC) {
		s message="FileCopy Wish : ERROR - Get from Infohos ("_pInput.Attributes("Filename")_" at "_$zdt($h)_")"
		d ..SendAlert(##class(Ens.AlertRequest).%New($LB("Infohos In : "_pInput.Attributes("Filename")_" at "_$zdt($h)_")",message)))	
		}
	Quit tSC
}

}
