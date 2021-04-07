Class CHUBXL.BS.NEW.MososPdfFcpIn Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BS MOSOS PDF Fcp

VERSION
-------
DAM	19/03/2021	Initial Version

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
	s Filename2=$p($p(FileName,".",1),"_",2)
	$$$TRACE("FileName2 : "_Filename2)
	s %CRLF=$c(13)_$c(10)
	
	//------------------------------
	// Get & Fill HL7 message
	//------------------------------
	
    s DtePrel=$p($p(FileName,".",1),"_",3),Passage="",Prescripteur="",NomPres="",TypPass=""
    s NoExam=$p($p(FileName,".",1),"_",2)
	s DtePrel=$e($tr($tr($tr($g(DtePrel)," "),":"),"-"),1,10),hop="",nHop=26,nDir="\\spica\a$\Integrations-Br\DocumentsLABO\"
	f ii=$l(NomPres):-1:1 q:$e(NomPres,ii)=" "
	s NomPres=Prescripteur_"^"_$e(NomPres,1,ii-1)_"^"_$e(NomPres,ii+1,$l(NomPres))
	i $e($p($p(FileName,".",1),"_",1),1)=8 s nHop=27
	s nDir="\\atair\b$\Integrations\DocumentsLABO\",DirTo="G:\PREP\Glimsabru\in\Hud\"
	i Instance="ENS2017M" s x=##class(%Library.File).CopyFile(pInput.Attributes("Filename"),DirTo_FileName_".PDF",1) $$$TRACE("OK : "_x_" "_pInput.Attributes("Filename")_DirTo_FileName_".PDF")

	s %rsDB1 = ##class(%Library.ResultSet).%New()
    s %qDB1 = "select * from CHUBXL_DB_WISH.HOS h, CHUBXL_DB_WISH.passage p where h.CBMRN=p.VIMRN and p.VIMRN='200812451'"
    $$$TRACE(%qDB1)
    s status=%rsDB1.Prepare(%qDB1)
    s status=%rsDB1.Execute()
    $$$TRACE("Statut : "_status)
    While (%rsDB1.Next()) {
	    $$$TRACE("**************")
	    s TypPass=%rsDB1.Data("CBTYPE") ;%rsDB1.Data("CBADDT") %rsDB1.Data("CBDHDT")
	    i TypPass="O",DtePrel=$e(%rsDB1.Data("CBADDT"),1,8) {
		  s Passage=%rsDB1.Data("VINSEJ")_$tr($j(%rsDB1.Data("VIPASS"),3)," ","0")
	    }
	    i TypPass="I",DtePrel'<$e(%rsDB1.Data("CBADDT"),1,8),DtePrel'>$e(%rsDB1.Data("CBDHDT"),1,8) {
		  s Passage=%rsDB1.Data("NSEJ")
	    }
    }	

	s %rsDB2 = ##class(%Library.ResultSet).%New()
    s %qDB2 = "select * from CHUBXL_DB_WISH.PATIENTS"_hop_" where pbmrn="_$p($p(FileName,".",1),"_",1)
    s status=%rsDB2.Prepare(%qDB2)
    s status=%rsDB2.Execute()
    While (%rsDB2.Next()) {
    	s ^CHUBXL.FileSeq("Mosos")=$g(^CHUBXL.FileSeq("Mosos"))+1
	   	s NomPre=%rsDB2.Data("PBNAME")
		s NomPat=$ZSTRIP($$SPN($p(NomPre,",",1)),"*W")
		s PrePat=$ZSTRIP($$SPN($p(NomPre,",",2)),"*W")
		
		;MSH|^~\&|Mosos|Mosos|UVC|Brugman|20201015141340||ORU^R01|20101514134000005129|P|2.3|||AL|NE
		;PID|1||200466799||LAADIM^FATNA||19920624
		;OBR|1||269990004788900005129^Mosos|26^notes^Mosos|||20200529|20200529||||||||||||||20201015|||F||||||||||
		;OBX|1|RP|26^notes^Mosos||D:\E\Mosos\E\Mosos\E\Verzonden\E\20101514134000005129.PDF||||||F|||20201015
	   		
		s %LineOut="MSH|^~\&|Mosos|Mosos|"_$g(nHop)_"|BDOC|"_$zd($h,8)_$tr($e($zt($p($h,",",2),3),1,8),":")_"||ORU^R01|"_NoExam_"|P|2.4|||||BE|8859/1|FR"_%CRLF
		s %LineOut=%LineOut_"PID||"_$tr($j(%rsDB2.Data("PBMRN"),9)," ","0")_"|||"_NomPat_"^"_PrePat_"||"_%rsDB2.Data("PBDOB")_"|"_%rsDB2.Data("PBSEX")_"|||"_$$SPN(%rsDB2.Data("PBADDR"))_"^^"_$g(%sqlpatcom)_"^^"_$e(%rsDB2.Data("PBZIP"),1,4)_"^"_$$SPN(%rsDB2.Data("CPAY"))_"||"_$$SPN(%rsDB2.Data("PBPHON"))_$$SPN($g(%sqlNOGSM))_$$SPN($g(%sqlEMAIL))_"||"_$$SPN(%rsDB2.Data("CLNG"))_"|"_$$SPN(%rsDB2.Data("PBMARI"))_"|||"_$$SPN(%rsDB2.Data("PBNPI"))_"|"_$$SPN(%rsDB2.Data("NIDE"))_"|||"_$$SPN(%rsDB2.Data("LNAI"))_"|||||"_$$SPN(%rsDB2.Data("PBNATN"))_"|"_$$SPN(%rsDB2.Data("DETC4"))_"|"_$$SPN(%rsDB2.Data("PBDETH"))_"|||"_$$SPN(%rsDB2.Data("PBRGDT"))_"00||"_%CRLF
		s %LineOut=%LineOut_"PV1||"_TypPass_"||||||^^|^^|||||^^|||||"_Passage_"||||||||||||||||||||||||||"_%CRLF
		s %LineOut=%LineOut_"OBR|1||"_NoExam_"^Mosos|26^notes^Mosos|||"_DtePrel_"|||||||||"_NomPres_"||||||"_DtePrel_"|||F||||||||"_%CRLF
		s %LineOut=%LineOut_"OBX|1|RP|26^notes^Mosos||"_nDir_FileName_".PDF||||||F|||"_DtePrel_"||"_%CRLF
						
		s HL7File=##class(CHUBXL.MSG.HL7DPIFile).%New()
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
		s MvFile.NumeroDemande=NoExam
		s MvFile.DocDate=$e(DtePrel,7,8)_"/"_$e(DtePrel,5,6)_"/"_$e(DtePrel,1,4)
		s MvFile.PrestationDate=$e(DtePrel,7,8)_"/"_$e(DtePrel,5,6)_"/"_$e(DtePrel,1,4)
		s MvFile.MedecinPresc=$p(NomPres,"^",1)
		s MvFile.ServPresc=""
		s MvFile.MedecinPresta=$g(Prescripteur)
		s MvFile.ServPresta=""
		s MvFile.CigesNumber=""
		s MvFile.Ciges=""
		s MvFile.SystemeSource="MOSOS"
		s MvFile.DocUniqueId=NoExam
		s MvFile.Batch="MOSOS"
		s MvFile.DocTemplate="MOSOS"	
		s MvFile.TreeFid="4^rapportaccouchement.issue"
		d MvFile.Blob.CopyFrom(stream)
		d MvFile.%Save()
	
		k %OutputFile,%LineOut
		
	//------------------------------
	// Route message
	//------------------------------		
		
		s tSC=..SendRequestAsync("MososBruDocRouting",MvFile)
		s tSC=..SendRequestAsync("MososBruDocRouting",HL7File)

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
