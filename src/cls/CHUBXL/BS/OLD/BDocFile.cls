Class CHUBXL.BS.OLD.BDocFile Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

Property FileArchivePath As %String(TRUNCATE = 1) [ InitialExpression = "G:\dataPROD\BDoc\archive\HUD" ];

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
		
	// Get OK File
	
	$$$TRACE("FileName: "_pInput.Attributes("Filename"))
	$$$TRACE("FileSpec: "_..Adapter.FileSpec)
		
	s FileName = ..Adapter.FilePath_"\"_$p($p(pInput.Attributes("Filename"),"\",7),".hl7",1)
	s FileName = ..Adapter.FilePath_$p($p(pInput.Attributes("Filename"),"\",7),".",1)
	s FileName = ..Adapter.FilePath_$p($p(pInput.Attributes("Filename"),"\",$l(pInput.Attributes("Filename"),"\")),".",1)
	
	$$$TRACE("FileName Prefix : "_FileName)
	
	// Get HL7 data
	
	If '##class(%Library.File).Exists(FileName_".hl7") {
		$$$TRACE("Warning - HL7 file doesn't exist : "_FileName_".hl7")
		Quit tSC
	}
	
	s NewFile=##class(%Library.File).%New(FileName_".hl7")
	$$$TRACE("Taille : "_NewFile.Size)
	d NewFile.Rewind()
	d NewFile.Open()
	
	s msgHL7="",msgZRW="",EndHL7=0,message=""
	while ('NewFile.AtEnd) {
		s NewLine=NewFile.ReadLine()
		i $e(NewLine,1,3)="ZRW" s EndHL7=1,NewLine=$p(NewLine,"|",3)
		i 'EndHL7 s msgHL7=msgHL7_NewLine_$c(13)
		i EndHL7 s message=message_$system.Encryption.Base64Decode(NewLine)
	}
	d NewFile.Close()
	
	s message=$zcvt(message,"I","UTF8")
	;$$$TRACE("Message HL7 : "_msgHL7)
	;$$$TRACE("Message ZRW : "_message)
	
	;s r=rawMsg.toto
	
	s HL7File=##class(CHUBXL.MSG.HL7BDocFile).%New()
	s HL7File.HL7 = ##class(EnsLib.HL7.Message).ImportFromString(msgHL7,.tSC)
	;s message=$system.Encryption.Base64Decode($p(msgZRW,"|",3))
	s TreeFid=$p(message,"</IDTREE>",1)
	s TreeFid=$p(TreeFid,">",$l(TreeFid,">"))
	s TreeSpec=$p(message,"spec=",2)
	s TreeSpec=$p(TreeSpec,"""",2),TreeFid1="%%%%%%%%%%%%%%%%%%"
	$$$TRACE("**** TreeSpec : "_TreeSpec)
	$$$TRACE("**** TreeFid : "_TreeFid1)
	
	d HL7File.HL7.DocTypeSet("2.4:ORU_R01")
	
	$$$TRACE("HL7 Name : "_HL7File.HL7.Name)
	$$$TRACE("HL7 Identifier : "_HL7File.HL7.Identifier)
	$$$TRACE("HL7 Name : "_HL7File.HL7.Name)
	$$$TRACE("HL7 TypeVersion : "_HL7File.HL7.TypeVersion)
		
	$$$TRACE("HL7 HospitalService : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PV1grp.PV1:HospitalService",,.tSC)_" tSC:"_tSC)
	$$$TRACE("HL7 ControlID : "_HL7File.HL7.GetValueAt("MSH:MessageControlID",,.tSC)_" tSC:"_tSC)	
	$$$TRACE("HL7 PIDgrpgrp(1).PIDgrp.PID:PatientID.ID : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PID:PatientID.ID",,.tSC)_" tSC:"_tSC)
	$$$TRACE("HL7 ObservationValue : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationValue",,.tSC)_" tSC:"_tSC)
	;$$$TRACE("HL7 message : "_message)
	;$$$TRACE("Longueur : "_$l(HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationValue")))
	;$$$TRACE("Longueur : "_message)

	Set ResultStatus = "", ResultStatus2 = ""
	Set ResultStatus = HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus",,.tSC)
	Set ResultStatus2 = HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBR:ResultStatus",,.tSC)

	$$$TRACE("HL7 ResultStatus (1): "_ResultStatus)
	$$$TRACE("HL7 ResultStatus (2): "_ResultStatus2)
	$$$TRACE("HL7 ResultStatus (3): ")
	;$$$TRACE("HL7 ResultStatus (4): "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationResultStatus",,.tSC))
	;$$$TRACE("HL7 ResultStatus (5): "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationResultStatus",,.tSC))

	// Send Msg to BP  **** $system.Encryption.Base64Decode(msg) *****
	
	s TreeNote=HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:UniversalServiceIdentifier",,.tSC)
	s DateRep=HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:ObservationDateTime",,.tSC)
	s DateRep=$e(DateRep,7,8)_"/"_$e(DateRep,5,6)_"/"_$e(DateRep,1,4)_" à "_$e(DateRep,9,10)_":"_$e(DateRep,11,12)_":"_$e(DateRep,13,14)

	i (($tr(TreeFid," ")="") ! ($tr(TreeSpec," ")="")) {
	  $$$TRACE("Erreur !!!!!!!!!!!!!!!!!!")
	  $$$TRACE("NoDos : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PID:PatientIdentifierList().ID",,.tSC))
	  d ..SendEmail(+HL7File.HL7.GetValueAt("MSH:SendingFacility.namespaceID",,.tSC),HL7File.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PID:PatientIdentifierList().ID",,.tSC),HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:FillerOrderNumber.entityidentifier",,.tSC),TreeFid,TreeSpec,$tr(HL7File.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PID:PatientName()",,.tSC),"^",","),TreeNote,DateRep)
	}
	i ($tr(TreeFid," ")'=""),($tr(TreeSpec," ")'="") {
	  s TreeFid1=$g(^CHUBXL.ConvBDocMV(TreeFid,TreeSpec)) $$$TRACE("$$$$ "_TreeFid_" $$$$ "_TreeFid1_" $$$$ "_TreeSpec_" $$$$")
	  i '$d(^CHUBXL.ConvBDocMV(TreeFid,TreeSpec)){
		d ..SendEmail(+HL7File.HL7.GetValueAt("MSH:SendingFacility.namespaceID",,.tSC),HL7File.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PID:PatientIdentifierList().ID",,.tSC),HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:FillerOrderNumber.entityidentifier",,.tSC),TreeFid,TreeSpec,$tr(HL7File.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PID:PatientName()",,.tSC),"^",","),TreeNote,DateRep)
	  }
	}

	i $tr(TreeFid1," ")="" s TreeFid1=TreeFid
	$$$TRACE("Envoi vers BDOcRouting")
	$$$TRACE("**** TreeFid : *"_TreeFid_"*")
	$$$TRACE("**** TreeFid1 : "_TreeFid1)
	$$$TRACE("**** TreeSpec : "_TreeSpec)
	s tSC1=HL7File.HL7.SetValueAt(TreeFid1,"PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationIdentifier.identifierST")

	$$$TRACE("**** Statut : "_tSC1)
	s FileNameOut=HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationValue()",,.tSC)
	$$$TRACE("FileNameOut 0 : "_FileNameOut)
	s FileNameOut=$p(FileNameOut,"\",$l(FileNameOut,"\"))
	$$$TRACE("FileNameOut 1 : "_FileNameOut)
	s tSC1=HL7File.HL7.SetValueAt(FileNameOut,"PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationValue()")
	Set stream=##class(%FileCharacterStream).%New()
	Set stream.Filename=FileName_".PDF"
	d HL7File.File.CopyFrom(stream)
	d HL7File.%Save()
	$$$TRACE("ID:"_HL7File.%Id())
	
	s tSC=..SendRequestAsync("BdocAllDocRouting",HL7File)	
	
	k HL7File ; Close Object
		
	// Add move file $$$$
	
	s Ext="hl7"
	s From=FileName_"."_Ext
	s To=..Adapter.ArchivePath_$p(FileName,"\",$l(FileName,"\"))_"."_Ext
	d ##class(%Library.File).CopyFile(From,To)
	d ##class(%Library.File).Delete(From)
	$$$TRACE("Archive "_Ext_" File To:"_To)
	
	s Ext="PDF"
	s From=FileName_"."_Ext
	s To=..Adapter.ArchivePath_$p(FileName,"\",$l(FileName,"\"))_"."_Ext
	d ##class(%Library.File).CopyFile(From,To)
	d ##class(%Library.File).Delete(From)
	$$$TRACE("Archive "_Ext_" File To:"_To)

	if ('tSC) {
		s message="FileCopy BDoc : ERROR - Get from BDoc("_pInput.Attributes("Filename")_" at "_$zdt($h)_")"
		d ..SendAlert(##class(Ens.AlertRequest).%New($LB("BDoc IN : "_pInput.Attributes("Filename")_" at "_$zdt($h)_")",message)))	
		}
		
	Quit tSC
}

ClassMethod SendEmail(NomHop As %String, NoDos As %String, NoBDoc As %String, TreeFid As %String, TreeSpec As %String, NomPat As %String, TreeNote As %String, DateRep As %String)
{
	s CrLf=$c(10)_$c(13)
	s NomHop=$s(NomHop=26:"Brugmann",1:"HUDERF")
	s MsgSend="Bonjour,"_CrLf_CrLf
	s MsgSend=MsgSend_"Il y a un problème avec la correspondance pour un document de BDoc vers Medical Viewer."_CrLf
	s MsgSend=MsgSend_"Ceci concerne le patient dont le numéro administratif est "_NoDos_" et le nom est "_NomPat_". "_CrLf
	s MsgSend=MsgSend_"Le numéro du document BDoc est "_NoBDoc_"."_CrLf
	s MsgSend=MsgSend_"Le TreeFid est '"_TreeFid_"'. et la spécialité est '"_TreeSpec_"'"_CrLf
	s MsgSend=MsgSend_"La note concerné est '"_TreeNote_"'"_CrLf
	s MsgSend=MsgSend_"Dont la date est '"_DateRep_"'"_CrLf
	s MsgSend=MsgSend_"Merci de prendre les dispositions nécéssaires."_CrLf
	s MsgSend=MsgSend_"Cordialement."_CrLf_CrLf_CrLf
	s MsgSend=MsgSend_NomHop_"~"_NoDos_"~"_NomPat_"~"_NoBDoc_"~"_TreeFid_"~"_TreeSpec_"~"_TreeNote_"~"_DateRep_"~"_CrLf
	$$$TRACE("NomHop : "_NomHop)
	$$$TRACE("MsgSend : "_MsgSend)
	s tSC=##class(CHUBXL.DT.Utils).SendEmail("Pas de classification BDoc "_NomHop_" vers Medical Viewer",MsgSend,"quentin.baeyens@chu-brugmann.be")
	s tSC=##class(CHUBXL.DT.Utils).SendEmail("Pas de classification BDoc "_NomHop_" vers Medical Viewer",MsgSend,"youssef.elhathout@chu-brugmann.be")
	s tSC=##class(CHUBXL.DT.Utils).SendEmail("Pas de classification BDoc "_NomHop_" vers Medical Viewer",MsgSend,"jeremie.rossignon@chu-brugmann.be")
	;s tSC=##class(CHUBXL.DT.Utils).SendEmail("Pas de classification BDoc "_NomHop_" vers Medical Viewer",MsgSend,"sebastien.delaide@chu-brugmann.be")
	s tSC=##class(CHUBXL.DT.Utils).SendEmail("Pas de classification BDoc "_NomHop_" vers Medical Viewer",MsgSend,"dulio.ambrogetti@chu-brugmann.be")
	$$$TRACE("SendMail")
    Quit $$$OK
}

}
