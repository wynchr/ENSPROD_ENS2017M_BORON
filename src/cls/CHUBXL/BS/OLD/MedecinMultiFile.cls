Class CHUBXL.BS.OLD.MedecinMultiFile Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

Property FileArchivePath As %String(TRUNCATE = 1) [ InitialExpression = "E:\dataPROD\MEDECIN\archive" ];

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter ADAPTER = "EnsLib.File.InboundAdapter";

Parameter SETTINGS = "AddToMetric,FileArchivePath";

Method OnProcessInput(pInput As %FileCharacterStream, pOutput As %RegisteredObject) As %Status
{
	s tSC=$$$OK	
	
	// Set ArchivePath
	$$$TRACE("File : "_pInput.Attributes("Filename"))
	
	i ..FileArchivePath '= "" {
		s dir=..FileArchivePath_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		$$$TRACE("Set ArchivePath to : "_dir)
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s ..Adapter.ArchivePath=dir
	}
			
	;s msgLine=""
	;while ('pInput.AtEnd) {
	;	s msgLine=msgLine_pInput.Read(32000)
	;}
	
	

	;s tSC=##class(CHUBXL.DATA.RawMessageString).saveMessage(msgLine,"medecin",pInput.Attributes("Filename"),.rawMsg) Quit:$$$ISERR(tSC) tSC
	s tSC=##class(CHUBXL.DATA.RawMessageStream).saveMessage(pInput,"medecin",.rawMsg) Quit:$$$ISERR(tSC) tSC
	
	;CWY i pInput.Attributes("Filename")["\FMC\" $$$TRACE("MedRout") s tSC=..SendRequestAsync("MedecinAllMedRouting",rawMsg)	
	;CWYi pInput.Attributes("Filename")'["\FMC\" $$$TRACE("OneKey") 
	
	s tSC=..SendRequestAsync("RefmedAllMedRouting",rawMsg)	
		
	if ('tSC) {
		s message="FileCopy medecin : ERROR - Get from medecin("_pInput.Attributes("Filename")_" at "_$zdt($h)_")"
		d ..SendAlert(##class(Ens.AlertRequest).%New($LB("medecin IN : "_pInput.Attributes("Filename")_" at "_$zdt($h)_")",message)))	
		}
		
	
	Quit tSC
}

}
