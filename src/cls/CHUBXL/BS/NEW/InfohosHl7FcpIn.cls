Class CHUBXL.BS.NEW.InfohosHl7FcpIn Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BS INFOHOS TS

VERSION
-------
CWY	24/07/2018	Initial Version
CWY	30/07/2018	Add comment

MESSAGES
--------
CHUBXL.MSG.HL7EcareFile (HL7 + RTF File)

PROCESS
-------
	InfohosSpeAllPhaDlmFcpIn ! OxygenBruFacDlmFcpIn ! DiamicAllFacDlmFcpIn	=> InfohosSpeAllPhaRouting	(FileName?)
	InfohosArtAllPhaXmlFcpIn												=> InfohosArtAllPhaRouting 	(Infohos)
	InfohosMdAllPhaHl7FcpIn													=> InfohosMdAllPhaRouting 	(InfohosMedic)

OPTIMISATION
------------
- to change for Oxygen & Diamic
- Add Metrics ?

SOURCE
------
CHUBXL.BS.InfohosFileIn
CHUBXL.BS.InfohosFile
CHUBXL.BS.InfohosBDocMedicFile

--------------------------------------------------------------------------------------------------------------------------------
*/
Property FileArchivePath As %String(TRUNCATE = 1) [ InitialExpression = "D:\DATA\ENS\Test\MEDIBRIDGE\archive" ];

Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter ADAPTER = "EnsLib.File.InboundAdapter";

Parameter SETTINGS = "AddToMetric,FileArchivePath";

Method OnProcessInput(pInput As %RegisteredObject, pOutput As %RegisteredObject) As %Status
{
	s tSC=$$$OK	
	
	//------------------------------
	// Set ArchivePath
	//------------------------------
	
	$$$TRACE("Fichier : "_pInput.Attributes("Filename"))
	i ..FileArchivePath '= "" {
		s dir=..FileArchivePath_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		$$$TRACE("Set ArchivePath to : "_dir)
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s ..Adapter.ArchivePath=dir
	}

	//------------------------------
	// Route message
	//------------------------------
		
	if (..%ConfigName="InfohosSpeAllPhaDlmFcpIn") ! (..%ConfigName="OxygenBruFacDlmFcpIn") ! (..%ConfigName="DiamicAllFacDlmFcpIn") {
		s FileName=$p(pInput.Attributes("Filename"),"\",$l(pInput.Attributes("Filename"),"\"))
		s tSC=##class(CHUBXL.DATA.RawMessageStream).saveMessage(pInput,FileName,.rawMsg)
		q:('tSC) 	
		s tSC=..SendRequestAsync("InfohosSpeAllPhaRouting",rawMsg)	
	}
	
	if (..%ConfigName="InfohosArtAllPhaXmlFcpIn") {
		s tSC=##class(CHUBXL.DATA.RawMessageStream).saveMessage(pInput,"Infohos",.rawMsg)
		q:('tSC) 	
		s tSC=..SendRequestAsync("InfohosArtAllPhaRouting",rawMsg)
	}
	
	if (..%ConfigName="InfohosMdAllPhaHl7FcpIn") {
		s tSC=##class(CHUBXL.DATA.RawMessageStream).saveMessage(pInput,"InfohosMedic",.rawMsg) Quit:$$$ISERR(tSC) tSC
		s tSC=..SendRequestAsync("InfohosMdAllPhaRouting",rawMsg)
	}

	if (..%ConfigName="InfohosMdBetaAllPhaHl7FcpIn") {
		s tSC=##class(CHUBXL.DATA.RawMessageStream).saveMessage(pInput,"InfohosMedic",.rawMsg) Quit:$$$ISERR(tSC) tSC
		s tSC=..SendRequestAsync("InfohosMdAllPhaRouting",rawMsg)
	}
	
	if (..%ConfigName="InfohosAllStomedHl7FcpIn") {
		s tSC=##class(CHUBXL.DATA.RawMessageStream).saveMessage(pInput,"InfohosMedic",.rawMsg) Quit:$$$ISERR(tSC) tSC
		s tSC=..SendRequestAsync("BdocAllMedicRouting",rawMsg)
	}
	
	//------------------------------
	// Trap Routing Error
	//------------------------------    
    
    if ('tSC) {
        s message="FileCopy : ERROR - Get from "_..%ConfigName_"("_pInput.Attributes("Filename")_" at "_$zdt($h)_")"
        d ..SendAlert(##class(Ens.AlertRequest).%New($LB(..%ConfigName_" : "_pInput.Attributes("Filename")_" at "_$zdt($h)_")",message)))   
    }
    
	Quit tSC
}

}
