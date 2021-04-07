Class CHUBXL.DT.Utils Extends %RegisteredObject [ ClassType = "", ProcedureBlock ]
{

/// Renvoie le SendingApplication pour Dbmotion 
ClassMethod getSendingApplicationFromNHop(pNHop As %String = "") As %String
{
	q $Case(+(pNHop),25:"HSP_ADT_SNI",26:"HBR_ADT_SNI",27:"HUD_ADT_SNI",31:"BOR_ADT_SNI",10:"HIS_ADT_SNI",:"Other_ADT_SNI")
}

/// Renvoie le ReceivingFacility pour Dbmotion
ClassMethod getReceivingFacilityFromNHop(pNHop As %String = "") As %String
{
	q $Case(+(pNHop),25:"DBM_HSP",26:"DBM_HBR",27:"DBM_HUD",31:"DBM_BOR",10:"DBM_HIS",:"DBM_Other")
}

/// Renvoie le MultipleBirthIndicator pour Dbmotion
ClassMethod getMultipleBirthIndicator(pName As %String = "") As %String
{
	q $case(pName,"F":"Y","F I":"Y","F-I":"Y","F-II":"Y","F-III":"Y","F-V":"Y","FILLE":"Y","FILLE I":"Y","FILLE II":"Y","FILLE-I":"Y","G":"Y","G I":"Y","G-I":"Y","G-II":"Y","G-III":"Y","G-IV":"Y","G-V":"Y","G-VI":"Y","GARCON":"Y","GARCON 2":"Y","GARCON DEUX":"Y","GARCON I":"Y","GARCON II":"Y","GARCON UN":"Y","GARçON UN":"Y","GARçON DEUX":"Y","GARçON I":"Y","GARçON II":"Y","GARçON III":"Y","GARçON IV":"Y","GARçON V":"Y","GARçON":"Y","J I":"Y","J-I":"Y","J-II":"Y","J-III":"Y","J-IV":"Y","J-V":"Y","JONGEN":"Y","M I":"Y","M-I":"Y","M-II":"Y","M-III":"Y","M-IV":"Y","M-V":"Y","MEISJE":"Y",:"N")
}

/// Get Inami number with length of 11
ClassMethod getMedecinInami(pInami As %String = "") As %String
{
	if ($l(+pInami) '= 6) s OUT="00000000000"
	if ($l(+pInami) = 6) s OUT=$p($g(^CHUBXL.MEDECIN(+pInami)),"~",1)
	if OUT="" s OUT=+pInami
	;q "NMED L="_$l(pInami)_"~N="_+pInami_"~OUT="_OUT
	q OUT
}

/// Détermination du type de message HL7 en sortie en fonction du type de mouvement 
/// sibelmed ( PATH )
/// 
ClassMethod getHL7TypeFromTYPMVT(pTypMvt As %String) As %String
{
	q:(pTypMvt="A") "ADT^01"
	q:(pTypMvt="X") "ADT^03"
	q:((pTypMvt="T")||(pTypMvt="W")||(pTypMvt="R")) "ADT^02"
	q ""
}

ClassMethod getHL7SexFromSEXE(pSexe As %String = "") As %String
{
	q $Case(pSexe,0:"F",1:"M",2:"U",:"U")
}

ClassMethod getMTSexFromSEXE(pSexe As %String = "") As %String
{
	q $Case(pSexe,0:"2",1:"1",2:"0",:"0")
}

ClassMethod getOmniproResultStatus(pStatus As %String = "") As %String
{
	q $Case(pStatus,"P":"P","D":"F",:"F")
}

ClassMethod getNewUnitInfohos(pUnit As %String = "") As %String
{
	i $tr(pUnit," ")="" q pUnit
	i '$d(^CHUBXL.CONVERUNIT(pUnit)) q pUnit
	s NewUnit=$p(^CHUBXL.CONVERUNIT(pUnit),"~",1)
	q NewUnit
}

/// Renvoie le n° d'hôpital pour le médico tech.
ClassMethod getMTNHopFromNHop(pNHop As %String = "") As %String
{
	q $Case(+(pNHop),25:"01",26:"02",27:"08",:"02")
}

// ClassMethod encodeBase64Stream(pInStream As %BinaryStream) As %GlobalCharacterStream

/// Renvoie le contenu du stream passé en paramètre encode en base64
ClassMethod encodeBase64Stream(pInStream As %BinaryStream) As %GlobalBinaryStream
{
	;s result=##class(%GlobalCharacterStream).%New()
	s result=##class(%GlobalBinaryStream).%New()
	d pInStream.Rewind()
	while('pInStream.AtEnd) {
		d result.Write($system.Encryption.Base64Encode(pInStream.Read(4000)))
	}
	q result
}

/// Renvoie le contenu du stream passé en paramètre encode en base64
/// mais pour Quadrat seulement.....
ClassMethod encodeBase64StreamForQuadrat(pInStream As %BinaryStream) As %GlobalBinaryStream
{
	;s result=##class(%GlobalCharacterStream).%New()
	s result=##class(%GlobalBinaryStream).%New()
	d pInStream.Rewind()
	d result.Write("^AP^^Base64^")
	while('pInStream.AtEnd) {
		;d result.Write($system.Encryption.Base64Encode(..fixStringForQuadrat(pInStream.Read(4000))))
		d result.Write(..fixStringForQuadrat($system.Encryption.Base64Encode(pInStream.Read(4000))))
		;d result.Write($system.Encryption.Base64Encode(pInStream.Read(4000)))
	}
	q result
}

/// "Fix" pour Quadrat
/// Retire les "\n" et "\r" des chaînes de caractères et les remplace par un blanc
ClassMethod fixStringForQuadrat(pStr As %String) As %String
{
	q $TR($TR(pStr,$C(10)," "),$C(13)," ")
}

/// Ecrit un stream dans un segment HL7
ClassMethod pushStreamIntoHL7(pHl7Msg As EnsLib.HL7.Message, pInStream As %BinaryStream, pSegmentName As %String, pStatus As %String) As %Status
{
	d pHl7Msg.%Save()	; has to save or no id for segment
	Set id=pHl7Msg.GetSegmentAt(pSegmentName).ID	
	q:(id="") $$$ERROR("CannotGetSegment")
	d pInStream.Rewind()
	s i=0
	while ('pInStream.AtEnd) {
		Set buffer=pInStream.Read(32000)
		Set ^EnsHL7.Segment(id,$i(i))=buffer
	}
	Set ^EnsHL7.Segment(id,$i(i))="||||||"_pStatus
	q $$$OK
}

ClassMethod omniproDoObservationValue(pHl7Msg As EnsLib.HL7.Message, pObservationValue As %BinaryStream, pStatus As %String) As %Status
{
	; before encoding - Translate \r to \n !!!!????
	s base64Stream=..encodeBase64StreamForQuadrat(pObservationValue)
	q ..pushStreamIntoHL7(pHl7Msg,base64Stream,"PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX",$Case(pStatus,"P":"P","D":"F",:"F"))
	//q ..pushStreamIntoHL7(pHl7Msg,pObservationValue,"PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX")
}

ClassMethod ConvertProtocole(msg As %GlobalCharacterStream) As %GlobalCharacterStream
{
	Set stream=##class(%GlobalCharacterStream).%New()
	d msg.Rewind()
	While 'msg.AtEnd {
		s line=msg.Read()
		s line=##class(Ens.Util.FunctionSet).ReplaceStr(line,"&lt;","<")
		s line=##class(Ens.Util.FunctionSet).ReplaceStr(line,"&gt;",">")
		s line=##class(Ens.Util.FunctionSet).ReplaceStr(line,"&amp;","&")
		d stream.Write(line)
	}
	d stream.%Save()
		
	quit stream
}

ClassMethod CtrlUnite(unite As %String) As %String
{
	s ok=0
	s rec="~097~098~099~AMB~BG1~BG2~CJR~DCH~U80~DIA~ZCV~P40~P41~P42~P43~P44~P46~"
	s rec=rec_"P48~C04~D13~U15~D26~D28~ZCV~CO~HPO~MCV~UODC~UODM~UODS~C03~C09~D99~UJS~UJC~"
	s rec=rec_"UJM~HP~M00~M37~M38~MCV~D27~U28~G31~U27~C07~UMB~S15~S16~UODG~U97~U98~"
	s rec=rec_"U99~HCV~D20~D25~CTR~C05~D21~UMF~UGAS~UODE~UAGA~UGOD~BHC1~BHC2~"
	s rec=rec_"BHQO~BHQP~BBQO~BBQO~BBQP~HUQO~BHSR~BHSP~BBSR~BBSR~BBSP~HUSR~"
	s rec=rec_"BHQ~BHQ~BBQ~BBQ~BBQ~HUQ~BHS~BHS~BBS~BBS~BBS~HUS~UODU~"
	i rec'[("~"_unite_"~") s ok=1
	quit ok
}

ClassMethod CtrlUniteECare(unite As %String) As %String
{
	s ok=0
	s rec="~U09~U91~21009~75100~75111~75110~75120~85110~21~83~75205~"
	i rec[("~"_unite_"~") s ok=1
	quit ok
}

ClassMethod CtrlCodeLieu(CodeLieu As %String) As %String
{
	s ok=0
	s rec="~8531~8427~8420~8424~8429~5310~8421~8428~8451~8422~8426~8556~61~8520~8425~3~810~8487~8452~"
	i rec[("~"_CodeLieu_"~") s ok=1
	quit ok
}

ClassMethod getUrgLocHUDERF(cfrais As %String) As %String
{
	s rec="~75054~75300~1521~1523~",loc=""
	i rec[("~"_cfrais_"~") s loc="60U"
	quit loc
}

ClassMethod getMicroMvt(unite As %String) As %String
{
	s rec="~HUQO~HUSR~BHQO~BHSR~BBQO~BBSR~",MicroMvt=""
	i rec[("~"_unite_"~") s MicroMvt="1"
	quit MicroMvt
}

ClassMethod MembrePerso(ndosm As %String) As %String
{
	// use dynamic SQL result set to find person data
	Set query = ##class(%ResultSet).%New("%DynamicQuery:SQL")
	s sql=""
	s sql=sql_"select d.ndosm,d.nom,d.pren,r.reg,b.noa,o.lcourt,r.dfin "
	s sql=sql_"from CHUBXL_DB_informix.dos d "
	s sql=sql_"inner join CHUBXL_DB_informix.reg r on r.nhop=d.nhop and r.ndosm=d.ndosm and (r.dfin is null or r.dfin>current_date) "
	s sql=sql_"inner join CHUBXL_DB_informix.deb b on b.nhop=d.nhop and b.ndosm=d.ndosm and b.sqreg=r.sqreg "
	s sql=sql_"inner join CHUBXL_DB_informix.oa o on o.noa=b.noa "
	s sql=sql_"where r.reg='51' and d.nhop=27 and b.prio=2 and d.ndosm="_ndosm
	s MemPer=0
	Do query.Prepare(sql)
	Do query.Execute()
	
	While (query.Next()) {
		s MemPer=1
	}
	
	Quit MemPer
}

ClassMethod NumMed(nmed As %String) As %String
{
	// use dynamic SQL result set to find person data
	Set query = ##class(%ResultSet).%New("%DynamicQuery:SQL")
	i $g(nmed)="" q ""
	s sql="",NoMed=nmed
	s sql=sql_"select PEO_INAMI_RIZIV_NUMBER as nomed "
	s sql=sql_"from CHUBXL_DB_INFORDB.fmc_people "
	s sql=sql_"where PEO_INAMI_RIZIV_NUMBER like '"_nmed_"%'"
	s NoMed=nmed
	Do query.Prepare(sql)
	Do query.Execute()
	s cpt=0
	While (query.Next()) {
		s NoMed=query.Data("nomed"),cpt=cpt+1
	}
	i cpt>1 s NoMed=nmed
	Quit NoMed
}

ClassMethod SpeCatLib(TypeDoc As %String) As %String
{
	i TypeDoc="" q ""
	s out=""
	i $d(^CHUBXL.ConvArboBDoc(TypeDoc)) s out=^CHUBXL.ConvArboBDoc(TypeDoc)
	q out
}

ClassMethod getWishNHOP(NADM As %String) As %String
{
	s First=$e(NADM,1),NHOP="02"
	i First=8 s NHOP="08"
	q NHOP
}

ClassMethod getCodeMvt(Code As %String) As %String
{
	s CodeMvt="R"
	i Code="ADT^A04" s CodeMvt="R"
	i Code="ADT^A31" s CodeMvt="R"
	i Code="ADT^A08" s CodeMvt="R"
	i Code="ADT^A11" s CodeMvt="D"
	i Code="ADT^A12" s CodeMvt="D"
	i Code="ADT^A13" s CodeMvt="D"
	i Code="ADT^A32" s CodeMvt="D"
	i Code="ADT^A33" s CodeMvt="D"
	i Code="ADT^A38" s CodeMvt="D"
	q CodeMvt
}

ClassMethod getTypMvt(Typ As %String) As %String
{
	s TypMvt=""
	i (Typ="ADT^A01") ! (Typ="ADT^A08") ! (Typ="ADT^A11") s TypMvt="A"
	i (Typ="ADT^A02") ! (Typ="ADT^A12") s TypMvt="T"
	i (Typ="ADT^A03") ! (Typ="ADT^A13") s TypMvt="X"
	i (Typ="ADT^A21") ! (Typ="ADT^A52") s TypMvt="W"
	i (Typ="ADT^A22") ! (Typ="ADT^A53") s TypMvt="R"
	q TypMvt
}

ClassMethod getNHop(ndosm As %String) As %String
{
	s NHop=26
	i $e(ndosm,1)=8,$l(ndosm)=9 s NHop=27
	q NHop
}

ClassMethod AllAdrMedecin(pHl7Msg As EnsLib.HL7.Message, AllAdr As %String, zone11 As %String, adr1 As %String, adr2 As %String, tel1 As %String, tel2 As %String) As %String
{
	s NewMessHL7Out=##class(EnsLib.HL7.Message).%New(),NewMessHL7Out.DocType="2.3.1:MFN_M02"
	s MSH=pHl7Msg.FindSegmentValues("MSH")
	s MFI=pHl7Msg.FindSegmentValues("MFI")
	s MFE=pHl7Msg.FindSegmentValues("MFE")
	s STF=pHl7Msg.FindSegmentValues("STF")
	s PRA=pHl7Msg.FindSegmentValues("PRA")
	w !,STF,! s STF1=$p(STF,"|",1,11)_"|"
	i ($tr(adr1," ")'="") & ($tr(adr1," ")'="^") s STF1=$p(STF,"|",1,11)_"|"_$p($p(STF,"|",12),"^",1)_"^"_zone11_"-"_tel1_"^"_$p($p(STF,"|",12),"^",3,6)_$p($p(STF,"|",12),"^",7)_"^"_adr1_$p($p(STF,"|",12),"^",8)
	i ($tr(adr2," ")'="") & ($tr(adr2," ")'="^") s STF1=STF1_$p($p(STF,"|",12),"^",9)_"^"_zone11_"-"_tel2_"^"_$p($p(STF,"|",12),"^",11,13)_"^"_$p($p(STF,"|",12),"^",15)_"^"_adr2
	f idx=1:1:($l(AllAdr,"~")-1) d
	. s rec=$p(AllAdr,"~",idx)
	. w !,rec,!
	. s code=$p(rec,"|",4),code=$p(code,"^",2),CodAdr=$p(rec,"|",3)
	. s NewRec=$p(rec,"|",7)_"^"_zone11_"-"_$p(rec,"|",13)_"^"_$p(rec,"|",11)_"^^"_$p(rec,"|",10)_"^"_$p(rec,"|",12)_"^"_CodAdr_"^"_$s($e(code,1)'="O":code,1:$p(rec,"|",15))
	. i $e(code,1)'="P" s STF1=STF1_"~"_NewRec
	s tSC1=NewMessHL7Out.SetValueAt(MSH,"MSH")
	s tSC1=NewMessHL7Out.SetValueAt(MFI,"MFI")
	s tSC1=NewMessHL7Out.SetValueAt(MFE,"MFEgrp(1).MFE")
	s tSC1=NewMessHL7Out.SetValueAt(STF1,"MFEgrp(1).STF")
	s tSC1=NewMessHL7Out.SetValueAt(PRA,"MFEgrp(1).PRA")
	q NewMessHL7Out
}

ClassMethod getCodeAss(nadm As %String, db As %String) As %String
{
	Set query = ##class(%ResultSet).%New("%DynamicQuery:SQL")
    s %qDB = ""
	s %qDB = %qDB_"select distinct H.NSEJ, H.CBMRN, H.CBADDT, H.MOTE, "
	s %qDB = %qDB_"S.TYPAS, M.MUTAP, U.TYPMU, h.CPAS, S.KORG, P.CPAY, D.DTCODE AS CEE, M.MUTAP AS POA "
    s %qDB = %qDB_"FROM CHUBXL_db_wish.hos"_db_" H INNER JOIN CHUBXL_db_wish.patients"_db_" P ON P.PBMRN = H.CBMRN "
	s %qDB = %qDB_"LEFT OUTER JOIN CHUBXL_db_wish.TBLPARM"_db_" D ON D.DTNAME = 'NATEUR' AND D.DTCODE = P.CPAY "
	s %qDB = %qDB_"LEFT OUTER JOIN CHUBXL_db_wish.patmut"_db_" M ON M.NADM = P.PBMRN AND ROUND (H.CBADDT/10000,0) BETWEEN M.DMMU AND M.DINT "
	s %qDB = %qDB_"LEFT OUTER JOIN CHUBXL_db_wish.sigmut"_db_" U ON U.MUTMU = M.MUTAP "
	s %qDB = %qDB_"LEFT OUTER JOIN CHUBXL_db_wish.SIGASS"_db_" S ON S.MUTAS = H.CPAS "
    s %qDB = %qDB_"where h.nsej ="_nadm

	Do query.Prepare(%qDB)
	Do query.Execute()
	s CODEASSU = "000"
	While (query.Next()) {
		
   	if query.Data("MOTE")=9  {
	   i query.Data("TYPMU") = 2 {
		 s CODEASSU="230"
	   }
	   else {
	     s CODEASSU="500"
	     if $e(query.Data("POA"),1)=1 s CODEASSU="001"
	     if $e(query.Data("POA"),1)=2 s CODEASSU="002"
	     if $e(query.Data("POA"),1)=3 s CODEASSU="003"
	     if $e(query.Data("POA"),1)=4 s CODEASSU="004"
	     if $e(query.Data("POA"),1)=5 s CODEASSU="005"
	     if $e(query.Data("POA"),1)=6 s CODEASSU="006"
	     if $e(query.Data("POA"),1)=9 s CODEASSU="009"
	     if $e(query.Data("POA"),1)=7 {
	        if query.Data("POA")=703 s CODEASSU="200"
	        if query.Data("POA")=750 s CODEASSU="210"
	        if query.Data("POA")=702 s CODEASSU="220"
	     }
	  }
   	}
   	else {
	  if (query.Data("MOTE") = 21 & query.Data("MOTE") '= 9) {
	    s CODEASSU="500"
	    }
	  else {
	    i query.Data("CPAS") = 0 {
		  i $tr(query.Data("CEE")," ") = "" {
		    s CODEASSU="330"
	 	  }
		  else {
		    s CODEASSU="400"
		  }
	    }
	    else {
	      i query.Data("TYPAS") = 1 {
		    s CODEASSU="230"
	        }
		  else {
		    i query.Data("KORG") '= 0 {
			  s CODEASSU=$tr($j(query.Data("KORG"),3)," ","0")
		      }
		    else {
		      s CODEASSU="500"
		      }
		  }
	    } 
	  }
   	}
	}
	Quit CODEASSU
}

ClassMethod getPatZipCode(nadm As %String, db As %String) As %String
{
	Set query = ##class(%ResultSet).%New("%DynamicQuery:SQL")
    s %qDB = ""
	s %qDB = %qDB_"select p.pbzip,* "
    s %qDB = %qDB_"FROM CHUBXL_DB_WISH.patients p, CHUBXL_db_wish.hos h "
    s %qDB = %qDB_"where p.pbmrn=h.cbmrn and h.nsej ="_nadm

	Do query.Prepare(%qDB)
	Do query.Execute()
	s PZipCode = "0000"
	While (query.Next()) {
		s PZipCode=$e(query.Data("PBZIP"),1,4)
	}
	Quit PZipCode
}

ClassMethod getInamiMed(Segment As %String, Len As %String, Modulo As %String, Pos As %String, Pos2 As %String) As %String
{
	i +$g(Pos2)=0 s Pos2=1
	i Len=8 {
	  s ZNoMed=$p(Segment,"|",Pos)
	  s NoMed=$e($p(ZNoMed,"^",Pos2),1,6)
	  i NoMed?6N {
	    s NoMed=NoMed_$tr($j((Modulo-(NoMed#Modulo)),2)," ","0")
	    i Pos2=1 {
		  s ZNoMed2=$p(ZNoMed,"^",Pos2+1,99),ZNoMed=NoMed
		  i ZNoMed2'="" s ZNoMed=NoMed_"^"_ZNoMed2
	    }
	    i Pos2>1 {
		  s ZNoMed1=$p(ZNoMed,"^",1,Pos2-1),ZNoMed2=$p(ZNoMed,"^",Pos2+1,99),ZNoMed=ZNoMed1_"^"_NoMed
		  i ZNoMed2'="" s ZNoMed=ZNoMed_"^"_ZNoMed2
	    }
	    s Seg1=$p(Segment,"|",1,Pos-1),Seg2=$p(Segment,"|",Pos+1,99),Segment=Seg1_"|"_ZNoMed
	    i Seg2'="" s Segment=Segment_"|"_Seg2
	  }
	}
	i Len=6 {
	  s ZNoMed=$p(Segment,"|",Pos)
	  s NoMed=$e($p(ZNoMed,"^",Pos2),1,6)
	  i $e($p($p(Segment,"|",Pos),"^",1),7,8)=$tr($j((89-(NoMed#89)),2)," ","0") {
		s CrLf=$c(10)_$c(13)
		s MsgSend="Bonjour,"_CrLf_CrLf
		s MsgSend=MsgSend_"La numéro de médecin "_$p($p(Segment,"|",Pos),"^",1)_CrLf
		s MsgSend=MsgSend_"est un numéro de médecin avec modulo 89."_CrLf_CrLf
		s MsgSend=MsgSend_"Merci de prendre les dispositions nécéssaires."_CrLf
		s MsgSend=MsgSend_"Cordialement."_CrLf
		s AdrEmail="dulio.ambrogetti@chu-brugmann.be"
		s tSC=..SendEmail("Numéro de médecin avec modulo 89",MsgSend,AdrEmail)
	  }
	  i NoMed?6N {
	    i Pos2=1 {
		  s ZNoMed2=$p(ZNoMed,"^",Pos2+1,99),ZNoMed=NoMed
		  i ZNoMed2'="" s ZNoMed=NoMed_"^"_ZNoMed2
	    }
	    i Pos2>1 {
		  s ZNoMed1=$p(ZNoMed,"^",1,Pos2-1),ZNoMed2=$p(ZNoMed,"^",Pos2+1,99),ZNoMed=ZNoMed1_"^"_NoMed
		  i ZNoMed2'="" s ZNoMed=ZNoMed_"^"_ZNoMed2
	    }
	    s Seg1=$p(Segment,"|",1,Pos-1),Seg2=$p(Segment,"|",Pos+1,99),Segment=Seg1_"|"_ZNoMed
	    i Seg2'="" s Segment=Segment_"|"_Seg2
	  }
	}
	Quit Segment
}

ClassMethod SendEmail(MsgSubject As %String, MsgSend As %String, Email As %String)
{
    Set Mailer = ##class(%Net.SMTP).%New()
    Set Mailer.smtpserver = "smtp.chu-brugmann.be"

    Set Msg = ##class(%Net.MailMessage).%New()
    Set Msg.From="Ensemble2017???@chu-brugmann.be"
    if $p($SYSTEM,":",2) = "ENS2017PREP" Set Msg.From="Ensemble2017Boron01PREP@chu-brugmann.be"
    if $p($SYSTEM,":",2) = "ENS2017TEST" Set Msg.From="Ensemble2017Boron02TEST@chu-brugmann.be"
    if $p($SYSTEM,":",2) = "ENS2017M" Set Msg.From="Ensemble2017BoronPROD@chu-brugmann.be"

    Do Msg.To.Insert(Email)
    Set Msg.Subject = MsgSubject
    Do Msg.TextData.Write(MsgSend)

    set status=Mailer.Send(Msg)
	if $$$ISERR(status) do $system.OBJ.DisplayError(status) quit

    Quit $$$OK
}

}
