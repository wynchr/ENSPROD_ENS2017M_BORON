Class CHUBXL.BS.NEW.GlimsPdfFcpIn Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BS GLIMS PDF Fcp

VERSION
-------
CWY	24/07/2018	Initial Version
CWY	30/07/2018	Add comment

MESSAGES
--------
CHUBXL.MSG.HL7GlimsFile
CHUBXL.MSG.ResultMv

PROCESS
-------
	=> GlimsAllLabRouting
	
OPTIMISATION
------------
- A réécrire

SOURCE
------
CHUBXL.BS.GlimsFile

--------------------------------------------------------------------------------------------------------------------------------
*/
Property FileArchivePath As %String(TRUNCATE = 1) [ InitialExpression = "D:\DATA\ENS\DATA\GLIMS\archive" ];

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter ADAPTER = "EnsLib.File.InboundAdapter";

Parameter SETTINGS = "AddToMetric,FileArchivePath";

Method OnProcessInput(pInput As %RegisteredObject, pOutput As %RegisteredObject) As %Status
{
	s tSC=$$$OK	
	
	//------------------------------
	// Set ArchivePath
	//------------------------------
	
	$$$TRACE("FileName : "_pInput.Attributes("Filename"))
	If ##class(%Library.File).Exists(pInput.Attributes("Filename")) {
	   $$$TRACE("HL7 file exist and hang : "_pInput.Attributes("Filename"))
	   H 45
	}
	s Instance=$p($SYSTEM,":",2)
	i ..FileArchivePath '= "" {
		s dir=..FileArchivePath_"\"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")
		$$$TRACE("Set ArchivePath to : "_dir)
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s ..Adapter.ArchivePath=dir
	}

	s FileName = $p($p(pInput.Attributes("Filename"),"\",$l(pInput.Attributes("Filename"),"\")),".",1)
	$$$TRACE("FileName : "_FileName_"  "_Instance)
	s Filename2=$p($p(FileName,".",1),"_",2),suf=""
	$$$TRACE("FileName2 : "_Filename2)
	i Filename2["ARL" s suf="ARL",Filename2=$p(Filename2,"ARL",1)
	s %CRLF=$c(13)_$c(10)
	
	//------------------------------
	// Get & Fill HL7 message
	//------------------------------
	
	s %rsDB1 = ##class(%Library.ResultSet).%New()
    s %qDB1 = "select distinct a.ORD_INTERNALID as NUM_LABO, "
    s %qDB1 = %qDB1_"F.ENCT_EXTERNALID as PASSAGE_VISITE, "
    s %qDB1 = %qDB1_"K.CRSP_INTERNALID as PRESCRIPTEUR, "
    s %qDB1 = %qDB1_"K.CRSP_NAME as NOM_PRES, "
    s %qDB1 = %qDB1_"to_date('01/01/2000','dd/mm/yyyy')+g.RSLT_OBJECTTIME-2451546 as DATE_PRELEVEMENT "
    s %qDB1 = %qDB1_"from CHUBXL_DB_GLIMS.order a "
    s %qDB1 = %qDB1_"inner join CHUBXL_DB_GLIMS.ENCOUNTER f on F.ENCT_ID = A.ORD_ENCOUNTER "
    s %qDB1 = %qDB1_"inner join CHUBXL_DB_GLIMS.RESULT g on G.RSLT_ORDER = A.ORD_ID "
    s %qDB1 = %qDB1_"inner join CHUBXL_DB_GLIMS.CORRESPONDENT k on K.CRSP_ID = A.ORD_ISSUER "
    s %qDB1 = %qDB1_"where a.u##ord_internalid='"_Filename2_"' and "
    s %qDB1 = %qDB1_"to_date('01/01/2000','dd/mm/yyyy')+g.RSLT_VALIDATIONTIME-2451546 between (sysdate - 3500) and sysdate"
    $$$TRACE(%qDB1)
    s DtePrel="",Passage="",Prescripteur="",NomPres="",TypPass=""
    s status=%rsDB1.Prepare(%qDB1)
    s status=%rsDB1.Execute()
    $$$TRACE("Statut : "_status)
    While (%rsDB1.Next()) {
	    $$$TRACE("**************")
	    s DtePrel=%rsDB1.Data("DATE_PRELEVEMENT")
	    s Passage=%rsDB1.Data("PASSAGE_VISITE")
	    s Prescripteur=$e(%rsDB1.Data("PRESCRIPTEUR"),1,8)
	    s NomPres=%rsDB1.Data("NOM_PRES")
	    s TypPass="I"
	    i $l(Passage)>9 s TypPass="O"
    }	
	s DtePrel=$e($tr($tr($tr($g(DtePrel)," "),":"),"-"),1,12),hop="",nHop=26,nDir="\\spica\a$\Integrations-Br\DocumentsLABO\"
	s DirTo="G:\PREP\Glimsabru\in\Bru\"
	f ii=$l(NomPres):-1:1 q:$e(NomPres,ii)=" "
	s NomPres=Prescripteur_"^"_$e(NomPres,1,ii-1)_"^"_$e(NomPres,ii+1,$l(NomPres))
	i $e($p($p(FileName,".",1),"_",1),1)=8 s hop="H",nHop=27,nDir="\\atair\b$\Integrations\DocumentsLABO\",DirTo="G:\PREP\Glimsabru\in\Hud\"
	i Instance="ENS2017M" s x=##class(%Library.File).CopyFile(pInput.Attributes("Filename"),DirTo_FileName_".PDF",1) $$$TRACE("OK : "_x_" "_pInput.Attributes("Filename")_DirTo_FileName_".PDF")
	s %rsDB2 = ##class(%Library.ResultSet).%New()
    s %qDB2 = "select * from CHUBXL_DB_WISH.PATIENTS"_hop_" where pbmrn="_$p($p(FileName,".",1),"_",1)
    s status=%rsDB2.Prepare(%qDB2)
    s status=%rsDB2.Execute()
    While (%rsDB2.Next()) {
    	s ^CHUBXL.FileSeq("GlimsAbrumet")=$g(^CHUBXL.FileSeq("GlimsAbrumet"))+1
	   	s NomPre=%rsDB2.Data("PBNAME")
		s NomPat=$ZSTRIP($$SPN($p(NomPre,",",1)),"*W")
		s PrePat=$ZSTRIP($$SPN($p(NomPre,",",2)),"*W")
	   		
		s %LineOut="MSH|^~\&|GLIMS|GLIMS|"_$g(nHop)_"|BDOC|"_$zd($h,8)_$tr($e($zt($p($h,",",2),3),1,8),":")_"||ORU^R01|"_$tr($j(^CHUBXL.FileSeq("GlimsAbrumet"),8)," ","0")_"|P|2.4|||||BE|8859/1|FR"_%CRLF
		s %LineOut=%LineOut_"PID||"_$tr($j(%rsDB2.Data("PBMRN"),9)," ","0")_"|||"_NomPat_"^"_PrePat_"||"_%rsDB2.Data("PBDOB")_"|"_%rsDB2.Data("PBSEX")_"|||"_$$SPN(%rsDB2.Data("PBADDR"))_"^^"_$g(%sqlpatcom)_"^^"_$e(%rsDB2.Data("PBZIP"),1,4)_"^"_$$SPN(%rsDB2.Data("CPAY"))_"||"_$$SPN(%rsDB2.Data("PBPHON"))_$$SPN($g(%sqlNOGSM))_$$SPN($g(%sqlEMAIL))_"||"_$$SPN(%rsDB2.Data("CLNG"))_"|"_$$SPN(%rsDB2.Data("PBMARI"))_"|||"_$$SPN(%rsDB2.Data("PBNPI"))_"|"_$$SPN(%rsDB2.Data("NIDE"))_"|||"_$$SPN(%rsDB2.Data("LNAI"))_"|||||"_$$SPN(%rsDB2.Data("PBNATN"))_"|"_$$SPN(%rsDB2.Data("DETC4"))_"|"_$$SPN(%rsDB2.Data("PBDETH"))_"|||"_$$SPN(%rsDB2.Data("PBRGDT"))_"00||"_%CRLF
		s %LineOut=%LineOut_"PV1||"_TypPass_"||||||^^|^^|||||^^|||||"_Passage_"||||||||||||||||||||||||||"_%CRLF
		s %LineOut=%LineOut_"OBR||LABO|"_Filename2_$g(suf)_"|^LABRES^Laboratoire^Acte technique^Acte technique|||"_DtePrel_"|||||||||"_NomPres_"||1|LAB||305109~LABORATOIRES^ACTES TECHNIQUES|"_DtePrel_"|||F|||||||12985429^GULBIS^BEATRICE|"_%CRLF
		s %LineOut=%LineOut_"OBX|1|RP|||"_nDir_FileName_".PDF||||||F|||"_DtePrel_"|LAB|12985468^GULBIS^BEATRICE"_%CRLF

    	;s FileName = "D:\dataTest\GLIMS\out\DPI\HUD\BDoc-Abru-"_FileName_"-"_$tr($j(^CHUBXL.FileSeq("RepriseWish"),8)," ","0")_".hl7"
		
    	;If ##class(%Library.File).Exists(FileName) {
	    ;   d ##class(%Library.File).Delete(FileName)
    	;}
		;s %OutputFile = ##class(%File).%New(FileName)
			
		;s FileName=$p(FileName,".",1)_".PDF"
		;s %OutputFile = ##class(%File).%New(FileName)
						
		s HL7File=##class(CHUBXL.MSG.HL7GlimsFile).%New()
		s HL7File.HL7 = ##class(EnsLib.HL7.Message).ImportFromString(%LineOut)
	
		d HL7File.HL7.DocTypeSet("2.4:ORU_R01")
		Set stream=##class(%FileCharacterStream).%New()
		Set stream.Filename=pInput.Attributes("Filename")
		d HL7File.File.CopyFrom(stream)
		d HL7File.%Save()
		
		s MvFile=##class(CHUBXL.MSG.ResultMv).%New()
		s MvFile.HospitalFid=nHop
		s MvFile.PatientCode=$tr($j(%rsDB2.Data("PBMRN"),9)," ","0")
		s MvFile.PassageNr=$s($l(Passage)>9:Passage,1:"")
		s MvFile.NumeroAdm=$s($l(Passage)'>9:Passage,1:"")
		s MvFile.NumeroDemande=Filename2_$g(suf)
		s MvFile.DocDate=$e(DtePrel,7,8)_"/"_$e(DtePrel,5,6)_"/"_$e(DtePrel,1,4)
		s MvFile.PrestationDate=$e(DtePrel,7,8)_"/"_$e(DtePrel,5,6)_"/"_$e(DtePrel,1,4)
		s MvFile.MedecinPresc=$p(NomPres,"^",1)
		s MvFile.ServPresc=""
		s MvFile.MedecinPresta=$g(Prescripteur)
		s MvFile.ServPresta=""
		s MvFile.CigesNumber=""
		s MvFile.Ciges=""
		s MvFile.SystemeSource="GLIMS"
		s MvFile.DocUniqueId=$zd($h,8)_$tr($e($zt($p($h,",",2),3),1,8),":")
		s MvFile.Batch="IFGLIMSLABOENS"
		s MvFile.DocTemplate="GLIMSLABOMODELE"	
		s MvFile.TreeFid="Laboratoire"
		d MvFile.Blob.CopyFrom(stream)
		d MvFile.%Save()
	
		k %OutputFile,%LineOut
		
	//------------------------------
	// Route message
	//------------------------------		
		
		s tSC=..SendRequestAsync("GlimsAllLabRouting",MvFile)
		s tSC=..SendRequestAsync("GlimsAllLabRouting",HL7File)

    }

	//------------------------------
	// Trap Routing Error
	//------------------------------    
    
    if ('tSC) {
        s message="FileCopy : ERROR - Get from "_..%ConfigName_"("_pInput.Attributes("Filename")_" at "_$zdt($h)_")"
        d ..SendAlert(##class(Ens.AlertRequest).%New($LB(..%ConfigName_" : "_pInput.Attributes("Filename")_" at "_$zdt($h)_")",message)))   
    }

	Quit tSC

SPN(SPE)
    F II=$L(SPE):-1:1 S LET=$E(SPE,II) Q:LET'=" " 
    S SPE=$E(SPE,1,II) 
    QUIT SPE
}

}
