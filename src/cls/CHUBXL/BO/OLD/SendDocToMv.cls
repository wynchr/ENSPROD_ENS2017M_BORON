Class CHUBXL.BO.OLD.SendDocToMv Extends Ens.BusinessOperation [ ClassType = "", ProcedureBlock ]
{

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Property SystemSource As %String(TRUNCATE = 1) [ InitialExpression = "Glims Labo" ];

Property SystemDestination As %String(TRUNCATE = 1) [ InitialExpression = "External System" ];

Property FilePathLocalXML As %String(TRUNCATE = 1) [ InitialExpression = "D:\DATA\ENS\Test\RXISO\out\MV" ];

Property FilePathLocalTXT As %String(TRUNCATE = 1) [ InitialExpression = "D:\DATA\ENS\Test\RXISO\out\MV" ];

Property FilePathRemoteXML As %String(TRUNCATE = 1) [ InitialExpression = "\\sodium\pcl$\IN" ];

Property FilePathRemoteTXT As %String(TRUNCATE = 1) [ InitialExpression = "\\sodium\pcl$\IN" ];

Property FilePathBLOB As %String(TRUNCATE = 1) [ InitialExpression = "E:\Medical Viewer\AcArchive\XML\PCL\PCL\" ];

Property ExtentionBLOB As %String(TRUNCATE = 1) [ InitialExpression = "PCL" ];

Parameter ADAPTER = "EnsLib.File.OutboundAdapter";

Parameter INVOCATION = "Queue";

Parameter SETTINGS = "AddToMetric,SystemSource,SystemDestination,FilePathLocalXML,FilePathLocalTXT,FilePathRemoteXML,FilePathRemoteTXT,FilePathBLOB,ExtentionBLOB";

Method WriteXMLToFile(pRequest As CHUBXL.MSG.ResultMv, Output pResponse As Ens.Response) As %Status
{
	
	$$$TRACE("Start SendDocToMv")
	
	Set $ZTrap = "exception"
	s tSC=$$$OK
	
	;s ..Retry=1

	// Set File Sequence
	i '$d(^CHUBXL.FileSeq(..%ConfigName)) s ^CHUBXL.FileSeq(..%ConfigName)=0
	S ^CHUBXL.FileSeq(..%ConfigName)=^CHUBXL.FileSeq(..%ConfigName) + 1

	// Set fileName
	s FileName=""
	s FileName=FileName_..SystemSource_"_"
	s FileName=FileName_..SystemDestination_"_"	
	s FileName=FileName_$tr($j(^CHUBXL.FileSeq(..%ConfigName),7)," ","0")_"_"
	s FileName=FileName_pRequest.%Id()_"_"
	s FileName=FileName_pRequest.PatientCode_"_"
	s FileName=FileName_pRequest.NumeroDemande_"_"
	s FileName=FileName_pRequest.ObservationStatus_"_"
	s tf=pRequest.TreeFid
	s tf=$tr(tf,">",".")
	s tf=$tr(tf,"<",".")
	s tf=$tr(tf,"/",".")
	s tf=$tr(tf,"(",".")
	s tf=$tr(tf,")",".")
	s tf=$tr(tf,"?","e")
	i ..SystemSource="MOSOS" d
	. s tf=$tr(tf," "),tf=$tr(tf,"'"),pRequest.TreeFid=tf
	. s pRequest.NumeroDemande=$tr($h,",")_$e($tr($j(^CHUBXL.FileSeq(..%ConfigName),7)," ","0"),5,7)
	. s pRequest.DocUniqueId=pRequest.NumeroDemande
	s FileName=FileName_tf
	

	s CRLF=$c(13)_$c(10)
	s out=""
	s out=out_"<?xml version='1.0' encoding='ISO-8859-1' standalone='yes'?>"_CRLF
	s out=out_"<!DOCTYPE GENERAL["_CRLF
	s out=out_"<!ELEMENT GENERAL (GENERAL_INFO+)>"_CRLF
	s out=out_"<!ELEMENT GENERAL_INFO ("_CRLF
	s out=out_"HOSPITAL_FID,"_CRLF
	s out=out_"PATIENT_CODE,"_CRLF
	s out=out_"PASSAGE_NR,"_CRLF
	s out=out_"NUMERO_ADM,"_CRLF
	s out=out_"NUMERO_DEMANDE,"_CRLF
	s out=out_"DOC_DATE,"_CRLF
	s out=out_"PRESTATION_DATE,"_CRLF
	s out=out_"MEDECIN_PRESCR,"_CRLF
	s out=out_"SERV_PRESCR,"_CRLF
	s out=out_"MEDECIN_PRESTA,"_CRLF
	s out=out_"SERV_PRESTA,"_CRLF
	s out=out_"CIGES_NUMBER,"_CRLF
	s out=out_"CIGES,"_CRLF
	s out=out_"SYSTEME_SOURCE,"_CRLF
	s out=out_"DOC_UNIQUE_ID,"_CRLF
	s out=out_"BATCH,"_CRLF
	s out=out_"DOC_TEMPLATE,"_CRLF
	s out=out_"TREE_FID,"_CRLF
	s out=out_"BLOB*)>"_CRLF
	s out=out_"<!ELEMENT HOSPITAL_FID (#PCDATA)>"_CRLF
	s out=out_"<!ELEMENT PATIENT_CODE (#PCDATA)>"_CRLF
	s out=out_"<!ELEMENT PASSAGE_NR (#PCDATA)>"_CRLF
	s out=out_"<!ELEMENT NUMERO_ADM (#PCDATA)>"_CRLF
	s out=out_"<!ELEMENT NUMERO_DEMANDE (#PCDATA)>"_CRLF
	s out=out_"<!ELEMENT DOC_DATE (#PCDATA)>"_CRLF
	s out=out_"<!ELEMENT PRESTATION_DATE (#PCDATA)>"_CRLF
	s out=out_"<!ELEMENT MEDECIN_PRESCR (#PCDATA)>"_CRLF
	s out=out_"<!ELEMENT SERV_PRESCR (#PCDATA)>"_CRLF
	s out=out_"<!ELEMENT MEDECIN_PRESTA (#PCDATA)>"_CRLF
	s out=out_"<!ELEMENT SERV_PRESTA (#PCDATA)>"_CRLF
	s out=out_"<!ELEMENT CIGES_NUMBER (#PCDATA)>"_CRLF
	s out=out_"<!ELEMENT CIGES (#PCDATA)>"_CRLF	
	s out=out_"<!ELEMENT SYSTEME_SOURCE (#PCDATA)>"_CRLF
	s out=out_"<!ELEMENT DOC_UNIQUE_ID (#PCDATA)>"_CRLF
	s out=out_"<!ELEMENT BATCH (#PCDATA)>"_CRLF	
	s out=out_"<!ELEMENT DOC_TEMPLATE (#PCDATA)>"_CRLF
	s out=out_"<!ELEMENT TREE_FID (#PCDATA)>"_CRLF
	s out=out_"<!ELEMENT BLOB (#PCDATA)>"_CRLF
	s out=out_"]>"_CRLF
	s out=out_"<GENERAL>"_CRLF
	s out=out_"  <GENERAL_INFO>"_CRLF
	s out=out_"    <HOSPITAL_FID>"_pRequest.HospitalFid_"</HOSPITAL_FID>"_CRLF
	s out=out_"    <PATIENT_CODE>"_pRequest.PatientCode_"</PATIENT_CODE>"_CRLF
	s out=out_"    <PASSAGE_NR>"_pRequest.PassageNr_"</PASSAGE_NR>" _CRLF
	s out=out_"    <NUMERO_ADM>"_pRequest.NumeroAdm_"</NUMERO_ADM>"_CRLF
	s out=out_"    <NUMERO_DEMANDE>"_pRequest.NumeroDemande_"</NUMERO_DEMANDE>"_CRLF
	s out=out_"    <DOC_DATE>"_pRequest.DocDate_"</DOC_DATE>"_CRLF
	s out=out_"    <PRESTATION_DATE>"_pRequest.PrestationDate_"</PRESTATION_DATE>"_CRLF
	s out=out_"    <MEDECIN_PRESCR>"_pRequest.MedecinPresc_"</MEDECIN_PRESCR>"_CRLF
	s out=out_"    <SERV_PRESCR>"_pRequest.ServPresc_"</SERV_PRESCR>"_CRLF
	s out=out_"    <MEDECIN_PRESTA>"_pRequest.MedecinPresta_"</MEDECIN_PRESTA>"_CRLF
	s out=out_"    <SERV_PRESTA>"_pRequest.ServPresta_"</SERV_PRESTA>"_CRLF
	s out=out_"    <CIGES_NUMBER>"_pRequest.CigesNumber_"</CIGES_NUMBER>"_CRLF
	s out=out_"    <CIGES>"_pRequest.Ciges_"</CIGES>"_CRLF	
	If (..SystemSource = "QUADRAT") {
		s out=out_"    <SYSTEME_SOURCE>"_pRequest.SystemeSource_"</SYSTEME_SOURCE>"_CRLF
	}
	Else {
		s out=out_"    <SYSTEME_SOURCE>"_..SystemSource_"</SYSTEME_SOURCE>"_CRLF
	}
	s out=out_"    <DOC_UNIQUE_ID>"_pRequest.DocUniqueId_"</DOC_UNIQUE_ID>"_CRLF	
	s out=out_"    <BATCH>"_pRequest.Batch_"</BATCH>"_CRLF
	s out=out_"    <DOC_TEMPLATE>"_pRequest.DocTemplate_"</DOC_TEMPLATE>"_CRLF	
	s out=out_"    <TREE_FID>"_pRequest.TreeFid_"</TREE_FID>"_CRLF
	if pRequest.ObservationStatus'="D" s out=out_"    <BLOB>"_..FilePathBLOB_FileName_"."_..ExtentionBLOB_"</BLOB>"_CRLF
	if pRequest.ObservationStatus="D" s out=out_"    <BLOB>"_$p(..FilePathBLOB,"RTF1",1)_"RTF1_DEL"_$p(..FilePathBLOB,"RTF1",2,99)_FileName_"."_..ExtentionBLOB_"</BLOB>"_CRLF
	s out=out_"  </GENERAL_INFO>"_CRLF
	s out=out_"</GENERAL>"_CRLF
		
	$$$TRACE("Message for MvXmlInserter "_out)		
		
	//s tXML=""
	//s status=pRequest.XMLExportToString(.tXML)
	//s out=out_tXML
		
	/// REMOTE PROCESSING (on MV Server)
	Do pRequest.Blob.Rewind()
	if ($l(..FilePathRemoteTXT)>0) {
		s ..Adapter.FilePath=..FilePathRemoteTXT
		i pRequest.ObservationStatus="D" s ..Adapter.FilePath=$p(..FilePathRemoteTXT,"RTF1",1)_"RTF1_DEL"_$p(..FilePathRemoteTXT,"RTF1",2,99)
		$$$TRACE("Send remote TXT msg to "_..FilePathRemoteTXT_FileName_"."_..ExtentionBLOB)
		s tSC=..Adapter.PutStream(FileName_"."_..ExtentionBLOB,pRequest.Blob)
		;Quit:('tSC) $$$ERROR($$$GeneralError, "Error writing to file "_..Adapter.FilePath_FileName_"."_..ExtentionBLOB _ $ZError)
		Quit:$$$ISERR(tSC) tSC
		$$$TRACE("Send remote TXT msg completed")
	}
	if ($l(..FilePathRemoteXML)>0) {
		s ..Adapter.FilePath=..FilePathRemoteXML
		i pRequest.ObservationStatus="D" s ..Adapter.FilePath=$p(..FilePathRemoteTXT,"RTF1",1)_"RTF1_DEL"_$p(..FilePathRemoteTXT,"RTF1",2,99)
		$$$TRACE("Send remote XML msg to "_..FilePathRemoteXML_FileName_".xml")
		s tSC=..Adapter.PutString(FileName_".xml",out)
		;Quit:('tSC) $$$ERROR($$$GeneralError, "Error writing to file "_..Adapter.FilePath_FileName_".xml" _ $ZError)
		Quit:$$$ISERR(tSC) tSC
		$$$TRACE("Send remote XML msg completed")
	}
	
	/// LOCAL PROCESSING (on ENSEMBLE Server)
	Do pRequest.Blob.Rewind()
	if ($l(..FilePathLocalTXT)>0) {
		s dir=..FilePathLocalTXT_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		$$$TRACE("dir:"_dir)
		s ..Adapter.FilePath=dir
		$$$TRACE("Send local TXT msg to "_dir_"\"_FileName_"."_..ExtentionBLOB)
		s tSC=..Adapter.PutStream(FileName_"."_..ExtentionBLOB,pRequest.Blob)
		Quit:$$$ISERR(tSC) tSC
		$$$TRACE("Send local TXT msg completed")
	}
	
	if ($l(..FilePathLocalXML)>0) {
		$$$TRACE("OK 1")
		s dir=..FilePathLocalXML_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		$$$TRACE("OK 2"_dir)
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		$$$TRACE("OK 3")
		s ..Adapter.FilePath=dir
		$$$TRACE("OK 4")
		$$$TRACE("Send local XML msg to "_dir_"\"_FileName_".xml")
		s tSC=..Adapter.PutString(FileName_".xml",out)
		Quit:$$$ISERR(tSC) tSC
		$$$TRACE("Send local XML msg completed")		
	}
	d ##class(Ens.BusinessMetric).SetMetric("CHUBXLGeneralMetric","lastMessageReceived",$ZDT($h,3),..%ConfigName)	
	
	$$$TRACE("End of MvDocToMv")
	
end
	Set $ZTrap = ""
	Quit tSC
	
exception
	s tZE=$ze
	s tSC=$$$EnsError("General Error: "_tZE)
	g end
}

Method WriteXMLToFilePLUS(pRequest As CHUBXL.MSG.ResultPLUS, Output pResponse As Ens.Response) As %Status
{
	
	$$$TRACE("Start SendDocToMv")
	
	Set $ZTrap = "exception"
	s tSC=$$$OK
	
	// Set File Sequence
	i '$d(^CHUBXL.FileSeq(..%ConfigName)) s ^CHUBXL.FileSeq(..%ConfigName)=0
	S ^CHUBXL.FileSeq(..%ConfigName)=^CHUBXL.FileSeq(..%ConfigName) + 1

	// Set fileName
	s FileName=pRequest.FileName
		
	/// REMOTE PROCESSING (on MV Server)
	Do pRequest.XML.Rewind()
	Do pRequest.Blob.Rewind()
	if ($l(..FilePathRemoteTXT)>0) {
		s ..Adapter.FilePath=..FilePathRemoteTXT
		$$$TRACE("Send remote TXT msg to "_..FilePathRemoteTXT_FileName_"."_..ExtentionBLOB)
		s tSC=..Adapter.PutStream(FileName_"."_..ExtentionBLOB,pRequest.Blob)
		Quit:$$$ISERR(tSC) tSC
		$$$TRACE("Send remote TXT msg completed")
	}
	if ($l(..FilePathRemoteXML)>0) {
		s ..Adapter.FilePath=..FilePathRemoteXML
		$$$TRACE("Send remote XML msg to "_..FilePathRemoteXML_FileName_".xml")
		s tSC=..Adapter.PutStream(FileName_".xml",pRequest.XML)
		Quit:$$$ISERR(tSC) tSC
		$$$TRACE("Send remote XML msg completed")
	}
	
	/// LOCAL PROCESSING (on ENSEMBLE Server)
	Do pRequest.XML.Rewind()
	Do pRequest.Blob.Rewind()
	if ($l(..FilePathLocalTXT)>0) {
		s dir=..FilePathLocalTXT_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		$$$TRACE("dir:"_dir)
		s ..Adapter.FilePath=dir
		$$$TRACE("Send local TXT msg to "_dir_"\"_FileName_"."_..ExtentionBLOB)
		s tSC=..Adapter.PutStream(FileName_"."_..ExtentionBLOB,pRequest.Blob)
		Quit:$$$ISERR(tSC) tSC
		$$$TRACE("Send local TXT msg completed")
	}
	
	if ($l(..FilePathLocalXML)>0) {
		s dir=..FilePathLocalXML_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s ..Adapter.FilePath=dir
		$$$TRACE("Send local XML msg to "_dir_"\"_FileName_".xml")
		s tSC=..Adapter.PutStream(FileName_".xml",pRequest.XML)
		Quit:$$$ISERR(tSC) tSC
		$$$TRACE("Send local XML msg completed")
	}
	
	
	
	$$$TRACE("End of MvDocToMv")
	
end
	Set $ZTrap = ""
	Quit tSC
	
exception
	s tZE=$ze
	s tSC=$$$EnsError("General Error: "_tZE)
	g end
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="CHUBXL.MSG.ResultMv"> 
		<Method>WriteXMLToFile</Method>
	</MapItem>
	<MapItem MessageType="CHUBXL.MSG.ResultKineMv"> 
		<Method>WriteXMLToFile</Method>
	</MapItem>
	<MapItem MessageType="CHUBXL.MSG.ResultPLUS"> 
		<Method>WriteXMLToFilePLUS</Method>
	</MapItem>
</MapItems>
}

///                        Format pour XmlInserter
///                       	
///                         <?xml version="1.0" encoding="ISO-8859-1" standalone="yes"?> 
///                         <!DOCTYPE MV_GENERAL[ 
///                         <!ELEMENT MV_GENERAL (MV_GENERAL_INFO+)> 
///                         <!ELEMENT MV_GENERAL_INFO ( 
///                         HOSPITAL_FID, 
///                         PATIENT_CODE, 
///                         PASSAGE_NR, 
///                         NUMERO_ADM, 
///                         NUMERO_DEMANDE, 
///                         DOC_DATE, 
///                         PRESTATION_DATE, 
///                         MEDECIN_PRESCR, 
///                         SERV_PRESCR, 
///                         MEDECIN_PRESTA, 
///                         SERV_PRESTA, 
///                         CIGES_NUMBER, 
///                         SYSTEME_SOURCE, 
///                         BATCH, 
///                         TREE_FID, 
///                         BLOB*)> 
///                         <!ELEMENT HOSPITAL_FID (#PCDATA)> 
///                         <!ELEMENT PATIENT_CODE (#PCDATA)> 
///                         <!ELEMENT PASSAGE_NR (#PCDATA)> 
///                         <!ELEMENT NUMERO_ADM (#PCDATA)> 
///                         <!ELEMENT NUMERO_DEMANDE (#PCDATA)> 
///                         <!ELEMENT DOC_DATE (#PCDATA)> 
///                         <!ELEMENT PRESTATION_DATE (#PCDATA)> 
///                         <!ELEMENT MEDECIN_PRESCR (#PCDATA)> 
///                         <!ELEMENT SERV_PRESCR (#PCDATA)> 
///                         <!ELEMENT MEDECIN_PRESTA (#PCDATA)> 
///                         <!ELEMENT SERV_PRESTA (#PCDATA)> 
///                         <!ELEMENT CIGES_NUMBER (#PCDATA)> 
///                         <!ELEMENT SYSTEME_SOURCE (#PCDATA)> 
///                         <!ELEMENT BATCH (#PCDATA)> 
///                         <!ELEMENT TREE_FID (#PCDATA)> 
///                         <!ELEMENT BLOB (#PCDATA)> 
///                         ]> 
///                         <MV_GENERAL> 
///                           <MV_GENERAL_INFO> 
///                             <HOSPITAL_FID> 		$nhop			</HOSPITAL_FID> 
///                             <PATIENT_CODE> 		$nosim 			</PATIENT_CODE> 
///                             <PASSAGE_NR> 			$nopassage 		</PASSAGE_NR> 
///                             <NUMERO_ADM> 			$nohospit		</NUMERO_ADM> 
///                             <NUMERO_DEMANDE>		$numprot 		</NUMERO_DEMANDE> 
///                             <DOC_DATE> 			$dateprel		</DOC_DATE> 
///                             <PRESTATION_DATE>	 	$dateprel 		</PRESTATION_DATE> 
///                             <MEDECIN_PRESCR> 		$noinami 		</MEDECIN_PRESCR> 
///                             <SERV_PRESCR>							</SERV_PRESCR> 
///                             <MEDECIN_PRESTA>						</MEDECIN_PRESTA> 
///                             <SERV_PRESTA>							</SERV_PRESTA> 
///                             <CIGES_NUMBER>						</CIGES_NUMBER> 
///                             <SYSTEME_SOURCE>		GLIMS LABO		</SYSTEME_SOURCE> 
///                             <BATCH> 	 							</BATCH> 
///                             <TREE_FID>  			$tree_fid		</TREE_FID> 
///                             <BLOB> 				 				</BLOB> 
///                           </MV_GENERAL_INFO> 
///                         </MV_GENERAL> 

}
