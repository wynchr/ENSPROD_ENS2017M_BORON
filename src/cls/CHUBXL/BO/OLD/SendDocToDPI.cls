Class CHUBXL.BO.OLD.SendDocToDPI Extends Ens.BusinessOperation [ ClassType = "", ProcedureBlock ]
{

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Property SystemSource As %String(TRUNCATE = 1) [ InitialExpression = "Quadrat" ];

Property SystemDestination As %String(TRUNCATE = 1) [ InitialExpression = "DPI" ];

Property FilePathLocalXML As %String(TRUNCATE = 1) [ InitialExpression = "D:\DATA\ENS\Test\RXISO\out\DPI" ];

Property FilePathLocalTXT As %String(TRUNCATE = 1) [ InitialExpression = "D:\DATA\ENS\Test\RXISO\out\DPI" ];

Property FilePathRemoteXML As %String(TRUNCATE = 1) [ InitialExpression = "\\sodium\pcl$\IN" ];

Property FilePathRemoteTXT As %String(TRUNCATE = 1) [ InitialExpression = "\\sodium\pcl$\IN" ];

Property FilePathBLOB As %String(TRUNCATE = 1) [ InitialExpression = "E:\Medical Viewer\AcArchive\XML\PCL\PCL\" ];

Property ExtentionBLOB As %String(TRUNCATE = 1) [ InitialExpression = "RTF" ];

Parameter ADAPTER = "EnsLib.File.OutboundAdapter";

Parameter INVOCATION = "Queue";

Parameter SETTINGS = "AddToMetric,SystemSource,SystemDestination,FilePathLocalXML,FilePathLocalTXT,FilePathRemoteXML,FilePathRemoteTXT,FilePathBLOB,ExtentionBLOB";

Method WriteToFile0(pRequest As CHUBXL.MSG.HL7DiamicFile, Output pResponse As Ens.Response) As %Status
{
	
	$$$TRACE("Start SendDocToDPI")
	
	Set $ZTrap = "exception"
	s tSC=$$$OK
	s out=pRequest.HL7
	s ndosm=pRequest.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PID:PatientID.ID",,.tSC)
	i ndosm="" s ndosm=pRequest.HL7.FindSegmentValues("PID:3.1")
	s NumeroDemande=pRequest.HL7.GetValueAt("MSH:MessageControlID",,.tSC)
	s ObservationStatus=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationResultStatus",,.tSC)
	i ObservationStatus="" s ObservationStatus=pRequest.HL7.GetValueAt("{PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus}",,.tSC)

	s reStatus="",reStatus2=""
	s reStatus=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus",,.tSC)
	s reStatus2=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBR:ResultStatus",,.tSC)
	
	s obStatus=reStatus
	i reStatus2'="" s obStatus=reStatus2

	// Set File Sequence
	i '$d(^CHUBXL.FileSeq(..%ConfigName)) s ^CHUBXL.FileSeq(..%ConfigName)=0
	S ^CHUBXL.FileSeq(..%ConfigName)=^CHUBXL.FileSeq(..%ConfigName) + 1

	// Set fileName
	s FileName=""
	s FileName=FileName_..SystemSource_"_"
	s FileName=FileName_..SystemDestination_"_"	
	s FileName=FileName_$tr($j(^CHUBXL.FileSeq(..%ConfigName),7)," ","0")_"_"
	s FileName=FileName_pRequest.%Id()_"_"
	s FileName=FileName_ndosm_"_"
	s FileName=FileName_NumeroDemande_"_"
	s FileName=FileName_ObservationStatus

	// Adjust RP pointer
	if ((reStatus="P") ! (reStatus="F")) {
		d pRequest.HL7.SetValueAt(..FilePathBLOB_FileName_"."_..ExtentionBLOB,"PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationValue") 
	}
	if ((reStatus2="P") ! (reStatus2="F")) {
		d pRequest.HL7.SetValueAt(..FilePathBLOB_FileName_"."_..ExtentionBLOB,"PIDgrpgrp(1).ORCgrp(2).OBXgrp(3).OBX:ObservationValue") 
	}

	/// REMOTE PROCESSING (on DPI Server)
	Do pRequest.File.Rewind()
	if ($l(..FilePathRemoteTXT)>0) {
		If ((reStatus = "P") ! (reStatus = "F") ! (reStatus2 = "P") ! (reStatus2 = "F")) {
		   s ..Adapter.FilePath=..FilePathRemoteTXT
		   $$$TRACE("Send remote TXT msg to "_..FilePathRemoteTXT_FileName_"."_..ExtentionBLOB)
		   s tSC=..Adapter.PutStream(FileName_"."_..ExtentionBLOB,pRequest.File)
		   ;Quit:('tSC) $$$ERROR($$$GeneralError, "Error writing to file "_..Adapter.FilePath_FileName_"."_..ExtentionBLOB _ $ZError)
		   Quit:$$$ISERR(tSC) tSC
		   $$$TRACE("Send remote TXT msg completed")
		}
	}
	if ($l(..FilePathRemoteXML)>0) {
		s ..Adapter.FilePath=..FilePathRemoteXML
		$$$TRACE("Send remote XML msg to "_..FilePathRemoteXML_FileName_".HL7")
		s stream=##class(%GlobalCharacterStream).%New()
		s tSC=pRequest.HL7.OutputToOldStream(stream)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_FileName_".HL7")	
		s tSC=..Adapter.PutStream(FileName_".HL7",stream)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_FileName_".HL7")
	}
	
	/// LOCAL PROCESSING (on ENSEMBLE Server)
	Do pRequest.File.Rewind()
	if ($l(..FilePathLocalTXT)>0) {
		If ((reStatus = "P") ! (reStatus = "F") ! (reStatus2 = "P") ! (reStatus2 = "F")) {
		   s dir=..FilePathLocalTXT_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		   If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		   $$$TRACE("dir:"_dir)
		   s ..Adapter.FilePath=dir
		   $$$TRACE("Send local TXT msg to "_dir_"\"_FileName_"."_..ExtentionBLOB)
		   s tSC=..Adapter.PutStream(FileName_"."_..ExtentionBLOB,pRequest.File)
		   Quit:$$$ISERR(tSC) tSC
		   $$$TRACE("Send local TXT msg completed")
		}
	}
	
	if ($l(..FilePathLocalXML)>0) {
		s dir=..FilePathLocalXML_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s ..Adapter.FilePath=dir
		s stream=##class(%GlobalCharacterStream).%New()
		s tSC=pRequest.HL7.OutputToOldStream(stream)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_FileName_".HL7")	
		s tSC=..Adapter.PutStream(FileName_".HL7",stream)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_FileName_".HL7")
	}
		
	$$$TRACE("End of DocToDPI")
	Set file=##class(%File).%New(..FilePathBLOB_FileName_".ok")
	d file.Open("WSN")
	d file.WriteLine("")
	d file.Close()
	d ##class(Ens.BusinessMetric).SetMetric("CHUBXLGeneralMetric","lastMessageReceived",$ZDT($h,3),..%ConfigName)	
end
	Set $ZTrap = ""
	Quit tSC
	
exception
	s tZE=$ze
	s tSC=$$$EnsError("General Error: "_tZE)
	g end
}

