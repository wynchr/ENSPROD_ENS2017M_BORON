Class CHUBXL.MSG.Medecin Extends Ens.Request [ ClassType = persistent, ProcedureBlock ]
{

/// SIG
Property sig As %String(TRUNCATE = 1);

Property etat As %String(TRUNCATE = 1);

Property id As %String(TRUNCATE = 1);

Property statut As %String(TRUNCATE = 1);

Property langue As %String(TRUNCATE = 1);

Property datevalidation As %String(TRUNCATE = 1);

Property inami As %String(TRUNCATE = 1);

Property titre As %String(TRUNCATE = 1);

Property nom As %String(TRUNCATE = 1);

Property prenom As %String(TRUNCATE = 1);

Property sexe As %String(TRUNCATE = 1);

Property email As %String(TRUNCATE = 1);

Property gsm As %String(TRUNCATE = 1);

Property specialite1 As %String(TRUNCATE = 1);

Property specialite2 As %String(TRUNCATE = 1);

Property specialite3 As %String(TRUNCATE = 1);

Property usrhbr As %String(TRUNCATE = 1);

Property usrhude As %String(TRUNCATE = 1);

Property medibridge As %String(TRUNCATE = 1);

/// ADR1
Property adr1 As %String(TRUNCATE = 1);

Property etatadr1 As %String(TRUNCATE = 1);

Property idadr1 As %String(TRUNCATE = 1);

Property statutadr1 As %String(TRUNCATE = 1);

Property langueadr1 As %String(TRUNCATE = 1);

Property datevalidationadr1 As %String(TRUNCATE = 1);

Property adresseadr1 As %String(TRUNCATE = 1);

Property numeroadr1 As %String(TRUNCATE = 1);

Property boiteadr1 As %String(TRUNCATE = 1);

Property cpadr1 As %String(TRUNCATE = 1);

Property localiteadr1 As %String(TRUNCATE = 1);

Property paysadr1 As %String(TRUNCATE = 1);

Property teladr1 As %String(TRUNCATE = 1);

Property faxadr1 As %String(TRUNCATE = 1);

Property organisationadr1 As %String(TRUNCATE = 1);

Property serviceadr1 As %String(TRUNCATE = 1);

Property fonctionadr1 As %String(TRUNCATE = 1);

/// ADR2
Property adr2 As %String(TRUNCATE = 1);

Property etatadr2 As %String(TRUNCATE = 1);

Property idadr2 As %String(TRUNCATE = 1);

Property statutadr2 As %String(TRUNCATE = 1);

Property langueadr2 As %String(TRUNCATE = 1);

Property datevalidationadr2 As %String(TRUNCATE = 1);

Property adresseadr2 As %String(TRUNCATE = 1);

Property numeroadr2 As %String(TRUNCATE = 1);

Property boiteadr2 As %String(TRUNCATE = 1);

Property cpadr2 As %String(TRUNCATE = 1);

Property localiteadr2 As %String(TRUNCATE = 1);

Property paysadr2 As %String(TRUNCATE = 1);

Property teladr2 As %String(TRUNCATE = 1);

Property faxadr2 As %String(TRUNCATE = 1);

Property organisationadr2 As %String(TRUNCATE = 1);

Property serviceadr2 As %String(TRUNCATE = 1);

Property fonctionadr2 As %String(TRUNCATE = 1);

Method LoadMessage()
{
	set ..sig="sig"
			
	;do ..protocolecorendu.WriteLine("1.Chris")
	;do ..protocolecorendu.WriteLine("2.Dulio")
	;do ..protocolecorendu.WriteLine("3.Olivier")
	;do ..protocolecorendu.WriteLine("4.Patrick")
	;do ..protocolecorendu.WriteLine("5.Rudy")

	quit $$$OK
}

ClassMethod ListAllMessage()
{
	set rs=##class(%Library.ResultSet).%New()
	set SQL="Select * from CHUBXL_MSG.Medecin"
	Set st=rs.Prepare(SQL)
	
	Do rs.Execute()
	
	s i=0	
	while (rs.Next() '= 0) {
		s i=i+1
		Write "* "_i_" (Medecin) ***************************",!
		s out=""
		s out=out_"ID : "_$get(rs.Data("ID"))
		s out=out_" commonnumdos : "_$get(rs.Data("commonnumdos"))
		s out=out_" niveau0nom : "_$get(rs.Data("niveau0nom"))
		w out,!
		
		s pID=$get(rs.Data("ID"))
		s msg=##class(CHUBXL.MSG.Medecin).%OpenId(pID)
 		;w msg.%Id(),!
		w "--- Start of Text ---",!
		While ('msg.protocolecorendu.AtEnd) {
			Set line=msg.protocolecorendu.ReadLine()
			if line '= "" {
				w line,!
			}
		}
		w "--- End of Text ---",!
		
	}
	
	Do rs.Close()
	Kill rs
	
	quit $$$OK
}

