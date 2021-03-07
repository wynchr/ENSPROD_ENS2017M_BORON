Class CHUBXL.BS.NEW.GlimsHl7FcpIn Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BS GLIMS HL7 Fcp

VERSION
-------
CWY	24/07/2018	Initial Version
CWY	30/07/2018	Add comment
DAM	11/02/2021	Add Cosite connexion

MESSAGES
--------
CHUBXL.DATA.RawMessageStream (glims)

PROCESS
-------
	GlimsAllLabHl7FcpIn	=> GlimsAllLabRouting
	GlimsAllMFUHl7FcpIn	=> GlimsAllMFURouting
	GlimsAllRsbCsvFcpIn	=> GlimsAllCsvRouting
	
OPTIMISATION
------------
- No archiving ???


SOURCE
------
CHUBXL.BS.GlimsHL7File
CHUBXL.BS.GlimsHL7MFUFile

--------------------------------------------------------------------------------------------------------------------------------
*/
Property FileArchivePath As %String(TRUNCATE = 1) [ InitialExpression = "D:\DATA\ENS\DATA\GLIMS\archive" ];

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Property DeleteFile As %Boolean [ InitialExpression = 0 ];

Parameter ADAPTER = "EnsLib.File.InboundAdapter";

Parameter SETTINGS = "AddToMetric,FileArchivePath,DeleteFile";

Method OnProcessInput(pInput As %FileCharacterStream, pOutput As %RegisteredObject) As %Status
{
	s tSC=$$$OK	
	s Instance=$p($SYSTEM,":",2)
	s ..Adapter.DeleteFromServer=..DeleteFile
	$$$TRACE("***"_..DeleteFile_"***")
	
	//------------------------------
	// Set ArchivePath
	//------------------------------
	
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
	
	//------------------------------
	// Create RawMessageStream
	//------------------------------	

	s tSC=##class(CHUBXL.DATA.RawMessageStream).saveMessage(pInput,"glims",.rawMsg) Quit:$$$ISERR(tSC) tSC
	$$$TRACE("Record : "_rawMsg.payLoad)
	
	i ..%ConfigName="GlimsAllMFUHl7FcpIn" {
	  d rawMsg.payLoad.Rewind()
	  s tmp=rawMsg.payLoad.Read(3500000)
	  s HL7Msg = ##class(EnsLib.HL7.Message).ImportFromString(tmp,.tSC)
	  s HL7Msg.DocType=HL7Msg.TypeVersion_":"_HL7Msg.Name
	
	  $$$TRACE("Record 1 : "_HL7Msg.RawContent)
	}
	
	//------------------------------
	// Route message
	//------------------------------
	
	s:..%ConfigName="GlimsAllLabHl7FcpIn" tsc=..SendRequestAsync("GlimsAllLabRouting",rawMsg)	
	s:..%ConfigName="GlimsAllMFUHl7FcpIn" tsc=..SendRequestAsync("GlimsAllMFURouting",HL7Msg)	
	i (..%ConfigName="GlimsAllRsbCsvFcpIn") ! (..%ConfigName="GlimsBisAllRsbCsvFcpIn") {
		i Instance="ENS2017TEST" s Dir="\\boron02\g$\TEST\GlimsCsv\archive\All\"
		i Instance="ENS2017M" s Dir="\\boron\g$\PROD\GlimsCsv\archive\All\"
		i Instance="ENS2017PREP" s Dir="\\boron\g$\PREP\GlimsCsv\archive\All\"
		$$$TRACE("Last Modified : "_pInput.LastModified)
		s DateTime=pInput.LastModified
		s FileName1 = $p($p(pInput.Attributes("Filename"),"\",$l(pInput.Attributes("Filename"),"\")),".",1)
		$$$TRACE("FileName  : "_pInput.Attributes("Filename"))
		$$$TRACE("FileName1 : "_FileName1)
		s %DS=$e(DateTime,6,7)_"-"_$e(DateTime,9,10)_"-"_$e(DateTime,1,4) d INT^%DATE
 		s %TS=$e(DateTime,12,20) d INT^%TI
 		$$$TRACE("Date : "_%DN)
 		$$$TRACE("Time : "_%TN)
 		s DateDuDernier=$p($g(^CHUBXL.WS.DateTimeProcess(0)),",",1)
 		s TimeDuDernier=$p($g(^CHUBXL.WS.DateTimeProcess(0)),",",2)
 		i (%DN>DateDuDernier)!((%DN=DateDuDernier)&(%TN>TimeDuDernier)) {
	 		i ..%ConfigName="GlimsAllRsbCsvFcpIn" s tsc=..SendRequestAsync("GlimsAllCsvRouting",rawMsg)
	 		i ..%ConfigName="GlimsBisAllRsbCsvFcpIn" s tsc=..SendRequestAsync("GlimsBisAllCsvRouting",rawMsg)
	 		s ^CHUBXL.WS.DateTimeProcess(0)=%DN_","_%TN $$$TRACE("Time : ****************************")
	 		s x=##class(%Library.File).CopyFile(pInput.Attributes("Filename"),Dir_FileName1_".csv",1)
 		}
	}
	
	//------------------------------
	// Trap Routing Error
	//------------------------------
    
    if ('tSC) {
        s message="FileCopy : ERROR - Get from "_..%ConfigName_"("_pInput.Attributes("Filename")_" at "_$zdt($h)_")"
        d ..SendAlert(##class(Ens.AlertRequest).%New($LB(..%ConfigName_" : "_pInput.Attributes("Filename")_" at "_$zdt($h)_")",message)))   
    }
    
	//------------------------------
	// Sednd to Metrics
	//------------------------------
	    
	d:(tSC) ##class(Ens.BusinessMetric).SetMetric("CHUBXLGeneralMetric","lastMessageReceived",$ZDT($h,3),..%ConfigName)	

	Quit tSC
}

}