Method WriteToFile(pRequest As CHUBXL.MSG.HL7DPIFile, Output pResponse As Ens.Response) As %Status
{
	
	$$$TRACE("Start SendDocToDPI")
	
	Set $ZTrap = "exception"
	s tSC=$$$OK
	s out=pRequest.HL7
	s ndosm=pRequest.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PID:PatientID.ID",,.tSC)
	s NumeroDemande=pRequest.HL7.GetValueAt("MSH:MessageControlID",,.tSC)
	s ObservationStatus=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationResultStatus",,.tSC)
	
	// Set File Sequence
	i '$d(^CHUBXL.FileSeq(..%ConfigName)) s ^CHUBXL.FileSeq(..%ConfigName)=0
	S ^CHUBXL.FileSeq(..%ConfigName)=^CHUBXL.FileSeq(..%ConfigName) + 1

	// Set fileName
	s FileName=""
	s FileName=FileName_..SystemSource_"_"
	s FileName=FileName_..SystemDestination_"_"	
	s FileName=FileName_$tr($j(^CHUBXL.FileSeq(..%ConfigName),7)," ","0")_"_"
	s FileName=FileName_pRequest.%Id()_"_"
	s FileName=FileName_ndosm_"_"
	s FileName=FileName_NumeroDemande_"_"
	s FileName=FileName_ObservationStatus
	d pRequest.HL7.SetValueAt(..FilePathBLOB_FileName_"."_..ExtentionBLOB,"PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationValue") 

	/// REMOTE PROCESSING (on DPI Server)
	Do pRequest.File.Rewind()
	if ($l(..FilePathRemoteTXT)>0) {
		s ..Adapter.FilePath=..FilePathRemoteTXT
		$$$TRACE("Send remote TXT msg to "_..FilePathRemoteTXT_FileName_"."_..ExtentionBLOB)
		s tSC=..Adapter.PutStream(FileName_"."_..ExtentionBLOB,pRequest.File)
		;Quit:('tSC) $$$ERROR($$$GeneralError, "Error writing to file "_..Adapter.FilePath_FileName_"."_..ExtentionBLOB _ $ZError)
		Quit:$$$ISERR(tSC) tSC
		$$$TRACE("Send remote TXT msg completed")
	}
	if ($l(..FilePathRemoteXML)>0) {
		s ..Adapter.FilePath=..FilePathRemoteXML
		$$$TRACE("Send remote XML msg to "_..FilePathRemoteXML_FileName_".HL7")
		s stream=##class(%GlobalCharacterStream).%New()
		s tSC=pRequest.HL7.OutputToOldStream(stream)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_FileName_".HL7")	
		s tSC=..Adapter.PutStream(FileName_".HL7",stream)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_FileName_".HL7")
	}
	$$$TRACE("Ok *******")
	/// LOCAL PROCESSING (on ENSEMBLE Server)
	Do pRequest.File.Rewind()
	$$$TRACE("Ok ******* 1 : *"_..FilePathLocalTXT_"*")
	if ($l(..FilePathLocalTXT)>0) {
		s dir=..FilePathLocalTXT_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		$$$TRACE("dir:"_dir)
		s ..Adapter.FilePath=dir
		$$$TRACE("Send local TXT msg to "_dir_"\"_FileName_"."_..ExtentionBLOB)
		s tSC=..Adapter.PutStream(FileName_"."_..ExtentionBLOB,pRequest.File)
		Quit:$$$ISERR(tSC) tSC
		$$$TRACE("Send local TXT msg completed")
	}
	$$$TRACE("Ok ******* 2")
	if ($l(..FilePathLocalXML)>0) {
		s dir=..FilePathLocalXML_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s ..Adapter.FilePath=dir
		s stream=##class(%GlobalCharacterStream).%New()
		s tSC=pRequest.HL7.OutputToOldStream(stream)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_FileName_".HL7")	
		s tSC=..Adapter.PutStream(FileName_".HL7",stream)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_FileName_".HL7")
	}
	$$$TRACE("Ok ******* 3")
	$$$TRACE("End of DocToDPI : "_..FilePathBLOB_FileName)
	Set file=##class(%File).%New(..FilePathBLOB_FileName_".ok")
	d file.Open("WSN")
	d file.WriteLine("")
	d file.Close()