ClassMethod DeleteAllMessage()
{
	set rs=##class(%Library.ResultSet).%New()
	set SQL="delete from CHUBXL_MSG.Medecin"
	Set st=rs.Prepare(SQL)
	
	Do rs.Execute()

	Do rs.Close()
	Kill rs
	
	quit $$$OK
}

ClassMethod ReadFile(FileIn As %String) As %Status
{
	Set $ZTrap = "ErrorTrap"
	
	kill
	
	if FileIn = "" {
		Set FileIn = "D:\DATA\ENS\Test\RXISO\archive\RXISOPROT_Test01.xml"
	}
	
	Set exists = ##class(%File).Exists(FileIn)
	if 'exists {
		Quit "Input File don't exist" 
	}
	
	Set stream=##class(%FileCharacterStream).%New()
	Set stream.Filename=FileIn
	
	s i=0, f=0, l=0,cStart="<?xml", cStop="/record>"
	
	While 'stream.AtEnd {
		s i=i+1, l=l+1
		s posStart=0, posStop=0, lastPos=1, swWrite=0
		Set line=stream.Read(32000)
		;w "*line* "_"[_"_line_"]",!
   		s posStart=$FIND(line,cStart)
   		s posStop=$FIND(line,cStop)   			
   		s p="("_posStart_","_posStop_")"		
		w "=>",p,!
				
		if (posStart>0) & (posStop>0) {
			;w "Process tag",!
			set tRequest=##class(CHUBXL.MSG.Medecin).%New()
			/// COMMON			
			set tRequest.commonnhop=$$GetXMLTag(line, .lastPos, "nhop",1)
			set tRequest.commonniss=$$GetXMLTag(line, .lastPos, "niss",1)
			set tRequest.commonnumdos=$$GetXMLTag(line, .lastPos, "numdos",1)
			set tRequest.commontimestamp=$$GetXMLTag(line, .lastPos, "timestamp",1)
			set tRequest.commonmnemonique=$$GetXMLTag(line, .lastPos, "mnemonique",1)
			set tRequest.commonusername=$$GetXMLTag(line, .lastPos, "username",1)
			set tRequest.commontransaction=$$GetXMLTag(line, .lastPos, "transaction",1)
			set tRequest.commonsupression=$$GetXMLTag(line, .lastPos, "supression",1)
			/// NIVEAU0
			set tRequest.niveau0=$$GetXMLTag(line, .lastPos, "niveau0",1)
			set tRequest.niveau0nom=$$GetXMLTag(line, .lastPos, "nom",1)
			set tRequest.niveau0prenom=$$GetXMLTag(line, .lastPos, "prenom",1)
			set tRequest.niveau0sexe=$$GetXMLTag(line, .lastPos, "sexe",1)
			set tRequest.niveau0ddn=$$GetXMLTag(line, .lastPos, "ddn",1)
			set tRequest.niveau0adr1=$$GetXMLTag(line, .lastPos, "adr1",1)
			set tRequest.niveau0adr2=$$GetXMLTag(line, .lastPos, "adr2",1)
			set tRequest.niveau0cpostal=$$GetXMLTag(line, .lastPos, "cpostal",1)
			set tRequest.niveau0pays=$$GetXMLTag(line, .lastPos, "pays",1)
			set tRequest.niveau0localite=$$GetXMLTag(line, .lastPos, "localite",1)
			set tRequest.niveau0phone1=$$GetXMLTag(line, .lastPos, "phone1",1)
			set tRequest.niveau0phone2=$$GetXMLTag(line, .lastPos, "phone2",1)
			set tRequest.niveau0gsm=$$GetXMLTag(line, .lastPos, "gsm",1)
			/// NIVEAU01
			set tRequest.niveau01=$$GetXMLTag(line, .lastPos, "niveau01",1)
			set tRequest.niveau01copiemednoinami=$$GetXMLTag(line, .lastPos, "noinami",1)
			set tRequest.niveau01copiemedtitre=$$GetXMLTag(line, .lastPos, "titre",1)
			set tRequest.niveau01copiemednom=$$GetXMLTag(line, .lastPos, "nom",1)
			set tRequest.niveau01copiemedprenom=$$GetXMLTag(line, .lastPos, "prenom",1)
			set tRequest.niveau01copiemedadr1=$$GetXMLTag(line, .lastPos, "adr1",1)
			set tRequest.niveau01copiemedadr2=$$GetXMLTag(line, .lastPos, "adr2",1)
			set tRequest.niveau01copiemedcpostal=$$GetXMLTag(line, .lastPos, "cpostal",1)
			set tRequest.niveau01copiemedpays=$$GetXMLTag(line, .lastPos, "pays",1)
			set tRequest.niveau01copiemedlocalite=$$GetXMLTag(line, .lastPos, "localite",1)
			set tRequest.niveau01copiemedphone1=$$GetXMLTag(line, .lastPos, "phone1",1)
			set tRequest.niveau01copiemedphone2=$$GetXMLTag(line, .lastPos, "phone2",1)
			set tRequest.niveau01copiemedgsm=$$GetXMLTag(line, .lastPos, "gsm",1)
			set tRequest.niveau01copiemedfax=$$GetXMLTag(line, .lastPos, "fax",1)
			set tRequest.niveau01copiemedemail=$$GetXMLTag(line, .lastPos, "email",1)
			/// NIVEAU3001
			set tRequest.niveau3001=$$GetXMLTag(line, .lastPos, "niveau3001",1)
			set tRequest.niveau3001contactdate=$$GetXMLTag(line, .lastPos, "date",1)
			set tRequest.niveau3001contactheure=$$GetXMLTag(line, .lastPos, "heure",1)
			set tRequest.niveau3001contactnopassage=$$GetXMLTag(line, .lastPos, "nopassage",1)
			/// PROTOCOLE
			set tRequest.protocolemedprestatairenoinami=$$GetXMLTag(line, .lastPos, "noinami",1)
			set tRequest.protocolemedprestatairetitre=$$GetXMLTag(line, .lastPos, "titre",1)
			set tRequest.protocolemedprestatairenom=$$GetXMLTag(line, .lastPos, "nom",1)
			set tRequest.protocolemedprestataireprenom=$$GetXMLTag(line, .lastPos, "prenom",1)
			set tRequest.protocolemedprestataireadr1=$$GetXMLTag(line, .lastPos, "adr1",1)
			set tRequest.protocolemedprestataireadr2=$$GetXMLTag(line, .lastPos, "adr2",1)
			set tRequest.protocolemedprestatairecpostal=$$GetXMLTag(line, .lastPos, "cpostal",1)
			set tRequest.protocolemedprestatairepays=$$GetXMLTag(line, .lastPos, "pays",1)
			set tRequest.protocolemedprestatairelocalite=$$GetXMLTag(line, .lastPos, "localite",1)
			set tRequest.protocolemedprestatairephone1=$$GetXMLTag(line, .lastPos, "phone1",1)
			set tRequest.protocolemedprestatairephone2=$$GetXMLTag(line, .lastPos, "phone2",1)
			set tRequest.protocolemedprestatairegsm=$$GetXMLTag(line, .lastPos, "gsm",1)
			set tRequest.protocolemedprestatairefax=$$GetXMLTag(line, .lastPos, "fax",1)
			set tRequest.protocolemedprestataireemail=$$GetXMLTag(line, .lastPos, "email",1)
			set tRequest.protocolenumprot=$$GetXMLTag(line, .lastPos, "numprot",1)
			set tRequest.protocolestatut=$$GetXMLTag(line, .lastPos, "statut",1)
			set tRequest.protocoleprintid=$$GetXMLTag(line, .lastPos, "printid",1)
			d tRequest.protocoleprint.WriteLine($$GetXMLTag(line, .lastPos, "print",1))
			set tRequest.protocolerensclinique=$$GetXMLTag(line, .lastPos, "rensclinique",1)
			set tRequest.protocolecorendu=$$GetXMLTag(line, .lastPos, "corendu",1)
			set tRequest.protocoleconclusion=$$GetXMLTag(line, .lastPos, "conclusion",1)
			set tRequest.protocolecommentaire=$$GetXMLTag(line, .lastPos, "commentaire",1)
			set tRequest.protocolereferenceprot=$$GetXMLTag(line, .lastPos, "prot",1)
			set tRequest.protocolereferencesystemehote=$$GetXMLTag(line, .lastPos, "systemehote",1)
			set tRequest.protocoleanalyseresultat=$$GetXMLTag(line, .lastPos, "resultat",1)
			set tRequest.protocoleanalysecommentaire=$$GetXMLTag(line, .lastPos, "commentaire",1)
			set tRequest.protocoleanalyseflag=$$GetXMLTag(line, .lastPos, "flag",1)
			set tRequest.protocoleanalyselimites=$$GetXMLTag(line, .lastPos, "limites",1)
			set tRequest.protocoleanalysegermenom=$$GetXMLTag(line, .lastPos, "nom",1)
			set tRequest.protocoleanalysegermeresultat=$$GetXMLTag(line, .lastPos, "resultat",1)
			set tRequest.protocoleanalysegermeabgramme=$$GetXMLTag(line, .lastPos, "abgramme",1)
			set tRequest.protocoleanalysegermeabtflag=$$GetXMLTag(line, .lastPos, "flag",1)
			set tRequest.protocoleanalysegermeabtmasque=$$GetXMLTag(line, .lastPos, "masque",1)

			d tRequest.%Save()
		}
		

		
		
	
	}
	w "---- End of files "_f_"  ------------",!
	kill
	
	Quit $$$OK
	
