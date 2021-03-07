/// <center><b><font size=+2>Interface Diamic pour le registre du cancer</font></b></center>
/// 																									<br>
/// <b><font size=+1>Parameters :</font></b>
/// <ul type=disc>
/// <li> DIR  : Directory for outputfile = G:\dataTEST\DIAMIC\RegistreCancer							</li>	<br>
/// <li> PROC : Procédure (CANCER,COL,SEIN,COLON)														</li>	<br>
/// <li> DDEB : date début format YYYYMMDD																</li>	<br>
/// <li> DFIN : date début format YYYYMMDD																</li>	<br>
/// <li> MODE : mode (T=TEST, P=PROD)																	</li>	<br>
/// <li> LOG  : create logfile ?																		</li>	<br>
/// </ul>
/// Exemple : d ##class(CHUBXL.BATCH.DiamicRegistreCancer).Start("DIR=","PROC=Col","DDEB=20170601","DFIN=20170605","MODE=T","LOG=0","TYP=0")
/// Exemple : d ##class(CHUBXL.BATCH.DiamicRegistreCancer).AllStartBatch("20180101","20180131","1")
///  																									<br>
/// <b><font size=+1>Version :</font></b>
///  																									<br>
/// 26-04-2013	Ambrogetti Dulio	Initial version														<br>
/// </body>
/// </html>
Class CHUBXL.BATCH.DiamicRegistreCancer Extends %RegisteredObject [ ClassType = "", ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
Interface Diamic pour le registre du cancer

VERSION
-------
DAM	25/07/2018	Initial Version

--------------------------------------------------------------------------------------------------------------------------------
*/
ClassMethod AllStartBatch(DDeb, DFin, Source) As %Status
{
	i (Source=0) ! (Source=2) {
	  d ##class(CHUBXL.BATCH.DiamicRegistreCancer).Start("DIR=","PROC=Col","DDEB="_DDeb,"DFIN="_DFin,"MODE=T","LOG=0","TYP=0")
	  d ##class(CHUBXL.BATCH.DiamicRegistreCancer).Start("DIR=","PROC=Sein","DDEB="_DDeb,"DFIN="_DFin,"MODE=T","LOG=0","TYP=0")
	  d ##class(CHUBXL.BATCH.DiamicRegistreCancer).Start("DIR=","PROC=Colon","DDEB="_DDeb,"DFIN="_DFin,"MODE=T","LOG=0","TYP=0")
	  d ##class(CHUBXL.BATCH.DiamicRegistreCancer).Start("DIR=","PROC=Cancer","DDEB="_DDeb,"DFIN="_DFin,"MODE=T","LOG=0","TYP=0")
	}
	i (Source=1) ! (Source=2) {
	  d ##class(CHUBXL.BATCH.DiamicRegistreCancer).Start("DIR=","PROC=Col","DDEB="_DDeb,"DFIN="_DFin,"MODE=T","LOG=0","TYP=1")
	  d ##class(CHUBXL.BATCH.DiamicRegistreCancer).Start("DIR=","PROC=Sein","DDEB="_DDeb,"DFIN="_DFin,"MODE=T","LOG=0","TYP=1")
	  d ##class(CHUBXL.BATCH.DiamicRegistreCancer).Start("DIR=","PROC=Colon","DDEB="_DDeb,"DFIN="_DFin,"MODE=T","LOG=0","TYP=1")
	  d ##class(CHUBXL.BATCH.DiamicRegistreCancer).Start("DIR=","PROC=Cancer","DDEB="_DDeb,"DFIN="_DFin,"MODE=T","LOG=0","TYP=1")
	}
}

/// START BATCH - Execute all entry points - Set for Scheduler
ClassMethod StartBatch() As %Status
{
	if $p($SYSTEM,":",2) = "ENSEMBLE2012PRE" {
		d ..Purge(2,1,"P")
		d ..StartCol()	
		d ..StartSein()
		d ..StartColon()	
		d ..StartCancer()	
	}
	Quit $$$OK
}

/// START - Frottis col
ClassMethod StartCol() As %Status
{
	d ..Start("DIR=","PROC=Col","DDEB=","DFIN=","MODE=T","LOG=0")
	Quit $$$OK
}

/// START - Sein
ClassMethod StartSein() As %Status
{
	d ..Start("DIR=","PROC=Sein","DDEB=","DFIN=","MODE=T","LOG=0")
	Quit $$$OK
}

/// START - Biopsie colon
ClassMethod StartColon() As %Status
{
	d ..Start("DIR=","PROC=Colon","DDEB=","DFIN=","MODE=T","LOG=0")
	Quit $$$OK
}

/// START - Cancer
ClassMethod StartCancer() As %Status
{
	d ..Start("DIR=","PROC=Cancer","DDEB=","DFIN=","MODE=T","LOG=0")
	Quit $$$OK
}

/// Start Process
ClassMethod Start(Arg1... As %List) As %Status
{
	Set $ZT = "Trap"
	Set tSC = $$$OK
	
	// Get parameters
	Write "Invocation has ", $GET(Arg1, 0), " element", $SELECT(($GET(Arg1, 0)=1):"", 1:"s"), !
 	For i = 1 : 1 : $GET(Arg1, 0) {
	 	If ($DATA(Arg1(i))>0) {
		 	Set Var = "%p"_$p($GET(Arg1(i)),"=",1)
		 	Set Val = $p($GET(Arg1(i)),"=",2)
		 	set @Var = Val
		 	Write Var_"="_Val_" "
		}
	}
    Write " ",!

	d ..InitProcess()

	// Specific Process
	k ^CHUBXL.DIAMICREC,^CHUBXL.DIAMICTMP,^CHUBXL.DIAMICINA,^CHUBXL.DIAMICHPVT,^CHUBXL.DIAMICHPV,^CHUBXL.DIAMICM1,^CHUBXL.DIAMICM2,^CHUBXL.DIAMICSAERCH,^CHUBXL.DIAMICSNOP
	i (%pPROC="Col") d ..ProcessCol()
 	i (%pPROC="Sein") d ..ProcessSein()
 	i (%pPROC="Colon") d ..ProcessColon()
 	i (%pPROC="Cancer") d ..ProcessCancer() 

	// EndProcess
 	d ..EndProcess()
	k ^CHUBXL.DIAMICREC,^CHUBXL.DIAMICTMP,^CHUBXL.DIAMICINA,^CHUBXL.DIAMICHPVT,^CHUBXL.DIAMICHPV,^CHUBXL.DIAMICM1,^CHUBXL.DIAMICM2,^CHUBXL.DIAMICSAERCH,^CHUBXL.DIAMICSNOP
 	w "Normal exit",!
Done
	s $ZT=""
	Quit $$$OK
Trap
	w "Trap Exit",!
	Set $ZT=""	
	s tZE=$ze
	w "Error : "_tZE
	Goto Done
}

/// Init Process
ClassMethod InitProcess() As %Status
{
	// Set Global Variable
	s LigTit="internal_patient_id;name;first_name;sex;date_of_birth;deceased;place_of_residence;country_of_residence;specimen_number;date_specimen_was_taken;requesting_hospital;INAMI Medecin;;diagnostic_procedure;organ;lesion;INAMI;HPV;"
 	s %g="""", %w=",", %cpt=0, %OpeUS="", %LineInT="", %LineOutT="", %CRLF=$c(13)_$c(10)
 
	// Test Parameters
  	i %pDIR="",%pTYP=0 {
	  	s %pDIR="G:\PROD\Diamic\RegistreCancer\"
	}		
  	i %pDIR="",%pTYP=1 {
	  	i %pPROC="Cancer" s suf="BCR_Cancer\"
	  	i %pPROC="Col" s suf="BCR_Cervix\"
	  	i %pPROC="Colon" s suf="BCR_Colon\"
	  	i %pPROC="Sein" s suf="BCR_Breast\"
	  	s %pDIR="\\brhd4dp\healthdata$\Fasttrack\71007760\"_suf
	  	;s %pDIR="D:\dataTEST\DIAMIC\RegistreCancer\"
	}		
	
 	i %pPROC=""  s %pPROC="Col"
	i %pDDEB=""  s %pDDEB=$tr($zd($h-%pNBJ-%pNBJ2+1,3),"-","")
 	i %pDFIN=""  s %pDFIN=$tr($zd($h-%pNBJ2,3),"-","")
  	i %pMODE=""  s %pMODE="T" 	
 	i %pLOG=""  s %pLOG=0

 	d ..SetGlobal()
  	d ..OpenLogFile()
	d ..OpenGLogFile()
 	
	s %zH1=$H, %zTS1=$P($H,",",2)
 	
 	i %pMODE = "T" {
	 	write "Process Started at "_$zdt($h,4),!
 		write "DIR  = "_%pDIR_" "
 		write "PROC = "_%pPROC_" "
 		write "DDEB = "_%pDDEB_" "
 		write "DFIN = "_%pDFIN_" "
 		write "MODE = "_%pMODE_" "
 	}
  	 
    s %LogLine="",Ext=".txt"
    i %pTYP=1 s Ext=".csv"
    s %LogLine=%LogLine_$zdt($h,4)_" "_%NameBase
    s %LogLine=%LogLine_" Start"
    s %LogLine=%LogLine_" FileName : "_%FileNameBase_Ext
 	s %LogLine=%LogLine_" DIR  = "_%pDIR
 	s %LogLine=%LogLine_" PROC = "_%pPROC
 	s %LogLine=%LogLine_" DDEB = "_%pDDEB
 	s %LogLine=%LogLine_" DFIN = "_%pDFIN
 	s %LogLine=%LogLine_" MODE = "_%pMODE
 	d ..WriteLogFile(%LogLine)
 	d ..WriteGlobalLogLine(%LogLine)
 		
    Quit $$$OK
}

/// EndProcess
ClassMethod EndProcess() As %Status
{
	s %zH2=$H, %zTS2=$P($H,",",2)
	i %pMODE = "T" {
		write !,"Process stopped at "_$zdt($h,4),!
		write "Execution time = "_$zt(%zTS2-%zTS1),!
		write "Number of line processed = "_%cpt,!
		write "Number of line skipped = "_%cptSkip,!
		write "--------------------------------------------",!
	}
	
	s %LogLine=""
    s %LogLine=%LogLine_$zdt($h,4)_" "_%NameBase
    s %LogLine=%LogLine_" STOP"
 	s %LogLine=%LogLine_" Execution time = "_$zt(%zTS2-%zTS1)
 	s %LogLine=%LogLine_" Number of line processed = "_%cpt
 	s %LogLine=%LogLine_" Number of line skipped = "_%cptSkip
 	d ..WriteLogFile(%LogLine)
 	d ..WriteGlobalLogLine(%LogLine) 	
 	
	s %LogLine=""
    s %LogLine=%LogLine_$zdt($h,4)_" "_%NameBase
    s %LogLine=%LogLine_" -----"
 	d ..WriteLogFile(%LogLine)
 	d ..WriteGlobalLogLine(%LogLine) 	
 	
 	s %Line = ""
 	s %Line = %Line_%pDIR_"~"
 	s %Line = %Line_%pPROC_"~"
 	s %Line = %Line_%pDDEB_"~"
 	s %Line = %Line_%pDFIN_"~"
 	s %Line = %Line_%pMODE_"~"
 
 	s $p(^CHUBXL.DIAMIC(2,%S1,0,"PAR"),"~",1)=%Line
 	s $p(^CHUBXL.DIAMIC(2,%S1,0,"SQL"),"~",1)=%qDB
	s $p(^CHUBXL.DIAMIC(2,%S1,0,"LOG"),"~",1)=$zdt(%zH1,4)	
 	s $p(^CHUBXL.DIAMIC(2,%S1,0,"LOG"),"~",2)=$zdt(%zH2,4)
 	s $p(^CHUBXL.DIAMIC(2,%S1,0,"LOG"),"~",3)=$zt(%zTS2-%zTS1)
 	s $p(^CHUBXL.DIAMIC(2,%S1,0,"LOG"),"~",4)=%cpt
 	s $p(^CHUBXL.DIAMIC(2,%S1,0,"LOG"),"~",5)=%cptSkip
 	
 	s ^CHUBXL.DIAMIC(2,%S1,1,"IN",0)=%LineInT
	s ^CHUBXL.DIAMIC(2,%S1,1,"OUT",0)=%LineOutT
 	
	s %LogLine="-------------------------------------------------------------------------------"
	d ..WriteLogFile(%LogLine)
	
	i $g(%OutputFile)'="" d ..CloseOutputFile()
	i $g(%OutputOPEFile)'="" d ..CloseOutputOPEFile()
 	i $g(%LogFile)'="" d ..CloseLogFile()
 	i $g(%GLogFile)'="" d ..CloseGLogFile()
 	
 	d ..SendEmail("dulo.ambrogetti@chu-brugmann.be",
					"BatchDiRHM - "_%NameBase_" created"
					,"Parameters : "_%Line_%CRLF_
					 "Output Directory : File://"_%pDIR_%CRLF
					 ,"","")
 	
 	Quit $$$OK
}

/// PROCESS Col
ClassMethod ProcessCol() As %Status
{
	d ..SqlCol()
 	s %cpt=0,%cptSkip=0
	While (%rsDB.Next()) {
		d ..SqlData()
		d ..PrepareCol()
 		s %cpt=%cpt+1
    }
	s %ndem="" f  s %ndem=$o(^CHUBXL.DIAMICREC(%ndem)) q:%ndem=""  d
	. d ..FormatFieldsCol()
	. d ..FormatLineCol()
 	. d ..WriteGlobalLine()

	d ..WriteOutputFile()     
	Quit $$$OK
}

/// PROCESS Sein
ClassMethod ProcessSein() As %Status
{
	d ..SqlSein()
 	s %cpt=0,%cptSkip=0
	While (%rsDB.Next()) {
		d ..SqlData()
		d ..PrepareSein()
 		s %cpt=%cpt+1
    }
	s %ndem="" f  s %ndem=$o(^CHUBXL.DIAMICREC(%ndem)) q:%ndem=""  d
	. d ..FormatFieldsSein()
	. d ..FormatLineSein()
 	. d ..WriteGlobalLine()

	d ..WriteOutputFile()     
	Quit $$$OK
}

ClassMethod WordConversion1(%FileName, texte) As %Status
{
	i texte.SizeGet()=0 Quit $$$OK
	s:%FileName'["11H07057" %word=##class(Activate.Word.Application).%New()
	s:%FileName'["11H07057" %doc=%word.Documents.Open(%FileName)
	s %FileNameTXT=$e(%FileName,1,$l(%FileName)-3)_"txt"
	d:%FileName'["11H07057" %doc.SaveAs(%FileNameTXT,7)
	d:%FileName'["11H07057" %word.ActiveDocument.Close()
	d:%FileName'["11H07057" %doc.%Close()
	d:%FileName'["11H07057" %word.Quit()
	s file=##class(%FileCharacterStream).%New(),%sqlExpression25=""
	s file.Filename=%FileNameTXT
	while ('file.AtEnd) {
		s t=file.ReadLine(),%sqlExpression25=%sqlExpression25_t_$c(13)_$c(10)
	}
	d file.Clear()
	s x=##class(%Library.File).Delete(%FileName)
    Quit $$$OK
}

ClassMethod WordConversion(%FileName, texte) As %Status
{
	i texte.SizeGet()=0 Quit $$$OK
	s dotNetBrol=##class(CHUBXL.Utils.WordConvert).%New("55555")
	s %FileNameTXT=$e(%FileName,1,$l(%FileName)-3)_"txt"

	s sc=dotNetBrol.convert(%FileName,%FileNameTXT)
	d:('sc) $system.OBJ.DisplayError(sc)
		
	s file=##class(%FileCharacterStream).%New(),%sqlExpression25=""
	s file.Filename=%FileNameTXT
	while ('file.AtEnd) {
		s t=file.ReadLine(),%sqlExpression25=%sqlExpression25_t_$c(13)_$c(10)
	}
	d file.Clear()
	s x=##class(%Library.File).Delete(%FileName)
    Quit $$$OK
}

/// PROCESS Colon
ClassMethod ProcessColon() As %Status
{
	d ..SqlColon()
 	s %cpt=0,%cptSkip=0
	While (%rsDB.Next()) {
		d ..SqlData()
		d ..PrepareColon()
 		s %cpt=%cpt+1
    }
	s %ndem="" f  s %ndem=$o(^CHUBXL.DIAMICREC(%ndem)) q:%ndem=""  d
	. d ..FormatFieldsColon()
	. d ..FormatLineColon()
 	. d ..WriteGlobalLine()

	d ..WriteOutputFile()      
	Quit $$$OK
}

/// PROCESS Cancer
ClassMethod ProcessCancer() As %Status
{
	d ..SqlCancer()
 	s %cpt=0,%cptSkip=0
	While (%rsDB.Next()) {
		d ..SqlData()
		d ..PrepareCancer()
 		s %cpt=%cpt+1
    }
	s %ndem="" f  s %ndem=$o(^CHUBXL.DIAMICREC(%ndem)) q:%ndem=""  d
	. d ..FormatFieldsCancer()
	. d ..FormatLineCancer()
 	. d ..WriteGlobalLine()

	d ..WriteOutputFile()     
	Quit $$$OK
}

/// SQL Col
ClassMethod SqlCol() As %Status
{
    d ..SqlHeader()
    
    s %qDB = ""
    
    s %qDB = %qDB_"SELECT P.NUSS as NISS, P.NOMPAT as Lastname, P.PRENOM as Firstname, P.SEXE as Sex, to_char(P.DATNAISSANCE,'YYYYMMDD') as Dateofbirth, "
	s %qDB = %qDB_"to_char(P.DATDECES,'YYYYMMDD') as Dateofdeath, P.CODPOSTAL as Zipcode, 'BE' as CountryCode, NUDDEEXT as SpecimenNumber, "
	s %qDB = %qDB_"to_char(DATPREL,'YYYYMMDD') as DateSpecimenTaken, O.NOMORIG as Hospital, M.INSEE as MEDPRESC, CODAXEM ""MORPHO"", ' ' as DIAGPROC, E.CODAXET ""TOPO"", "
	s %qDB = %qDB_"E.CODAXEM ""MORPHO"", ' ' as DEGCERT, '#NS' as HPVTEST, ' ' as HPVTYPE, C.NUCOT as INAMI, C.INAMIA, C.INAMIH, D.NUSEJOUR,RB.CODBIBLE,E.CODAXEP, D.NUDDE "
	s %qDB = %qDB_"FROM CHUBXL_DB_DIAMIC.EXAMENCODIFSNO E, CHUBXL_DB_DIAMIC.DEMANDE D left outer join CHUBXL_DB_DIAMIC.RESULTATBIBLE RB on D.NUDDE=RB.NUDDE inner join CHUBXL_DB_DIAMIC.ORIGINE O ON D.NUORIG=O.NUORIG, CHUBXL_DB_DIAMIC.PATIENT P, "
	s %qDB = %qDB_"CHUBXL_DB_DIAMIC.COTATIONELEM C, CHUBXL_DB_DIAMIC.PATIENTNIP PT, CHUBXL_DB_DIAMIC.MEDECIN M, CHUBXL_DB_DIAMIC.EXAMENCOT EC "
	s %qDB = %qDB_"WHERE (E.CODAXET LIKE '%T-82%' or E.CODAXET LIKE '%T-832%' or E.CODAXET LIKE '%T-82910%' or E.CODAXET LIKE '%T-83098%') AND E.CODAXEM LIKE '%M-%' "
	s %qDB = %qDB_"AND E.NUDDE=D.NUDDE AND E.NUEXAM=EC.NUEXAM AND EC.NUCOT=C.NUCOT "
	s %qDB = %qDB_"AND D.DATPREL BETWEEN to_date('"_%pDDEB_"','YYYYMMDD') AND to_date('"_%pDFIN_"','YYYYMMDD') "
	s %qDB = %qDB_"AND D.NUPAT = P.NUPAT and C.INAMIA is not null and C.INAMIH is not null "
	s %qDB = %qDB_"AND P.NUPAT =PT.NUPAT AND D.NUSIH = PT.NUSIH AND D.NUSIH=5 AND D.NUPRESC=M.NUMED "
	i $g(%pNEXAM)'="" s %qDB = %qDB_"AND nuddeext='"_%pNEXAM_"' "
	s %qDB = %qDB_"ORDER BY NUDDEEXT"
    
 	w !,%qDB    
    d ..SqlFooter()
	Quit $$$OK
}

/// PREPARE Col
ClassMethod PrepareCol() As %Status
{
	s %SUFINSU="",%sqlNewNISS=%sqlNISS,%sqlGenerate="FALSE",%sqlPatDec="FALSE"
	i %sqlDateofdeath'="",%pTYP=1 s %sqlPatDec="TRUE",%sqlDateofdeath=$e(%sqlDateofdeath,7,8)_"/"_$e(%sqlDateofdeath,5,6)_"/"_$e(%sqlDateofdeath,1,4)
	i $e(%sqlSpecimenNumber,3)="L" s %SUFINSU="SUF" 
	i $tr(%sqlNISS," ")'="" s %sqlLastname="XXXXXXXXXX",%sqlFirstname="YYYYYYYYYY"
	i $tr(%sqlNISS," ")="" s %sqlNewNISS="" ;%sqlLastname_$e(%sqlDateofbirth,7,8)_"/"_$e(%sqlDateofbirth,5,6)_"/"_$e(%sqlDateofbirth,1,4)_%sqlSex,%sqlGenerate="TRUE"
	i $l(+%sqlNUSEJOUR)>7 s inami=%sqlINAMIA
	i $l(+%sqlNUSEJOUR)'>7 s inami=%sqlINAMIH
	i $tr(inami," ")="" s inami=70603
	i '$d(^CHUBXL.DIAMICINA(%sqlSpecimenNumber)) {
		s ^CHUBXL.DIAMICINA(%sqlSpecimenNumber)=inami
	}
	else {
		i (","_^CHUBXL.DIAMICINA(%sqlSpecimenNumber)_",")'[(","_inami_",") s ^CHUBXL.DIAMICINA(%sqlSpecimenNumber)=^CHUBXL.DIAMICINA(%sqlSpecimenNumber)_","_inami
	}
	;s ^CHUBXL.DIAMICINA(%sqlSpecimenNumber)=""   ; Version pour Abdel
	i '$d(^CHUBXL.DIAMICSNOP(%sqlSpecimenNumber)) {
		s:$tr(%sqlCODAXEP," ")'="" ^CHUBXL.DIAMICSNOP(%sqlSpecimenNumber)=%sqlCODAXEP
	}
	else {
		i (","_^CHUBXL.DIAMICSNOP(%sqlSpecimenNumber)_",")'[(","_%sqlCODAXEP_",") s:$tr(%sqlCODAXEP," ")'="" ^CHUBXL.DIAMICSNOP(%sqlSpecimenNumber)=^CHUBXL.DIAMICSNOP(%sqlSpecimenNumber)_","_%sqlCODAXEP
	}
	
	i "~HPV-~HPVi~"[("~"_%sqlCODBIBLE_"~") s ^CHUBXL.DIAMICHPVT(%sqlSpecimenNumber)=%sqlCODBIBLE
	i "~HPXX~HPOT~HP16~HP18~HP16,HP18~"[("~"_%sqlCODBIBLE_"~") {
		s ^CHUBXL.DIAMICHPVT(%sqlSpecimenNumber)="HPV+"
		i '$d(^CHUBXL.DIAMICHPV(%sqlSpecimenNumber)) {
		  s ^CHUBXL.DIAMICHPV(%sqlSpecimenNumber)=%sqlCODBIBLE
	      }
	    else {
		  i (","_^CHUBXL.DIAMICHPV(%sqlSpecimenNumber)_",")'[(","_%sqlCODBIBLE_",") s ^CHUBXL.DIAMICHPV(%sqlSpecimenNumber)=^CHUBXL.DIAMICHPV(%sqlSpecimenNumber)_","_%sqlCODBIBLE
	    }
	}
	i %sqlSpecimenNumber?2n1"L"5n s %SUFINSU="SUF"
	i "~M-09000~M-09010~M-09019~"[("~"_%sqlMORPHO_"~") d
	. s %SUFINSU="SUF"
	. s:%sqlMORPHO="M-09010" %SUFINSU="INSU"
	s ^CHUBXL.DIAMICM1(%sqlSpecimenNumber)=%SUFINSU
	i "~M-09000~M-09010~M-09019~"'[("~"_%sqlMORPHO_"~") s ^CHUBXL.DIAMICM2(%sqlSpecimenNumber)=%sqlMORPHO
	i %sqlZipcode="9999" s %sqlCountryCode="#NK"
	i %sqlZipcode'?4N s %sqlCountryCode="#NK"
	i %sqlSex="F" s %sqlSex="FEMALE"
	i %sqlSex="M" s %sqlSex="MALE"
	i %sqlMORPHO="M-74001" s %sqlMORPHO="M-80770"
	i %sqlMORPHO="M-74002" s %sqlMORPHO="M-80772"
	i %pTYP=0 s ^CHUBXL.DIAMICREC(%sqlSpecimenNumber)=%sqlNISS_$c(9)_%sqlLastname_$c(9)_%sqlFirstname_$c(9)_%sqlSex_$c(9)_%sqlDateofbirth_$c(9)_%sqlDateofdeath_$c(9)_%sqlZipcode_$c(9)_%sqlCountryCode_$c(9)_%sqlSpecimenNumber_$c(9)_%sqlDateSpecimenTaken_$c(9)_%sqlHospital_$c(9)_%sqlMEDPRESC_$c(9)_""_$c(9)_$c(9)_%sqlTOPO_$c(9)_""_$c(9)_""_$c(9)
	i %pTYP=1 s ^CHUBXL.DIAMICREC(%sqlSpecimenNumber)=%sqlNewNISS_";"_%sqlNISS_";"_%sqlGenerate_";"_%sqlLastname_";"_%sqlFirstname_";"_$e(%sqlDateofbirth,7,8)_"/"_$e(%sqlDateofbirth,5,6)_"/"_$e(%sqlDateofbirth,1,4)_";"_$s(%sqlSex="FEMALE":"F",1:"M")_";"_%sqlZipcode_";"_%sqlPatDec_";"_%sqlDateofdeath_";"_%sqlCountryCode_";"_%sqlSpecimenNumber_";"_$e(%sqlDateSpecimenTaken,7,8)_"/"_$e(%sqlDateSpecimenTaken,5,6)_"/"_$e(%sqlDateSpecimenTaken,1,4)_";"_%sqlHospital_";"_%sqlMEDPRESC_";"_""_";"_";"_%sqlTOPO_";"_""_";"_""_";"
	s ^CHUBXL.DIAMICSAERCH(%sqlSpecimenNumber)=%sqlNUDDE
	Quit $$$OK   	
   	
SPN(SPE)
    F II=$L(SPE):-1:1 S LET=$E(SPE,II) Q:LET'=" " 
    S SPE=$E(SPE,1,II) 
    QUIT SPE
}

/// FORMAT Fields Col
ClassMethod FormatFieldsCol() As %Status
{
	s rec=^CHUBXL.DIAMICREC(%ndem) ;w rec,! b
	i '$d(^CHUBXL.DIAMICSAERCH(%ndem)) q
	i ^CHUBXL.DIAMICSAERCH(%ndem)="" q
   	s %stream=##class(%FileCharacterStream).%New()
	s %FileName=%pDIR_%ndem_".doc"
	s %r=##class(CHUBXL.DB.DIAMIC.RESULTAT).%OpenId(^CHUBXL.DIAMICSAERCH(%ndem))
	s %stream.Filename=%FileName
  	d %stream.CopyFrom(%r.TXTDESCROIMP)
    d %stream.%Save()
	d ..WordConversion(%pDIR_%ndem_".doc",%r.TXTDESCROIMP)
	i %sqlExpression25["[\D2]" s %sqlExpression25=$p(%sqlExpression25,"[\D2]",1)_$p(%sqlExpression25,"[\D2]",2,99)
	i %sqlExpression25["[\DD]" s %sqlExpression25=$p(%sqlExpression25,"[\DD]",1)_$p(%sqlExpression25,"[\DD]",2,99)
	i %sqlExpression25["[\D1]" s %sqlExpression25=$p(%sqlExpression25,"[\D1]",1)_$p(%sqlExpression25,"[\D1]",2,99)
	i %sqlExpression25["[\DCR]" s %sqlExpression25=$p(%sqlExpression25,"[\DCR]",1)_$p(%sqlExpression25,"[\DCR]",2,99)
	i %sqlExpression25["[\R]" s %sqlExpression25=$p(%sqlExpression25,"[\R]",1)_$p(%sqlExpression25,"[\R]",2,99)
	i %sqlExpression25["[\M]" s %sqlExpression25=$p(%sqlExpression25,"[\M]",1)_$p(%sqlExpression25,"[\M]",2,99)
	i %sqlExpression25["[\FD]" s %sqlExpression25=$p(%sqlExpression25,"[\FD]",1)_$p(%sqlExpression25,"[\FD]",2,99)
	i %sqlExpression25["[\DC]" s %sqlExpression25=$p(%sqlExpression25,"[\DC]",1)_$p(%sqlExpression25,"[\DC]",2,99)
	i %sqlExpression25["[\C1]" s %sqlExpression25=$p(%sqlExpression25,"[\C1]",1)_$p(%sqlExpression25,"[\C1]",2,99)
	i %sqlExpression25["[\C2]" s %sqlExpression25=$p(%sqlExpression25,"[\C2]",1)_$p(%sqlExpression25,"[\C2]",2,99)
	i %sqlExpression25["[\FC]" s %sqlExpression25=$p(%sqlExpression25,"[\FC]",1)_$p(%sqlExpression25,"[\FC]",2,99)
	s pos=10,Sep=$c(9) i %pTYP=1 s pos=13,Sep=";"
	s %sqlExpression25=$c(13)_$c(10)_$c(13)_$c(10)_$c(13)_$c(10)_"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"_%CRLF_"EXAMEN : "_%ndem_" / DATE : "_$p(rec,Sep,pos)_%CRLF_%CRLF_%sqlExpression25
	s ^CHUBXL.DIAMICTMP(%ndem)=$tr(%sqlExpression25,Sep)

	Quit $$$OK
}

/// FORMAT Line Col 
ClassMethod FormatLineCol() As %Status
{
	i %pTYP=0 s %LineOut = $p(^CHUBXL.DIAMICREC(%ndem),$c(9),1,12)_$c(9)_$g(^CHUBXL.DIAMICM1(%ndem))_$c(9)_$g(^CHUBXL.DIAMICSNOP(%ndem))_$c(9)_$p(^CHUBXL.DIAMICREC(%ndem),$c(9),15)_$c(9)_$g(^CHUBXL.DIAMICM2(%ndem))_$c(9)_$c(9)_$g(^CHUBXL.DIAMICHPVT(%ndem))_$c(9)_$g(^CHUBXL.DIAMICHPV(%ndem))_$c(9)_$g(^CHUBXL.DIAMICINA(%ndem))_$c(9)_$g(^CHUBXL.DIAMICTMP(%ndem))_$c(9)
	i %pTYP=1 s %LineOut = $p(^CHUBXL.DIAMICREC(%ndem),";",1,15)_";"_$g(^CHUBXL.DIAMICM1(%ndem))_";"_$g(^CHUBXL.DIAMICSNOP(%ndem))_";"_$p(^CHUBXL.DIAMICREC(%ndem),";",18)_";"_$g(^CHUBXL.DIAMICM2(%ndem))_";"_";"_$g(^CHUBXL.DIAMICHPVT(%ndem))_";"_$g(^CHUBXL.DIAMICHPV(%ndem))_";"_$g(^CHUBXL.DIAMICINA(%ndem))_";"_$g(^CHUBXL.DIAMICTMP(%ndem))_";"
	s %LineOutT = ""
	Quit $$$OK
}

/// SQL Sein
ClassMethod SqlSein() As %Status
{
    d ..SqlHeader()
    s %qDB = ""
    
    s %qDB = %qDB_"SELECT P.NUSS as NISS, P.NOMPAT as Lastname, P.PRENOM as Firstname, P.SEXE as Sex, to_char(P.DATNAISSANCE,'YYYYMMDD') as Dateofbirth, "
	s %qDB = %qDB_"to_char(P.DATDECES,'YYYYMMDD') as Dateofdeath, P.CODPOSTAL as Zipcode, 'BE' as CountryCode, NUDDEEXT as SpecimenNumber, "
	s %qDB = %qDB_"to_char(DATPREL,'YYYYMMDD') as DateSpecimenTaken, O.NOMORIG as Hospital, M.INSEE as MEDPRESC, CODAXEM ""MORPHO"", ' ' as DIAGPROC, E.CODAXET ""TOPO"", "
	s %qDB = %qDB_"CODAXEM ""MORPHO"", ' ' as DEGCERT, '#NS' as HPVTEST, ' ' as HPVTYPE, C.NUCOT as INAMI, C.INAMIA, C.INAMIH, D.NUSEJOUR,RB.CODBIBLE,D.NUDDE, E.CODAXEP "
	s %qDB = %qDB_"FROM CHUBXL_DB_DIAMIC.EXAMENCODIFSNO E, CHUBXL_DB_DIAMIC.DEMANDE D left outer join CHUBXL_DB_DIAMIC.RESULTATBIBLE RB on D.NUDDE=RB.NUDDE inner join CHUBXL_DB_DIAMIC.ORIGINE O ON D.NUORIG=O.NUORIG, CHUBXL_DB_DIAMIC.PATIENT P, "
	s %qDB = %qDB_"CHUBXL_DB_DIAMIC.COTATIONELEM C, CHUBXL_DB_DIAMIC.PATIENTNIP PT, CHUBXL_DB_DIAMIC.MEDECIN M, CHUBXL_DB_DIAMIC.EXAMENCOT EC "
	s %qDB = %qDB_"WHERE (E.CODAXET LIKE '%T-04%' or E.CODAXET LIKE '%T-3430%' or E.CODAXET LIKE '%T-3431%' or E.CODAXET LIKE '%T-3432%') AND E.CODAXEM LIKE '%M-%' "
	s %qDB = %qDB_"AND E.NUDDE=D.NUDDE AND E.NUEXAM=EC.NUEXAM AND EC.NUCOT=C.NUCOT "
	s %qDB = %qDB_"AND D.DATPREL BETWEEN to_date('"_%pDDEB_"','YYYYMMDD') AND to_date('"_%pDFIN_"','YYYYMMDD') "
	s %qDB = %qDB_"AND D.NUPAT = P.NUPAT and C.INAMIA is not null and C.INAMIH is not null "
	s %qDB = %qDB_"AND P.NUPAT =PT.NUPAT AND D.NUSIH = PT.NUSIH AND D.NUSIH=5 AND D.NUPRESC=M.NUMED "
	s %qDB = %qDB_"ORDER BY NUDDEEXT"
    
 	w !,%qDB 
    d ..SqlFooter()
	Quit $$$OK
}

/// PREPARE Sein	
ClassMethod PrepareSein() As %Status
{
	s %SUFINSU="",%sqlNewNISS=%sqlNISS,%sqlGenerate="FALSE",%sqlPatDec="FALSE"
	i %sqlDateofdeath'="",%pTYP=1 s %sqlPatDec="TRUE",%sqlDateofdeath=$e(%sqlDateofdeath,7,8)_"/"_$e(%sqlDateofdeath,5,6)_"/"_$e(%sqlDateofdeath,1,4)
	i $tr(%sqlNISS," ")'="" s %sqlLastname="XXXXXXXXXX",%sqlFirstname="YYYYYYYYYY"
	i $tr(%sqlNISS," ")="" s %sqlNewNISS="" ;%sqlLastname_$e(%sqlDateofbirth,7,8)_"/"_$e(%sqlDateofbirth,5,6)_"/"_$e(%sqlDateofbirth,1,4)_%sqlSex,%sqlGenerate="TRUE"
	i %sqlZipcode="9999" s %sqlCountryCode="#NK"
	i $l(+%sqlNUSEJOUR)>7 s inami=%sqlINAMIA
	i $l(+%sqlNUSEJOUR)'>7 s inami=%sqlINAMIH
	i '$d(^CHUBXL.DIAMICINA(%sqlSpecimenNumber)) {
		s ^CHUBXL.DIAMICINA(%sqlSpecimenNumber)=inami
	}
	else {
		i (","_^CHUBXL.DIAMICINA(%sqlSpecimenNumber)_",")'[(","_inami_",") s ^CHUBXL.DIAMICINA(%sqlSpecimenNumber)=^CHUBXL.DIAMICINA(%sqlSpecimenNumber)_","_inami
	}
	i %pTYP=0 s ^CHUBXL.DIAMICREC(%sqlSpecimenNumber)=%sqlNISS_$c(9)_%sqlLastname_$c(9)_%sqlFirstname_$c(9)_%sqlSex_$c(9)_%sqlDateofbirth_$c(9)_%sqlDateofdeath_$c(9)_%sqlZipcode_$c(9)_%sqlCountryCode_$c(9)_%sqlSpecimenNumber_$c(9)_%sqlDateSpecimenTaken_$c(9)_%sqlHospital_$c(9)_%sqlMEDPRESC_$c(9)_%sqlCODAXEP_$c(9)_%sqlTOPO_$c(9)_""_$c(9)_%sqlMORPHO_$c(9)_""_$c(9)
	i %pTYP=1 s ^CHUBXL.DIAMICREC(%sqlSpecimenNumber)=%sqlNewNISS_";"_%sqlNISS_";"_%sqlGenerate_";"_%sqlLastname_";"_%sqlFirstname_";"_$e(%sqlDateofbirth,7,8)_"/"_$e(%sqlDateofbirth,5,6)_"/"_$e(%sqlDateofbirth,1,4)_";"_%sqlSex_";"_%sqlZipcode_";"_%sqlPatDec_";"_%sqlDateofdeath_";"_%sqlCountryCode_";"_%sqlSpecimenNumber_";"_$e(%sqlDateSpecimenTaken,7,8)_"/"_$e(%sqlDateSpecimenTaken,5,6)_"/"_$e(%sqlDateSpecimenTaken,1,4)_";"_%sqlHospital_";"_%sqlMEDPRESC_";"_%sqlCODAXEP_";"_%sqlTOPO_";"_";"_%sqlMORPHO_";"_""_";"
   	s ^CHUBXL.DIAMICSAERCH(%sqlSpecimenNumber)=%sqlNUDDE		    
	Quit $$$OK
SPN(SPE)
    F II=$L(SPE):-1:1 S LET=$E(SPE,II) Q:LET'=" " 
    S SPE=$E(SPE,1,II) 
    QUIT SPE
}

/// FORMAT Fields Sein
ClassMethod FormatFieldsSein() As %Status
{
   	s rec=^CHUBXL.DIAMICREC(%ndem)
	i '$d(^CHUBXL.DIAMICSAERCH(%ndem)) q
	i ^CHUBXL.DIAMICSAERCH(%ndem)="" q
	s %stream=##class(%FileCharacterStream).%New()
	s %FileName=%pDIR_%ndem_".doc"
	s %r=##class(CHUBXL.DB.DIAMIC.RESULTAT).%OpenId(^CHUBXL.DIAMICSAERCH(%ndem))
	s %stream.Filename=%FileName
  	d %stream.CopyFrom(%r.TXTDESCROIMP)
    d %stream.%Save()
	d ..WordConversion(%pDIR_%ndem_".doc",%r.TXTDESCROIMP)
	i %sqlExpression25["[\D2]" s %sqlExpression25=$p(%sqlExpression25,"[\D2]",1)_$p(%sqlExpression25,"[\D2]",2,99)
	i %sqlExpression25["[\DD]" s %sqlExpression25=$p(%sqlExpression25,"[\DD]",1)_$p(%sqlExpression25,"[\DD]",2,99)
	i %sqlExpression25["[\D1]" s %sqlExpression25=$p(%sqlExpression25,"[\D1]",1)_$p(%sqlExpression25,"[\D1]",2,99)
	i %sqlExpression25["[\DCR]" s %sqlExpression25=$p(%sqlExpression25,"[\DCR]",1)_$p(%sqlExpression25,"[\DCR]",2,99)
	i %sqlExpression25["[\R]" s %sqlExpression25=$p(%sqlExpression25,"[\R]",1)_$p(%sqlExpression25,"[\R]",2,99)
	i %sqlExpression25["[\M]" s %sqlExpression25=$p(%sqlExpression25,"[\M]",1)_$p(%sqlExpression25,"[\M]",2,99)
	i %sqlExpression25["[\FD]" s %sqlExpression25=$p(%sqlExpression25,"[\FD]",1)_$p(%sqlExpression25,"[\FD]",2,99)
	i %sqlExpression25["[\DC]" s %sqlExpression25=$p(%sqlExpression25,"[\DC]",1)_$p(%sqlExpression25,"[\DC]",2,99)
	i %sqlExpression25["[\C1]" s %sqlExpression25=$p(%sqlExpression25,"[\C1]",1)_$p(%sqlExpression25,"[\C1]",2,99)
	i %sqlExpression25["[\C2]" s %sqlExpression25=$p(%sqlExpression25,"[\C2]",1)_$p(%sqlExpression25,"[\C2]",2,99)
	i %sqlExpression25["[\FC]" s %sqlExpression25=$p(%sqlExpression25,"[\FC]",1)_$p(%sqlExpression25,"[\FC]",2,99)
	s pos=10,Sep=$c(9) i %pTYP=1 s pos=13,Sep=";"
	s %sqlExpression25=$c(13)_$c(10)_$c(13)_$c(10)_$c(13)_$c(10)_$c(13)_$c(10)_"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"_%CRLF_"EXAMEN : "_%ndem_" / DATE : "_$p(rec,Sep,pos)_%CRLF_%CRLF_%sqlExpression25
	s ^CHUBXL.DIAMICTMP(%ndem)=$tr(%sqlExpression25,Sep)

	Quit $$$OK
}

/// FORMAT Line Sein 
ClassMethod FormatLineSein() As %Status
{
	i %pTYP=0 s %LineOut = ^CHUBXL.DIAMICREC(%ndem)_$g(^CHUBXL.DIAMICINA(%ndem))_$c(9)_$g(^CHUBXL.DIAMICTMP(%ndem))
	i %pTYP=1 s %LineOut = ^CHUBXL.DIAMICREC(%ndem)_$g(^CHUBXL.DIAMICINA(%ndem))_";"_$g(^CHUBXL.DIAMICTMP(%ndem)) ;$p(^CHUBXL.DIAMICREC(%ndem),";",1,15)_";"_$g(^CHUBXL.DIAMICM1(%ndem))_";"_$g(^CHUBXL.DIAMICSNOP(%ndem))_";"_$p(^CHUBXL.DIAMICREC(%ndem),";",18)_";"_$g(^CHUBXL.DIAMICM2(%ndem))_";"_";"_$g(^CHUBXL.DIAMICHPVT(%ndem))_";"_$g(^CHUBXL.DIAMICHPV(%ndem))_";"_$g(^CHUBXL.DIAMICINA(%ndem))_";"_$g(^CHUBXL.DIAMICTMP(%ndem))_";"
	s %LineOutT = ""
	Quit $$$OK
}

/// SQL Colon
ClassMethod SqlColon() As %Status
{
    d ..SqlHeader()
    s %qDB = ""
    
    s %qDB = %qDB_"SELECT P.NUSS as NISS, P.NOMPAT as Lastname, P.PRENOM as Firstname, P.SEXE as Sex, to_char(P.DATNAISSANCE,'YYYYMMDD') as Dateofbirth, "
	s %qDB = %qDB_"to_char(P.DATDECES,'YYYYMMDD') as Dateofdeath, P.CODPOSTAL as Zipcode, 'BE' as CountryCode, NUDDEEXT as SpecimenNumber, "
	s %qDB = %qDB_"to_char(DATPREL,'YYYYMMDD') as DateSpecimenTaken, O.NOMORIG as Hospital, M.INSEE as MEDPRESC, CODAXEM ""MORPHO"", ' ' as DIAGPROC, E.CODAXET ""TOPO"", "
	s %qDB = %qDB_"CODAXEM ""MORPHO"", ' ' as DEGCERT, '#NS' as HPVTEST, ' ' as HPVTYPE, C.NUCOT as INAMI, C.INAMIA, C.INAMIH, D.NUSEJOUR,RB.CODBIBLE ,D.NUDDE, E.CODAXEP "
	s %qDB = %qDB_"FROM CHUBXL_DB_DIAMIC.EXAMENCODIFSNO E, CHUBXL_DB_DIAMIC.DEMANDE D left outer join CHUBXL_DB_DIAMIC.RESULTATBIBLE RB on D.NUDDE=RB.NUDDE inner join CHUBXL_DB_DIAMIC.ORIGINE O ON D.NUORIG=O.NUORIG, CHUBXL_DB_DIAMIC.PATIENT P, "
	s %qDB = %qDB_"CHUBXL_DB_DIAMIC.COTATIONELEM C ,CHUBXL_DB_DIAMIC.PATIENTNIP PT, CHUBXL_DB_DIAMIC.MEDECIN M, CHUBXL_DB_DIAMIC.EXAMENCOT EC "
	s %qDB = %qDB_"WHERE (E.CODAXET LIKE '%T-59%' or E.CODAXET LIKE '%T-58650%' or E.CODAXET LIKE '%T-EA566%' or E.CODAXET LIKE '%T-EA552%' or E.CODAXET LIKE '%T-EA573%') "
	s %qDB = %qDB_"AND E.NUDDE=D.NUDDE AND E.NUEXAM=EC.NUEXAM AND EC.NUCOT=C.NUCOT "
	s %qDB = %qDB_"AND D.DATPREL BETWEEN to_date('"_%pDDEB_"','YYYYMMDD') AND to_date('"_%pDFIN_"','YYYYMMDD') "
	s %qDB = %qDB_"AND D.NUPAT = P.NUPAT and C.INAMIA is not null and C.INAMIH is not null "
	s %qDB = %qDB_"AND P.NUPAT =PT.NUPAT AND D.NUSIH = PT.NUSIH AND D.NUSIH=5 AND D.NUPRESC=M.NUMED "
	s %qDB = %qDB_"ORDER BY NUDDEEXT"
    
 	w !,%qDB 
    d ..SqlFooter()
	Quit $$$OK
}

/// PREPARE Colon
ClassMethod PrepareColon() As %Status
{
	s %sqlNewNISS=%sqlNISS,%sqlGenerate="FALSE",%sqlPatDec="FALSE"
	i %sqlDateofdeath'="",%pTYP=1 s %sqlPatDec="TRUE",%sqlDateofdeath=$e(%sqlDateofdeath,7,8)_"/"_$e(%sqlDateofdeath,5,6)_"/"_$e(%sqlDateofdeath,1,4)
	i $tr(%sqlNISS," ")'="" s %sqlLastname="XXXXXXXXXX",%sqlFirstname="YYYYYYYYYY"
	i $tr(%sqlNISS," ")="" s %sqlNewNISS=""  ;%sqlLastname_$e(%sqlDateofbirth,7,8)_"/"_$e(%sqlDateofbirth,5,6)_"/"_$e(%sqlDateofbirth,1,4)_%sqlSex,%sqlGenerate="TRUE"
	i %sqlZipcode="9999" s %sqlCountryCode="#NK"
	i $l(+%sqlNUSEJOUR)>7 s inami=%sqlINAMIA
	i $l(+%sqlNUSEJOUR)'>7 s inami=%sqlINAMIH
	i '$d(^CHUBXL.DIAMICINA(%sqlSpecimenNumber)) {
		s ^CHUBXL.DIAMICINA(%sqlSpecimenNumber)=inami
	}
	else {
		i (","_^CHUBXL.DIAMICINA(%sqlSpecimenNumber)_",")'[(","_inami_",") s ^CHUBXL.DIAMICINA(%sqlSpecimenNumber)=^CHUBXL.DIAMICINA(%sqlSpecimenNumber)_","_inami
	}
	i %pTYP=0 s ^CHUBXL.DIAMICREC(%sqlSpecimenNumber)=%sqlNISS_$c(9)_%sqlLastname_$c(9)_%sqlFirstname_$c(9)_%sqlSex_$c(9)_%sqlDateofbirth_$c(9)_%sqlDateofdeath_$c(9)_%sqlZipcode_$c(9)_%sqlCountryCode_$c(9)_%sqlSpecimenNumber_$c(9)_%sqlDateSpecimenTaken_$c(9)_%sqlHospital_$c(9)_%sqlMEDPRESC_$c(9)_%sqlCODAXEP_$c(9)_%sqlTOPO_$c(9)_""_$c(9)_%sqlMORPHO_$c(9)_""_$c(9)
	i %pTYP=1 s ^CHUBXL.DIAMICREC(%sqlSpecimenNumber)=%sqlNewNISS_";"_%sqlNISS_";"_%sqlGenerate_";"_%sqlLastname_";"_%sqlFirstname_";"_$e(%sqlDateofbirth,7,8)_"/"_$e(%sqlDateofbirth,5,6)_"/"_$e(%sqlDateofbirth,1,4)_";"_%sqlSex_";"_%sqlZipcode_";"_%sqlPatDec_";"_%sqlDateofdeath_";"_%sqlCountryCode_";"_%sqlSpecimenNumber_";"_$e(%sqlDateSpecimenTaken,7,8)_"/"_$e(%sqlDateSpecimenTaken,5,6)_"/"_$e(%sqlDateSpecimenTaken,1,4)_";"_%sqlHospital_";"_%sqlMEDPRESC_";"_%sqlCODAXEP_";"_%sqlTOPO_";"_";"_%sqlMORPHO_";"_""_";"
	s ^CHUBXL.DIAMICSAERCH(%sqlSpecimenNumber)=%sqlNUDDE
	Quit $$$OK
}

/// FORMAT Fields Colon
ClassMethod FormatFieldsColon() As %Status
{
   	s rec=^CHUBXL.DIAMICREC(%ndem)
	i '$d(^CHUBXL.DIAMICSAERCH(%ndem)) q
	i ^CHUBXL.DIAMICSAERCH(%ndem)="" q
	s %stream=##class(%FileCharacterStream).%New()
	s %FileName=%pDIR_%ndem_".doc"
	s %r=##class(CHUBXL.DB.DIAMIC.RESULTAT).%OpenId(^CHUBXL.DIAMICSAERCH(%ndem))
	s %stream.Filename=%FileName
  	d %stream.CopyFrom(%r.TXTDESCROIMP)
    d %stream.%Save()
	d ..WordConversion(%pDIR_%ndem_".doc",%r.TXTDESCROIMP)
	i %sqlExpression25["[\D2]" s %sqlExpression25=$p(%sqlExpression25,"[\D2]",1)_$p(%sqlExpression25,"[\D2]",2,99)
	i %sqlExpression25["[\DD]" s %sqlExpression25=$p(%sqlExpression25,"[\DD]",1)_$p(%sqlExpression25,"[\DD]",2,99)
	i %sqlExpression25["[\D1]" s %sqlExpression25=$p(%sqlExpression25,"[\D1]",1)_$p(%sqlExpression25,"[\D1]",2,99)
	i %sqlExpression25["[\DCR]" s %sqlExpression25=$p(%sqlExpression25,"[\DCR]",1)_$p(%sqlExpression25,"[\DCR]",2,99)
	i %sqlExpression25["[\R]" s %sqlExpression25=$p(%sqlExpression25,"[\R]",1)_$p(%sqlExpression25,"[\R]",2,99)
	i %sqlExpression25["[\M]" s %sqlExpression25=$p(%sqlExpression25,"[\M]",1)_$p(%sqlExpression25,"[\M]",2,99)
	i %sqlExpression25["[\FD]" s %sqlExpression25=$p(%sqlExpression25,"[\FD]",1)_$p(%sqlExpression25,"[\FD]",2,99)
	i %sqlExpression25["[\DC]" s %sqlExpression25=$p(%sqlExpression25,"[\DC]",1)_$p(%sqlExpression25,"[\DC]",2,99)
	i %sqlExpression25["[\C1]" s %sqlExpression25=$p(%sqlExpression25,"[\C1]",1)_$p(%sqlExpression25,"[\C1]",2,99)
	i %sqlExpression25["[\C2]" s %sqlExpression25=$p(%sqlExpression25,"[\C2]",1)_$p(%sqlExpression25,"[\C2]",2,99)
	i %sqlExpression25["[\FC]" s %sqlExpression25=$p(%sqlExpression25,"[\FC]",1)_$p(%sqlExpression25,"[\FC]",2,99)
	s pos=10,Sep=$c(9) i %pTYP=1 s pos=13,Sep=";"
	s %sqlExpression25=$c(13)_$c(10)_$c(13)_$c(10)_$c(13)_$c(10)_$c(13)_$c(10)_"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"_%CRLF_"EXAMEN : "_%ndem_" / DATE : "_$p(rec,Sep,13)_%CRLF_%CRLF_%sqlExpression25
	s ^CHUBXL.DIAMICTMP(%ndem)=$tr(%sqlExpression25,Sep)

	Quit $$$OK
}

/// FORMAT Line Colon
ClassMethod FormatLineColon() As %Status
{
	i %pTYP=0 s %LineOut = ^CHUBXL.DIAMICREC(%ndem)_$g(^CHUBXL.DIAMICINA(%ndem))_$c(9)_$g(^CHUBXL.DIAMICTMP(%ndem))
	i %pTYP=1 s %LineOut = ^CHUBXL.DIAMICREC(%ndem)_$g(^CHUBXL.DIAMICINA(%ndem))_";"_$g(^CHUBXL.DIAMICTMP(%ndem))
	s %LineOutT = ""
	  	
	Quit $$$OK
}

/// SQL Cancer
ClassMethod SqlCancer() As %Status
{
    d ..SqlHeader()
    s %qDB = "SELECT P.NUSS as NISS, P.NOMPAT as Lastname, P.PRENOM as Firstname, P.SEXE as Sex, to_char(P.DATNAISSANCE,'YYYYMMDD') as Dateofbirth, "
	s %qDB = %qDB_"to_char(P.DATDECES,'YYYYMMDD') as Dateofdeath, P.CODPOSTAL as Zipcode, 'BE' as CountryCode, NUDDEEXT as SpecimenNumber, "
	s %qDB = %qDB_"to_char(DATPREL,'YYYYMMDD') as DateSpecimenTaken, O.NOMORIG as Hospital, M.INSEE as MEDPRESC, E.CODAXEM ""MORPHO"", ' ' as DIAGPROC, E.CODAXET ""TOPO"", "
	s %qDB = %qDB_"E.CODAXEM ""MORPHO"", ' ' as DEGCERT, '#NS' as HPVTEST, ' ' as HPVTYPE, C.NUCOT as INAMI, C.INAMIA, C.INAMIH, D.NUSEJOUR,RB.CODBIBLE, E.CODAXEP, D.NUDDE "
	s %qDB = %qDB_", T.CODAXET as pT, T.CODAXEN as pN, T.CODAXEM as pM, D.NUDDE " 
	s %qDB = %qDB_"FROM CHUBXL_DB_DIAMIC.EXAMENCODIFSNO E, CHUBXL_DB_DIAMIC.DEMANDE D left outer join CHUBXL_DB_DIAMIC.EXAMENCODIFTNM T on D.NUDDE = T.NUDDE left outer join CHUBXL_DB_DIAMIC.resultatbible RB on D.NUDDE = RB.NUDDE inner join CHUBXL_DB_DIAMIC.ORIGINE O ON D.NUORIG=O.NUORIG, CHUBXL_DB_DIAMIC.PATIENT P, CHUBXL_DB_DIAMIC.PATIENTNIP PT, "
	s %qDB = %qDB_"CHUBXL_DB_DIAMIC.MEDECIN M, CHUBXL_DB_DIAMIC.EXAMENCOT EC, CHUBXL_DB_DIAMIC.COTATIONELEM C "
	s %qDB = %qDB_"WHERE (E.CODAXEM LIKE '%M-74003%' or E.CODAXEM LIKE '%M-74009%' or E.CODAXEM LIKE '%M-74413%' or E.CODAXEM LIKE '%M-8%' or E.CODAXEM LIKE '%M-9%') "
	s %qDB = %qDB_"AND E.NUDDE=D.NUDDE AND E.NUEXAM=EC.NUEXAM AND EC.NUCOT=C.NUCOT "
	s %qDB = %qDB_"AND D.DATPREL BETWEEN to_date('"_%pDDEB_"','YYYYMMDD') AND to_date('"_%pDFIN_"','YYYYMMDD') "
	s %qDB = %qDB_"AND D.NUPAT = P.NUPAT and C.INAMIA is not null and C.INAMIH is not null "
	s %qDB = %qDB_"AND P.NUPAT =PT.NUPAT AND D.NUSIH = PT.NUSIH AND D.NUSIH=5 AND D.NUPRESC=M.NUMED "
	s %qDB = %qDB_"ORDER BY NUDDEEXT"
	w !,%qDB 
    d ..SqlFooter()
	Quit $$$OK
}

/// PREPARE Cancer
ClassMethod PrepareCancer() As %Status
{
	s %sqlNewNISS=%sqlNISS,%sqlGenerate="FALSE",%sqlPatDec="FALSE"
	i %sqlDateofdeath'="",%pTYP=1 s %sqlPatDec="TRUE",%sqlDateofdeath=$e(%sqlDateofdeath,7,8)_"/"_$e(%sqlDateofdeath,5,6)_"/"_$e(%sqlDateofdeath,1,4)
	i $tr(%sqlNISS," ")'="" s %sqlLastname="XXXXXXXXXX",%sqlFirstname="YYYYYYYYYY"
	i $tr(%sqlNISS," ")="" s %sqlNewNISS="" ;%sqlLastname_$e(%sqlDateofbirth,7,8)_"/"_$e(%sqlDateofbirth,5,6)_"/"_$e(%sqlDateofbirth,1,4)_%sqlSex,%sqlGenerate="TRUE"
	i %sqlZipcode="9999" s %sqlCountryCode="#NK"
	i %pTYP=0 s ^CHUBXL.DIAMICREC(%sqlSpecimenNumber)=%sqlNISS_$c(9)_%sqlLastname_$c(9)_%sqlFirstname_$c(9)_%sqlSex_$c(9)_%sqlDateofbirth_$c(9)_%sqlDateofdeath_$c(9)_%sqlZipcode_$c(9)_%sqlCountryCode_$c(9)_%sqlSpecimenNumber_$c(9)_%sqlDateSpecimenTaken_$c(9)_%sqlHospital_$c(9)_%sqlCODAXEP_$c(9)_%sqlTOPO_$c(9)_""_$c(9)_%sqlMORPHO_$c(9)_""_$c(9)_$g(%sqlpT)_$c(9)_$g(%sqlpN)_$c(9)_$g(%sqlpM)_$c(9)
	i %pTYP=1 s ^CHUBXL.DIAMICREC(%sqlSpecimenNumber)=%sqlNewNISS_";"_%sqlNISS_";"_%sqlGenerate_";"_%sqlLastname_";"_%sqlFirstname_";"_$e(%sqlDateofbirth,7,8)_"/"_$e(%sqlDateofbirth,5,6)_"/"_$e(%sqlDateofbirth,1,4)_";"_%sqlSex_";"_%sqlZipcode_";"_%sqlPatDec_";"_%sqlDateofdeath_";"_%sqlCountryCode_";"_%sqlSpecimenNumber_";"_$e(%sqlDateSpecimenTaken,7,8)_"/"_$e(%sqlDateSpecimenTaken,5,6)_"/"_$e(%sqlDateSpecimenTaken,1,4)_";"_%sqlHospital_";"_%sqlCODAXEP_";"_%sqlTOPO_";"_""_";"_%sqlMORPHO_";"_""_";"_$g(%sqlpT)_";"_$g(%sqlpN)_";"_$g(%sqlpM)_";"
	s ^CHUBXL.DIAMICSAERCH(%sqlSpecimenNumber)=%sqlNUDDE
	Quit $$$OK
}

/// FORMAT Fields Cancer
ClassMethod FormatFieldsCancer() As %Status
{
	s rec=^CHUBXL.DIAMICREC(%ndem)
	i '$d(^CHUBXL.DIAMICSAERCH(%ndem)) q
	i ^CHUBXL.DIAMICSAERCH(%ndem)="" q
	s %stream=##class(%FileCharacterStream).%New()
	s %FileName=%pDIR_%ndem_".doc"
	s %r=##class(CHUBXL.DB.DIAMIC.RESULTAT).%OpenId(^CHUBXL.DIAMICSAERCH(%ndem))
	s %stream.Filename=%FileName
  	d %stream.CopyFrom(%r.TXTDESCROIMP)
    d %stream.%Save()
	d ..WordConversion(%pDIR_%ndem_".doc",%r.TXTDESCROIMP)
   	i %sqlExpression25["[\D2]" s %sqlExpression25=$p(%sqlExpression25,"[\D2]",1)_$p(%sqlExpression25,"[\D2]",2,99)
	i %sqlExpression25["[\DD]" s %sqlExpression25=$p(%sqlExpression25,"[\DD]",1)_$p(%sqlExpression25,"[\DD]",2,99)
	i %sqlExpression25["[\D1]" s %sqlExpression25=$p(%sqlExpression25,"[\D1]",1)_$p(%sqlExpression25,"[\D1]",2,99)
	i %sqlExpression25["[\DCR]" s %sqlExpression25=$p(%sqlExpression25,"[\DCR]",1)_$p(%sqlExpression25,"[\DCR]",2,99)
	i %sqlExpression25["[\R]" s %sqlExpression25=$p(%sqlExpression25,"[\R]",1)_$p(%sqlExpression25,"[\R]",2,99)
	i %sqlExpression25["[\M]" s %sqlExpression25=$p(%sqlExpression25,"[\M]",1)_$p(%sqlExpression25,"[\M]",2,99)
	i %sqlExpression25["[\FD]" s %sqlExpression25=$p(%sqlExpression25,"[\FD]",1)_$p(%sqlExpression25,"[\FD]",2,99)
	i %sqlExpression25["[\DC]" s %sqlExpression25=$p(%sqlExpression25,"[\DC]",1)_$p(%sqlExpression25,"[\DC]",2,99)
	i %sqlExpression25["[\C1]" s %sqlExpression25=$p(%sqlExpression25,"[\C1]",1)_$p(%sqlExpression25,"[\C1]",2,99)
	i %sqlExpression25["[\C2]" s %sqlExpression25=$p(%sqlExpression25,"[\C2]",1)_$p(%sqlExpression25,"[\C2]",2,99)
	i %sqlExpression25["[\FC]" s %sqlExpression25=$p(%sqlExpression25,"[\FC]",1)_$p(%sqlExpression25,"[\FC]",2,99)
	s pos=10,Sep=$c(9) i %pTYP=1 s pos=13,Sep=";"
	s %sqlExpression25=$c(13)_$c(10)_$c(13)_$c(10)_$c(13)_$c(10)_$c(13)_$c(10)_"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"_%CRLF_"EXAMEN : "_%ndem_" / DATE : "_$p(rec,Sep,pos)_%CRLF_%CRLF_%sqlExpression25
	s ^CHUBXL.DIAMICTMP(%ndem)=$tr(%sqlExpression25,Sep)

	Quit $$$OK
}

/// FORMAT Line Cancer
ClassMethod FormatLineCancer() As %Status
{
	i %pTYP=0 s %LineOut = ^CHUBXL.DIAMICREC(%ndem)_$c(9)_$g(^CHUBXL.DIAMICTMP(%ndem))
	i %pTYP=1 s %LineOut = ^CHUBXL.DIAMICREC(%ndem)_";"_$g(^CHUBXL.DIAMICTMP(%ndem))
	s %LineOutT = ""
	  	
	Quit $$$OK
}

/// OPE - Write LogFile ^CHUBXL.DIAMICTMPLOG 
ClassMethod OpeWriteLog() As %Status
{
	s p=$o(^CHUBXL.DIAMICTMPLOG(%ptSEJ_"                    "))
	while $p(p,":",1)=%ptSEJ {
		d ..WriteLogFile(^CHUBXL.DIAMICTMPLOG(p))
		s p=$o(^CHUBXL.DIAMICTMPLOG(p))
	}
	Quit $$$OK
}

/// OPE - Check if Intervention in %SEJOUR 
ClassMethod OpeCheckIntInSej() As %Status
{
	s %ERR=0	
	s %sqldadmjj	= $tr($j($g(%sqldadmjj),2)," ","0")
	s %sqldadmmm	= $tr($j($g(%sqldadmmm),2)," ","0")
	s %sqldadmaa	= $tr($j($g(%sqldadmaa),4)," ","0")
	s %sqldsorhjj	= $tr($j($g(%sqldsorhjj),2)," ","0")
	s %sqldsorhmm	= $tr($j($g(%sqldsorhmm),2)," ","0")
	s %sqldsorhaa	= $tr($j($g(%sqldsorhaa),4)," ","0")
	s %zDSIMED1		= %sqldadmaa_%sqldadmmm_%sqldadmjj
	s %zDSIMED2		= %sqldsorhaa_%sqldsorhmm_%sqldsorhjj
	
	i ((%zDOPERA < %zDSIMED1) ! (%zDOPERA > %zDSIMED2)) {
		s %ERR=1
		s %LogLine=" " d ..WriteLogFile(%LogLine)
		s %LogLine="*****   ERRORD (Bad NADM "_%ptSEJ_") QOP {DATE:"_%zDOPERA_"} => SIMED {SDEB:"_%zDSIMED1_" SFIN:"_%zDSIMED2_"}" d ..WriteLogFile(%LogLine)
	}
	Quit $$$OK
}

ClassMethod OpeCreateFile() As %Status
{
	d ..OpenOutputOPEFile()
	s %LogLine=" " d ..WriteLogFile(%LogLine)
	s p=$o(^CHUBXL.DIAMICTMPOPE(%ptSEJ_"                    "))
	while $p(p,":",1)=%ptSEJ {
		s %LineOut=^CHUBXL.DIAMICTMPOPE(p)
		// Test if we have to fill the correct Simed %sqlus
		i $p(p,">",2) = "????" {
			s %findUS=0
			s DTOPE = $p($p(p,":",2)_":"_$p(p,":",3),">",1)
			s DTOPE = $tr(DTOPE,":","")
			s DTOPE = $tr(DTOPE," ","")
			// Find entry in ^CHUBXL.DIAMICTMPOPE
			s %ft=$o(^CHUBXL.DIAMICTMPOPE(p),-1)
			s $p(%ft,">",2)="????"
			s %ftORI=%ft
			// Find next in ^CHUBXL.DIAMICTMPLOG
			s DTNEXT = "999912312359"
			s %ft=$o(^CHUBXL.DIAMICTMPLOG(%ft))
			i ((%ft '= "") & ($p(%ft,":",1)=%ptSEJ)) {
				s DTNEXT = $p($p(%ft,":",2)_":"_$p(%ft,":",3),">",1)
				s DTNEXT = $tr(DTNEXT,":","")
				s DTNEXT = $tr(DTNEXT," ","")
			}
			// Test if we have to loop forward or backward
			if (DTOPE >= DTNEXT) {
				d ..OpeLoopForward()
			} else {
				d ..OpeLoopBackward()
			}
		}
		d ..WriteOutputOPEFile()
		s %LogLine="=>RHM : "_%LineOut d ..WriteLogFile(%LogLine)
		s p=$o(^CHUBXL.DIAMICTMPOPE(p))
	}
	d ..CloseOutputOPEFile()
	Quit $$$OK
}

/// OPE - Loop Forward for %sqlus
ClassMethod OpeLoopForward() As %Status
{
	;%w "loop forward",!
	while ((%ft'= "") & (%findUS=0)& ($p(%ft,":",1)=%ptSEJ)) {
		i $p(%ft,">",2) '= "????" {
			s %ftUS = $p(%ft,">",2)
			s $p(%LineOut,",",8) = %g_%ftUS_%g
			s %findUS=1
		}
		Else {
			s %ft=$o(^CHUBXL.DIAMICTMPLOG(%ft))
		}
	}	
	Quit $$$OK
}

/// OPE - Loop Backward for %sqlus
ClassMethod OpeLoopBackward() As %Status
{
	;%w "loop backward",!
	s %ft=$o(^CHUBXL.DIAMICTMPLOG(%ftORI),-1)
	i ((%ft="") ! ($p(%ft,":",1)'=%ptSEJ)) {
		s %ft=%ftORI
		d ..OpeLoopForward()
	} else {
		while ((%ft'= "") & (%findUS=0) & ($p(%ft,":",1)=%ptSEJ)) {
			i $p(%ft,">",2) '= "????" {
				s %ftUS = $p(%ft,">",2)
				s $p(%LineOut,",",8) = %g_%ftUS_%g
				s %findUS=1
			}
			Else {
				s %ft=$o(^CHUBXL.DIAMICTMPLOG(%ft),-1)
			}
		}		
	}
	// if nothing found go forward (exception = due to encoding errors)
	i %findUS=0 { 
		s %ft=%ftORI
		d ..OpeLoopForward()
	}
	Quit $$$OK
}

/// SQL - Header 
ClassMethod SqlHeader() As %Status
{
    s %rsDB = ##class(%Library.ResultSet).%New()
	Quit $$$OK
}

/// SQL - Footer
ClassMethod SqlFooter() As %Status
{
    ;i %pMODE = "T" write %qDB,!
    
    s %LogLine=""
    s %LogLine=%LogLine_$zdt($h,4)_" "_%NameBase
    s %LogLine=%LogLine_" SQL : "
 	s %LogLine=%LogLine_%qDB
 	d ..WriteLogFile(%LogLine)
	d ..WriteGlobalLogLine(%LogLine) 	
 	i %pMODE = "T" write !,"Execute Sqlquery ...",!
    s status=%rsDB.Prepare(%qDB)
    s status=%rsDB.Execute()
    i (status '= 1) {
		WRITE !,"SELECT failed, status=",status
		Do DisplayError^%apiOBJ(status) Quit $$$ISERR(status)
	}
	i %pMODE = "T" write !,"Process Recordset ...",!
    
	Quit $$$OK
}

/// SQL - Get Data in Memory
ClassMethod SqlData() As %Status
{
	s %LineIn = ""
	s %LineInT = ""
	f i=1:1:%rsDB.GetColumnCount() {
		s x=%rsDB.GetColumnName(i)
		s y="%sql"_$tr(x,"_","")
		s @y = %rsDB.Data(x)
	    s %LineIn = %LineIn_@y_"~"	
	    s %LineInT = %LineInT_x_"~"
	}
	Quit $$$OK
}

/// SQL - Header
ClassMethod SqlHeader2() As %Status
{
	s %rsDB2 = ##class(%Library.ResultSet).%New()
	Quit $$$OK
}

/// SQL - Footer
ClassMethod SqlFooter2() As %Status
{
    s status=%rsDB2.Prepare(%qDB2)
    s status=%rsDB2.Execute()
    i (status '= 1) {
		WRITE !,"SELECT failed, status=",status
		Do DisplayError^%apiOBJ(status) Quit $$$ISERR(status)
	}
	Quit $$$OK
}

/// SQL - Get Data in Memory
ClassMethod SqlData2() As %Status
{
	f i=1:1:%rsDB2.GetColumnCount() {
		s x=%rsDB2.GetColumnName(i)
		s y="%sql"_$tr(x,"_","")
		s @y = %rsDB2.Data(x)
	}
	Quit $$$OK
}

/// GLOBAL - Init Global
ClassMethod SetGlobal() As %Status
{
	i $g(^CHUBXL.DIAMIC(2,0)) = "" s ^CHUBXL.DIAMIC(2,0)=0
	s ^CHUBXL.DIAMIC(2,0) = ^CHUBXL.DIAMIC(2,0)+1
	s %SEQ = $tr($j(^CHUBXL.DIAMIC(2,0),5)," ","0")
  	s %NameBase = %pPROC_"_"_%SEQ_"_2_"_%pDDEB_"_"_%pDFIN_"_"_%pMODE
	s %FileNameBase = %pDIR_%NameBase
    s %S1 = ^CHUBXL.DIAMIC(2,0)
    k ^CHUBXL.DIAMIC(2,%S1)
    s ^CHUBXL.DIAMIC(2,%S1)=$H
    s ^CHUBXL.DIAMIC(2,%S1,0,"SQL")=""
    s ^CHUBXL.DIAMIC(2,%S1,0,"LOG")=""
    s ^CHUBXL.DIAMIC(2,%S1,0,"FIL")=%NameBase
    s ^CHUBXL.DIAMIC(2,%S1,0,"FIL")=%FileNameBase
    s ^CHUBXL.DIAMIC(2,%S1,1,0)=0
	Quit $$$OK
}

/// GLOBAL - Write Line to Global
ClassMethod WriteGlobalLine() As %Status
{
	l ^CHUBXL.DIAMIC(2,%S1,1,0)
	s ptr=^CHUBXL.DIAMIC(2,%S1,1,0)
	s ptr=ptr+1
	s ^CHUBXL.DIAMIC(2,%S1,1,"IN",ptr)=$g(%LineIn)
	s ^CHUBXL.DIAMIC(2,%S1,1,"OUT",ptr)=$g(%LineOut)
	s ^CHUBXL.DIAMIC(2,%S1,1,0)=ptr
	l
	i %pMODE = "T" write "-"
	Quit $$$OK
}

/// GLOBAL - Write LogLine to Global
ClassMethod WriteGlobalLogLine(%LogLine As %String) As %Status
{
	i '$d(^CHUBXL.DIAMIC("LOG",0)) s ^CHUBXL.DIAMIC("LOG",0)="0"
	l ^CHUBXL.DIAMIC("LOG",0)
	s ptr=^CHUBXL.DIAMIC("LOG",0)
	s ptr=ptr+1
	s ^CHUBXL.DIAMIC("LOG",ptr)=%LogLine
	s ^CHUBXL.DIAMIC("LOG",0)=ptr
	l
	Quit $$$OK
}

/// GLOBAL - List Global
ClassMethod ListGlobal() As %Status
{
 	s x=$o(^CHUBXL.DIAMIC(2,%S1,1,"OUT",0))
	while (x '= "") {
		w ^CHUBXL.DIAMIC(2,%S1,1,"OUT",x),!
		s x=$o(^CHUBXL.DIAMIC(2,%S1,1,"OUT",x))
	}
	Quit $$$OK
}

/// GLOBAL - Purge Global Log ^CHUBXL.DIAMIC 
ClassMethod Purge(pnhop As %String, pdays As %String, pmode As %String) As %Status
{
	if pmode="T" w "Start Purge",!
	i $d(^CHUBXL.DIAMIC) {
	s i=^CHUBXL.DIAMIC(pnhop,0)
	While (($g(^CHUBXL.DIAMIC(pnhop,i)) '= "" ) & (i '= 0 )){
		i (($p($h,",",1) - $p(^CHUBXL.DIAMIC(pnhop,i),",",1)) > pdays ) {
			if pmode ="T" w !,i," ",^CHUBXL.DIAMIC(pnhop,i)," ",$zd(^CHUBXL.DIAMIC(pnhop,i),3)," ",$h," ",$zd($h,3)," ",($p($h,",",1) - $p(^CHUBXL.DIAMIC(pnhop,i),",",1))," => Purge"
			k ^CHUBXL.DIAMIC(pnhop,i)
		}
		Else {
			w "."
			}
		s i=i-1
	}
	}
	Quit $$$OK
}

/// STANDARD Output File - Open
ClassMethod OpenOutputFile() As %Status
{
    s FileName = %FileNameBase_".txt"
    i %pTYP=1 s FileName = %FileNameBase_".csv"
	;i %pMODE = "T" write "FileName : "_FileName,!    
    If ##class(%Library.File).Exists(FileName) {
	    d ##class(%Library.File).Delete(FileName)
    }
	s %OutputFile = ##class(%File).%New(FileName)
	d %OutputFile.Open("WSN")
    i %pTYP=0 s FileName = %FileNameBase_"_Prot.txt"
    i %pTYP=1 s FileName = $p(%FileNameBase,"\",1,$l(%FileNameBase,"\")-1)_"_Protocol\"_$p(%FileNameBase,"\",$l(%FileNameBase,"\"))_"_Prot.txt" ;$p(%FileNameBase,"\",1,$l(%FileNameBase,"\")-1)_"_Prot.txt"
	;i %pMODE = "T" write "FileName : "_FileName,!    
    If ##class(%Library.File).Exists(FileName) {
	    d ##class(%Library.File).Delete(FileName)
    }
	s %OutputFile1 = ##class(%File).%New(FileName)
	d %OutputFile1.Open("WSN")	Quit $$$OK
}

/// STANDARD Output File - Write
ClassMethod WriteOutputFile() As %Status
{
	i %pMODE = "T" write !,"Writing to file ...",!
	d ..OpenOutputFile()
	i %pPROC="Col",%pTYP=1 {
	  s %LineOut = "patient_id;patient_id|internal_patient_id;patient_id|generated;patient_id|name;patient_id|first_name;patient_id|date_of_birth;patient_id|sex;patient_id|place_of_residence;patient_id|deceased;patient_id|date_of_death;country_of_residence;specimen_number;date_specimen_was_taken;requesting_hospital;rizivinami_number_of_the_applicant_of_the_test;quality_of_the_specimen;diagnostic_procedure;organ;lesion;degree_of_certainty_about_lesion_code;hpv_high_risk_test_results;hpv_high_risk_types_detected;nomenclature_numbers"
	  d %OutputFile.WriteLine(%LineOut)
    }
	i %pPROC="Sein",%pTYP=1 {
	  s %LineOut = "patient_id;patient_id|internal_patient_id;patient_id|generated;patient_id|name;patient_id|first_name;patient_id|date_of_birth;patient_id|sex;patient_id|place_of_residence;patient_id|deceased;patient_id|date_of_death;country_of_residence;specimen_number;date_specimen_was_taken;requesting_hospital;rizivinami_number_of_the_applicant_of_the_test;diagnostic_procedure;organ;laterality;lesion;degree_of_certainty_about_lesion_code;nomenclature_numbers"
	  d %OutputFile.WriteLine(%LineOut)
    }
	i %pPROC="Colon",%pTYP=1 {
	  s %LineOut = "patient_id;patient_id|internal_patient_id;patient_id|generated;patient_id|name;patient_id|first_name;patient_id|date_of_birth;patient_id|sex;patient_id|place_of_residence;patient_id|deceased;patient_id|date_of_death;country_of_residence;specimen_number;date_specimen_was_taken;requesting_hospital;rizivinami_number_of_the_applicant_of_the_test;diagnostic_procedure;organ;laterality;lesion;degree_of_certainty_about_lesion_code;nomenclature_numbers"
	  d %OutputFile.WriteLine(%LineOut)
    }
	i %pPROC="Cancer",%pTYP=1 {
	  s %LineOut = "patient_id;patient_id|internal_patient_id;patient_id|generated;patient_id|name;patient_id|first_name;patient_id|date_of_birth;patient_id|sex;patient_id|place_of_residence;patient_id|deceased;patient_id|date_of_death;country_of_residence;specimen_number;date_specimen_was_taken;requesting_hospital;diagnostic_procedure;organ;laterality;lesion;differentiation_grade;pt;pn;pm;degree_of_certainty_about_lesion_code"
	  d %OutputFile.WriteLine(%LineOut)
    }
	s ptr=$o(^CHUBXL.DIAMIC(2,%S1,1,"OUT",0))
	while (ptr '= "") {
		s pos1=20,pos2=21,Sep=$c(9)
		i %pTYP=1 s pos1=23,pos2=24,Sep=";"
		i %pPROC="Sein" s pos1=18,pos2=19 s:%pTYP=1 pos1=21,pos2=22
		i %pPROC="Colon" s pos1=18,pos2=19 s:%pTYP=1 pos1=21,pos2=22
		s %LineOut = $p(^CHUBXL.DIAMIC(2,%S1,1,"OUT",ptr),Sep,1,pos1)
		d %OutputFile.WriteLine(%LineOut)
		s %LineOut = $p(^CHUBXL.DIAMIC(2,%S1,1,"OUT",ptr),Sep,pos2)
		d %OutputFile1.WriteLine(%LineOut)
		i %pMODE = "T" write "."  		
		s ptr=$o(^CHUBXL.DIAMIC(2,%S1,1,"OUT",ptr))
	}
	d ..CloseOutputFile()
	Quit $$$OK
}

/// STANDARD Output File - Close
ClassMethod CloseOutputFile() As %Status
{
	d %OutputFile.%Close()
	k %OutputFile     
	d %OutputFile1.%Close()
	k %OutputFile1 
	Quit $$$OK
}

/// OPE Output File - Open
ClassMethod OpenOutputOPEFile() As %Status
{
    s FileName = %FileNameBase_".txt"
    i %pTYP=1 s FileName = FileName_".csv"
	s %OutputOPEFile = ##class(%File).%New(FileName)
	d %OutputOPEFile.Open("AWS")
	Quit $$$OK
}

/// OPE Output File - Write
ClassMethod WriteOutputOPEFile() As %Status
{
	d %OutputOPEFile.WriteLine(%LineOut)
	Quit $$$OK
}

/// OPE Output File - Close
ClassMethod CloseOutputOPEFile() As %Status
{
	d %OutputOPEFile.%Close()  
	k %OutputOPEFile  
	Quit $$$OK
}

/// LOG Output File - Open
ClassMethod OpenLogFile() As %Status
{
	i %pLOG '= 1 quit
    s FileName = %FileNameBase_".log"
    If ##class(%Library.File).Exists(FileName) {
	    d ##class(%Library.File).Delete(FileName)
    }
	s %LogFile = ##class(%File).%New(FileName)
	d %LogFile.Open("WSN")	
	Quit $$$OK
}

/// LOG Output File - Write
ClassMethod WriteLogFile(%LogLine As %String) As %Status
{
	i %pLOG = 1 d %LogFile.WriteLine(%LogLine)
	d ..WriteGLogLine(%LogLine)
	Quit $$$OK
}

/// LOG Output File - Close
ClassMethod CloseLogFile() As %Status
{
	i %pLOG = 1 d %LogFile.%Close() 
	k %LogFile 
	Quit $$$OK
}

/// GENERAL LOG Output File - Open
ClassMethod OpenGLogFile() As %Status
{
    s FileName = %pDIR_"Diamic"_"_"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")_".log"
	s %GLogFile = ##class(%File).%New(FileName)
	d %GLogFile.Open("AWS")
	Quit $$$OK
}

/// GENERAL LOG Output File - Write
ClassMethod WriteGLogLine(%GLogLine As %String) As %Status
{
	d %GLogFile.WriteLine(%GLogLine)
	Quit $$$OK
}

/// GENERAL LOG Output File - Close
ClassMethod CloseGLogFile() As %Status
{
	d %GLogFile.%Close()    
	k %GLogFile 
	Quit $$$OK
}

/// FUNCTION to trim spaces (NOT USED !!!!)
ClassMethod SPN(SPE As %String) As %Status
{
    F II=$L(SPE):-1:1 S LET=$E(SPE,II) Q:LET'=" " 
    S SPE=$E(SPE,1,II) 
    ;QUIT SPE
    Quit $$$OK
}

/// SendEmail
/// <example>
/// Set Mailer = ##class(%Net.SMTP).%New()
/// Set Mailer.smtpserver = "CHUBXLMAIL2"
///     
/// Set Msg = ##class(%Net.MailMessage).%New()
/// Set Msg.From="BromineEns2007TEST"
/// Do Msg.To.Insert(Address)
/// Set Msg.Subject = Subject
/// Do Msg.TextData.Write(MessageText)
///     
/// set status=Msg.AttachFile(Dir,FileName,0,"iso-8859-1")
/// if $$$ISERR(status) do $system.OBJ.DisplayError(status) quit
///     
/// set status=Mailer.Send(Msg)
/// if $$$ISERR(status) do $system.OBJ.DisplayError(status)
/// </example>
ClassMethod SendEmail(Address As %String, Subject As %String, MessageText As %String, Dir As %String, FileName As %String)
{
	i %pMODE = "T" write "SendMail ...",!
    Set Mailer = ##class(%Net.SMTP).%New()
    Set Mailer.smtpserver = "smtp.chu-brugmann.be"
    
    Set Msg = ##class(%Net.MailMessage).%New()
    if $p($SYSTEM,":",2) = "ENS2017M" Set Msg.From="ensemble2017BORON@chu-brugmann.be"
    Do Msg.To.Insert(Address)
    Set Msg.Subject = Subject
    Do Msg.TextData.Write(MessageText)
    
    If Dir '= "" {
    	Set status=Msg.AttachFile(Dir,FileName,0,"iso-8859-1")
    	if $$$ISERR(status) do $system.OBJ.DisplayError(status) quit
    }
    
    set status=Mailer.Send(Msg)
	if $$$ISERR(status) do $system.OBJ.DisplayError(status) quit

	i %pMODE = "T" write "Mail Sent",!
    Quit $$$OK
}

}