end
	Set $ZTrap = ""
	Quit tSC
	
exception
	s tZE=$ze
	s tSC=$$$EnsError("General Error: "_tZE)
	g end
}

Method WriteToFile1(pRequest As CHUBXL.MSG.HL7EcareFile, Output pResponse As Ens.Response) As %Status
{
	
	s $zt="exception",tSC=$$$OK

	// Set File Sequence
	i '$d(^CHUBXL.FileSeq(..%ConfigName)) s ^CHUBXL.FileSeq(..%ConfigName)=0
	S ^CHUBXL.FileSeq(..%ConfigName)=^CHUBXL.FileSeq(..%ConfigName) + 1

	/// Get fields from HL7 message
	s ndem=pRequest.HL7.GetValueAt("MSH:MessageControlID",,.tSC)
	;s ndosm=pRequest.HL7.FindSegmentValues("PID:2.1") 
	s ndosm=pRequest.HL7.GetValueAt("PIDgrpgrp().PIDgrp.PID:PatientIdentifierList()",,.tSC)
	$$$TRACE("ndosm 1 : "_ndosm)
	i $tr(ndosm," ")="" s ndosm=pRequest.HL7.FindSegmentValues("PID:3.1") 
	i $tr(ndosm," ")="" s ndosm=pRequest.HL7.FindSegmentValues("PID:2.1") 
	$$$TRACE("ndosm 2 : "_ndosm)
	s NHop=##class(CHUBXL.DT.Utils).getNHop(ndosm)
	$$$TRACE("NHOP : "_NHop)
	// Set fileName
	s fileName=""
	s fileName=fileName_..SystemSource_"_"
	s fileName=fileName_..SystemDestination_"_"
	s fileName=fileName_$tr($j(^CHUBXL.FileSeq(..%ConfigName),7)," ","0")_"_"
	s fileName=fileName_pRequest.%Id()_"_"
	s fileName=fileName_ndosm_"_"
	s fileName=fileName_ndem_"_"
	s fileName=fileName_pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus",,.tSC)
    s NewHL7=##class(EnsLib.HL7.Message).%New(),NewHL7.DocType="2.4:ORU_R01"
	s MSH=pRequest.HL7.FindSegmentValues("MSH")
	s PID=pRequest.HL7.FindSegmentValues("PID")
	s PV1=pRequest.HL7.FindSegmentValues("PV1")
	i ("~2~8~"'[("~"_$e(pRequest.HL7.FindSegmentValues("PV1:19"),1)_"~")) s PV1=""
	s ORC1=pRequest.HL7.FindSegmentValues("ORC(1)")
	s ORC2=pRequest.HL7.FindSegmentValues("ORC(2)")
	s ORC3=pRequest.HL7.FindSegmentValues("ORC(3)")
	s ORC4=pRequest.HL7.FindSegmentValues("ORC(4)")
	s ORC5=pRequest.HL7.FindSegmentValues("ORC(5)")
	s ORC6=pRequest.HL7.FindSegmentValues("ORC(6)")
	s ORC7=pRequest.HL7.FindSegmentValues("ORC(7)")
	s ORC8=pRequest.HL7.FindSegmentValues("ORC(8)")
	s OBR1=pRequest.HL7.FindSegmentValues("OBR(1)")
	s OBR2=pRequest.HL7.FindSegmentValues("OBR(2)")
	s OBR3=pRequest.HL7.FindSegmentValues("OBR(3)")
	s OBR4=pRequest.HL7.FindSegmentValues("OBR(4)")
	s OBR5=pRequest.HL7.FindSegmentValues("OBR(5)")
	s OBR6=pRequest.HL7.FindSegmentValues("OBR(6)")
	s OBR7=pRequest.HL7.FindSegmentValues("OBR(7)")
	s OBR8=pRequest.HL7.FindSegmentValues("OBR(8)")
	s OBX=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX"),pos=1
	s MsgFin=$p(pRequest.HL7.RawContent,"OBX",$l(pRequest.HL7.RawContent,"OBX"))
	s MsgFin=$e(MsgFin,1,$l(MsgFin)-1),MsgFin=$tr(MsgFin,$c(13)),MsgFin=$tr(MsgFin,$c(10))
	$$$TRACE("MsgFin : "_MsgFin)
	s sw=0
	f jj=1:1:8 {
	  s var="OBR"_jj,@var=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp("_jj_").OBR",,.tSC)
	  $$$TRACE("OBR:"_jj_"* "_pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp("_jj_").OBR",,.tSC))
	  i @var'="" {
	    f ii=1:1:8 {
		  s var1="OBX"_jj_ii,@var1=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp("_jj_").OBXgrp("_ii_").OBX",,.tSC)
		  $$$TRACE("OBX"_jj_ii_" : "_@var1)
	  	  i @var1'="" {
		  	s tSC1=NewHL7.SetValueAt(@var1,"PIDgrpgrp(1).ORCgrp("_jj_").OBXgrp("_ii_").OBX")
		  	i (pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp("_jj_").OBXgrp("_ii_").OBX:ValueType",,.tSC)="RP") ! (pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp("_jj_").OBXgrp("_ii_").OBX:ValueType",,.tSC)="ED") {
		  	  s tSC1=NewHL7.SetValueAt(..FilePathRemoteTXT_fileName_".RTF","PIDgrpgrp(1).ORCgrp("_jj_").OBXgrp("_ii_").OBX:5")
		  	  s tSC1=NewHL7.SetValueAt($p(MsgFin,"|",7),"PIDgrpgrp(1).ORCgrp("_jj_").OBXgrp("_ii_").OBX:6")
		  	  s tSC1=NewHL7.SetValueAt($p(MsgFin,"|",8),"PIDgrpgrp(1).ORCgrp("_jj_").OBXgrp("_ii_").OBX:7")
		  	  s tSC1=NewHL7.SetValueAt($p(MsgFin,"|",9),"PIDgrpgrp(1).ORCgrp("_jj_").OBXgrp("_ii_").OBX:8")
		  	  s tSC1=NewHL7.SetValueAt($p(MsgFin,"|",10),"PIDgrpgrp(1).ORCgrp("_jj_").OBXgrp("_ii_").OBX:9")
		  	  s tSC1=NewHL7.SetValueAt($p(MsgFin,"|",11),"PIDgrpgrp(1).ORCgrp("_jj_").OBXgrp("_ii_").OBX:10")
		  	  s tSC1=NewHL7.SetValueAt($p(MsgFin,"|",12),"PIDgrpgrp(1).ORCgrp("_jj_").OBXgrp("_ii_").OBX:11")
		  	  s tSC1=NewHL7.SetValueAt($p(MsgFin,"|",13),"PIDgrpgrp(1).ORCgrp("_jj_").OBXgrp("_ii_").OBX:12")
		  	  s tSC1=NewHL7.SetValueAt($p(MsgFin,"|",14),"PIDgrpgrp(1).ORCgrp("_jj_").OBXgrp("_ii_").OBX:13")
		  	  s tSC1=NewHL7.SetValueAt($p(MsgFin,"|",15),"PIDgrpgrp(1).ORCgrp("_jj_").OBXgrp("_ii_").OBX:14")
		  	  s tSC1=NewHL7.SetValueAt($p(MsgFin,"|",16),"PIDgrpgrp(1).ORCgrp("_jj_").OBXgrp("_ii_").OBX:15")
		  	  s tSC1=NewHL7.SetValueAt($p(MsgFin,"|",17),"PIDgrpgrp(1).ORCgrp("_jj_").OBXgrp("_ii_").OBX:16"),sw=1
		  	}
		  	;i ..SystemSource["Quadrat" s tSC1=NewHL7.SetValueAt("RP","PIDgrpgrp(1).ORCgrp("_jj_").OBXgrp("_ii_").OBX:ValueType")
	  	  }
	    }
	  }
	}

    s Appli=pRequest.HL7.GetValueAt("MSH:SendingApplication",,.tSC)
    s NumDem=pRequest.HL7.GetValueAt("MSH:MessageControlID",,.tSC)
	i MSH'="" s tSC1=NewHL7.SetValueAt(MSH,"MSH")
	i Appli="ECARE" {
	  s $p(PID,"|",3)=$p(PID,"|",4)
	}
	i PID'="" s tSC1=NewHL7.SetValueAt(PID,"PIDgrpgrp(1).PIDgrp.PID")
	i PV1'="" s tSC1=NewHL7.SetValueAt(PV1,"PIDgrpgrp(1).PIDgrp.PV1grp.PV1")
	i ORC1'="" s tSC1=NewHL7.SetValueAt(ORC1,"PIDgrpgrp(1).ORCgrp(1).ORC"),pos=1
	i ORC2'="" s tSC1=NewHL7.SetValueAt(ORC2,"PIDgrpgrp(1).ORCgrp(2).ORC"),pos=2
	i ORC3'="" s tSC1=NewHL7.SetValueAt(ORC3,"PIDgrpgrp(1).ORCgrp(3).ORC"),pos=3
	i ORC4'="" s tSC1=NewHL7.SetValueAt(ORC4,"PIDgrpgrp(1).ORCgrp(4).ORC"),pos=4
	i ORC5'="" s tSC1=NewHL7.SetValueAt(ORC5,"PIDgrpgrp(1).ORCgrp(5).ORC"),pos=5
	i ORC6'="" s tSC1=NewHL7.SetValueAt(ORC6,"PIDgrpgrp(1).ORCgrp(6).ORC"),pos=6
	i ORC7'="" s tSC1=NewHL7.SetValueAt(ORC7,"PIDgrpgrp(1).ORCgrp(7).ORC"),pos=7
	i ORC8'="" s tSC1=NewHL7.SetValueAt(ORC8,"PIDgrpgrp(1).ORCgrp(8).ORC"),pos=8
	i OBR1'="" s OBR=..RetrieveBDoc(OBR1,NHop) s:Appli="ECARE" OBR=$p(OBR,"|",1,3)_"|"_NumDem_"^"_$p(OBR,"^",2,99) s tSC1=NewHL7.SetValueAt(OBR,"PIDgrpgrp(1).ORCgrp(1).OBR") $$$TRACE("OBR 1 : "_OBR)
	i OBR2'="" s OBR=..RetrieveBDoc(OBR2,NHop) s:Appli="ECARE" OBR=$p(OBR,"|",1,3)_"|"_NumDem_"^"_$p(OBR,"^",2,99) s tSC1=NewHL7.SetValueAt(OBR,"PIDgrpgrp(1).ORCgrp(2).OBR") $$$TRACE("OBR 2 : "_OBR)
	i OBR3'="" s OBR=..RetrieveBDoc(OBR3,NHop) s:Appli="ECARE" OBR=$p(OBR,"|",1,3)_"|"_NumDem_"^"_$p(OBR,"^",2,99) s tSC1=NewHL7.SetValueAt(OBR,"PIDgrpgrp(1).ORCgrp(3).OBR") $$$TRACE("OBR 3 : "_OBR)
	i OBR4'="" s OBR=..RetrieveBDoc(OBR4,NHop) s:Appli="ECARE" OBR=$p(OBR,"|",1,3)_"|"_NumDem_"^"_$p(OBR,"^",2,99) s tSC1=NewHL7.SetValueAt(OBR,"PIDgrpgrp(1).ORCgrp(4).OBR") $$$TRACE("OBR 4 : "_OBR)
	i OBR5'="" s OBR=..RetrieveBDoc(OBR5,NHop) s:Appli="ECARE" OBR=$p(OBR,"|",1,3)_"|"_NumDem_"^"_$p(OBR,"^",2,99) s tSC1=NewHL7.SetValueAt(OBR,"PIDgrpgrp(1).ORCgrp(5).OBR") $$$TRACE("OBR 5 : "_OBR)
	i OBR6'="" s OBR=..RetrieveBDoc(OBR6,NHop) s:Appli="ECARE" OBR=$p(OBR,"|",1,3)_"|"_NumDem_"^"_$p(OBR,"^",2,99) s tSC1=NewHL7.SetValueAt(OBR,"PIDgrpgrp(1).ORCgrp(6).OBR") $$$TRACE("OBR 6 : "_OBR)
	i OBR7'="" s OBR=..RetrieveBDoc(OBR7,NHop) s:Appli="ECARE" OBR=$p(OBR,"|",1,3)_"|"_NumDem_"^"_$p(OBR,"^",2,99) s tSC1=NewHL7.SetValueAt(OBR,"PIDgrpgrp(1).ORCgrp(7).OBR") $$$TRACE("OBR 7 : "_OBR)
	i OBR8'="" s OBR=..RetrieveBDoc(OBR8,NHop) s:Appli="ECARE" OBR=$p(OBR,"|",1,3)_"|"_NumDem_"^"_$p(OBR,"^",2,99) s tSC1=NewHL7.SetValueAt(OBR,"PIDgrpgrp(1).ORCgrp(8).OBR") $$$TRACE("OBR 8 : "_OBR)
	i 'sw {
	  s OBX=pRequest.HL7.FindSegmentValues("OBX(1)")
  	  s tSC1=NewHL7.SetValueAt($p(MsgFin,"|",2),"PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:1")
  	  s tSC1=NewHL7.SetValueAt($p(MsgFin,"|",3),"PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:2")
  	  s tSC1=NewHL7.SetValueAt($p(MsgFin,"|",4),"PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:3")
  	  s tSC1=NewHL7.SetValueAt($p(MsgFin,"|",5),"PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:4")
  	  s tSC1=NewHL7.SetValueAt(..FilePathRemoteTXT_fileName_".RTF","PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:5")
  	  s tSC1=NewHL7.SetValueAt($p(MsgFin,"|",7),"PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:6")
  	  s tSC1=NewHL7.SetValueAt($p(MsgFin,"|",8),"PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:7")
  	  s tSC1=NewHL7.SetValueAt($p(MsgFin,"|",9),"PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:8")
  	  s tSC1=NewHL7.SetValueAt($p(MsgFin,"|",10),"PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:9")
  	  s tSC1=NewHL7.SetValueAt($p(MsgFin,"|",11),"PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:10")
  	  s tSC1=NewHL7.SetValueAt($p(MsgFin,"|",12),"PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:11")
  	  s tSC1=NewHL7.SetValueAt($p(MsgFin,"|",13),"PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:12")
  	  s tSC1=NewHL7.SetValueAt($p(MsgFin,"|",14),"PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:13")
  	  s tSC1=NewHL7.SetValueAt($p(MsgFin,"|",15),"PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:14")
  	  s tSC1=NewHL7.SetValueAt($p(MsgFin,"|",16),"PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:15")
  	  s tSC1=NewHL7.SetValueAt($p(MsgFin,"|",17),"PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:16"),sw=1
		
	}

	/// REMOTE PROCESSING (on QUADRAT Server)
	if ($l(..FilePathRemoteXML)>0) {
		//-- RTF file --
		s dir=..FilePathRemoteXML
		s ..Adapter.FilePath=dir
		s dir=..Adapter.FilePath
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s fileExt=".RTF"
		;$$$TRACE("Send Remote RTF msg to "_dir_"\"_fileName_fileExt)
		d pRequest.File.Rewind()
		s tSC=..Adapter.PutStream(fileName_fileExt,pRequest.File,.len)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
		
		//-- HL7 file --
		s dir=..FilePathRemoteXML
		s ..Adapter.FilePath=dir
		s dir=..Adapter.FilePath
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s fileExt=".HL7"
		;$$$TRACE("Send Remote HL7 msg to "_dir_"\"_fileName_fileExt)
		s stream=##class(%GlobalCharacterStream).%New()
		;s tSC=pRequest.HL7.OutputToOldStream(stream)
		s tSC=NewHL7.OutputToOldStream(stream)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
		s tSC=..Adapter.PutStream(fileName_fileExt,stream)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
	}
		
	/// LOCAL PROCESSING (on ENSEMBLE Server)
	if ($l(..FilePathLocalXML)>0) {
		s dir=..FilePathLocalXML_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		s ..Adapter.FilePath=dir
		s dir=..Adapter.FilePath
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s fileExt=".RTF"
		;$$$TRACE("Send local RTF msg to "_dir_"\"_fileName_fileExt)
		d pRequest.File.Rewind()
		s tSC=..Adapter.PutStream(fileName_fileExt,pRequest.File,.len)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	

		//-- HL7 file --
		s dir=..FilePathLocalXML_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s ..Adapter.FilePath=dir
		s fileExt=".HL7"
		;$$$TRACE("Send local HL7 msg to "_dir_"\"_fileName_fileExt)
		s stream=##class(%GlobalCharacterStream).%New()
		;s tSC=pRequest.HL7.OutputToOldStream(stream)
		s tSC=NewHL7.OutputToOldStream(stream)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
		s tSC=..Adapter.PutStream(fileName_fileExt,stream)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
	}
	;$$$TRACE("End of DocToDPI : "_..FilePathBLOB_fileName)
	Set file=##class(%File).%New(..FilePathBLOB_fileName_".ok")
	d file.Open("WSN")
	d file.WriteLine("")
	d file.Close()
				
end
	s $zt=""
	Quit tSC
exception
	s tZE=$ze
	
	s tSC=$$$EnsError("General Error: "_tZE)
	g end
}

Method WriteToFile2(pRequest As CHUBXL.MSG.HL7EcareFile, Output pResponse As Ens.Response) As %Status
{
	
	s $zt="exception",tSC=$$$OK

	// Set File Sequence
	i '$d(^CHUBXL.FileSeq(..%ConfigName)) s ^CHUBXL.FileSeq(..%ConfigName)=0
	S ^CHUBXL.FileSeq(..%ConfigName)=^CHUBXL.FileSeq(..%ConfigName) + 1

	/// Get fields from HL7 message
	s ndem=pRequest.HL7.GetValueAt("MSH:MessageControlID",,.tSC)
	;s ndosm=pRequest.HL7.FindSegmentValues("PID:2.1") 
	s ndosm=pRequest.HL7.GetValueAt("PIDgrpgrp().PIDgrp.PID:PatientIdentifierList()",,.tSC)
	$$$TRACE("ndosm 1 : "_pRequest.HL7.RawContent)
	i $tr(ndosm," ")="" s ndosm=pRequest.HL7.FindSegmentValues("PID:3.1") 
	i $tr(ndosm," ")="" s ndosm=pRequest.HL7.FindSegmentValues("PID:2.1") 
	$$$TRACE("ndosm 2 : "_ndosm)
	s NHop=##class(CHUBXL.DT.Utils).getNHop(ndosm)
	$$$TRACE("NHOP : "_NHop)
	// Set fileName
	s fileName=""
	;s fileName=fileName_..SystemSource_"_"
	s fileName=fileName_"Glims_"
	s fileName=fileName_..SystemDestination_"_"
	s fileName=fileName_$tr($j(^CHUBXL.FileSeq(..%ConfigName),7)," ","0")_"_"
	s fileName=fileName_pRequest.%Id()_"_"
	s fileName=fileName_ndosm_"_"
	s fileName=fileName_ndem_"_"
	s fileName=fileName_pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus",,.tSC)
	$$$TRACE("File Name 1 : "_pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationValue()",,.tSC))
	s FilePDF=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationValue()",,.tSC)
	$$$TRACE("File Name 2 : "_$p(FilePDF,"\",1,$l(FilePDF,"\")-1)_"\"_fileName)
	s FilePDF=pRequest.HL7.SetValueAt($p(FilePDF,"\",1,$l(FilePDF,"\")-1)_"\"_fileName_".PDF","PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationValue()") 
	s NewHL7=##class(EnsLib.HL7.Message).%New(),NewHL7.DocType="2.4:ORU_R01"

	/// REMOTE PROCESSING (on QUADRAT Server)
	if ($l(..FilePathRemoteXML)>0) {
		//-- RTF file --
		s dir=..FilePathRemoteXML
		s ..Adapter.FilePath=dir
		s dir=..Adapter.FilePath
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s fileExt=".PDF"
		$$$TRACE("Send Remote RTF msg to "_dir_"\"_fileName_fileExt)
		d pRequest.File.Rewind()
		s tSC=..Adapter.PutStream(fileName_fileExt,pRequest.File,.len)
		d pRequest.File.Rewind()
		$$$TRACE("Send : "_pRequest.File.Read())
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
		
		//-- HL7 file --
		s dir=..FilePathRemoteXML
		s ..Adapter.FilePath=dir
		s dir=..Adapter.FilePath
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s fileExt=".HL7"
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
		s tSC=..Adapter.PutStream(fileName_fileExt,pRequest.HL7)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
	}
		
	/// LOCAL PROCESSING (on ENSEMBLE Server)
	if ($l(..FilePathLocalXML)>0) {
		s dir=..FilePathLocalXML_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		s ..Adapter.FilePath=dir
		s dir=..Adapter.FilePath
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s fileExt=".PDF"
		$$$TRACE("Send local RTF msg to "_dir_"\"_fileName_fileExt)
		d pRequest.File.Rewind()
		s tSC=..Adapter.PutStream(fileName_fileExt,pRequest.File,.len)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	

		//-- HL7 file --
		s dir=..FilePathLocalXML_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s ..Adapter.FilePath=dir
		s fileExt=".HL7"
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
		s tSC=..Adapter.PutStream(fileName_fileExt,pRequest.HL7)
		q:('tSC) $$$ERROR("Error writing to file "_dir_"\"_fileName_fileExt)	
	}
	$$$TRACE("End of DocToDPI : "_..FilePathBLOB_fileName)
	Set file=##class(%File).%New(..FilePathBLOB_fileName_".ok")
	d file.Open("WSN")
	d file.WriteLine("")
	d file.Close()
				
end
	s $zt=""
	Quit tSC
exception
	s tZE=$ze
	
	s tSC=$$$EnsError("General Error: "_tZE)
	g end
}

Method RetrieveBDoc(OBR, NHop)
{
	s TagAgfa=$p($p(OBR,"|",5),"^",2)
	$$$TRACE("TagAgfa : *"_TagAgfa_"*")
	$$$TRACE("OBR : *"_OBR_"*")
	$$$TRACE("NHop : *"_NHop_"*")
	i $tr(TagAgfa," ")'="" {
	  s TagAgfa=$zstrip(TagAgfa,"<W")
	  s rec=$g(^CHUBXL.ConvArboBDoc(NHop,TagAgfa))
	  s NewRec="^"_TagAgfa_"^"_$tr($p(rec,"~",1,3),"~","^")
	  $$$TRACE("TagAgfa rec : *"_rec_"*")
	  $$$TRACE("TagAgfa NewRec : *"_"^"_TagAgfa_"^"_$tr($p(rec,"~",1,3),"~","^")_"*")
	  s $p(OBR,"|",5)=NewRec
	  s $p(OBR,"|",19)=$p(rec,"~",4)
	  s $p(OBR,"|",20)=$p(rec,"~",5)
	}
	Quit OBR
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="CHUBXL.MSG.HL7DiamicFile"> 
		<Method>WriteToFile0</Method>
	</MapItem>
	<MapItem MessageType="CHUBXL.MSG.HL7DPIFile"> 
		<Method>WriteToFile</Method>
	</MapItem>
	<MapItem MessageType="CHUBXL.MSG.HL7EcareFile"> 
		<Method>WriteToFile1</Method>
	</MapItem>
	<MapItem MessageType="CHUBXL.MSG.HL7GlimsFile"> 
		<Method>WriteToFile2</Method>
	</MapItem>
	<MapItem MessageType="CHUBXL.MSG.HL7KineFile"> 
		<Method>WriteToFile2</Method>
	</MapItem>
</MapItems>
}

}
