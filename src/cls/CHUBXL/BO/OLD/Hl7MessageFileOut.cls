Class CHUBXL.BO.OLD.Hl7MessageFileOut Extends Ens.BusinessOperation [ ClassType = "", ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
Production ENSPROD

VERSION
-------
DAM	13/04/2018	Initial Version
--------------------------------------------------------------------------------------------------------------------------------
*/
/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Property SystemSource As %String(TRUNCATE = 1) [ InitialExpression = "External System" ];

Property SystemDestination As %String(TRUNCATE = 1) [ InitialExpression = "External System" ];

Property FilePathLocalHL7 As %String(TRUNCATE = 1) [ InitialExpression = "D:\DATA\ENS\Test\RXISO\out\QUADRAT" ];

Property FilePathRemoteHL7 As %String(TRUNCATE = 1) [ InitialExpression = "\\boron\QUADRATFS\Quadrat531_HB_TEST\Interfaces\ReportsInbound\Files\InENS" ];

Property RPFileHL7 As %String(TRUNCATE = 1) [ InitialExpression = "Q:\Quadrat531_HB_TEST\Interfaces\ReportsInbound\Files\In" ];

Parameter ADAPTER = "EnsLib.File.OutboundAdapter";

Parameter INVOCATION = "Queue";

Parameter SETTINGS = "AddToMetric,SystemSource,SystemDestination,FilePathLocalHL7,FilePathRemoteHL7,RPFileHL7";

// HL7 msg ADT,OUL,MFN

Method writeRawMessageHL7(pRequest As EnsLib.HL7.Message, Output pResponse As Ens.Response) As %Status
{
	s $zt="exception",tSC=$$$OK

	s msgtype=pRequest.GetValueAt("MSH:MessageType.messagetype",,.tSC)
	
	$$$TRACE("HL7 MessageType : "_pRequest.GetValueAt("MSH:MessageType.messagetype",,.tSC))
	$$$TRACE("HL7 Version ID ** : "_pRequest.GetValueAt("MSH:VersionID",,.tSC))
	$$$TRACE("HL7 AcceptAcknowledgmentType : "_pRequest.GetValueAt("MSH:AcceptAcknowledgmentType",,.tSC))
	$$$TRACE("HL7 ValueType : "_pRequest.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ValueType",,.tSC))
	$$$TRACE("Config Name : "_..%ConfigName)
	
	/// HL7 Message ADT received from Sibelmed for Opera ------------------------------
	
	if ((msgtype '= "OUL") & (msgtype '= "MFN")) {
		s ndosm=pRequest.GetValueAt("PIDgrpgrp(1).PIDgrp.PID:PatientID.ID",,.tSC)
		/// REMOTE PROCESSING (on QUADRAT Server)
		if ($l(..FilePathRemoteHL7)>0) {
			s ..Adapter.FilePath=..FilePathRemoteHL7
			s dir=..Adapter.FilePath
			If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
			s fileName=..SystemSource_"_"_..SystemDestination_"_"_pRequest.%Id()_"_"_ndosm_".HL7"
			s:(..%ConfigName="CacheHL7FileOut") fileName=..SystemSource_"_"_..SystemDestination_"_"_pRequest.%Id()_"_"_pRequest.GetValueAt("PID:3",,.tSC)_"_"_pRequest.GetValueAt("MSH:9.2",,.tSC)_".HL7"
			$$$TRACE("Send remote HL7 msg to "_..FilePathRemoteHL7_"\"_fileName)
			$$$TRACE(pRequest.RawContent)
			s stream=##class(%GlobalCharacterStream).%New()
			s tSC=pRequest.OutputToOldStream(stream)
			q:('tSC) $$$ERROR("Error writing to file "_..Adapter.FilePath_"\"_fileName)	
			s tSC=..Adapter.PutStream(fileName,stream)
			q:('tSC) $$$ERROR("Error writing to file "_..Adapter.FilePath_"\"_fileName)	
		}
		/// LOCAL PROCESSING (on ENSEMBLE Server)
		if ($l(..FilePathLocalHL7)>0) {
			s ..Adapter.FilePath=..FilePathLocalHL7
			s dir=..Adapter.FilePath s:(..%ConfigName="CacheHL7FileOut") dir=..Adapter.FilePath_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
			If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
			s fileName=..SystemSource_"_"_..SystemDestination_"_"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")_".HL7"
			s:(..%ConfigName="CacheHL7FileOut") fileName=$zd($h,8)_"\"_..SystemSource_"_"_..SystemDestination_"_"_pRequest.%Id()_"_"_pRequest.GetValueAt("PID:3",,.tSC)_"_"_pRequest.GetValueAt("MSH:9.2",,.tSC)_".HL7"
			$$$TRACE("Send local HL7 msg to "_..FilePathLocalHL7_":"_fileName)
			$$$TRACE(pRequest.RawContent)		
			s stream=##class(%GlobalCharacterStream).%New()
			s tSC=pRequest.OutputToOldStream(stream)
			q:('tSC) $$$ERROR("Error writing to file "_..Adapter.FilePath_"\"_fileName)	
			s tSC=..Adapter.PutStream(fileName,stream)
			q:('tSC) $$$ERROR("Error writing to file "_..Adapter.FilePath_"\"_fileName)	
		}
	} ;endif 'OUL
	
	/// HL7 Message = OUL Received from Glims for Quadrat -------------------------------------------------
	
	if (msgtype = "OUL") {
		// Set File Sequence
		i '$d(^CHUBXL.FileSeq(..%ConfigName)) s ^CHUBXL.FileSeq(..%ConfigName)=0
		S ^CHUBXL.FileSeq(..%ConfigName)=^CHUBXL.FileSeq(..%ConfigName) + 1
		/// Get fields from HL7 message
		s ndem=pRequest.GetValueAt("MSH:MessageControlID",,.tSC)
		s ndosm=pRequest.GetValueAt("PIDgrp.PID:PatientIdentifierList(1).ID",,.tSC) 
		s status=pRequest.GetValueAt("SACgrpgrp(1).OBR:ResultStatus",,.tSC)
		
		// Set fileName		
		s fileName=""
		s fileName=fileName_..SystemSource_"_"
		s fileName=fileName_..SystemDestination_"_"
		s fileName=fileName_$tr($j(^CHUBXL.FileSeq(..%ConfigName),7)," ","0")_"_"
		s fileName=fileName_pRequest.%Id()_"_"
		s fileName=fileName_ndosm_"_"
		s fileName=fileName_ndem_"_"
		s fileName=fileName_status
		/// REMOTE PROCESSING (on QUADRAT Server)
		if ($l(..FilePathRemoteHL7)>0) {
			s dir=..FilePathRemoteHL7
			s ..Adapter.FilePath=dir
			s dir=..Adapter.FilePath
			If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
			s fileExt=".HL7"
			$$$TRACE("Send Remote HL7 msg to "_dir_"\"_fileName_fileExt)
			$$$TRACE(pRequest.RawContent)
			s stream=##class(%GlobalCharacterStream).%New()
			s tSC=pRequest.OutputToOldStream(stream)
			q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
			s tSC=..Adapter.PutStream(fileName_fileExt,stream)
			q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
		}
		/// LOCAL PROCESSING (on ENSEMBLE Server)
		if ($l(..FilePathLocalHL7)>0) {
			s dir=..FilePathLocalHL7_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
			If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
			s ..Adapter.FilePath=dir
			s fileExt=".HL7"
			$$$TRACE("Send local HL7 msg to "_dir_"\"_fileName_fileExt)
			$$$TRACE(pRequest.RawContent)		
			s stream=##class(%GlobalCharacterStream).%New()
			s tSC=pRequest.OutputToOldStream(stream)
			q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
			s tSC=..Adapter.PutStream(fileName_fileExt,stream)
			q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
		}
	} ;endif OUL
		
	/// HL7 Message = MFN Received from Glims for Quadrat -------------------------------------------------
	
	if (msgtype = "MFN") {
		// Set File Sequence
		i '$d(^CHUBXL.FileSeq(..%ConfigName)) s ^CHUBXL.FileSeq(..%ConfigName)=0
		S ^CHUBXL.FileSeq(..%ConfigName)=^CHUBXL.FileSeq(..%ConfigName) + 1
		
		/// Get fields from HL7 message
		s ndem=pRequest.GetValueAt("MSH:MessageControlID",,.tSC)	
		
		// Set fileName		
		s fileName=""
		s fileName=fileName_..SystemSource_"_"
		s fileName=fileName_..SystemDestination_"_"
		s fileName=fileName_$tr($j(^CHUBXL.FileSeq(..%ConfigName),7)," ","0")_"_"
		s fileName=fileName_pRequest.%Id()_"_"
		s fileName=fileName_$tr($j(ndem,4)," ","0")_"_"
		
		/// REMOTE PROCESSING (on QUADRAT Server)
		if ($l(..FilePathRemoteHL7)>0) {
			s dir=..FilePathRemoteHL7
			s ..Adapter.FilePath=dir
			s dir=..Adapter.FilePath
			If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
			s fileExt=".HL7"
			$$$TRACE("Send Remote HL7 msg to "_dir_"\"_fileName_fileExt)
			$$$TRACE(pRequest.RawContent)
			s stream=##class(%GlobalCharacterStream).%New()
			s tSC=pRequest.OutputToOldStream(stream)
			q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
			s tSC=..Adapter.PutStream(fileName_fileExt,stream)
			q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
		}
		/// LOCAL PROCESSING (on ENSEMBLE Server)
		if ($l(..FilePathLocalHL7)>0) {
			s dir=..FilePathLocalHL7_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
			If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
			s ..Adapter.FilePath=dir
			s fileExt=".HL7"
			$$$TRACE("Send local HL7 msg to "_dir_"\"_fileName_fileExt)
			$$$TRACE(pRequest.RawContent)		
			s stream=##class(%GlobalCharacterStream).%New()
			s tSC=pRequest.OutputToOldStream(stream)
			q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
			s tSC=..Adapter.PutStream(fileName_fileExt,stream)
			q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
		}
	} ;endif MFN
	d ##class(Ens.BusinessMetric).SetMetric("CHUBXLGeneralMetric","lastMessageReceived",$ZDT($h,3),..%ConfigName)	
			
end
	s $zt=""
	Quit tSC
exception
	s tZE=$ze
	
	s tSC=$$$EnsError("General Error: "_tZE)
	g end
}

// HL7 msg OUL from GLIMS for Quadrat

Method writeRawMessageHL7File(pRequest As CHUBXL.MSG.HL7File, Output pResponse As Ens.Response) As %Status
{
	s $zt="exception",tSC=$$$OK

	// Set File Sequence
	i '$d(^CHUBXL.FileSeq(..%ConfigName)) s ^CHUBXL.FileSeq(..%ConfigName)=0
	S ^CHUBXL.FileSeq(..%ConfigName)=^CHUBXL.FileSeq(..%ConfigName) + 1

	/// Get NDOSM from HL7 message
	s ndem=pRequest.HL7.GetValueAt("MSH:MessageControlID",,.tSC)
	s ndosm=pRequest.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PID:PatientID.ID",,.tSC)
	s ObStatus=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationResultStatus",,.tSC)

	
	// Set fileName
	s fileName=""
	s fileName=fileName_..SystemSource_"_"
	s fileName=fileName_..SystemDestination_"_"
	s fileName=fileName_$tr($j(^CHUBXL.FileSeq(..%ConfigName),7)," ","0")_"_"
	s fileName=fileName_pRequest.%Id()_"_"
	s fileName=fileName_ndosm_"_"
	s fileName=fileName_ndem_"_"
	s fileName=fileName_ObStatus

	// Adjust RP parm in the HL7 segment
	d pRequest.HL7.SetValueAt(..RPFileHL7_"\"_fileName_".RTF","PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationValue(1)") 

	
	/// REMOTE PROCESSING (on QUADRAT Server)
	if ($l(..FilePathRemoteHL7)>0) {
		//-- RTF file --
		s ..Adapter.FilePath=..FilePathRemoteHL7
		s dir=..Adapter.FilePath
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s fileExt=".RTF"
		$$$TRACE("Send Remote RTF msg to "_..FilePathRemoteHL7_":"_fileName_fileExt)
		d pRequest.File.Rewind()
		s tSC=..Adapter.PutStream(fileName_fileExt,pRequest.File,.len)
		q:('tSC) $$$ERROR("Error writing to file "_..Adapter.FilePath_":"_fileName_fileExt)	
		
		//-- HL7 file --
		s ..Adapter.FilePath=..FilePathRemoteHL7
		s dir=..Adapter.FilePath
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s fileExt=".HL7"
		$$$TRACE("Send Remote HL7 msg to "_..FilePathRemoteHL7_":"_fileName_fileExt)
		s stream=##class(%GlobalCharacterStream).%New()
		s tSC=pRequest.HL7.OutputToOldStream(stream)
		q:('tSC) $$$ERROR("Error writing to file "_..Adapter.FilePath_":"_fileName_fileExt)	
		s tSC=..Adapter.PutStream(fileName_fileExt,stream)
		q:('tSC) $$$ERROR("Error writing to file "_..Adapter.FilePath_":"_fileName_fileExt)	
	}
		
	/// LOCAL PROCESSING (on ENSEMBLE Server)
	if ($l(..FilePathLocalHL7)>0) {
		//-- RTF file --		
		s ..Adapter.FilePath=dir
		s fileExt=".RTF"
		$$$TRACE("Send local RTF msg to "_dir_":"_fileName_fileExt)
		d pRequest.File.Rewind()
		s tSC=..Adapter.PutStream(fileName_fileExt,pRequest.File,.len)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
		
		//-- HL7 file --
		s dir=..FilePathLocalHL7_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s ..Adapter.FilePath=dir
		s fileExt=".HL7"
		$$$TRACE("Send local HL7 msg to "_dir_"\"_fileName_fileExt)
		s stream=##class(%GlobalCharacterStream).%New()
		s tSC=pRequest.HL7.OutputToOldStream(stream)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
		s tSC=..Adapter.PutStream(fileName_fileExt,stream)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
	}
	d ##class(Ens.BusinessMetric).SetMetric("CHUBXLGeneralMetric","lastMessageReceived",$ZDT($h,3),..%ConfigName)	
			
end
	s $zt=""
	Quit tSC
exception
	s tZE=$ze
	
	s tSC=$$$EnsError("General Error: "_tZE)
	g end
}

// HL7 msg MFN_M02 from FMC to Ecare

Method writeRawMessageHL7MedecinFile(pRequest As CHUBXL.MSG.HL7MedecinFile, Output pResponse As Ens.Response) As %Status
{
	s $zt="exception",tSC=$$$OK

	// Set File Sequence
	i '$d(^CHUBXL.FileSeq(..%ConfigName)) s ^CHUBXL.FileSeq(..%ConfigName)=0
	S ^CHUBXL.FileSeq(..%ConfigName)=^CHUBXL.FileSeq(..%ConfigName) + 1

	/// Get NDOSM from HL7 message
	s ndem=pRequest.HL7.GetValueAt("MSH:MessageControlID",,.tSC)
	s ndosm=pRequest.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PID:PatientID.ID",,.tSC)
	s ObStatus=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationResultStatus",,.tSC)
	
	// Set fileName
	s fileName=""
	s fileName=fileName_..SystemSource_"_"
	s fileName=fileName_..SystemDestination_"_"
	s fileName=fileName_$tr($j(^CHUBXL.FileSeq(..%ConfigName),7)," ","0")_"_"
	s fileName=fileName_pRequest.%Id()
	$$$TRACE("Send Remote HL7 msg to "_..FilePathRemoteHL7_"*:*"_pRequest.File)
	
	/// REMOTE PROCESSING
	if ($l(..FilePathRemoteHL7)>0) {
		//-- HL7 file --
		s ..Adapter.FilePath=..FilePathRemoteHL7
		s dir=..Adapter.FilePath
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s fileExt=".HL7"
		$$$TRACE("Send Remote HL7 msg to "_..FilePathRemoteHL7_":"_fileName_fileExt)
		s stream=##class(%GlobalCharacterStream).%New()
		s tSC=pRequest.HL7.OutputToOldStream(stream)
		q:('tSC) $$$ERROR("Error writing to file "_..Adapter.FilePath_":"_fileName_fileExt)	
		s tSC=..Adapter.PutStream(fileName_fileExt,stream)
		q:('tSC) $$$ERROR("Error writing to file "_..Adapter.FilePath_":"_fileName_fileExt)	
	}
	
		if ($l(..FilePathLocalHL7)>0) {
		//-- HL7 file --
		s dir=..FilePathLocalHL7_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s ..Adapter.FilePath=dir
		s fileExt=".HL7"
		$$$TRACE("Send local HL7 msg to "_dir_"\"_fileName_fileExt)
		s stream=##class(%GlobalCharacterStream).%New()
		s tSC=pRequest.HL7.OutputToOldStream(stream)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
		s tSC=..Adapter.PutStream(fileName_fileExt,stream)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
	}
	d ##class(Ens.BusinessMetric).SetMetric("CHUBXLGeneralMetric","lastMessageReceived",$ZDT($h,3),..%ConfigName)	
			
end
	s $zt=""
	Quit tSC
exception
	s tZE=$ze
	
	s tSC=$$$EnsError("General Error: "_tZE)
	g end
}

// DIAMIC ORU report for QUADRAT

Method writeRawMessageHL7DiamicFile(pRequest As CHUBXL.MSG.HL7DiamicFile, Output pResponse As Ens.Response) As %Status
{
	s $zt="exception",tSC=$$$OK

	// Set File Sequence
	i '$d(^CHUBXL.FileSeq(..%ConfigName)) s ^CHUBXL.FileSeq(..%ConfigName)=0
	S ^CHUBXL.FileSeq(..%ConfigName)=^CHUBXL.FileSeq(..%ConfigName) + 1

	/// Get fields from HL7 message
	s ndem=pRequest.HL7.GetValueAt("MSH:MessageControlID",,.tSC)
	s ndosm=pRequest.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PID:PatientIDInternalID",,.tSC) 
	
	s reStatus="",reStatus2=""
	s reStatus=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus",,.tSC)
	s reStatus2=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBR:ResultStatus",,.tSC)
	
	s obStatus=reStatus
	i reStatus2'="" s obStatus=reStatus2 
	
	
	// Set fileName
	s fileName=""
	s fileName=fileName_..SystemSource_"_"
	s fileName=fileName_..SystemDestination_"_"
	s fileName=fileName_$tr($j(^CHUBXL.FileSeq(..%ConfigName),7)," ","0")_"_"
	s fileName=fileName_pRequest.%Id()_"_"
	s fileName=fileName_ndosm_"_"
	s fileName=fileName_ndem_"_"
	s fileName=fileName_obStatus

	// Adjust RP pointer
	if ((reStatus="P") ! (reStatus="F")) {
		d pRequest.HL7.SetValueAt(..RPFileHL7_"\"_fileName_".RTF","PIDgrpgrp(1).ORCgrp(1).OBXgrp(3).OBX:ObservationValue") 
	}
	if ((reStatus2="P") ! (reStatus2="F")) {
		d pRequest.HL7.SetValueAt(..RPFileHL7_"\"_fileName_".RTF","PIDgrpgrp(1).ORCgrp(2).OBXgrp(3).OBX:ObservationValue") 
	}
	

	/// REMOTE PROCESSING (on QUADRAT Server)
	if ($l(..FilePathRemoteHL7)>0) {
		//-- RTF file --
		If ((reStatus = "P") ! (reStatus = "F") ! (reStatus2 = "P") ! (reStatus2 = "F")) {
			s dir=..FilePathRemoteHL7
			s ..Adapter.FilePath=dir
			s dir=..Adapter.FilePath
			If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
			s fileExt=".RTF"
			$$$TRACE("Send Remote RTF msg to "_dir_"\"_fileName_fileExt)
			d pRequest.File.Rewind()
			s tSC=..Adapter.PutStream(fileName_fileExt,pRequest.File,.len)
			q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
		}
		
		//-- HL7 file --
		s dir=..FilePathRemoteHL7
		s ..Adapter.FilePath=dir
		s dir=..Adapter.FilePath
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s fileExt=".HL7"
		$$$TRACE("Send Remote HL7 msg to "_dir_"\"_fileName_fileExt)
		s stream=##class(%GlobalCharacterStream).%New()
		s tSC=pRequest.HL7.OutputToOldStream(stream)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
		s tSC=..Adapter.PutStream(fileName_fileExt,stream)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
	}
		
	/// LOCAL PROCESSING (on ENSEMBLE Server)
	if ($l(..FilePathLocalHL7)>0) {
		//-- RTF file --		
		If ((reStatus = "P") ! (reStatus = "F") ! (reStatus2 = "P") ! (reStatus2 = "F")) {
			s dir=..FilePathLocalHL7_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
			s ..Adapter.FilePath=dir
			s dir=..Adapter.FilePath
			If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
			s fileExt=".RTF"
			$$$TRACE("Send local RTF msg to "_dir_"\"_fileName_fileExt)
			d pRequest.File.Rewind()
			s tSC=..Adapter.PutStream(fileName_fileExt,pRequest.File,.len)
			q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
		}
		//-- HL7 file --
		s dir=..FilePathLocalHL7_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s ..Adapter.FilePath=dir
		s fileExt=".HL7"
		$$$TRACE("Send local HL7 msg to "_dir_"\"_fileName_fileExt)
		s stream=##class(%GlobalCharacterStream).%New()
		s tSC=pRequest.HL7.OutputToOldStream(stream)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
		s tSC=..Adapter.PutStream(fileName_fileExt,stream)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
	}
	d ##class(Ens.BusinessMetric).SetMetric("CHUBXLGeneralMetric","lastMessageReceived",$ZDT($h,3),..%ConfigName)	
				
end
	s $zt=""
	Quit tSC
exception
	s tZE=$ze
	
	s tSC=$$$EnsError("General Error: "_tZE)
	g end
}

// BDoc ORU report for Medical Viewer

Method writeRawMessageHL7BDocFile(pRequest As CHUBXL.MSG.HL7DiamicFile, Output pResponse As Ens.Response) As %Status
{
	s $zt="exception",tSC=$$$OK

	// Set File Sequence
	i '$d(^CHUBXL.FileSeq(..%ConfigName)) s ^CHUBXL.FileSeq(..%ConfigName)=0
	S ^CHUBXL.FileSeq(..%ConfigName)=^CHUBXL.FileSeq(..%ConfigName) + 1

	/// Get fields from HL7 message
	s ndem=pRequest.HL7.GetValueAt("MSH:MessageControlID",,.tSC)
	s ndosm=pRequest.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PID:PatientIdentifierList().ID",,.tSC) 

	s reStatus="",reStatus2=""
	s reStatus=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus",,.tSC)
	s reStatus2=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBR:ResultStatus",,.tSC)
	$$$TRACE("reStatus : "_reStatus)
	$$$TRACE("reStatus2 : "_reStatus2)
	
	s obStatus=reStatus
	i reStatus2'="" s obStatus=reStatus2 
	
	
	// Set fileName
	s fileName=$p(pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationValue()",,.tSC),".",1)

	/// REMOTE PROCESSING (on MV Server)
	if ($l(..FilePathRemoteHL7)>0) {
		//-- PDF file --
		If ((reStatus = "P") ! (reStatus = "F") ! (reStatus2 = "P") ! (reStatus2 = "F")) {
			s dir=..FilePathRemoteHL7
			s ..Adapter.FilePath=dir
			s dir=..Adapter.FilePath
			If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
			s fileExt=".PDF"
			$$$TRACE("Send Remote RTF msg to "_dir_"\"_fileName_fileExt)
			d pRequest.File.Rewind()
			s tSC=..Adapter.PutStream(fileName_fileExt,pRequest.File,.len)
			q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
		}
		
		//-- HL7 file --
		s dir=..FilePathRemoteHL7
		s ..Adapter.FilePath=dir
		s dir=..Adapter.FilePath
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s fileExt=".HL7"
		$$$TRACE("Send Remote HL7 msg to "_dir_"\"_fileName_fileExt)
		s stream=##class(%GlobalCharacterStream).%New()
		s tSC=pRequest.HL7.OutputToOldStream(stream)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
		s tSC=..Adapter.PutStream(fileName_fileExt,stream)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
	}
		
	/// LOCAL PROCESSING (on ENSEMBLE Server)
	if ($l(..FilePathLocalHL7)>0) {
		//-- PDF file --		
		If ((reStatus = "P") ! (reStatus = "F") ! (reStatus2 = "P") ! (reStatus2 = "F")) {
			s dir=..FilePathLocalHL7_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
			s ..Adapter.FilePath=dir
			s dir=..Adapter.FilePath
			If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
			s fileExt=".PDF"
			$$$TRACE("Send local RTF msg to "_dir_"\"_fileName_fileExt)
			d pRequest.File.Rewind()
			s tSC=..Adapter.PutStream(fileName_fileExt,pRequest.File,.len)
			q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
		}
		//-- HL7 file --
		s dir=..FilePathLocalHL7_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s ..Adapter.FilePath=dir
		s fileExt=".HL7"
		$$$TRACE("Send local HL7 msg to "_dir_"\"_fileName_fileExt)
		s stream=##class(%GlobalCharacterStream).%New()
		s tSC=pRequest.HL7.OutputToOldStream(stream)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
		s tSC=..Adapter.PutStream(fileName_fileExt,stream)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
	}
	d ##class(Ens.BusinessMetric).SetMetric("CHUBXLGeneralMetric","lastMessageReceived",$ZDT($h,3),..%ConfigName)	
				
end
	s $zt=""
	Quit tSC
exception
	s tZE=$ze
	
	s tSC=$$$EnsError("General Error: "_tZE)
	g end
}

// ECARE ORU report for QUADRAT

Method writeRawMessageHL7EcareFile(pRequest As CHUBXL.MSG.HL7EcareFile, Output pResponse As Ens.Response) As %Status
{
	s $zt="exception",tSC=$$$OK

	// Set File Sequence
	i '$d(^CHUBXL.FileSeq(..%ConfigName)) s ^CHUBXL.FileSeq(..%ConfigName)=0
	S ^CHUBXL.FileSeq(..%ConfigName)=^CHUBXL.FileSeq(..%ConfigName) + 1

	/// Get fields from HL7 message
	s ndem=pRequest.HL7.GetValueAt("MSH:MessageControlID",,.tSC)
	s ndosm=pRequest.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PID:PatientIDInternalID",,.tSC) 
	
	s reStatus="",reStatus2=""
	s reStatus=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus",,.tSC)
	s reStatus2=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBR:ResultStatus",,.tSC)
	
	s obStatus=reStatus
	i reStatus2'="" s obStatus=reStatus2 
	
	
	// Set fileName
	s fileName=""
	s fileName=fileName_..SystemSource_"_"
	s fileName=fileName_..SystemDestination_"_"
	s fileName=fileName_$tr($j(^CHUBXL.FileSeq(..%ConfigName),7)," ","0")_"_"
	s fileName=fileName_pRequest.%Id()_"_"
	s fileName=fileName_ndosm_"_"
	s fileName=fileName_ndem_"_"
	s fileName=fileName_obStatus

	// Adjust RP pointer
	if ((reStatus="P") ! (reStatus="F")) {
		d pRequest.HL7.SetValueAt(..RPFileHL7_"\"_fileName_".RTF","PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationValue") 
		//d pRequest.HL7.SetValueAt("RP","PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ValueType") 
		//d pRequest.HL7.SetValueAt("F","PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservResultStatus") 
	}
	if ((reStatus2="P") ! (reStatus2="F")) {
		d pRequest.HL7.SetValueAt(..RPFileHL7_"\"_fileName_".RTF","PIDgrpgrp(1).ORCgrp(2).OBXgrp(3).OBX:ObservationValue") 
		//d pRequest.HL7.SetValueAt("RP","PIDgrpgrp(1).ORCgrp(2).OBXgrp(3).OBX:ValueType")
		//d pRequest.HL7.SetValueAt("F","PIDgrpgrp(1).ORCgrp(2).OBXgrp(3).OBX:ObservResultStatus") 
	}

	/// REMOTE PROCESSING (on QUADRAT Server)
	if ($l(..FilePathRemoteHL7)>0) {
		//-- RTF file --
		If ((reStatus = "P") ! (reStatus = "F") ! (reStatus2 = "P") ! (reStatus2 = "F")) {
			s dir=..FilePathRemoteHL7
			s ..Adapter.FilePath=dir
			s dir=..Adapter.FilePath
			If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
			s fileExt=".RTF"
			$$$TRACE("Send Remote RTF msg to "_dir_"\"_fileName_fileExt)
			d pRequest.File.Rewind()
			s tSC=..Adapter.PutStream(fileName_fileExt,pRequest.File,.len)
			q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
		}
		
		//-- HL7 file --
		s dir=..FilePathRemoteHL7
		s ..Adapter.FilePath=dir
		s dir=..Adapter.FilePath
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s fileExt=".HL7"
		$$$TRACE("Send Remote HL7 msg to "_dir_"\"_fileName_fileExt)
		s stream=##class(%GlobalCharacterStream).%New()
		s tSC=pRequest.HL7.OutputToOldStream(stream)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
		s tSC=..Adapter.PutStream(fileName_fileExt,stream)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
	}
		
	/// LOCAL PROCESSING (on ENSEMBLE Server)
	if ($l(..FilePathLocalHL7)>0) {
		//-- RTF file --		
		If ((reStatus = "P") ! (reStatus = "F") ! (reStatus2 = "P") ! (reStatus2 = "F")) {
			s dir=..FilePathLocalHL7_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
			s ..Adapter.FilePath=dir
			s dir=..Adapter.FilePath
			If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
			s fileExt=".RTF"
			$$$TRACE("Send local RTF msg to "_dir_"\"_fileName_fileExt)
			d pRequest.File.Rewind()
			s tSC=..Adapter.PutStream(fileName_fileExt,pRequest.File,.len)
			q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
		}
		//-- HL7 file --
		s dir=..FilePathLocalHL7_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s ..Adapter.FilePath=dir
		s fileExt=".HL7"
		$$$TRACE("Send local HL7 msg to "_dir_"\"_fileName_fileExt)
		s stream=##class(%GlobalCharacterStream).%New()
		s tSC=pRequest.HL7.OutputToOldStream(stream)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
		s tSC=..Adapter.PutStream(fileName_fileExt,stream)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
	}
	d ##class(Ens.BusinessMetric).SetMetric("CHUBXLGeneralMetric","lastMessageReceived",$ZDT($h,3),..%ConfigName)	
				
end
	s $zt=""
	Quit tSC
exception
	s tZE=$ze
	
	s tSC=$$$EnsError("General Error: "_tZE)
	g end
}

// DIALYSE HL7 from GLIMS 

Method writeRawMessageHL7DIA(pRequest As CHUBXL.MSG.HL7Dialyse, Output pResponse As Ens.Response) As %Status
{
	s $zt="exception",tSC=$$$OK

	$$$TRACE("HL7 DIA Message : "_pRequest.Message)
	
	/// REMOTE PROCESSING (not used for DIALYSE)
		if ($l(..FilePathRemoteHL7)>0) {
			s ..Adapter.FilePath=..FilePathRemoteHL7
			s dir=..Adapter.FilePath
			If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
			s fileName=..SystemSource_"_"_..SystemDestination_"_"_pRequest.%Id()_".HL7"
			$$$TRACE("Send remote HL7 DIA msg to "_..FilePathRemoteHL7_"\"_fileName)
			$$$TRACE(pRequest.Message)
			s tSC=..Adapter.PutString(fileName,pRequest.Message)
			q:('tSC) $$$ERROR("Error writing to file "_..Adapter.FilePath_"\"_fileName)	
		}
	/// LOCAL PROCESSING 
		if ($l(..FilePathLocalHL7)>0) {
			s ..Adapter.FilePath=..FilePathLocalHL7
			s dir=..Adapter.FilePath
			If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
			s fileName=..SystemSource_"_"_..SystemDestination_"_"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")_".HL7"
			$$$TRACE("Send local HL7 DIA msg to "_..FilePathLocalHL7_":"_fileName)
			$$$TRACE(pRequest.Message)		
			s tSC=..Adapter.PutString(fileName,pRequest.Message_$c(13)_$c(10))
			q:('tSC) $$$ERROR("Error writing to file "_..Adapter.FilePath_"\"_fileName)	
		}
		d ##class(Ens.BusinessMetric).SetMetric("CHUBXLGeneralMetric","lastMessageReceived",$ZDT($h,3),..%ConfigName)	
			
end
	s $zt=""
	Quit tSC
exception
	s tZE=$ze
	
	s tSC=$$$EnsError("General Error: "_tZE)
	g end
}

// HL7 msg MFN from GLIMS for Quadrat

Method writeRawMessage(pRequest As CHUBXL.DATA.RawMessageStream, Output pResponse As Ens.Response) As %Status
{
	s $zt="exception",tSC=$$$OK

			
	/// HL7 Message = MFN Received from Glims for Quadrat -------------------------------------------------
	
	// Set File Sequence
	i '$d(^CHUBXL.FileSeq(..%ConfigName)) s ^CHUBXL.FileSeq(..%ConfigName)=0
	S ^CHUBXL.FileSeq(..%ConfigName)=^CHUBXL.FileSeq(..%ConfigName) + 1
		
	// Set fileName		
	s fileName=""
	s fileName=fileName_..SystemSource_"_"
	s fileName=fileName_..SystemDestination_"_"
	s fileName=fileName_$tr($j(^CHUBXL.FileSeq(..%ConfigName),7)," ","0")_"_"
	s testFileName=$translate(fileName,"<>","")
	
	s fileName=fileName_pRequest.%Id()
		
	$$$TRACE("Test du TRANSLATE Filename : "_fileName_" -> "_testFileName)	
			
	/// REMOTE PROCESSING (on QUADRAT Server)
	if ($l(..FilePathRemoteHL7)>0) {
		s dir=..FilePathRemoteHL7_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		s ..Adapter.FilePath=dir
		s dir=..Adapter.FilePath
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s fileExt=".HL7"
		
		$$$TRACE("Send Remote HL7 msg to "_dir_"\"_fileName_fileExt)
		;$$$TRACE(pRequest.payLoad)
		s tSC=..Adapter.PutStream(fileName_fileExt,pRequest.payLoad)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
	}
	/// LOCAL PROCESSING (on ENSEMBLE Server)
	if ($l(..FilePathLocalHL7)>0) {
		s dir=..FilePathLocalHL7_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s ..Adapter.FilePath=dir
		s fileExt=".HL7"
		$$$TRACE("Send local HL7 msg to "_dir_"\"_fileName_fileExt)
		;$$$TRACE(pRequest.payLoad)
		s tSC=..Adapter.PutStream(fileName_fileExt,pRequest.payLoad)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
		}
	d ##class(Ens.BusinessMetric).SetMetric("CHUBXLGeneralMetric","lastMessageReceived",$ZDT($h,3),..%ConfigName)	

			
end
	s $zt=""
	Quit tSC
exception
	s tZE=$ze
	
	s tSC=$$$EnsError("General Error: "_tZE)
	g end
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="EnsLib.HL7.Message"> 
		<Method>writeRawMessageHL7</Method>
	</MapItem>
	<MapItem MessageType="CHUBXL.MSG.HL7File"> 
		<Method>writeRawMessageHL7File</Method>
	</MapItem>
	<MapItem MessageType="CHUBXL.MSG.HL7DiamicFile"> 
		<Method>writeRawMessageHL7DiamicFile</Method>
	</MapItem>
	<MapItem MessageType="CHUBXL.MSG.HL7BDocFile"> 
		<Method>writeRawMessageHL7BDocFile</Method>
	</MapItem>
	<MapItem MessageType="CHUBXL.MSG.HL7EcareFile"> 
		<Method>writeRawMessageHL7EcareFile</Method>
	</MapItem>
	<MapItem MessageType="CHUBXL.MSG.HL7Dialyse"> 
		<Method>writeRawMessageHL7DIA</Method>
	</MapItem>
	<MapItem MessageType="CHUBXL.DATA.RawMessageStream"> 
		<Method>writeRawMessage</Method>
	</MapItem>
	<MapItem MessageType="CHUBXL.MSG.HL7MedecinFile"> 
		<Method>writeRawMessageHL7MedecinFile</Method>
	</MapItem>
</MapItems>
}

}
