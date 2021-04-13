Class CHUBXL.BATCH.Utils Extends %RegisteredObject [ ClassType = "", ProcedureBlock ]
{

ClassMethod RenFile() As %Status
{
	Set tRS=##class(%ResultSet).%New("%Library.File:FileSet")
    Set tSC=tRS.Execute("t:\EXPORT\TEST\PROD","*.*")

    While tRS.Next() {
	    s DirLev1=tRS.Get("Name")_"\archive"
		Set tRS1=##class(%ResultSet).%New("%Library.File:FileSet")
    	Set tSC=tRS1.Execute(DirLev1,"*.*")
	    w !,DirLev1
    	While tRS1.Next() {
	    	s DirLev2=tRS1.Get("Name")
	    	w !,DirLev2
	    	i $e(DirLev2,1)="T" w " - ok" ;d ##class(CHUBXL.Utils.Cleaner).cleanDirectory(25,DirLev2)
		}
		s DirLev1=tRS.Get("Name")_"\out"
		Set tRS1=##class(%ResultSet).%New("%Library.File:FileSet")
    	Set tSC=tRS1.Execute(DirLev1,"*.*")
	    w !,DirLev1
    	While tRS1.Next() {
	    	s DirLev2=tRS1.Get("Name")
   			Set tRS2=##class(%ResultSet).%New("%Library.File:FileSet")
	    	Set tSC=tRS2.Execute(DirLev2,"*.*")
	    	While tRS2.Next() {
		    	s DirLev3=tRS2.Get("Name")
		    	w !,DirLev3
		    	i $e(DirLev3,1)="T" w " - ok" ;d ##class(CHUBXL.Utils.Cleaner).cleanDirectory(25,DirLev3)
			}
		}
	}
	
	Q $$$OK
}

ClassMethod CtrlWish() As %Status
{
	k ^CHUBXL.dulio,^CHUBXL.dulio1
	Set tRS=##class(%ResultSet).%New("%Library.File:FileSet")
    Set tSC=tRS.Execute("G:\PROD\Wish\archive\","*.*"),OldCptLine=0,OldDir=""

    While tRS.Next() {
	    s DirLev1=tRS.Get("Name")
		Set tRS1=##class(%ResultSet).%New("%Library.File:FileSet")
    	Set tSC=tRS1.Execute(DirLev1,"*.*")
	    ;w !,DirLev1
	    i OldDir'=$p(DirLev1,"\",5) s OldCptLine=0 w !,"***"_OldDir_"***"_$p(DirLev1,"\",5)_"***",! s OldDir=$p(DirLev1,"\",5)
    	While tRS1.Next() {
	    	s DirLev2=tRS1.Get("Name"),NbrFile=0
	    	w !,DirLev2
	    	Set stream=##class(%FileCharacterStream).%New()
			Set stream.Filename=DirLev2
	
			While 'stream.AtEnd {
				Set line=stream.ReadLine()
				i line["MSH|" {
				  ;w line,!
				  s CptLine=+$p(line,"|",10)
				  i (OldCptLine'=0) & ((CptLine)'=(OldCptLine+1)) s ^CHUBXL.dulio(DirLev2,CptLine)="",NbrFile=NbrFile+1
				  i (CptLine'=0)  s ^CHUBXL.dulio1(DirLev2,CptLine)=$g(^CHUBXL.dulio1(DirLev2,CptLine))+1
				  s OldCptLine=CptLine
				}
			}
			s ^CHUBXL.dulio(DirLev2,0)=NbrFile w " - ",$j(NbrFile,4)
		}
	}
	s File="" f  s File=$o(^CHUBXL.dulio1(File)) q:File=""  d
	. s ok=0,olg=""
    . s lg="" f  s lg=$o(^CHUBXL.dulio1(File,lg)) q:lg=""  d
    .. i ok,olg=lg+1,+^CHUBXL.dulio1(File,lg)=1 k ^CHUBXL.dulio1(File,olg) s olg=lg
    .. i 'ok s olg=lg,ok=1
    . i ok,+^CHUBXL.dulio1(File,olg)=1 k ^CHUBXL.dulio1(File,olg) s olg=lg
    
    s File="" f  s File=$o(^CHUBXL.dulio1(File)) q:File=""  d
    . s lg="" f  s lg=$o(^CHUBXL.dulio1(File,lg)) q:lg=""  d
    .. i ^CHUBXL.dulio1(File,lg)=1 w File," - ",lg,!

	Q $$$OK
}

ClassMethod WSTest(Type) As %Status
{
 i '$d(^CHUBXL.DentAdminWS(0)) s ^CHUBXL.DentAdminWS(0)=0
 s ^CHUBXL.DentAdminWS(0)=^CHUBXL.DentAdminWS(0)+1,Seq=^CHUBXL.DentAdminWS(0)
 i $tr($g(Type)," ")="" s Type="PR"
 w Seq,!
 i Type= "PR" {
	s ^CHUBXL.DentAdminWS(Seq,Type,"PMNSEJ")=251523035
 	s ^CHUBXL.DentAdminWS(Seq,Type,"PMMRN")=201011012
 	s ^CHUBXL.DentAdminWS(Seq,Type,"PMDPSD")=20190515
 	s ^CHUBXL.DentAdminWS(Seq,Type,"PMCAMI")=301011
 	s ^CHUBXL.DentAdminWS(Seq,Type,"PMCLI4")=8400
 	s ^CHUBXL.DentAdminWS(Seq,Type,"PMNRPR")=316204
 	s ^CHUBXL.DentAdminWS(Seq,Type,"PMCLM")=""
 	s ^CHUBXL.DentAdminWS(Seq,Type,"PMSLM")=""
 	s ^CHUBXL.DentAdminWS(Seq,Type,"PMUSER")="DENTADMIN"
 	s ^CHUBXL.DentAdminWS(Seq,Type,"PMAPI")="TR008"
 	s ^CHUBXL.DentAdminWS(Seq,Type,"PMTBPE")=3050,^CHUBXL.DentAdminWS(Seq,Type,"PMOSUE")=1235
 	}
 else {
	s ^CHUBXL.DentAdminWS(Seq,Type,"PMNSEJ")=251523035
 	s ^CHUBXL.DentAdminWS(Seq,Type,"PMMRN")=201011012
 	s ^CHUBXL.DentAdminWS(Seq,Type,"PMUSER")="DENTADMIN"
 	s ^CHUBXL.DentAdminWS(Seq,Type,"PMAPI")="TR008"
 	s ^CHUBXL.DentAdminWS(Seq,Type,"PMFRJO")=1
 	s ^CHUBXL.DentAdminWS(Seq,Type,"PMCETF")="Q"
  	}
 s x=##class(CHUBXL.BATCH.Utils).WSDentAdmin(Seq,Type)
 w x,!
 ;k ^CHUBXL.DentAdminWS(Seq)
 Q x
}

ClassMethod WSDentAdmin(Seq, Type, Valeur) As %Status
{
 s Pos="",Record=""
 s Pos=$o(^CHUBXL.DentAdminWS(Type,Pos))
 while Pos'="" {
	s Var=""
	s Var=$o(^CHUBXL.DentAdminWS(Type,Pos,Var))
	while Var'="" {
		s rec=^CHUBXL.DentAdminWS(Type,Pos,Var)
		s TypVar=$p(rec,"~",1)
		s Lg=$p(rec,"~",2)
		s Val=$p(rec,"~",3)
		;i Valeur[Var {
		;  s Val=$p($p($p(Valeur,Var,2),"=",2),"~",1)
		;}
		s Val=$g(^CHUBXL.DentAdminWS(Seq,Type,Var))
		i TypVar="N" s Val=$$NUM(Val,Lg) ;w !,Val,!
		i TypVar="A" s Val=$$ALPHA(Val,Lg) ;w !,Val,"*",!
		s Var=$o(^CHUBXL.DentAdminWS(Type,Pos,Var))
		s Record=Record_Val
	}
	s Pos=$o(^CHUBXL.DentAdminWS(Type,Pos))
 }
 Q Record
 
NUM(var,lg) ;
 Q $TR($J(var,lg)," ","0")

ALPHA(var,lg) ;
 Q $e(var_$j("",lg),1,lg)
}

ClassMethod ReadFile() As %Status
{
	Set tRS=##class(%ResultSet).%New("%Library.File:FileSet"),w="~",NbLg=1
    Set tSC=tRS.Execute("G:\PROD\Diamic\archive\All\","Edit6.TXT"),OldCptLine=0,OldDir=""
	k ^CHUBXL.dulio0,^CHUBXL.dulio1
    While tRS.Next() {
	    s DirLev1=tRS.Get("Name")
    	w !,DirLev1
	    Set stream=##class(%FileCharacterStream).%New()
		Set stream.Filename=DirLev1
		While 'stream.AtEnd {
			Set line=stream.ReadLine()
			s line=$tr(line,$c(9),"~")
			s ^CHUBXL.dulio1(line)=""
			;i $e(line,1,3)="OBR" {
			;	s NumDos=$p($p(line,"|",4),"^",1)
			;	;'="" w !,"21 - ",$p(line,"|",21)
			;	s ^CHUBXL.dulio0(NumDos)=""
			;}
			;w line,!
			;s Code=$p(line,w,1),Type=$e($p(line,w,5),1),Lg=$p(line,w,3)
			;w Code," - ",Type," - ",Lg,!
			;i $tr($p(line,w,1)," ")'="" s ^CHUBXL.DentAdminWS("PR",NbLg,Code)=Type_w_Lg_w_w_line,NbLg=NbLg+1
		}
	}
	;s x=##class(CHUBXL.BATCH.Utils).ReadFile1()
	Q $$$OK
}

ClassMethod CtrlDiamic(Dte) As %Status
{
	k ^CHUBXL.dulio0,^CHUBXL.dulio1
	i $tr(Dte," ")="" s Dte=$tr($zd($h-1,3),"-")
	w Dte,!
	s %rsDB = ##class(%Library.ResultSet).%New()
	s %qDB = ""
    s %qDB = %qDB_"SELECT NUDDEEXT FROM CHUBXL_DB_DIAMIC.DEMANDE where (to_char(datenreg,'YYYYMMDD')='"_Dte_"' or "
    s %qDB = %qDB_"to_char(datrepdde,'YYYYMMDD')='"_Dte_"') and nusih=5 order by 1"
    s status=%rsDB.Prepare(%qDB)
    s status=%rsDB.Execute()
    i (status '= 1) {
		WRITE !,"SELECT failed, status=",status
		Do DisplayError^%apiOBJ(status) Quit $$$ISERR(status)
	}
    While %rsDB.Next() {
	    s NoDem=%rsDB.Get("NUDDEEXT")
		s ^CHUBXL.dulio1(NoDem)=""
	}
	Set tRS=##class(%ResultSet).%New("%Library.File:FileSet"),w="~",NbLg=1
    Set tSC=tRS.Execute("G:\PROD\Diamic\archive\All\"_Dte,"*.hl7"),OldCptLine=0,OldDir=""
    While tRS.Next() {
	    s DirLev1=tRS.Get("Name")
	    Set stream=##class(%FileCharacterStream).%New()
		Set stream.Filename=DirLev1
		While 'stream.AtEnd {
			Set line=stream.ReadLine()
			s line=$tr(line,$c(9),"~")
			i $e(line,1,3)="OBR" {
				s NumDos=$p($p(line,"|",4),"^",1)
				s ^CHUBXL.dulio0(NumDos)=""
			}
		}
	}
	s n=0,t=""
	s MsgSend="Bonjour Dulio," _$c(13)_$C(10)_$c(13)_$C(10)_"Tu trouveras ci-joint la liste des demandes 'Diamic' "
	s MsgSend=MsgSend_"qui n'ont pas été envoyées vers 'Bdoc' pour la date du "
	s MsgSend=MsgSend_$e(Dte,7,8)_"/"_$e(Dte,5,6)_"/"_$e(Dte,1,4)_$c(13)_$C(10)_$c(13)_$C(10)
	s MsgSend=MsgSend_"Bonne journée"_$c(13)_$C(10)_$c(13)_$C(10)
	s MsgSend0="Bonjour Dulio," _$c(13)_$C(10)_$c(13)_$C(10)_"Toutes les demandes 'Diamic' "
	s MsgSend0=MsgSend0_"du "_$e(Dte,7,8)_"/"_$e(Dte,5,6)_"/"_$e(Dte,1,4)
	s MsgSend0=MsgSend0_" ont bien été envoyées vers 'Bdoc'"_$c(13)_$C(10)_$c(13)_$C(10)
	s MsgSend0=MsgSend0_"Bonne journée"_$c(13)_$C(10)_$c(13)_$C(10)
	s MsgSend1=""
	f  s t=$o(^CHUBXL.dulio1(t)) q:t=""  i '$d(^CHUBXL.dulio0(t)) w !,t s MsgSend1=MsgSend1_t_$c(13)_$C(10)
		
	s AllMsgSend=MsgSend0
	i MsgSend1'="" s AllMsgSend=MsgSend_MsgSend1
	Set Mailer = ##class(%Net.SMTP).%New()
	Set Mailer.smtpserver = "smtp.chu-brugmann.be"
	Set Msg = ##class(%Net.MailMessage).%New()
	if $p($SYSTEM,":",2) = "ENS2017PREP" Set Msg.From="Ensemble2017Boron01PREP@chu-brugmann.be"
	if $p($SYSTEM,":",2) = "ENS2017TEST" Set Msg.From="Ensemble2017Boron02TEST@chu-brugmann.be"
	if $p($SYSTEM,":",2) = "ENS2017M" Set Msg.From="Ensemble2017Boron01PROD@chu-brugmann.be"
	Do Msg.To.Insert("dulio.ambrogetti@chu-brugmann.be")
	Set Msg.Subject = "Demande 'Diamic' non envoyées vers 'Bdoc'"
	Do Msg.TextData.Write(AllMsgSend)
	set status=Mailer.Send(Msg)
	if $$$ISERR(status) do $system.OBJ.DisplayError(status) quit
    
	Q $$$OK
}

ClassMethod XStat(ID) As %Status
{
	set rs=##class(%Library.ResultSet).%New()
	set SQL="SELECT R.ID , Xml FROM CHUBXL_DB_XSTATBR.SpecNote R WHERE ID = '"_ID_"'"
	Set st=rs.Prepare(SQL)
	
	Do rs.Execute()
	
	s i=0	
	while (rs.Next() '= 0) {
		s out=""
		s out=out_"ID : "_$get(rs.Data("ID"))_$c(13)_$c(10)
		s out=out_"XML : "_$get(rs.Data("Xml"))
		s out=out_" "_$get(rs.Data("Xml")).Size_" length"
		w out,!
		
		s pID=$get(rs.Data("ID")),Xml=$get(rs.Data("Xml"))
		w "--- Start of Text ---",!
		;While ('Xml.AtEnd) {
		;Set line=Xml.ReadLine()
		;if line '= "" {
			;w line,!
		;}
		;}
		s Message=Xml.Read()
		w "Mesage : ",Message,!,"Longueur : ",$l(Message),!
		w "--- End of Text ---",!
		
	}
	
	Do rs.Close()
	Kill rs
	Q $$$OK
}

}
