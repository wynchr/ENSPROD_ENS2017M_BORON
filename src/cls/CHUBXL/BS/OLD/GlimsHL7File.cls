Class CHUBXL.BS.OLD.GlimsHL7File Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

Property FileArchivePath As %String(TRUNCATE = 1) [ InitialExpression = "D:\DATA\ENS\DATA\GLIMS\archive" ];

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter ADAPTER = "EnsLib.File.InboundAdapter";

Parameter SETTINGS = "AddToMetric,FileArchivePath";

Method OnProcessInput(pInput As %FileCharacterStream, pOutput As %RegisteredObject) As %Status
{
	s tSC=$$$OK	
	
	// Set ArchivePath
	
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
	
	

	;s tSC=##class(CHUBXL.DATA.RawMessageString).saveMessage(msgLine,"glims",pInput.Attributes("Filename"),.rawMsg) Quit:$$$ISERR(tSC) tSC
	s tSC=##class(CHUBXL.DATA.RawMessageStream).saveMessage(pInput,"glims",.rawMsg) Quit:$$$ISERR(tSC) tSC
	
	s tSC=..SendRequestAsync("GlimsAllLabRouting",rawMsg)	
	$$$TRACE("Record : "_rawMsg)	
	if ('tSC) {
		s message="FileCopy GLIMS : ERROR - Get from GLIMS("_pInput.Attributes("Filename")_" at "_$zdt($h)_")"
		d ..SendAlert(##class(Ens.AlertRequest).%New($LB("Glims IN : "_pInput.Attributes("Filename")_" at "_$zdt($h)_")",message)))	
		}
	d:(tSC) ##class(Ens.BusinessMetric).SetMetric("CHUBXLGeneralMetric","lastMessageReceived",$ZDT($h,3),..%ConfigName)	

	Quit tSC
}

}
