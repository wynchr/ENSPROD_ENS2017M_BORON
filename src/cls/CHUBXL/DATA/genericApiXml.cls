Class CHUBXL.DATA.genericApiXml Extends (%Persistent, %XML.Adaptor, Ens.Request) [ ClassType = persistent, Inheritance = right, ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "EnsLib.HL7.Message";

Property UserId As %String;

Property Password As %String;

Property XmlParam As %String(MAXLEN = 32000, TRUNCATE = 1);

Property NoSeq As %String(MAXLEN = 32000, TRUNCATE = 1);

ClassMethod saveMessage(pMessage As %Stream, pSource As %String, pObj As CHUBXL.DATA.genericApiXml) As %Status
{
	$$$TRACE("Message : "_pMessage)
	f i=1:1 {
		s rec=pMessage.FindSegmentValues("FT1("_i_")")
		$$$TRACE("FT1 - "_i_" : "_rec)
		q:rec=""
	}
	s NbrPrest=i-1
	s NoSej=$tr($j($e(pMessage.GetValueAt("PV1:VisitNumber",,.tSC),1,9),10)," ","0")
	s NoVisit=$tr($j($e(pMessage.GetValueAt("PV1:VisitNumber",,.tSC),10,12),4)," ","0")
	s NoPat=$tr($j($e(pMessage.GetValueAt("PID:PatientIdentifierList().IDNumber",,.tSC),1,9),10)," ","0")
	s DtPrest=pMessage.GetValueAt("PID:PatientIdentifierList().IDNumber",,.tSC)

	s msg=pMessage.RawContent
	s pObj=..%New()
	s PGM="<PGM>M99SJL0R</PGM>"
	s USER="<USER>DENTADMIN</USER>"
    s PTNSEJ="<PTNSEJ>"_NoSej_"</PTNSEJ>"
	s PTTRAN="<PTTRAN>TR008</PTTRAN>"
	i +NoVisit'=0 s PTTRAN="<PTTRAN>TR"_$e(NoVisit,2,4)_"</PTTRAN>"
	s PTNBRC="<PTNBRC>"_$tr($j(NbrPrest,3)," ","0")_"</PTNBRC>"
	s PTMOD="<PTMOD>A</PTMOD>"
	s PTMBR="<PTMBR>M002</PTMBR>",PTDATA=""
	s rec2=pMessage.FindSegmentValues("PV2(1)")
	s NoCL=$tr($j($e($p($p(rec2,"|",13),"^",4),1,4),4)," ","0")
	i '$d(^CHUBXL.DentAdminWS(0)) s ^CHUBXL.DentAdminWS(0)=0
 	s ^CHUBXL.DentAdminWS(0)=^CHUBXL.DentAdminWS(0)+1,Seq=^CHUBXL.DentAdminWS(0)
	f i=1:1:NbrPrest {
		s PDATA="",rec=pMessage.FindSegmentValues("FT1("_i_")")
		s NoPrest=$tr($j($e($p(rec,"|",21),1,8),8)," ","0")
		s rec1=pMessage.FindSegmentValues("ZFT("_i_")")
		s NoDent=$tr($j($e($p(rec1,"|",12),1,2),2)," ","0")
		s CLMult=$e($p(rec1,"|",11),1,2),CLMult="  "
		i NoDent="00" s NoDent="  ",CLMult="  "
		s NoInami=$tr($j($e($p(rec,"|",8),1,6),6)," ","0")
		s Prix=$tr($tr($j($p(rec,"|",16),9,2)," ","0"),".")
		s Suppl=$tr($tr($j($p(rec,"|",12),8,2)," ","0"),"."),Type="PR"
		i (+NoInami<10000)&(+NoInami'=9000) s Type="DV"
		i (+NoInami>69999) & (+NoInami<80000) s NoDent="  ",CLMult="  "
		s ^CHUBXL.DentAdminWS(Seq,Type,"PMNSEJ")=NoSej
 		s ^CHUBXL.DentAdminWS(Seq,Type,"PMMRN")=NoPat
 		s ^CHUBXL.DentAdminWS(Seq,Type,"PMCLI4")=NoCL
 		s ^CHUBXL.DentAdminWS(Seq,Type,"PMUSER")="DENTADMIN"
 		i +NoVisit'=0 s ^CHUBXL.DentAdminWS(Seq,Type,"PMNRPASS")=NoVisit
 		s ^CHUBXL.DentAdminWS(Seq,Type,"PMAPI")="TR008"
 		i +NoVisit'=0 s ^CHUBXL.DentAdminWS(Seq,Type,"PMAPI")="TR"_$e(NoVisit,2,4)
 		s PDATA="<PTDATA>"_Type_$tr($j(i,3)," ","0")
		
		i Type="PR" {
			s ^CHUBXL.DentAdminWS(Seq,Type,"PMDPSD")=$e($p(rec,"|",6),1,8)
 			s ^CHUBXL.DentAdminWS(Seq,Type,"PMCAMI")=$tr($j($e($p(rec,"|",8),1,6),6)," ","0")
 			s ^CHUBXL.DentAdminWS(Seq,Type,"PMNRPR")=NoPrest
 			s ^CHUBXL.DentAdminWS(Seq,Type,"PMCLM")=CLMult
 			s ^CHUBXL.DentAdminWS(Seq,Type,"PMSLM")=NoDent
 			s ^CHUBXL.DentAdminWS(Seq,Type,"PMUSER")="DENTADMIN"
 			;s ^CHUBXL.DentAdminWS(Seq,Type,"PMAPI")="TR008"
 			s ^CHUBXL.DentAdminWS(Seq,Type,"PMOSUE")=Suppl
 			s ^CHUBXL.DentAdminWS(Seq,Type,"PMNOPR")=""
 			s ^CHUBXL.DentAdminWS(Seq,Type,"PMDDEM")=""
 			i +NoInami=9000 {
	 		  s ^CHUBXL.DentAdminWS(Seq,Type,"PMTBPE")=""
	 		  s ^CHUBXL.DentAdminWS(Seq,Type,"PMTMPE")=Prix
 			  }
 			else {
	 		  s ^CHUBXL.DentAdminWS(Seq,Type,"PMTBPE")=Prix
	 		  s ^CHUBXL.DentAdminWS(Seq,Type,"PMTMPE")=""
 			  }
 			i $p(rec,"|",10)=3 s ^CHUBXL.DentAdminWS(Seq,Type,"PMNOPR")=3,^CHUBXL.DentAdminWS(Seq,Type,"PMDDEM")=$e($p(rec,"|",6),1,8)
		}
		else {
			s ^CHUBXL.DentAdminWS(Seq,Type,"PMFRJO")=1
 			s ^CHUBXL.DentAdminWS(Seq,Type,"PMCETF")="Q"
		}
		s x=##class(CHUBXL.BATCH.Utils).WSDentAdmin(Seq,Type),PTDATA=PTDATA_PDATA_x_"</PTDATA>"

		;s PDATA="<PTDATA>PR"_$tr($j(i,3)," ","0")_NoSej_NoPat_$e($p(rec,"|",6),1,8)_"00"_$tr($j($e($p(rec,"|",8),1,6),6)," ","0")_"0000"_NoCL_"       "_NoPrest
		;i $p(rec,"|",10)'=3 s PDATA=PDATA_"00000000000000000000000        00000000000000000000000000000      00000000000000000000000 0000000000000000000000000000000000000000000000000000000 00000000000 0000000000"_CLMult_NoDent_"000000000000000                         000000000000000000000000000000000000000000          0000TR008                             00   DENTADMIN                                         000000000000"_Prix_"0000000000000000"_Suppl_"0000000000000000000000000000000000000000</PTDATA>"
		;i $p(rec,"|",10)=3 s PDATA=PDATA_"00000000000000000000000        "_$e($p(rec,"|",6),1,8)_"000000003000000000000      00000000000000000000000 0000000000000000000000000000000000000000000000000000000 00000000000 0000000000"_CLMult_NoDent_"000000000000000                         000000000000000000000000000000000000000000          0000TR008                             00   DENTADMIN                                         000000000000"_Prix_"0000000000000000"_Suppl_"0000000000000000000000000000000000000000</PTDATA>"
		;i (+NoInami<10000)&(+NoInami'=9000) {
		;	s PDATA="<PTDATA>DV"_$tr($j(i,3)," ","0")_NoSej_NoPat_$e($p(rec,"|",8)_"      ",1,6)_$e($p(rec,"|",6),1,8)
		;	s PDATA=PDATA_"00"_NoCL_"      00010000                    Q        000000     00000000000000000000000 0000000000000000000000000000000000000000000000000 0000000000000          0000    TR008                             00 DENTADMIN                                         000000000000000000000000000000000000000000000000000000000000</PTDATA>"
		;}
		;s PTDATA=PTDATA_PDATA
	}
	;s PTDATA="<PTDATA>PR00102515230350201011012201905150030101100008400       0031620400000000000000000000000        00000000000000000000000000000      00000000000000000000000 0000000000000000000000000000000000000000000000000000000 00000000000 0000000000    000000000000000                         000000000000000000000000000000000000000000          0000TR008                             00   DENTADMIN                                         00000000000000000000000000000000000000000000000000000000000000000000000000000000000</PTDATA>"
	;s PTDATA="<PTDATA>PR0010000000000000000000000000000000000000000           0000000000000000000000000000000        00000000000000000000000000000      00000000000000000000000 0000000000000000000000000000000000000000000000000000000 00000000000 0000000000    000000000000000                         000000000000000000000000000000000000000000          0000                                  00                                                     00000000000000000000000000000000000000000000000000000000000000000000000000000000000          

	;s PTDATA="<PTDATA>DV00102515230350201011012      00000000000000      00010000                    Q        000000     00000000000000000000000 0000000000000000000000000000000000000000000000000 0000000000000          0000    TR008                             00 DENTADMIN                                         000000000000000000000000000000000000000000000000000000000000</PTDATA>"
	;s PTDATA="<PTDATA>DV00100000000000000000000      0000000000          00000000                             000000     00000000000000000000000 0000000000000000000000000000000000000000000000000 0000000000000          0000                                      00                                                   000000000000000000000000000000000000000000000000000000000000
	s pObj.UserId="MEDS"
	s pObj.Password="MEDS"
	s pObj.XmlParam="<PARAM>"_PGM_USER_PTNSEJ_PTTRAN_PTNBRC_PTMOD_PTMBR_PTDATA_"</PARAM>"
	s pObj.NoSeq=pMessage.GetValueAt("MSH:10",,.tSC)
	$$$TRACE("Param : "_pMessage.GetValueAt("MSH:10",,.tSC))
	q $$$OK
}

Storage Default
{
<Data name="genericApiXmlDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>UserId</Value>
</Value>
<Value name="3">
<Value>Password</Value>
</Value>
<Value name="4">
<Value>XmlParam</Value>
</Value>
<Value name="5">
<Value>NoSeq</Value>
</Value>
</Data>
<DataLocation>^CHUBXL.DATA.genericApiXmlD</DataLocation>
<DefaultData>genericApiXmlDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^CHUBXL.DATA.genericApiXmlD</IdLocation>
<IndexLocation>^CHUBXL.DATA.genericApiXmlI</IndexLocation>
<StreamLocation>^CHUBXL.DATA.genericApiXmlS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
