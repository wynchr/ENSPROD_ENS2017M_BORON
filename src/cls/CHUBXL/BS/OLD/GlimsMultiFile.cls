Class CHUBXL.BS.OLD.GlimsMultiFile Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

Property FileArchivePath As %String(TRUNCATE = 1) [ InitialExpression = "D:\DATA\ENS\Test\GLIMSMV\archive" ];

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter ADAPTER = "EnsLib.File.InboundAdapter";

Parameter SETTINGS = "AddToMetric,FileArchivePath";

Method OnProcessInput(pInput As %RegisteredObject, pOutput As %RegisteredObject) As %Status
{

	s tSC=$$$OK	
	
	// Set ArchivePath
	
	i ..FileArchivePath '= "" {
		s dir=..FileArchivePath_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s ..Adapter.ArchivePath=dir
		$$$TRACE("Set ArchivePath to : "_dir)
	}
	
	s tSC=##class(CHUBXL.DATA.RawMessageStream).saveMessage(pInput,"glimsmulti",.rawMsg)
	q:('tSC) 	
	s tSC=..SendRequestAsync("GlimsMultiIn",rawMsg)	
	
	if ('tSC) {
		s message="FileCopy Medical Viewer : ERROR - Get from GLIMSMV("_pInput.Attributes("Filename")_" at "_$zdt($h)_")"
		d ..SendAlert(##class(Ens.AlertRequest).%New($LB("Glims MV IN : "_pInput.Attributes("Filename")_" at "_$zdt($h)_")",message)))	
		}
		
	//s alert=##class(Ens.AlertRequest).%New()
	//s alert.AlertText="FileCopy Medical Viewer : Get from GLIMSMV("_pInput.Attributes("Filename")_" at "_$zdt($h)_")"
	//d ..SendRequestAsync("AlertEmail",alert)

	s message="FileCopy Medical Viewer : Get from GLIMSMV("_pInput.Attributes("Filename")_" at "_$zdt($h)_")"
	d ..SendAlert(##class(Ens.AlertRequest).%New($LB("GlimsMVFileCopy IN : "_pInput.Attributes("Filename")_" at "_$zdt($h)_")",message)))
	
	
	Quit tSC
}

}