ErrorTrap
 
 	Set $ZTrap = ""
 	Write $ZError,!
	Quit "Error"
	
GetXMLTag(line,lastPos,tag,write)
	;s tag=$ZCONVERT(tag,"U")
	s tag1="<"_tag_">"
	s tag2="</"_tag_">"
	s line2=$e(line,lastPos,$l(line))
	s pd=$find(line2,tag1)
	s pf=$find(line2,tag2)	
	s lastPos=lastPos+pd		
	s c=$e(line2,pd,pf-$l(tag2)-1)
	w:(write=1) tag1_"="""_c,""" (pd=",pd," pf=",pf,") lastPos=",lastPos," lenTot=",$l(line),!	
	;h 1
	Quit c
}

ClassMethod ConvertProtocole() As %Status
{
	s msg=##class(CHUBXL.MSG.Medecin).%OpenId(57)
	;w msg,!
	;d $system.OBJ.Dump(msg)
	s p=msg.protocoleprint
	d p.OutputToDevice()
	w "==============================================",!
	Set stream=##class(%GlobalCharacterStream).%New()
	s i=0
	While 'p.AtEnd {
		s line=p.Read()
		s line=##class(Ens.Util.FunctionSet).ReplaceStr(line,"&lt;","<")
		s line=##class(Ens.Util.FunctionSet).ReplaceStr(line,"&gt;",">")
		s line=##class(Ens.Util.FunctionSet).ReplaceStr(line,"&amp;","&")
		d stream.Write(line)
	}
	d stream.%Save()
	d stream.OutputToDevice()
	
	quit
}

///                  	<?xml version="1.0" encoding="ISO-8859-1"?>
///                  		<record>
///                  			<common>
///                  				<nhop>26</nhop>
///                  				<niss>55100710735</niss>
///                  				<numdos>200015030</numdos>
///                  				<timestamp>200605190003</timestamp>
///                  				<mnemonique>Radio Isotopes</mnemonique>
///                  				<username>Radio Isotopes</username>
///                  				<transaction>106955</transaction>
///                  				<supression>0</supression>
///                  			</common>
///                  			<niveau>00</niveau>
///                  				<nom>LEBERSORG</nom>
///                  				<prenom>JEAN-CLAUDE</prenom>
///                  				<sexe>M</sexe>
///                  				<ddn>07/10/1955</ddn>
///                  				<adr1>CITE MODELE 2B 5 D</adr1>
///                  				<adr2></adr2>
///                  				<cpostal>1020</cpostal>
///                  				<pays></pays>
///                  				<localite>LAEKEN</localite>
///                  				<phone1>02/4784001</phone1>
///                  				<phone2></phone2>
///                  				<gsm></gsm>
///                  			<niveau>01</niveau>
///                  				<copiemed>
///                  					<noinami>18378827140</noinami>
///                  					<titre></titre>
///                  					<nom>GOFFIN</nom>
///                  					<prenom>CARINE</prenom>
///                  					<adr1>AV. PIERRE CURIE 85</adr1>
///                  					<adr2></adr2>
///                  					<cpostal>1050</cpostal>
///                  					<pays></pays>
///                  					<localite>IXELLES</localite>
///                  					<phone1></phone1>
///                  					<phone2></phone2>
///                  					<gsm></gsm>
///                  					<fax></fax>
///                  					<email></email>
///                  				</copiemed>
///                  			<niveau>3001</niveau>
///                  				<contact>
///                  					<date>18/04/2006</date>
///                  					<heure></heure>
///                  					<nopassage>2203780</nopassage>
///                  				</contact>
///                  			<protocole>
///                  				<medprestataire>
///                  					<noinami>12729071985</noinami>
///                  					<titre>Dr.</titre>
///                  					<nom>MARTIN</nom>
///                  					<prenom>PHILIPPE</prenom>
///                  					<adr1>AV. PIERRE CURIE 85</adr1>
///                  					<adr2></adr2>
///                  					<cpostal>1050</cpostal>
///                  					<pays></pays>
///                  					<localite>IXELLES</localite>
///                  					<phone1></phone1>
///                  					<phone2></phone2>
///                  					<gsm></gsm>
///                  					<fax></fax>
///                  					<email></email>
///                  				</medprestataire>
///                  				<numprot>139057</numprot>
///                  				<statut>D</statut>
///                  				<printid>2006051900033102</printid>
///                  				<print>$$$</print>
///                  				<rensclinique>$$$</rensclinique>
///                  				<corendu>$$$</corendu>
///                  				<conclusion>examen suggestif d'un épisode embolique semi récent base gauche.
///                  				</conclusion>
///                  				<commentaire></commentaire>
///                  				<reference>
///                  					<prot></prot>
///                  					<systemehote>Mline</systemehote>
///                  				</reference>
///                  				<analyse>
///                  					<resultat></resultat>
///                  					<commentaire>Scintigraphie pulmonaire V/P (Krypton 81m+microsphères 	Tc99m)</commentaire>
///                  					<flag></flag>
///                  					<limites></limites>
///                  					<germe>
///                  						<nom></nom>
///                  						<resultat></resultat>
///                  						<abgramme></abgramme>
///                  						<abt>
///                  							<flag></flag>
///                  							<masque></masque>
///                  						</abt>
///                  					</germe>
///                  				</analyse>
///                  			</protocole>
///                  		</record>

Storage Default
{
<Data name="MedecinDefaultData">
<Subscript>"Medecin"</Subscript>
<Value name="1">
<Value>sig</Value>
</Value>
<Value name="2">
<Value>etat</Value>
</Value>
<Value name="3">
<Value>id</Value>
</Value>
<Value name="4">
<Value>statut</Value>
</Value>
<Value name="5">
<Value>langue</Value>
</Value>
<Value name="6">
<Value>datevalidation</Value>
</Value>
<Value name="7">
<Value>inami</Value>
</Value>
<Value name="8">
<Value>titre</Value>
</Value>
<Value name="9">
<Value>nom</Value>
</Value>
<Value name="10">
<Value>prenom</Value>
</Value>
<Value name="11">
<Value>sexe</Value>
</Value>
<Value name="12">
<Value>email</Value>
</Value>
<Value name="13">
<Value>gsm</Value>
</Value>
<Value name="14">
<Value>specialite1</Value>
</Value>
<Value name="15">
<Value>specialite2</Value>
</Value>
<Value name="16">
<Value>specialite3</Value>
</Value>
<Value name="17">
<Value>usrhbr</Value>
</Value>
<Value name="18">
<Value>usrhude</Value>
</Value>
<Value name="19">
<Value>medibridge</Value>
</Value>
<Value name="20">
<Value>adr1</Value>
</Value>
<Value name="21">
<Value>etatadr1</Value>
</Value>
<Value name="22">
<Value>idadr1</Value>
</Value>
<Value name="23">
<Value>statutadr1</Value>
</Value>
<Value name="24">
<Value>langueadr1</Value>
</Value>
<Value name="25">
<Value>datevalidationadr1</Value>
</Value>
<Value name="26">
<Value>adresseadr1</Value>
</Value>
<Value name="27">
<Value>numeroadr1</Value>
</Value>
<Value name="28">
<Value>boiteadr1</Value>
</Value>
<Value name="29">
<Value>cpadr1</Value>
</Value>
<Value name="30">
<Value>localiteadr1</Value>
</Value>
<Value name="31">
<Value>paysadr1</Value>
</Value>
<Value name="32">
<Value>teladr1</Value>
</Value>
<Value name="33">
<Value>faxadr1</Value>
</Value>
<Value name="34">
<Value>organisationadr1</Value>
</Value>
<Value name="35">
<Value>serviceadr1</Value>
</Value>
<Value name="36">
<Value>fonctionadr1</Value>
</Value>
<Value name="37">
<Value>adr2</Value>
</Value>
<Value name="38">
<Value>etatadr2</Value>
</Value>
<Value name="39">
<Value>idadr2</Value>
</Value>
<Value name="40">
<Value>statutadr2</Value>
</Value>
<Value name="41">
<Value>langueadr2</Value>
</Value>
<Value name="42">
<Value>datevalidationadr2</Value>
</Value>
<Value name="43">
<Value>adresseadr2</Value>
</Value>
<Value name="44">
<Value>numeroadr2</Value>
</Value>
<Value name="45">
<Value>boiteadr2</Value>
</Value>
<Value name="46">
<Value>cpadr2</Value>
</Value>
<Value name="47">
<Value>localiteadr2</Value>
</Value>
<Value name="48">
<Value>paysadr2</Value>
</Value>
<Value name="49">
<Value>teladr2</Value>
</Value>
<Value name="50">
<Value>faxadr2</Value>
</Value>
<Value name="51">
<Value>organisationadr2</Value>
</Value>
<Value name="52">
<Value>serviceadr2</Value>
</Value>
<Value name="53">
<Value>fonctionadr2</Value>
</Value>
</Data>
<DefaultData>MedecinDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
