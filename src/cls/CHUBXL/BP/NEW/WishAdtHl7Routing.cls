Class CHUBXL.BP.NEW.WishAdtHl7Routing Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
Routing des messages ADT provenant de WISH

VERSION
-------
CWY	18/06/2018	Initial Version
DAM	03/08/2018	Mise à niveau version ENPROD,ENSTEST,ENSPREP,ENSDEV
DAM	18/01/2019	Ajout des modification pour tenir compte du passsage du numéro de médecin de 6 à 8 chiffres.
DAM	07/08/2019	Mise en commentataire de l'envoie des messages vers Connex.
DAM	30/04/2019	Ajout connecteur DentAdmin
DAM	17/06/2019	Ajout connecteur Softalmo HBR
CWY	10/10/2019	Pour AGFA pas de MOD97 à la demande de LBI
DAM	28/09/2020	Ajout connecteur PacsOnWeb HUDERF
DAM 04/12/2020	Ajout objet NewMsgHL7iPlan pour ajouter "" au zone numéros de téléphone et date de décès lorsqu'elles sont vides
DAM	26/02/2021	Ajout test PV1 Astraia.
DAM	10/03/2020	Ajout connecteur PacsOnWeb Brugmann
DAM	23/03/2020	Ajout connecteur vers nouveau serveur Brain HUDERF

APPLICATION 	MESSAGE					HOP26	HOP27	A01	A02	A03	A04	A05	A06	A08	A11	A12	A13	A21	A22	A28	A31	A38	A40	A52	A53	DT	FILTER
------------	-------					-----	-----	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	------
Cache			RequestMsgHL7			  x		  x		 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	  x	 x	 x	 x	-	-
Cache			RequestMsgHL7Ina8		  x		  x		 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	  x	 x	 x	 x	-	-
Brain			RequestMsgHL7			  -		  x		 x	 x	 x	 -	 -	 -	 x	 x	 x	 x	 -	 -	 -	 -	 -	 x	 -	 -	-	PV1:3="66M"
Brain			RequestMsgHL7Ina8		  -		  x		 x	 x	 x	 -	 -	 -	 x	 x	 x	 x	 -	 -	 -	 -	 -	 x	 -	 -	-	PV1:3="66M"
BrainNew		RequestMsgHL7			  -		  x		 x	 x	 x	 -	 -	 -	 x	 x	 x	 x	 -	 -	 -	 -	 -	 x	 -	 -	-	PV1:3="66M"
BrainNew		RequestMsgHL7Ina8		  -		  x		 x	 x	 x	 -	 -	 -	 x	 x	 x	 x	 -	 -	 -	 -	 -	 x	 -	 -	-	PV1:3="66M"

Astraia  		NewMsgHL7 & NewMsgHL7Ina8 x		  -		 x	 -	 -	 x	 -	 -	 -	 -	 -	 -	 -	 -	 x	 x	 -	 x	 -	 -	-	-
Datameal		NewMsgHL7 & NewMsgHL7Ina8 x		  -		 x	 x	 x	 x	 -	 x	 x	 x	 x	 x	 x	 x	 x	 x	 -	 x	 x	 x	-	'conv & (TypeSej="I") ! ((PV1="") & (TypeSej'="O"))	& i ((##class(CHUBXL.DT.Utils).CtrlUnite(pRequest.FindSegmentValues("PV1:3.1")))!($tr(pRequest.FindSegmentValues("PV1:3.1")," ")="")) 	
MobiTrace		NewMsgHL7 & NewMsgHL7Ina8 x		  -		 x	 x	 x	 x	 -	 x	 x	 x	 x	 x	 x	 x	 x	 x	 -	 x	 x	 x	-	'conv & (TypeSej="I") ! ((PV1="") & (TypeSej'="O"))	& i ((##class(CHUBXL.DT.Utils).CtrlUnite(pRequest.FindSegmentValues("PV1:3.1")))!($tr(pRequest.FindSegmentValues("PV1:3.1")," ")="")) 	
Connex			NewMsgHL7 & NewMsgHL7Ina8 x		  -		 x	 x	 x	 x	 -	 x	 x	 x	 x	 x	 x	 x	 x	 x	 -	 x	 x	 x	-	'conv & (TypeSej="I") ! ((PV1="") & (TypeSej'="O"))	& i ((##class(CHUBXL.DT.Utils).CtrlUnite(pRequest.FindSegmentValues("PV1:3.1")))!($tr(pRequest.FindSegmentValues("PV1:3.1")," ")="")) 	
Opera			NewMsgHL7 & NewMsgHL7Ina8 x		  x		 x	 x	 x	 x	 -	 x	 x	 x	 x	 x	 x	 x	 x	 x	 -	 x	 x	 x	-	'conv & (TypeSej="I") ! ((PV1="") & (TypeSej'="O"))	
Infopartner		NewMsgHL7 & NewMsgHL7Ina8 x		  x		 x	 x	 x	 x	 -	 x	 x	 x	 x	 x	 x	 x	 x	 x	 -	 x	 x	 x	-	'conv	
Diamic			NewMsgHL7 & NewMsgHL7Ina8 x		  x		 x	 x	 x	 x	 -	 x	 x	 x	 x	 x	 x	 x	 x	 x	 -	 x	 x	 x	-	'conv	
Innovian		NewMsgHL7 & NewMsgHL7Ina8 x		  x		 x	 x	 x	 -	 x	 x	 x	 x	 x	 x	 x	 x	 x	 -	 -	 x	 x	-	'conv & (TypeSej="I") ! ((PV1="") & (TypeSej'="O"))	
Icip			NewMsgHL7 & NewMsgHL7Ina8 -		  x		 x	 x	 x	 x	 -	 x	 x	 x	 x	 x	 x	 x	 x	 x	 -	 -	 x	 x	-	'conv	
Ophtalmo Brug	NewMsgHL7 & NewMsgHL7Ina8 -		  x		 x	 x	 x	 x	 -	 x	 x	 x	 x	 x	 x	 x	 x	 x	 -	 -	 x	 x	-	'conv	
Ophtalmo HUDE	NewMsgHL7 & NewMsgHL7Ina8 -		  x		 x	 x	 x	 x	 -	 x	 x	 x	 x	 x	 x	 x	 x	 x	 -	 -	 x	 x	-	'conv	

Agfa			NewMsgHL7 & NewMsgHL7Ina8 x		  x		 x	 x	 x	 x	 -	 x	 x	 x	 x	 x	 x	 x	 x	 x	 -	 x	 x	 x	DT	'conv
Alpha			NewMsgHL7 & NewMsgHL7Ina8 x		  x		 x	 x	 x	 x	 -	 x	 x	 x	 x	 x	 x	 x	 x	 x	 -	 x	 x	 x	DT	'conv	
Dialyse			NewMsgHL7 & NewMsgHL7Ina8 x		  x		 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	DT	(TypeSej="I") & (TypeAdm="Z") & (CodeForfait="020")	

Bdoc			BdocMsgHL7				  x		  x		 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	CO	-	
Glims			GlimsMsgHL7			  	  x		  x		 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 -	 x	 x	 x	CO	(('conv) ! (convdia))& PV2:12.4 (26)="~500~501~502~505~506~507~" (27)="~I502~I503~RM26~RM27~"
Infohos			InfohosMsgHL7		  	  x		  x		 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	CO	(convdia) ! ('conv) ! (convoxy) ! (convinfohos)
Mv				MvMsgHL7			  	  x		  x		 x	 x	 x	 x	 -	 x	 x	 x	 x	 x	 x	 x	 x	 x	 -	 x	 x	 x	CO	-	
Mosos			MososMsgHL7			  	  x		  -		 x	 x	 x	 x	 -	 x	 x	 x	 x	 x	 x	 x	 x	 x	 -	 x	 x	 x	CO	'conv	
Ecare			EcareMsgHL7			  	  x		  -		 x	 x	 x	 x	 -	 x	 x	 x	 x	 x	 x	 x	 x	 x	 -	 x	 x	 x	CO	'conv & ((ServHosp="8300") ! (ServHosp="151") ! (ServHosp="152") ! ($tr(TypeSej," ")=""))	& ((TypeSej="O") & (TypeAdm="E")) ! (TypeSej="") ! (TypeSej="I")
Oxygen			OxygenMsgHL7		  	  x		  -		 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	-	-	
DentAdmin		DentAdminMsgHL7			  x		  -		 -	 -   -	 x	 -	 -	 x	 -	 -	 -	 -	 -	 -	 x	 -	 x	 -	 -	-	'conv & ((ServHosp="8460") ! (ServHosp="8461") ! (ServHosp="8462") ! (ServHosp="8463"))
Canexis			CanexisMsgHL7			  x		  -		 -	 -   -	 x	 -	 -	 x	 -	 -	 -	 -	 -	 -	 x	 -	 x	 -	 -	-	'conv
PacsOnWeb		NewMsgHL7				  -		  x		 -	 -   -	 -	 -	 -	 -	 -	 -	 -	 -	 -	 x	 x	 x	 x	 -	 -	-	'conv
Diablink		NewMsgHL7				  x		  -		 x	 x   x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	 x	-	'conv
iPlan			NewMsgHL7iPlan			  x		  -		 x	 x	 x	 x	 -	 x	 x	 x	 x	 x	 x	 x	 x	 x	 -	 x	 x	 x	DT	'conv
Canexis			CanexisMsgHL7			  x		  -		 x	 x	 x	 x	 -	 x	 x	 x	 x	 x	 x	 x	 x	 x	 -	 x	 x	 x	DT	'conv

MESSAGES
--------
ADT_A01		MSH,EVN,PID,PD1,NK1(x),PV1,IN1+ZIN (x) 	 		Création admission (Séjours hospi) 
ADT_A02		MSH,EVN,PID,PD1,PV1 	 						Transfert patient 
ADT_A03		MSH,EVN,PID,PD1,PV1 	 						Sortie réelle patient 
ADT_A04		MSH,EVN,PID,PD1,NK1(x),PV1,IN1+ZIN (x)+[ZMG]	Création/modification visite + séjours urgences/kiné 
ADT_A05		MSH,EVN,PID,PD1,NK1(x),PV1 	 					Création pré-admission 
ADT_A06		MSH,EVN,PID,PD1,NK1(x),PV1 	 					Changer un séjour ambulant en séjour hospitalisé 
ADT_A07	N/A	MSH,EVN,PID,PD1,NK1(x),PV1						Changer un séjour hospitalisé en séjour ambulant
ADT_A08		MSH,EVN,PID,PD1,NK1(x),PV1,IN1+ZIN (x) 	 		Mise à jour données admission 
ADT_A11		MSH,EVN,PID,PD1,PV1 	 						Suppression admission 
ADT_A09	N/A	MSH,EVN,PID,PD1,PV1								Transfert technique
ADT_A10	N/A	MSH,EVN,PID,PD1,PV1								Transfert technique
ADT_A11		MSH,EVN,PID,PD1,PV1								Suppression admission
ADT_A12		MSH,EVN,PID,PD1,PV1 	 						Suppression transfert 
ADT_A13		MSH,EVN,PID,PD1,NK1(x),PV1 	 					Annulation sortie réelle patient 
ADT_A21		MSH,EVN,PID,PD1,PV1,PV2 	 					Départ en congé 
ADT_A22		MSH,EVN,PID,PD1,PV1,PV2 	 					Retour de congé 
ADT_A28		MSH,EVN,PID,PD1,NK1(x),[OBX] 	 				Création inscription patient 
ADT_A31		MSH,EVN,PID,PD1,NK1(x),[OBX],[IN1+ZIN](x) 	 	Mise à jour inscription patient 
ADT-A32	N/A	MSH,EVN,PID,PD1,PV1								Suppression transfert technique
ADT-A33	N/A	MSH,EVN,PID,PD1,PV1								Suppression transfert technique
ADT_A37	N/A	MSH,EVN,PID,PID									Annulation fusion dossiers patient
ADT_A38		MSH,EVN,PID,PD1,PV1 	 						Suppression pré-admission 
ADT_A40		MSH,EVN,PID,MRG									Fusion de deux dossiers
ADT_A45	N/A	MSH,EVN,PID,MRG,PV1								Transfert admission vers nouveau dossier patient
ADT_A52		MSH,EVN,PID,PD1,PV1,PV2 	 					Suppression départ en congé 
ADT_A53		MSH,EVN,PID,PD1,PV1,PV2 	 					Annulation retour de congé 

SEGMENTS
--------
Goto end of file =>

OPTIMISATION
------------
- Review with Method

SOURCE
------
CHUBXL.BP.WishAllAdtRouting
--------------------------------------------------------------------------------------------------------------------------------
*/
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As EnsLib.HL7.Message, Output pResponse As Ens.Response) As %Status
{
    Set $ZTrap = "ErrorTrap", tSC=$$$OK 
    d ##class(Ens.BusinessMetric).SetMetric("ChubxlGeneralMetric","lastMessageReceived",$ZDT($h,3),..%ConfigName)

    $$$TRACE("== Start BP WishHL7MLLPRouting ==========")

    s tClassName = pRequest.%ClassName(1)
    s tSourceConfigName = ..%PrimaryRequestHeader.SourceConfigName
    s tTargetConfigName = ..%PrimaryRequestHeader.TargetConfigName
    s Instance=$p($SYSTEM,":",2)
    
    $$$TRACE("ClassName : "_tClassName)
    $$$TRACE("SourceConfigName : "_tSourceConfigName)
    $$$TRACE("TargetConfigName : "_tTargetConfigName)

    // Check for supported messages ---------------------------------------------------------------------------------------
    If (tSourceConfigName = "WishBruAdtHl7TcpIn" ) ! (tSourceConfigName = "WishHudAdtHl7TcpIn" ) ! (tSourceConfigName = "WishAllAdtHl7FcpIn" ) ! (tSourceConfigName = "WishAllAdtHl7TcpIn" ) {
        
        // Init variable ---------------------------------------------------------------------------------------

	    s MsgCtrlId		= pRequest.GetValueAt("MSH:MessageControlID",,.tSC)		; ControlId
	    s MsgType		= $p(pRequest.FindSegmentValues("MSH:9"),"^",2)			; Type de message
	    s Ndosm			= pRequest.FindSegmentValues("PID:3")					; Numéro de dossier
	    s Nhop			= ##class(CHUBXL.DT.Utils).getNHop(Ndosm)				; Numéro d'hôpital	    
	    s TypeSej		= pRequest.FindSegmentValues("PV1:2")        			; TypeSej : Type de séjour (I,O)
	    s TypeAdm		= pRequest.FindSegmentValues("PV1:4")        			; TypeAdm : Type admission (E,Z,...)
	    s ServHosp		= pRequest.FindSegmentValues("PV1:10")      			; ServHosp : Service hospitalisation
	    s CodeForfait	= pRequest.FindSegmentValues("PV1:24")   				; CodeForfait : Code Forfait
	    s Nadm			= pRequest.FindSegmentValues("PV1:19")					; Numéro d'admission
	    s CodeServ		= pRequest.FindSegmentValues("PV2:12.4")				; Code service

		s ^IRIS.dulio(tSourceConfigName,"BP",$zd($h,8),0)=$g(^IRIS.dulio(tSourceConfigName,"BP",$zd($h,8),0))+1
		i +MsgCtrlId'>+$g(^IRIS.dulio(tSourceConfigName,"BP",$zd($h,8),1)) s ^IRIS.dulio(tSourceConfigName,"BP",$zd($h,8),+MsgCtrlId)=$g(^IRIS.dulio(tSourceConfigName,"BP",$zd($h,8),+MsgCtrlId))+1
		s ^IRIS.dulio(tSourceConfigName,"BP",$zd($h,8),1)=+MsgCtrlId

	    i +$l(Ndosm)<9 s Ndosm=$tr($j(Ndosm,9)," " ,"0")
        
        s conv=0,convdia=0,convoxy=0,convinfohos=0
        i (TypeSej="I") & (TypeAdm="Z") {
			i ($tr(CodeForfait," ")'="") & (CodeForfait'="000") & (CodeForfait'="099") s conv=1
			i CodeForfait="020" s convdia=1
			i CodeForfait="407" s convoxy=1
          	i CodeForfait="060" s convinfohos=1
        }
	    
	    // Trace ---------------------------------------------------------------------------------------

        $$$TRACE("Numero Hôpital : "_Nhop)
        $$$TRACE("Numero Dossier : "_Ndosm)
        $$$TRACE("Numero Admission : "_Nadm)
        $$$TRACE("Message Type   : "_MsgType)
        $$$TRACE("ControlId   : "_MsgCtrlId)
        	    
	    ;CWY i $tr(Nadm," ")'="",$d(^CHUBXL.ExclusVisite(Nhop,Nadm)) $$$TRACE("*****Numéro de visite exclu : "_Nadm) s ^dulio($h)=Nadm Quit tSC
        
        // Init outbound messages ---------------------------------------------------------------------------------------
        
        s RequestMsgHL7		= ##class(EnsLib.HL7.Message).%New(),RequestMsgHL7.DocType="2.5:ADT_A01"		; Cache,Brain pour numéro INAMI médecin en 6 positions
        s RequestMsgHL7Ina8	= ##class(EnsLib.HL7.Message).%New(),RequestMsgHL7Ina8.DocType="2.5:ADT_A01"	; Cache,Brain pour numéro INAMI médecin en 8 positions
        s NewMsgHL7			= ##class(EnsLib.HL7.Message).%New(),NewMsgHL7.DocType="2.5:ADT_A01"			; Agfa,Alpha,Datameal,Opera,Innovian,Dialyse,Icip,Ophtalmo,Infopartner,Diamic,Astraia,MobiTrace,Connex pour numéro INAMI médecin en 6 positions  
        s NewMsgHL7Ina8		= ##class(EnsLib.HL7.Message).%New(),NewMsgHL7Ina8.DocType="2.5:ADT_A01"		; Agfa,Alpha,Datameal,Opera,Innovian,Dialyse,Icip,Ophtalmo,Infopartner,Diamic,Astraia,MobiTrace,Connex pour numéro INAMI médecin en 8 positions

        s BdocMsgHL7		= ##class(EnsLib.HL7.Message).%New(),BdocMsgHL7.DocType="2.5:ADT_A01"			; Bdoc
        s GlimsMsgHL7		= ##class(EnsLib.HL7.Message).%New(),GlimsMsgHL7.DocType="2.5:ADT_A01"			; Glims
        s InfohosMsgHL7		= ##class(EnsLib.HL7.Message).%New(),InfohosMsgHL7.DocType="2.5:ADT_A01" 		; Infohos
        s MvMsgHL7			= ##class(EnsLib.HL7.Message).%New(),MvMsgHL7.DocType="2.5:ADT_A01"				; Mv
        s MososMsgHL7		= ##class(EnsLib.HL7.Message).%New(),MososMsgHL7.DocType="2.5:ADT_A01"			; Mosos
        s EcareMsgHL7		= ##class(EnsLib.HL7.Message).%New(),EcareMsgHL7.DocType="2.5:ADT_A01"			; Ecare
        s OxygenMsgHL7		= ##class(EnsLib.HL7.Message).%New(),OxygenMsgHL7.DocType="2.5:ADT_A01"			; Oxygen
        s DentAdminMsgHL7	= ##class(EnsLib.HL7.Message).%New(),DentAdminMsgHL7.DocType="2.5:ADT_A01"		; DentAdmin
        s CanexisMsgHL7		= ##class(EnsLib.HL7.Message).%New(),CanexisMsgHL7.DocType="2.5:ADT_A01"		; Canexis
        s NewMsgHL7iPlan	= ##class(EnsLib.HL7.Message).%New(),NewMsgHL7iPlan.DocType="2.5:ADT_A01"		; iPlan
        
		//==============================================================================================================================================
		// Load segments found in variable =============================================================================================================
		//==============================================================================================================================================
        s MSH=pRequest.FindSegmentValues("MSH")	
        s EVN=pRequest.FindSegmentValues("EVN")
        
        s PID=pRequest.FindSegmentValues("PID")
        i $l(pRequest.FindSegmentValues("PID:3"))<9 s $p(PID,"|",4)=Ndosm
        i $l(pRequest.FindSegmentValues("PID:4"))<9,pRequest.FindSegmentValues("PID:4")'="" s $p(PID,"|",5)=$tr($j(pRequest.FindSegmentValues("PID:4"),9)," " ,"0")
        
        s PD1=pRequest.FindSegmentValues("PD1")
        i $tr($p(PD1,"|",5)," ")'="",+$p(PD1,"|",5)<100000 s $p(PD1,"|",5)=""
        i $tr($p(PD1,"|",5)," ")'="",+$p(PD1,"|",5)=999999 s $p(PD1,"|",5)=""
        
        s OBX=pRequest.FindSegmentValues("OBX")
        
        s NK11=pRequest.FindSegmentValues("NK1(1)")
        s NK12=pRequest.FindSegmentValues("NK1(2)")
        s NK13=pRequest.FindSegmentValues("NK1(3)")
        s NK14=pRequest.FindSegmentValues("NK1(4)")
        s NK15=pRequest.FindSegmentValues("NK1(5)")
        s NK16=pRequest.FindSegmentValues("NK1(6)")
        s NK17=pRequest.FindSegmentValues("NK1(7)")
        s NK18=pRequest.FindSegmentValues("NK1(8)")
        
        s PV1=pRequest.FindSegmentValues("PV1")
        i MsgType="A40",PV1="" s PV1="PV1|"					; Init PV1 for A40 merge message 

        s PV2=pRequest.FindSegmentValues("PV2")
                
        // Début du traitement pour le module 89
        s PD1Ina8=PD1,PV1Ina8=PV1,PV2Ina8=PV2
        
	    i $l($tr($p($p(PD1,"|",5),"^",1)," "))=8 {
		  s PD1=##class(CHUBXL.DT.Utils).getInamiMed(PD1,6,"",5)
	    }
	    i $l($tr($p($p(PV1,"|",8),"^",1)," "))=8 {
		  s PV1=##class(CHUBXL.DT.Utils).getInamiMed(PV1,6,"",8)
	    }
	    i $l($tr($p($p(PV1,"|",9),"^",1)," "))=8 {
		  s PV1=##class(CHUBXL.DT.Utils).getInamiMed(PV1,6,"",9)
	    }
   	    i $l($tr($p($p(PV1,"|",10),"^",1)," "))=8 {
		  s PV1=##class(CHUBXL.DT.Utils).getInamiMed(PV1,6,"",10)
	    }
   	    i $l($tr($p($p(PV2,"|",13),"^",3)," "))=8 {
		  s PV2=##class(CHUBXL.DT.Utils).getInamiMed(PV2,6,"",13,3)
	    }
   	    i $l($tr($p($p(PV2,"|",20),"^",1)," "))=8 {
		  s PV2=##class(CHUBXL.DT.Utils).getInamiMed(PV2,6,"",21,3)
	    }
	    
        i $g(^CHUBXL.Parameter("MedWish",8)) {
	        i $l($tr($p($p(PD1Ina8,"|",5),"^",1)," "))=6 {
		      s PD1Ina8=##class(CHUBXL.DT.Utils).getInamiMed(PD1Ina8,8,97,5)
	        }
	        i $l($tr($p($p(PV1Ina8,"|",8),"^",1)," "))=6 {
			  s PV1Ina8=##class(CHUBXL.DT.Utils).getInamiMed(PV1Ina8,8,97,8)
	        }
	        i $l($tr($p($p(PV1Ina8,"|",9),"^",1)," "))=6 {
			  s PV1Ina8=##class(CHUBXL.DT.Utils).getInamiMed(PV1Ina8,8,97,9)
	        }
	        i $l($tr($p($p(PV1Ina8,"|",10),"^",1)," "))=6 {
			  s PV1Ina8=##class(CHUBXL.DT.Utils).getInamiMed(PV1Ina8,8,97,10)
	        }
	        i $l($tr($p($p(PV2Ina8,"|",13),"^",3)," "))=6 {
			  s PV2Ina8=##class(CHUBXL.DT.Utils).getInamiMed(PV2Ina8,8,97,13,3)
	        }
   	        i $l($tr($p($p(PV2Ina8,"|",21),"^",3)," "))=6 {
			  s PV2Ina8=##class(CHUBXL.DT.Utils).getInamiMed(PV2Ina8,8,97,21,3)
	        }
        }
        // Fin du traitement pour le modulo 89
        s MRG=pRequest.FindSegmentValues("MRG"),Ndosm1=$p(MRG,"|",2),Ndosm2=$p(MRG,"|",5)
        s MRGMV=MRG
        i $tr(Ndosm1," ")'="",$l(Ndosm1)<9 s Ndosm1=$tr($j(Ndosm1,9)," " ,"0"),$p(MRG,"|",2)=Ndosm1
        i $tr(Ndosm2," ")'="",$l(Ndosm2)<9 s Ndosm2=$tr($j(Ndosm2,9)," " ,"0"),$p(MRG,"|",5)=Ndosm2
        
        s IN11=pRequest.FindSegmentValues("IN1(1)")
        s IN12=pRequest.FindSegmentValues("IN1(2)")
        s IN13=pRequest.FindSegmentValues("IN1(3)")
        s IN14=pRequest.FindSegmentValues("IN1(4)")
        s IN15=pRequest.FindSegmentValues("IN1(5)")
        s IN16=pRequest.FindSegmentValues("IN1(6)")
        s IN17=pRequest.FindSegmentValues("IN1(7)")
        s IN18=pRequest.FindSegmentValues("IN1(8)")
        s IN19=pRequest.FindSegmentValues("IN1(9)")
        s ZIN1=pRequest.FindSegmentValues("ZIN(1)")
        s ZIN2=pRequest.FindSegmentValues("ZIN(2)")
        s ZIN3=pRequest.FindSegmentValues("ZIN(3)")
        s ZIN4=pRequest.FindSegmentValues("ZIN(4)")
        s ZIN5=pRequest.FindSegmentValues("ZIN(5)")
        s ZIN6=pRequest.FindSegmentValues("ZIN(6)")
        s ZIN7=pRequest.FindSegmentValues("ZIN(7)")
        s ZIN8=pRequest.FindSegmentValues("ZIN(8)")
        s ZIN9=pRequest.FindSegmentValues("ZIN(9)")
        
        s ZMG=pRequest.FindSegmentValues("ZMG")
        
		//==============================================================================================================================================
        // Put Segment into HL7 Message ================================================================================================================
        //==============================================================================================================================================
        i MSH'="" {
	        s tSC1=MososMsgHL7.SetValueAt(MSH,"MSH")
	        s tSC1=InfohosMsgHL7.SetValueAt(MSH,"MSH")
	        s tSC1=EcareMsgHL7.SetValueAt(MSH,"MSH")
	        s tSC1=RequestMsgHL7.SetValueAt(MSH,"MSH")
	        s tSC1=RequestMsgHL7Ina8.SetValueAt(MSH,"MSH")
	        s tSC1=MvMsgHL7.SetValueAt(MSH,"MSH")
	        s tSC1=NewMsgHL7.SetValueAt(MSH,"MSH")
	        s tSC1=NewMsgHL7iPlan.SetValueAt(MSH,"MSH")
	        s tSC1=NewMsgHL7Ina8.SetValueAt(MSH,"MSH")
	        s tSC1=BdocMsgHL7.SetValueAt(MSH,"MSH")
	        s tSC1=GlimsMsgHL7.SetValueAt(MSH,"MSH")
	        s tSC1=OxygenMsgHL7.SetValueAt(MSH,"MSH")
	        s tSC1=DentAdminMsgHL7.SetValueAt(MSH,"MSH")
	        s tSC1=CanexisMsgHL7.SetValueAt(MSH,"MSH")
        }      
        i EVN'="" {
	        s tSC1=MososMsgHL7.SetValueAt(EVN,"EVN")
	        s tSC1=InfohosMsgHL7.SetValueAt(EVN,"EVN")
	        s tSC1=EcareMsgHL7.SetValueAt(EVN,"EVN")
	        s tSC1=RequestMsgHL7.SetValueAt(EVN,"EVN")
	        s tSC1=RequestMsgHL7Ina8.SetValueAt(EVN,"EVN")
	        s tSC1=MvMsgHL7.SetValueAt(EVN,"EVN")
	        s tSC1=NewMsgHL7.SetValueAt(EVN,"EVN")
	        s tSC1=NewMsgHL7iPlan.SetValueAt(EVN,"EVN")
	        s tSC1=NewMsgHL7Ina8.SetValueAt(EVN,"EVN")
	        s tSC1=BdocMsgHL7.SetValueAt(EVN,"EVN")
	        s tSC1=GlimsMsgHL7.SetValueAt(EVN,"EVN")
			s tSC1=OxygenMsgHL7.SetValueAt(EVN,"EVN")
			s tSC1=DentAdminMsgHL7.SetValueAt(EVN,"EVN")
			s tSC1=CanexisMsgHL7.SetValueAt(EVN,"EVN")
        }
        i PID'="" { 
        	s tSC1=MososMsgHL7.SetValueAt(PID,"PID")
        	s tSC1=InfohosMsgHL7.SetValueAt(PID,"PID")
        	s tSC1=EcareMsgHL7.SetValueAt(PID,"PID")
        	s tSC1=RequestMsgHL7.SetValueAt(PID,"PID")
        	s tSC1=RequestMsgHL7Ina8.SetValueAt(PID,"PID")
        	s tSC1=MvMsgHL7.SetValueAt(PID,"PID")
        	s tSC1=NewMsgHL7.SetValueAt(PID,"PID") 
        	s tSC1=NewMsgHL7iPlan.SetValueAt(PID,"PID")
        	s tSC1=NewMsgHL7Ina8.SetValueAt(PID,"PID") 
        	s tSC1=BdocMsgHL7.SetValueAt(PID,"PID")
        	s tSC1=GlimsMsgHL7.SetValueAt(PID,"PID")
        	s tSC1=OxygenMsgHL7.SetValueAt(PID,"PID")
        	s tSC1=DentAdminMsgHL7.SetValueAt(PID,"PID")
        	s tSC1=CanexisMsgHL7.SetValueAt(PID,"PID")
        }
        i PD1'="" {
        	s:'$g(^CHUBXL.Parameter("MedWish","Mosos")) tSC1=MososMsgHL7.SetValueAt(PD1,"PD1")
        	s:$g(^CHUBXL.Parameter("MedWish","Mosos")) tSC1=MososMsgHL7.SetValueAt(PD1Ina8,"PD1")
        	s:'$g(^CHUBXL.Parameter("MedWish","Ecare")) tSC1=EcareMsgHL7.SetValueAt(PD1,"PD1")
        	s:$g(^CHUBXL.Parameter("MedWish","Ecare")) tSC1=EcareMsgHL7.SetValueAt(PD1Ina8,"PD1")
        	s:'$g(^CHUBXL.Parameter("MedWish","Infohos")) tSC1=InfohosMsgHL7.SetValueAt(PD1,"PD1")
        	s:$g(^CHUBXL.Parameter("MedWish","Infohos")) tSC1=InfohosMsgHL7.SetValueAt(PD1Ina8,"PD1")
        	s tSC1=RequestMsgHL7.SetValueAt(PD1,"PD1")
        	s tSC1=RequestMsgHL7Ina8.SetValueAt(PD1Ina8,"PD1")
        	s:'$g(^CHUBXL.Parameter("MedWish","Mv")) tSC1=MvMsgHL7.SetValueAt(PD1,"PD1")
        	s:$g(^CHUBXL.Parameter("MedWish","Mv")) tSC1=MvMsgHL7.SetValueAt(PD1Ina8,"PD1")
        	s tSC1=NewMsgHL7.SetValueAt(PD1,"PD1")
        	s tSC1=NewMsgHL7iPlan.SetValueAt(PD1,"PD1")
        	s tSC1=NewMsgHL7Ina8.SetValueAt(PD1Ina8,"PD1")
        	s:'$g(^CHUBXL.Parameter("MedWish","Bdoc")) tSC1=BdocMsgHL7.SetValueAt(PD1,"PD1")
        	s:$g(^CHUBXL.Parameter("MedWish","Bdoc")) tSC1=BdocMsgHL7.SetValueAt(PD1Ina8,"PD1")
        	s:'$g(^CHUBXL.Parameter("MedWish","Glims")) tSC1=GlimsMsgHL7.SetValueAt(PD1,"PD1")
        	s:$g(^CHUBXL.Parameter("MedWish","Glims")) tSC1=GlimsMsgHL7.SetValueAt(PD1Ina8,"PD1")
			s:'$g(^CHUBXL.Parameter("MedWish","Oxygen")) tSC1=OxygenMsgHL7.SetValueAt(PD1,"PD1")
			s:$g(^CHUBXL.Parameter("MedWish","Oxygen")) tSC1=OxygenMsgHL7.SetValueAt(PD1Ina8,"PD1")
			s:'$g(^CHUBXL.Parameter("MedWish","DentAdmin")) tSC1=DentAdminMsgHL7.SetValueAt(PD1,"PD1")
			s:$g(^CHUBXL.Parameter("MedWish","DentAdmin")) tSC1=DentAdminMsgHL7.SetValueAt(PD1Ina8,"PD1")
			s:'$g(^CHUBXL.Parameter("MedWish","Canexis")) tSC1=CanexisMsgHL7.SetValueAt(PD1,"PD1")
			s:$g(^CHUBXL.Parameter("MedWish","Canexis")) tSC1=CanexisMsgHL7.SetValueAt(PD1Ina8,"PD1")
        }
        i OBX'="" {
	        ;CWY attention photos
	        s tSC1=OxygenMsgHL7.SetValueAt(OBX,"OBX(1)")
	        s tSC1=BdocMsgHL7.SetValueAt(OBX,"OBX(1)")
	        s tSC1=DentAdminMsgHL7.SetValueAt(OBX,"OBX(1)")
	        i Instance="ENS2017TEST" s tSC1=NewMsgHL7.SetValueAt(OBX,"OBX(1)"),tSC1=NewMsgHL7Ina8.SetValueAt(OBX,"OBX(1)")

        }
        i NK11'="" {
	        s tSC1=MososMsgHL7.SetValueAt(NK11,"NK1(1)")
	        s tSC1=InfohosMsgHL7.SetValueAt($P(NK11,"|",1,19),"NK1(1)")
	        s tSC1=EcareMsgHL7.SetValueAt(NK11,"NK1(1)")
	        s tSC1=RequestMsgHL7.SetValueAt(NK11,"NK1(1)")
	        s tSC1=RequestMsgHL7Ina8.SetValueAt(NK11,"NK1(1)")
	        s tSC1=MvMsgHL7.SetValueAt(NK11,"NK1(1)")
	        s tSC1=NewMsgHL7.SetValueAt(NK11,"NK1(1)")
	        s tSC1=NewMsgHL7iPlan.SetValueAt(NK11,"NK1(1)")
	        s tSC1=NewMsgHL7Ina8.SetValueAt(NK11,"NK1(1)")
	        s tSC1=BdocMsgHL7.SetValueAt(NK11,"NK1(1)")
	        s tSC1=GlimsMsgHL7.SetValueAt(NK11,"NK1(1)")
	        s tSC1=OxygenMsgHL7.SetValueAt(NK11,"NK1(1)")
	        s tSC1=DentAdminMsgHL7.SetValueAt(NK11,"NK1(1)")
	        s tSC1=CanexisMsgHL7.SetValueAt(NK11,"NK1(1)")
        }
        i NK12'="" {
	        s tSC1=MososMsgHL7.SetValueAt(NK12,"NK1(2)")
	        s tSC1=InfohosMsgHL7.SetValueAt($P(NK12,"|",1,19),"NK1(2)")
	        s tSC1=EcareMsgHL7.SetValueAt(NK12,"NK1(2)")
	        s tSC1=RequestMsgHL7.SetValueAt(NK12,"NK1(2)")
	        s tSC1=RequestMsgHL7Ina8.SetValueAt(NK12,"NK1(2)")
	        s tSC1=MvMsgHL7.SetValueAt(NK12,"NK1(2)")
	        s tSC1=NewMsgHL7.SetValueAt(NK12,"NK1(2)")
	        s tSC1=NewMsgHL7iPlan.SetValueAt(NK12,"NK1(2)")
	        s tSC1=NewMsgHL7Ina8.SetValueAt(NK12,"NK1(2)")
	        s tSC1=BdocMsgHL7.SetValueAt(NK12,"NK1(2)")
	        s tSC1=GlimsMsgHL7.SetValueAt(NK12,"NK1(2)")
	        s tSC1=OxygenMsgHL7.SetValueAt(NK12,"NK1(2)")
	        s tSC1=DentAdminMsgHL7.SetValueAt(NK12,"NK1(2)")
	        s tSC1=CanexisMsgHL7.SetValueAt(NK12,"NK1(2)")
        }
        i NK13'="" {
	        s tSC1=MososMsgHL7.SetValueAt(NK13,"NK1(3)")
	        s tSC1=InfohosMsgHL7.SetValueAt($P(NK13,"|",1,19),"NK1(3)")
	        s tSC1=EcareMsgHL7.SetValueAt(NK13,"NK1(3)")
	        s tSC1=RequestMsgHL7.SetValueAt(NK13,"NK1(3)")
	        s tSC1=RequestMsgHL7Ina8.SetValueAt(NK13,"NK1(3)")
	        s tSC1=MvMsgHL7.SetValueAt(NK13,"NK1(3)")
	        s tSC1=NewMsgHL7.SetValueAt(NK13,"NK1(3)")
	        s tSC1=NewMsgHL7iPlan.SetValueAt(NK13,"NK1(3)")
	        s tSC1=NewMsgHL7Ina8.SetValueAt(NK13,"NK1(3)")
	        s tSC1=BdocMsgHL7.SetValueAt(NK13,"NK1(3)")
	        s tSC1=GlimsMsgHL7.SetValueAt(NK13,"NK1(3)")
	        s tSC1=OxygenMsgHL7.SetValueAt(NK13,"NK1(3)")
	        s tSC1=DentAdminMsgHL7.SetValueAt(NK13,"NK1(3)")
	        s tSC1=CanexisMsgHL7.SetValueAt(NK13,"NK1(3)")
        }
        i NK14'="" {
	        s tSC1=MososMsgHL7.SetValueAt(NK14,"NK1(4)")
	        s tSC1=InfohosMsgHL7.SetValueAt($P(NK14,"|",1,19),"NK1(4)")
	        s tSC1=EcareMsgHL7.SetValueAt(NK14,"NK1(4)")
	        s tSC1=RequestMsgHL7.SetValueAt(NK14,"NK1(4)")
	        s tSC1=RequestMsgHL7Ina8.SetValueAt(NK14,"NK1(4)")
	        s tSC1=MvMsgHL7.SetValueAt(NK14,"NK1(4)")
	        s tSC1=NewMsgHL7.SetValueAt(NK14,"NK1(4)")
	        s tSC1=NewMsgHL7iPlan.SetValueAt(NK14,"NK1(4)")
	        s tSC1=NewMsgHL7Ina8.SetValueAt(NK14,"NK1(4)")
	        s tSC1=BdocMsgHL7.SetValueAt(NK14,"NK1(4)")
	        s tSC1=GlimsMsgHL7.SetValueAt(NK14,"NK1(4)")
	        s tSC1=OxygenMsgHL7.SetValueAt(NK14,"NK1(4)")
	        s tSC1=DentAdminMsgHL7.SetValueAt(NK14,"NK1(4)")
	        s tSC1=CanexisMsgHL7.SetValueAt(NK14,"NK1(4)")
        }
        i NK15'="" {
	        s tSC1=MososMsgHL7.SetValueAt(NK15,"NK1(5)")
	        s tSC1=InfohosMsgHL7.SetValueAt($P(NK15,"|",1,19),"NK1(5)")
	        s tSC1=EcareMsgHL7.SetValueAt(NK15,"NK1(5)")
	        s tSC1=RequestMsgHL7.SetValueAt(NK15,"NK1(5)")
	        s tSC1=RequestMsgHL7Ina8.SetValueAt(NK15,"NK1(5)")
	        s tSC1=MvMsgHL7.SetValueAt(NK15,"NK1(5)")
	        s tSC1=NewMsgHL7.SetValueAt(NK15,"NK1(5)")
	        s tSC1=NewMsgHL7iPlan.SetValueAt(NK15,"NK1(5)")
	        s tSC1=NewMsgHL7Ina8.SetValueAt(NK15,"NK1(5)")
	        s tSC1=BdocMsgHL7.SetValueAt(NK15,"NK1(5)")
	        s tSC1=GlimsMsgHL7.SetValueAt(NK15,"NK1(5)")
	        s tSC1=OxygenMsgHL7.SetValueAt(NK15,"NK1(5)")
	        s tSC1=DentAdminMsgHL7.SetValueAt(NK15,"NK1(5)")
	        s tSC1=CanexisMsgHL7.SetValueAt(NK15,"NK1(5)")
        }
        i NK16'="" {
	        s tSC1=MososMsgHL7.SetValueAt(NK16,"NK1(6)")
	        s tSC1=InfohosMsgHL7.SetValueAt($P(NK16,"|",1,19),"NK1(6)")
	        s tSC1=EcareMsgHL7.SetValueAt(NK16,"NK1(6)")
	        s tSC1=RequestMsgHL7.SetValueAt(NK16,"NK1(6)")
	        s tSC1=RequestMsgHL7Ina8.SetValueAt(NK16,"NK1(6)")
	        s tSC1=MvMsgHL7.SetValueAt(NK16,"NK1(6)")
	        s tSC1=NewMsgHL7.SetValueAt(NK16,"NK1(6)")
	        s tSC1=NewMsgHL7iPlan.SetValueAt(NK16,"NK1(6)")
	        s tSC1=NewMsgHL7Ina8.SetValueAt(NK16,"NK1(6)")
	        s tSC1=BdocMsgHL7.SetValueAt(NK16,"NK1(6)")
	        s tSC1=GlimsMsgHL7.SetValueAt(NK16,"NK1(6)")
	        s tSC1=OxygenMsgHL7.SetValueAt(NK16,"NK1(6)")
	        s tSC1=DentAdminMsgHL7.SetValueAt(NK16,"NK1(6)")
	        s tSC1=CanexisMsgHL7.SetValueAt(NK16,"NK1(6)")
        }
        i NK17'="" {
	        s tSC1=MososMsgHL7.SetValueAt(NK17,"NK1(7)")
	        s tSC1=InfohosMsgHL7.SetValueAt($P(NK17,"|",1,19),"NK1(7)")
	        s tSC1=EcareMsgHL7.SetValueAt(NK17,"NK1(7)")
	        s tSC1=RequestMsgHL7.SetValueAt(NK17,"NK1(7)")
	        s tSC1=RequestMsgHL7Ina8.SetValueAt(NK17,"NK1(7)")
	        s tSC1=MvMsgHL7.SetValueAt(NK17,"NK1(7)")
	        s tSC1=NewMsgHL7.SetValueAt(NK17,"NK1(7)")
	        s tSC1=NewMsgHL7iPlan.SetValueAt(NK17,"NK1(7)")
	        s tSC1=NewMsgHL7Ina8.SetValueAt(NK17,"NK1(7)")
	        s tSC1=BdocMsgHL7.SetValueAt(NK17,"NK1(7)")
	        s tSC1=GlimsMsgHL7.SetValueAt(NK17,"NK1(7)")
	        s tSC1=OxygenMsgHL7.SetValueAt(NK17,"NK1(7)")
	        s tSC1=DentAdminMsgHL7.SetValueAt(NK17,"NK1(7)")
	        s tSC1=CanexisMsgHL7.SetValueAt(NK17,"NK1(7)")
        }
        i NK18'="" {
	        s tSC1=MososMsgHL7.SetValueAt(NK18,"NK1(8)")
	        s tSC1=InfohosMsgHL7.SetValueAt($P(NK18,"|",1,19),"NK1(8)")
	        s tSC1=EcareMsgHL7.SetValueAt(NK18,"NK1(8)")
	        s tSC1=RequestMsgHL7.SetValueAt(NK18,"NK1(8)")
	        s tSC1=RequestMsgHL7Ina8.SetValueAt(NK18,"NK1(8)")
	        s tSC1=MvMsgHL7.SetValueAt(NK18,"NK1(8)")
	        s tSC1=NewMsgHL7.SetValueAt(NK18,"NK1(8)")
	        s tSC1=NewMsgHL7iPlan.SetValueAt(NK18,"NK1(8)")
	        s tSC1=NewMsgHL7Ina8.SetValueAt(NK18,"NK1(8)")
	        s tSC1=BdocMsgHL7.SetValueAt(NK18,"NK1(8)")
	        s tSC1=GlimsMsgHL7.SetValueAt(NK18,"NK1(8)")
	        s tSC1=OxygenMsgHL7.SetValueAt(NK18,"NK1(8)")
	        s tSC1=DentAdminMsgHL7.SetValueAt(NK18,"NK1(8)")
	        s tSC1=CanexisMsgHL7.SetValueAt(NK18,"NK1(8)")
        }
        i PV1'="" {
        	s:'$g(^CHUBXL.Parameter("MedWish","Mosos")) tSC1=MososMsgHL7.SetValueAt(PV1,"PV1")
        	s:$g(^CHUBXL.Parameter("MedWish","Mosos")) tSC1=MososMsgHL7.SetValueAt(PV1Ina8,"PV1")
        	s:'$g(^CHUBXL.Parameter("MedWish","Ecare")) tSC1=EcareMsgHL7.SetValueAt(PV1,"PV1")
        	s:$g(^CHUBXL.Parameter("MedWish","Ecare")) tSC1=EcareMsgHL7.SetValueAt(PV1Ina8,"PV1")
        	s:'$g(^CHUBXL.Parameter("MedWish","Infohos")) tSC1=InfohosMsgHL7.SetValueAt(PV1,"PV1")
        	s:$g(^CHUBXL.Parameter("MedWish","Infohos")) tSC1=InfohosMsgHL7.SetValueAt(PV1Ina8,"PV1")
        	s tSC1=RequestMsgHL7.SetValueAt(PV1,"PV1")
        	s tSC1=RequestMsgHL7Ina8.SetValueAt(PV1Ina8,"PV1")
        	s:'$g(^CHUBXL.Parameter("MedWish","Mv")) tSC1=MvMsgHL7.SetValueAt(PV1,"PV1")
        	s:$g(^CHUBXL.Parameter("MedWish","Mv")) tSC1=MvMsgHL7.SetValueAt(PV1Ina8,"PV1")
        	s tSC1=NewMsgHL7.SetValueAt(PV1,"PV1")
        	s tSC1=NewMsgHL7iPlan.SetValueAt(PV1,"PV1")
        	s tSC1=NewMsgHL7Ina8.SetValueAt(PV1Ina8,"PV1")
        	s:'$g(^CHUBXL.Parameter("MedWish","Bdoc")) tSC1=BdocMsgHL7.SetValueAt(PV1,"PV1")
        	s:$g(^CHUBXL.Parameter("MedWish","Bdoc")) tSC1=BdocMsgHL7.SetValueAt(PV1Ina8,"PV1")
        	s:'$g(^CHUBXL.Parameter("MedWish","Glims")) tSC1=GlimsMsgHL7.SetValueAt(PV1,"PV1")
        	s:$g(^CHUBXL.Parameter("MedWish","Glims")) tSC1=GlimsMsgHL7.SetValueAt(PV1Ina8,"PV1")
			s:'$g(^CHUBXL.Parameter("MedWish","Oxygen")) tSC1=OxygenMsgHL7.SetValueAt(PV1,"PV1")
			s:$g(^CHUBXL.Parameter("MedWish","Oxygen")) tSC1=OxygenMsgHL7.SetValueAt(PV1Ina8,"PV1")
			i ('$g(^CHUBXL.Parameter("MedWish","DentAdmin"))) & (MsgType'="A40") s tSC1=DentAdminMsgHL7.SetValueAt(PV1,"PV1")
			i ($g(^CHUBXL.Parameter("MedWish","DentAdmin"))) & (MsgType'="A40") s tSC1=DentAdminMsgHL7.SetValueAt(PV1Ina8,"PV1")
			i ('$g(^CHUBXL.Parameter("MedWish","Canexis"))) & (MsgType'="A40") s tSC1=CanexisMsgHL7.SetValueAt(PV1,"PV1")
			i ($g(^CHUBXL.Parameter("MedWish","Canexis"))) & (MsgType'="A40") s tSC1=CanexisMsgHL7.SetValueAt(PV1Ina8,"PV1")
        }
        i PV2'="" {
        	s:'$g(^CHUBXL.Parameter("MedWish","Mosos")) tSC1=MososMsgHL7.SetValueAt(PV2,"PV2")
        	s:$g(^CHUBXL.Parameter("MedWish","Mosos")) tSC1=MososMsgHL7.SetValueAt(PV2Ina8,"PV2")
        	s:'$g(^CHUBXL.Parameter("MedWish","Ecare")) tSC1=EcareMsgHL7.SetValueAt(PV2,"PV2")
        	s:$g(^CHUBXL.Parameter("MedWish","Ecare")) tSC1=EcareMsgHL7.SetValueAt(PV2Ina8,"PV2")
        	s:'$g(^CHUBXL.Parameter("MedWish","Infohos")) tSC1=InfohosMsgHL7.SetValueAt(PV2,"PV2")
        	s:$g(^CHUBXL.Parameter("MedWish","Infohos")) tSC1=InfohosMsgHL7.SetValueAt(PV2Ina8,"PV2")
        	s tSC1=RequestMsgHL7.SetValueAt(PV2,"PV2")
        	s tSC1=RequestMsgHL7Ina8.SetValueAt(PV2Ina8,"PV2")
        	s:'$g(^CHUBXL.Parameter("MedWish","Mv")) tSC1=MvMsgHL7.SetValueAt(PV2,"PV2")
        	s:$g(^CHUBXL.Parameter("MedWish","Mv")) tSC1=MvMsgHL7.SetValueAt(PV2Ina8,"PV2")
        	s tSC1=NewMsgHL7.SetValueAt(PV2,"PV2")
        	s tSC1=NewMsgHL7iPlan.SetValueAt(PV2,"PV2")
        	s tSC1=NewMsgHL7Ina8.SetValueAt(PV2Ina8,"PV2")
        	s:'$g(^CHUBXL.Parameter("MedWish","Bdoc")) tSC1=BdocMsgHL7.SetValueAt(PV2,"PV2")
        	s:$g(^CHUBXL.Parameter("MedWish","Bdoc")) tSC1=BdocMsgHL7.SetValueAt(PV2Ina8,"PV2")
        	s:'$g(^CHUBXL.Parameter("MedWish","Glims")) tSC1=GlimsMsgHL7.SetValueAt(PV2,"PV2")
        	s:$g(^CHUBXL.Parameter("MedWish","Glims")) tSC1=GlimsMsgHL7.SetValueAt(PV2Ina8,"PV2")
			s:'$g(^CHUBXL.Parameter("MedWish","Oxygen")) tSC1=OxygenMsgHL7.SetValueAt(PV2,"PV2")
			s:$g(^CHUBXL.Parameter("MedWish","Oxygen")) tSC1=OxygenMsgHL7.SetValueAt(PV2Ina8,"PV2")
			s:'$g(^CHUBXL.Parameter("MedWish","DentAdmin")) tSC1=DentAdminMsgHL7.SetValueAt(PV2,"PV2")
			s:$g(^CHUBXL.Parameter("MedWish","DentAdmin")) tSC1=DentAdminMsgHL7.SetValueAt(PV2Ina8,"PV2")
			s:'$g(^CHUBXL.Parameter("MedWish","Canexis")) tSC1=CanexisMsgHL7.SetValueAt(PV2,"PV2")
			s:$g(^CHUBXL.Parameter("MedWish","Canexis")) tSC1=CanexisMsgHL7.SetValueAt(PV2Ina8,"PV2")
        }
        i MRG'="" {
            s tSC1=MososMsgHL7.SetValueAt(MRG,"IN1grp(1).ROL(1)")
            s tSC1=InfohosMsgHL7.SetValueAt(MRG,"IN1grp(1).ROL(1)")
            s tSC1=EcareMsgHL7.SetValueAt(MRG,"IN1grp(1).ROL(1)")
            s tSC1=RequestMsgHL7.SetValueAt(MRG,"IN1grp(1).ROL(1)")
            s tSC1=RequestMsgHL7Ina8.SetValueAt(MRG,"IN1grp(1).ROL(1)")
            s tSC1=NewMsgHL7.SetValueAt(MRG,"IN1grp(1).ROL(1)")
            s tSC1=NewMsgHL7iPlan.SetValueAt(MRG,"IN1grp(1).ROL(1)")
            s tSC1=NewMsgHL7Ina8.SetValueAt(MRG,"IN1grp(1).ROL(1)")
            s tSC1=BdocMsgHL7.SetValueAt(MRG,"IN1grp(1).ROL(1)")
            s tSC1=GlimsMsgHL7.SetValueAt(MRG,"IN1grp(1).ROL(1)")
            s tSC1=MvMsgHL7.SetValueAt(MRGMV,"IN1grp(1).ROL(1)")
            s tSC1=OxygenMsgHL7.SetValueAt(MRG,"IN1grp(1).ROL(1)")
            s tSC1=DentAdminMsgHL7.SetValueAt(MRG,"IN1grp(1).ROL(1)")
            s tSC1=CanexisMsgHL7.SetValueAt(MRG,"IN1grp(1).ROL(1)")
        }
        i IN11'="" {
	        s tSC1=MososMsgHL7.SetValueAt(IN11,"IN1grp(1).IN1")
	        s tSC1=InfohosMsgHL7.SetValueAt(IN11,"IN1grp(1).IN1")
	        s tSC1=EcareMsgHL7.SetValueAt(IN11,"IN1grp(1).IN1")
	        s tSC1=RequestMsgHL7.SetValueAt(IN11,"IN1grp(1).IN1")
	        s tSC1=RequestMsgHL7Ina8.SetValueAt(IN11,"IN1grp(1).IN1")
	        s tSC1=MvMsgHL7.SetValueAt(IN11,"IN1grp(1).IN1")
	        s tSC1=NewMsgHL7.SetValueAt(IN11,"IN1grp(1).IN1")
	        s tSC1=NewMsgHL7iPlan.SetValueAt(IN11,"IN1grp(1).IN1")
	        s tSC1=NewMsgHL7Ina8.SetValueAt(IN11,"IN1grp(1).IN1")
	        s tSC1=BdocMsgHL7.SetValueAt(IN11,"IN1grp(1).IN1")
	        s tSC1=GlimsMsgHL7.SetValueAt(IN11,"IN1grp(1).IN1")
	        i Instance="ENS2017TEST",$p(IN11,"|",3)=2 s tSC1=GlimsMsgHL7.SetValueAt($p(IN11,"|",1,13)_"|20501231|"_$p(IN11,"|",15,99),"IN1grp(1).IN1")
	        s tSC1=OxygenMsgHL7.SetValueAt(IN11,"IN1grp(1).IN1")
	        s tSC1=DentAdminMsgHL7.SetValueAt(IN11,"IN1grp(1).IN1")
	        s tSC1=CanexisMsgHL7.SetValueAt(IN11,"IN1grp(1).IN1")
        }
        i IN12'="" {
	        s tSC1=MososMsgHL7.SetValueAt(IN12,"IN1grp(2).IN1")
	        s tSC1=InfohosMsgHL7.SetValueAt(IN12,"IN1grp(2).IN1")
	        s tSC1=EcareMsgHL7.SetValueAt(IN12,"IN1grp(2).IN1")
	        s tSC1=RequestMsgHL7.SetValueAt(IN12,"IN1grp(2).IN1")
	        s tSC1=RequestMsgHL7Ina8.SetValueAt(IN12,"IN1grp(2).IN1")
	        s tSC1=MvMsgHL7.SetValueAt(IN12,"IN1grp(2).IN1")
	        s tSC1=NewMsgHL7.SetValueAt(IN12,"IN1grp(2).IN1")
	        s tSC1=NewMsgHL7iPlan.SetValueAt(IN12,"IN1grp(2).IN1")
	        s tSC1=NewMsgHL7Ina8.SetValueAt(IN12,"IN1grp(2).IN1")
	        s tSC1=BdocMsgHL7.SetValueAt(IN12,"IN1grp(2).IN1")
	        s tSC1=GlimsMsgHL7.SetValueAt(IN12,"IN1grp(2).IN1")
	        i Instance="ENS2017TEST",$p(IN12,"|",3)=2 s tSC1=GlimsMsgHL7.SetValueAt($p(IN12,"|",1,13)_"|20501231|"_$p(IN12,"|",15,99),"IN1grp(2).IN1")
	        s tSC1=OxygenMsgHL7.SetValueAt(IN12,"IN1grp(2).IN1")
	        s tSC1=DentAdminMsgHL7.SetValueAt(IN12,"IN1grp(2).IN1")
	        s tSC1=CanexisMsgHL7.SetValueAt(IN12,"IN1grp(2).IN1")
        }
        i IN13'="" {
	        s tSC1=MososMsgHL7.SetValueAt(IN13,"IN1grp(3).IN1")
	        s tSC1=InfohosMsgHL7.SetValueAt(IN13,"IN1grp(3).IN1")
	        s tSC1=EcareMsgHL7.SetValueAt(IN13,"IN1grp(3).IN1")
	        s tSC1=RequestMsgHL7.SetValueAt(IN13,"IN1grp(3).IN1")
	        s tSC1=RequestMsgHL7Ina8.SetValueAt(IN13,"IN1grp(3).IN1")
	        s tSC1=MvMsgHL7.SetValueAt(IN13,"IN1grp(3).IN1")
	        s tSC1=NewMsgHL7.SetValueAt(IN13,"IN1grp(3).IN1")
	        s tSC1=NewMsgHL7iPlan.SetValueAt(IN13,"IN1grp(3).IN1")
	        s tSC1=NewMsgHL7Ina8.SetValueAt(IN13,"IN1grp(3).IN1")
	        s tSC1=BdocMsgHL7.SetValueAt(IN13,"IN1grp(3).IN1")
	        s tSC1=GlimsMsgHL7.SetValueAt(IN13,"IN1grp(3).IN1")
	        i Instance="ENS2017TEST",$p(IN13,"|",3)=2 s tSC1=GlimsMsgHL7.SetValueAt($p(IN13,"|",1,13)_"|20501231|"_$p(IN13,"|",15,99),"IN1grp(3).IN1")
	        s tSC1=OxygenMsgHL7.SetValueAt(IN13,"IN1grp(3).IN1")
	        s tSC1=DentAdminMsgHL7.SetValueAt(IN13,"IN1grp(3).IN1")
	        s tSC1=CanexisMsgHL7.SetValueAt(IN13,"IN1grp(3).IN1")
        }
        i IN14'="" {
	        s tSC1=MososMsgHL7.SetValueAt(IN14,"IN1grp(4).IN1")
	        s tSC1=InfohosMsgHL7.SetValueAt(IN14,"IN1grp(4).IN1")
	        s tSC1=EcareMsgHL7.SetValueAt(IN14,"IN1grp(4).IN1")
	        s tSC1=RequestMsgHL7.SetValueAt(IN14,"IN1grp(4).IN1")
	        s tSC1=RequestMsgHL7Ina8.SetValueAt(IN14,"IN1grp(4).IN1")
	        s tSC1=MvMsgHL7.SetValueAt(IN14,"IN1grp(4).IN1")
	        s tSC1=NewMsgHL7.SetValueAt(IN14,"IN1grp(4).IN1")
	        s tSC1=NewMsgHL7iPlan.SetValueAt(IN14,"IN1grp(4).IN1")
	        s tSC1=NewMsgHL7Ina8.SetValueAt(IN14,"IN1grp(4).IN1")
	        s tSC1=BdocMsgHL7.SetValueAt(IN14,"IN1grp(4).IN1")
	        s tSC1=GlimsMsgHL7.SetValueAt(IN14,"IN1grp(4).IN1")
	        i Instance="ENS2017TEST",$p(IN14,"|",3)=2 s tSC1=GlimsMsgHL7.SetValueAt($p(IN14,"|",1,13)_"|20501231|"_$p(IN14,"|",15,99),"IN1grp(4).IN1")
	        s tSC1=OxygenMsgHL7.SetValueAt(IN14,"IN1grp(4).IN1")
	        s tSC1=DentAdminMsgHL7.SetValueAt(IN14,"IN1grp(4).IN1")
	        s tSC1=CanexisMsgHL7.SetValueAt(IN14,"IN1grp(4).IN1")
        }
        i IN15'="" {
	        s tSC1=MososMsgHL7.SetValueAt(IN15,"IN1grp(5).IN1")
	        s tSC1=InfohosMsgHL7.SetValueAt(IN15,"IN1grp(5).IN1")
	        s tSC1=EcareMsgHL7.SetValueAt(IN15,"IN1grp(5).IN1")
	        s tSC1=RequestMsgHL7.SetValueAt(IN15,"IN1grp(5).IN1")
	        s tSC1=RequestMsgHL7Ina8.SetValueAt(IN15,"IN1grp(5).IN1")
	        s tSC1=MvMsgHL7.SetValueAt(IN15,"IN1grp(5).IN1")
	        s tSC1=NewMsgHL7.SetValueAt(IN15,"IN1grp(5).IN1")
	        s tSC1=NewMsgHL7iPlan.SetValueAt(IN15,"IN1grp(5).IN1")
	        s tSC1=NewMsgHL7Ina8.SetValueAt(IN15,"IN1grp(5).IN1")
	        s tSC1=BdocMsgHL7.SetValueAt(IN15,"IN1grp(5).IN1")
	        s tSC1=GlimsMsgHL7.SetValueAt(IN15,"IN1grp(5).IN1")
	        i Instance="ENS2017TEST",$p(IN15,"|",3)=2 s tSC1=GlimsMsgHL7.SetValueAt($p(IN15,"|",1,13)_"|20501231|"_$p(IN15,"|",15,99),"IN1grp(5).IN1")
	        s tSC1=OxygenMsgHL7.SetValueAt(IN15,"IN1grp(5).IN1")
	        s tSC1=DentAdminMsgHL7.SetValueAt(IN15,"IN1grp(5).IN1")
	        s tSC1=CanexisMsgHL7.SetValueAt(IN15,"IN1grp(5).IN1")
        }
        i IN16'=""{
	         s tSC1=MososMsgHL7.SetValueAt(IN16,"IN1grp(6).IN1")
	         s tSC1=InfohosMsgHL7.SetValueAt(IN16,"IN1grp(6).IN1")
	         s tSC1=EcareMsgHL7.SetValueAt(IN16,"IN1grp(6).IN1")
	         s tSC1=RequestMsgHL7.SetValueAt(IN16,"IN1grp(6).IN1")
	         s tSC1=RequestMsgHL7Ina8.SetValueAt(IN16,"IN1grp(6).IN1")
	         s tSC1=MvMsgHL7.SetValueAt(IN16,"IN1grp(6).IN1")
	         s tSC1=NewMsgHL7.SetValueAt(IN16,"IN1grp(6).IN1")
	         s tSC1=NewMsgHL7iPlan.SetValueAt(IN16,"IN1grp(6).IN1")
	         s tSC1=NewMsgHL7Ina8.SetValueAt(IN16,"IN1grp(6).IN1")
	         s tSC1=BdocMsgHL7.SetValueAt(IN16,"IN1grp(6).IN1")
	         s tSC1=GlimsMsgHL7.SetValueAt(IN16,"IN1grp(6).IN1")
	         i Instance="ENS2017TEST",$p(IN16,"|",3)=2 s tSC1=GlimsMsgHL7.SetValueAt($p(IN16,"|",1,13)_"|20501231|"_$p(IN16,"|",15,99),"IN1grp(6).IN1")
	         s tSC1=OxygenMsgHL7.SetValueAt(IN16,"IN1grp(6).IN1")
	         s tSC1=DentAdminMsgHL7.SetValueAt(IN16,"IN1grp(6).IN1")
	         s tSC1=CanexisMsgHL7.SetValueAt(IN16,"IN1grp(6).IN1")
        }
        i IN17'="" {
	        s tSC1=MososMsgHL7.SetValueAt(IN17,"IN1grp(7).IN1")
	        s tSC1=InfohosMsgHL7.SetValueAt(IN17,"IN1grp(7).IN1")
	        s tSC1=EcareMsgHL7.SetValueAt(IN17,"IN1grp(7).IN1")
	        s tSC1=RequestMsgHL7.SetValueAt(IN17,"IN1grp(7).IN1")
	        s tSC1=RequestMsgHL7Ina8.SetValueAt(IN17,"IN1grp(7).IN1")
	        s tSC1=MvMsgHL7.SetValueAt(IN17,"IN1grp(7).IN1")
	        s tSC1=NewMsgHL7.SetValueAt(IN17,"IN1grp(7).IN1")
	        s tSC1=NewMsgHL7iPlan.SetValueAt(IN17,"IN1grp(7).IN1")
	        s tSC1=NewMsgHL7Ina8.SetValueAt(IN17,"IN1grp(7).IN1")
	        s tSC1=BdocMsgHL7.SetValueAt(IN17,"IN1grp(7).IN1")
	        s tSC1=GlimsMsgHL7.SetValueAt(IN17,"IN1grp(7).IN1")
	        i Instance="ENS2017TEST",$p(IN17,"|",3)=2 s tSC1=GlimsMsgHL7.SetValueAt($p(IN17,"|",1,13)_"|20501231|"_$p(IN17,"|",15,99),"IN1grp(7).IN1")
	        s tSC1=OxygenMsgHL7.SetValueAt(IN17,"IN1grp(7).IN1")
	        s tSC1=DentAdminMsgHL7.SetValueAt(IN17,"IN1grp(7).IN1")
	        s tSC1=CanexisMsgHL7.SetValueAt(IN17,"IN1grp(7).IN1")
        }
        i IN18'="" {
	        s tSC1=MososMsgHL7.SetValueAt(IN18,"IN1grp(8).IN1")
	        s tSC1=InfohosMsgHL7.SetValueAt(IN18,"IN1grp(8).IN1")
	        s tSC1=EcareMsgHL7.SetValueAt(IN18,"IN1grp(8).IN1")
	        s tSC1=RequestMsgHL7.SetValueAt(IN18,"IN1grp(8).IN1")
	        s tSC1=RequestMsgHL7Ina8.SetValueAt(IN18,"IN1grp(8).IN1")
	        s tSC1=MvMsgHL7.SetValueAt(IN18,"IN1grp(8).IN1")
	        s tSC1=NewMsgHL7.SetValueAt(IN18,"IN1grp(8).IN1")
	        s tSC1=NewMsgHL7iPlan.SetValueAt(IN18,"IN1grp(8).IN1")
	        s tSC1=NewMsgHL7Ina8.SetValueAt(IN18,"IN1grp(8).IN1")
	        s tSC1=BdocMsgHL7.SetValueAt(IN18,"IN1grp(8).IN1")
	        s tSC1=GlimsMsgHL7.SetValueAt(IN18,"IN1grp(8).IN1")
	        i Instance="ENS2017TEST",$p(IN18,"|",3)=2 s tSC1=GlimsMsgHL7.SetValueAt($p(IN18,"|",1,13)_"|20501231|"_$p(IN18,"|",15,99),"IN1grp(8).IN1")
	        s tSC1=OxygenMsgHL7.SetValueAt(IN18,"IN1grp(8).IN1")
	        s tSC1=DentAdminMsgHL7.SetValueAt(IN18,"IN1grp(8).IN1")
	        s tSC1=CanexisMsgHL7.SetValueAt(IN18,"IN1grp(8).IN1")
        }
        i IN19'="" {
	        s tSC1=MososMsgHL7.SetValueAt(IN19,"IN1grp(9).IN1")
	        s tSC1=InfohosMsgHL7.SetValueAt(IN19,"IN1grp(9).IN1")
	        s tSC1=EcareMsgHL7.SetValueAt(IN19,"IN1grp(9).IN1")
	        s tSC1=RequestMsgHL7.SetValueAt(IN19,"IN1grp(9).IN1")
	        s tSC1=RequestMsgHL7Ina8.SetValueAt(IN19,"IN1grp(9).IN1")
	        s tSC1=MvMsgHL7.SetValueAt(IN19,"IN1grp(9).IN1")
	        s tSC1=NewMsgHL7.SetValueAt(IN19,"IN1grp(9).IN1")
	        s tSC1=NewMsgHL7iPlan.SetValueAt(IN19,"IN1grp(9).IN1")
	        s tSC1=NewMsgHL7Ina8.SetValueAt(IN19,"IN1grp(9).IN1")
	        s tSC1=BdocMsgHL7.SetValueAt(IN19,"IN1grp(9).IN1")
	        s tSC1=GlimsMsgHL7.SetValueAt(ZIN1,"IN1grp(1).ROL(1)")
	        i Instance="ENS2017TEST",$p(IN19,"|",3)=2 s tSC1=GlimsMsgHL7.SetValueAt($p(IN19,"|",1,13)_"|20501231|"_$p(IN19,"|",15,99),"IN1grp(9).IN1")
	        s tSC1=OxygenMsgHL7.SetValueAt(ZIN1,"IN1grp(1).ROL(1)")
	        s tSC1=DentAdminMsgHL7.SetValueAt(ZIN1,"IN1grp(1).ROL(1)")
	        s tSC1=CanexisMsgHL7.SetValueAt(ZIN1,"IN1grp(1).ROL(1)")
        }
        i ZIN1'="" {
	        s tSC1=MososMsgHL7.SetValueAt(ZIN1,"IN1grp(1).ROL(1)")
	        s tSC1=InfohosMsgHL7.SetValueAt(ZIN1,"IN1grp(1).ROL(1)")
	        s tSC1=EcareMsgHL7.SetValueAt(ZIN1,"IN1grp(1).ROL(1)")
	        s tSC1=RequestMsgHL7.SetValueAt(ZIN1,"IN1grp(1).ROL(1)")
	        s tSC1=RequestMsgHL7Ina8.SetValueAt(ZIN1,"IN1grp(1).ROL(1)")
	        s tSC1=MvMsgHL7.SetValueAt(ZIN1,"IN1grp(1).ROL(1)")
	        s tSC1=NewMsgHL7.SetValueAt(ZIN1,"IN1grp(1).ROL(1)")
	        s tSC1=NewMsgHL7iPlan.SetValueAt(ZIN1,"IN1grp(1).ROL(1)")
	        s tSC1=NewMsgHL7Ina8.SetValueAt(ZIN1,"IN1grp(1).ROL(1)")
	        s tSC1=BdocMsgHL7.SetValueAt(ZIN1,"IN1grp(1).ROL(1)")
	        s tSC1=GlimsMsgHL7.SetValueAt(ZIN1,"IN1grp(1).ROL(1)")
	        s tSC1=OxygenMsgHL7.SetValueAt(ZIN1,"IN1grp(1).ROL(1)")
	        s tSC1=DentAdminMsgHL7.SetValueAt(ZIN1,"IN1grp(1).ROL(1)")
	        s tSC1=CanexisMsgHL7.SetValueAt(ZIN1,"IN1grp(1).ROL(1)")
        }
        i ZIN2'="" {
	        s tSC1=MososMsgHL7.SetValueAt(ZIN2,"IN1grp(2).ROL(1)")
	        s tSC1=InfohosMsgHL7.SetValueAt(ZIN2,"IN1grp(2).ROL(1)")
	        s tSC1=EcareMsgHL7.SetValueAt(ZIN2,"IN1grp(2).ROL(1)")
	        s tSC1=RequestMsgHL7.SetValueAt(ZIN2,"IN1grp(2).ROL(1)")
	        s tSC1=RequestMsgHL7Ina8.SetValueAt(ZIN2,"IN1grp(2).ROL(1)")
	        s tSC1=MvMsgHL7.SetValueAt(ZIN2,"IN1grp(2).ROL(1)")
	        s tSC1=NewMsgHL7.SetValueAt(ZIN2,"IN1grp(2).ROL(1)")
	        s tSC1=NewMsgHL7iPlan.SetValueAt(ZIN2,"IN1grp(2).ROL(1)")
	        s tSC1=NewMsgHL7Ina8.SetValueAt(ZIN2,"IN1grp(2).ROL(1)")
	        s tSC1=BdocMsgHL7.SetValueAt(ZIN2,"IN1grp(2).ROL(1)")
	        s tSC1=GlimsMsgHL7.SetValueAt(ZIN2,"IN1grp(2).ROL(2)")
	        s tSC1=OxygenMsgHL7.SetValueAt(ZIN2,"IN1grp(2).ROL(2)")
	        s tSC1=DentAdminMsgHL7.SetValueAt(ZIN2,"IN1grp(2).ROL(2)")
	        s tSC1=CanexisMsgHL7.SetValueAt(ZIN2,"IN1grp(2).ROL(2)")
        }
        i ZIN3'="" {
	        s tSC1=MososMsgHL7.SetValueAt(ZIN3,"IN1grp(3).ROL(1)")
	        s tSC1=InfohosMsgHL7.SetValueAt(ZIN3,"IN1grp(3).ROL(1)")
	        s tSC1=EcareMsgHL7.SetValueAt(ZIN3,"IN1grp(3).ROL(1)")
	        s tSC1=RequestMsgHL7.SetValueAt(ZIN3,"IN1grp(3).ROL(1)")
	        s tSC1=RequestMsgHL7Ina8.SetValueAt(ZIN3,"IN1grp(3).ROL(1)")
	        s tSC1=MvMsgHL7.SetValueAt(ZIN3,"IN1grp(3).ROL(1)")
	        s tSC1=NewMsgHL7.SetValueAt(ZIN3,"IN1grp(3).ROL(1)")
	        s tSC1=NewMsgHL7iPlan.SetValueAt(ZIN3,"IN1grp(3).ROL(1)")
	        s tSC1=NewMsgHL7Ina8.SetValueAt(ZIN3,"IN1grp(3).ROL(1)")
	        s tSC1=BdocMsgHL7.SetValueAt(ZIN3,"IN1grp(3).ROL(1)")
	        s tSC1=GlimsMsgHL7.SetValueAt(ZIN3,"IN1grp(3).ROL(3)")
	        s tSC1=OxygenMsgHL7.SetValueAt(ZIN3,"IN1grp(3).ROL(3)")
	        s tSC1=DentAdminMsgHL7.SetValueAt(ZIN3,"IN1grp(3).ROL(3)")
	        s tSC1=CanexisMsgHL7.SetValueAt(ZIN3,"IN1grp(3).ROL(3)")
        }
        i ZIN4'="" {
	        s tSC1=MososMsgHL7.SetValueAt(ZIN4,"IN1grp(4).ROL(1)")
	        s tSC1=InfohosMsgHL7.SetValueAt(ZIN4,"IN1grp(4).ROL(1)")
	        s tSC1=EcareMsgHL7.SetValueAt(ZIN4,"IN1grp(4).ROL(1)")
	        s tSC1=RequestMsgHL7.SetValueAt(ZIN4,"IN1grp(4).ROL(1)")
	        s tSC1=RequestMsgHL7Ina8.SetValueAt(ZIN4,"IN1grp(4).ROL(1)")
	        s tSC1=MvMsgHL7.SetValueAt(ZIN4,"IN1grp(4).ROL(1)")
	        s tSC1=NewMsgHL7.SetValueAt(ZIN4,"IN1grp(4).ROL(1)")
	        s tSC1=NewMsgHL7iPlan.SetValueAt(ZIN4,"IN1grp(4).ROL(1)")
	        s tSC1=NewMsgHL7Ina8.SetValueAt(ZIN4,"IN1grp(4).ROL(1)")
	        s tSC1=BdocMsgHL7.SetValueAt(ZIN4,"IN1grp(4).ROL(1)")
	        s tSC1=GlimsMsgHL7.SetValueAt(ZIN4,"IN1grp(4).ROL(4)")
	        s tSC1=OxygenMsgHL7.SetValueAt(ZIN4,"IN1grp(4).ROL(4)")
	        s tSC1=DentAdminMsgHL7.SetValueAt(ZIN4,"IN1grp(4).ROL(4)")
	        s tSC1=CanexisMsgHL7.SetValueAt(ZIN4,"IN1grp(4).ROL(4)")
        }
        i ZIN5'="" {
	        s tSC1=MososMsgHL7.SetValueAt(ZIN5,"IN1grp(5).ROL(1)")
	        s tSC1=InfohosMsgHL7.SetValueAt(ZIN5,"IN1grp(5).ROL(1)")
	        s tSC1=EcareMsgHL7.SetValueAt(ZIN5,"IN1grp(5).ROL(1)")
	        s tSC1=RequestMsgHL7.SetValueAt(ZIN5,"IN1grp(5).ROL(1)")
	        s tSC1=RequestMsgHL7Ina8.SetValueAt(ZIN5,"IN1grp(5).ROL(1)")
	        s tSC1=MvMsgHL7.SetValueAt(ZIN5,"IN1grp(5).ROL(1)")
	        s tSC1=NewMsgHL7.SetValueAt(ZIN5,"IN1grp(5).ROL(1)")
	        s tSC1=NewMsgHL7iPlan.SetValueAt(ZIN5,"IN1grp(5).ROL(1)")
	        s tSC1=NewMsgHL7Ina8.SetValueAt(ZIN5,"IN1grp(5).ROL(1)")
	        s tSC1=BdocMsgHL7.SetValueAt(ZIN5,"IN1grp(5).ROL(1)")
	        s tSC1=GlimsMsgHL7.SetValueAt(ZIN5,"IN1grp(5).ROL(5)")
	        s tSC1=OxygenMsgHL7.SetValueAt(ZIN5,"IN1grp(5).ROL(5)")
	        s tSC1=DentAdminMsgHL7.SetValueAt(ZIN5,"IN1grp(5).ROL(5)")
	        s tSC1=CanexisMsgHL7.SetValueAt(ZIN5,"IN1grp(5).ROL(5)")
        }
        i ZIN6'="" {
	        s tSC1=MososMsgHL7.SetValueAt(ZIN6,"IN1grp(6).ROL(1)")
	        s tSC1=InfohosMsgHL7.SetValueAt(ZIN6,"IN1grp(6).ROL(1)")
	        s tSC1=EcareMsgHL7.SetValueAt(ZIN6,"IN1grp(6).ROL(1)")
	        s tSC1=RequestMsgHL7.SetValueAt(ZIN6,"IN1grp(6).ROL(1)")
	        s tSC1=RequestMsgHL7Ina8.SetValueAt(ZIN6,"IN1grp(6).ROL(1)")
	        s tSC1=MvMsgHL7.SetValueAt(ZIN6,"IN1grp(6).ROL(1)")
	        s tSC1=NewMsgHL7.SetValueAt(ZIN6,"IN1grp(6).ROL(1)")
	        s tSC1=NewMsgHL7iPlan.SetValueAt(ZIN6,"IN1grp(6).ROL(1)")
	        s tSC1=NewMsgHL7Ina8.SetValueAt(ZIN6,"IN1grp(6).ROL(1)")
	        s tSC1=BdocMsgHL7.SetValueAt(ZIN6,"IN1grp(6).ROL(1)")
	        s tSC1=GlimsMsgHL7.SetValueAt(ZIN6,"IN1grp(6).ROL(6)")
	        s tSC1=OxygenMsgHL7.SetValueAt(ZIN6,"IN1grp(6).ROL(6)")
	        s tSC1=DentAdminMsgHL7.SetValueAt(ZIN6,"IN1grp(6).ROL(6)")
	        s tSC1=CanexisMsgHL7.SetValueAt(ZIN6,"IN1grp(6).ROL(6)")
        }
        i ZIN7'="" {
	        s tSC1=MososMsgHL7.SetValueAt(ZIN7,"IN1grp(7).ROL(1)")
	        s tSC1=InfohosMsgHL7.SetValueAt(ZIN7,"IN1grp(7).ROL(1)")
	        s tSC1=EcareMsgHL7.SetValueAt(ZIN7,"IN1grp(7).ROL(1)")
	        s tSC1=RequestMsgHL7.SetValueAt(ZIN7,"IN1grp(7).ROL(1)")
	        s tSC1=RequestMsgHL7Ina8.SetValueAt(ZIN7,"IN1grp(7).ROL(1)")
	        s tSC1=MvMsgHL7.SetValueAt(ZIN7,"IN1grp(7).ROL(1)")
	        s tSC1=NewMsgHL7.SetValueAt(ZIN7,"IN1grp(7).ROL(1)")
	        s tSC1=NewMsgHL7iPlan.SetValueAt(ZIN7,"IN1grp(7).ROL(1)")
	        s tSC1=NewMsgHL7Ina8.SetValueAt(ZIN7,"IN1grp(7).ROL(1)")
	        s tSC1=BdocMsgHL7.SetValueAt(ZIN7,"IN1grp(7).ROL(1)")
	        s tSC1=GlimsMsgHL7.SetValueAt(ZIN7,"IN1grp(7).ROL(7)")
	        s tSC1=OxygenMsgHL7.SetValueAt(ZIN7,"IN1grp(7).ROL(7)")
	        s tSC1=DentAdminMsgHL7.SetValueAt(ZIN7,"IN1grp(7).ROL(7)")
	        s tSC1=CanexisMsgHL7.SetValueAt(ZIN7,"IN1grp(7).ROL(7)")
        }
        i ZIN8'="" {
	        s tSC1=MososMsgHL7.SetValueAt(ZIN8,"IN1grp(8).ROL(1)")
	        s tSC1=InfohosMsgHL7.SetValueAt(ZIN8,"IN1grp(8).ROL(1)")
	        s tSC1=EcareMsgHL7.SetValueAt(ZIN8,"IN1grp(8).ROL(1)")
	        s tSC1=RequestMsgHL7.SetValueAt(ZIN8,"IN1grp(8).ROL(1)")
	        s tSC1=RequestMsgHL7Ina8.SetValueAt(ZIN8,"IN1grp(8).ROL(1)")
	        s tSC1=MvMsgHL7.SetValueAt(ZIN8,"IN1grp(8).ROL(1)")
	        s tSC1=NewMsgHL7.SetValueAt(ZIN8,"IN1grp(8).ROL(1)")
	        s tSC1=NewMsgHL7iPlan.SetValueAt(ZIN8,"IN1grp(8).ROL(1)")
	        s tSC1=NewMsgHL7Ina8.SetValueAt(ZIN8,"IN1grp(8).ROL(1)")
	        s tSC1=BdocMsgHL7.SetValueAt(ZIN8,"IN1grp(8).ROL(1)")
	        s tSC1=GlimsMsgHL7.SetValueAt(ZIN8,"IN1grp(8).ROL(8)")
	        s tSC1=OxygenMsgHL7.SetValueAt(ZIN8,"IN1grp(8).ROL(8)")
	        s tSC1=DentAdminMsgHL7.SetValueAt(ZIN8,"IN1grp(8).ROL(8)")
	        s tSC1=CanexisMsgHL7.SetValueAt(ZIN8,"IN1grp(8).ROL(8)")
        }
        i ZIN9'="" {
	        s tSC1=MososMsgHL7.SetValueAt(ZIN9,"IN1grp(9).ROL(1)")
	        s tSC1=InfohosMsgHL7.SetValueAt(ZIN9,"IN1grp(9).ROL(1)")
	        s tSC1=EcareMsgHL7.SetValueAt(ZIN9,"IN1grp(9).ROL(1)")
	        s tSC1=RequestMsgHL7.SetValueAt(ZIN9,"IN1grp(9).ROL(1)")
	        s tSC1=RequestMsgHL7Ina8.SetValueAt(ZIN9,"IN1grp(9).ROL(1)")
	        s tSC1=MvMsgHL7.SetValueAt(ZIN9,"IN1grp(9).ROL(1)")
	        s tSC1=NewMsgHL7.SetValueAt(ZIN9,"IN1grp(9).ROL(1)")
	        s tSC1=NewMsgHL7iPlan.SetValueAt(ZIN9,"IN1grp(9).ROL(1)")
	        s tSC1=NewMsgHL7Ina8.SetValueAt(ZIN9,"IN1grp(9).ROL(1)")
	        s tSC1=BdocMsgHL7.SetValueAt(ZIN9,"IN1grp(9).ROL(1)")
	        s tSC1=GlimsMsgHL7.SetValueAt(ZIN9,"IN1grp(9).ROL(9)")
	        s tSC1=OxygenMsgHL7.SetValueAt(ZIN9,"IN1grp(9).ROL(9)")
	        s tSC1=DentAdminMsgHL7.SetValueAt(ZIN9,"IN1grp(9).ROL(9)")
	        s tSC1=CanexisMsgHL7.SetValueAt(ZIN9,"IN1grp(9).ROL(9)")
        }
        
	    //==============================================================================================================================================    
        // General Fields Corrections ==================================================================================================================
        //==============================================================================================================================================
        
		s tSC1=RequestMsgHL7.SetValueAt(Nhop,"MSH:6")
		s tSC1=RequestMsgHL7Ina8.SetValueAt(Nhop,"MSH:6")
		s tSC1=OxygenMsgHL7.SetValueAt(Nhop,"MSH:6")        
        s tSC1=MvMsgHL7.SetValueAt(Nhop,"MSH:6") 
        s tSC1=BdocMsgHL7.SetValueAt(Nhop,"MSH:6")
        s tSC1=DentAdminMsgHL7.SetValueAt(Nhop,"MSH:6")
        s tSC1=CanexisMsgHL7.SetValueAt(Nhop,"MSH:6")
        ;CWY why not the others ?
        
        // Correction A08 pour les systèmes qui ne gèrent pas correctement A08 !!!!!!!!!!!!!!!!!!!!!
		i (MsgType="A08") & (RequestMsgHL7.FindSegmentValues("PV1:42")'="") {
			s tSC1=NewMsgHL7.SetValueAt(RequestMsgHL7.FindSegmentValues("PV1:42"),"PV1:3")
			s tSC1=NewMsgHL7iPlan.SetValueAt(RequestMsgHL7.FindSegmentValues("PV1:42"),"PV1:3")
			s tSC1=NewMsgHL7Ina8.SetValueAt(RequestMsgHL7.FindSegmentValues("PV1:42"),"PV1:3")
			s tSC1=InfohosMsgHL7.SetValueAt(RequestMsgHL7.FindSegmentValues("PV1:42"),"PV1:3")
			s tSC1=EcareMsgHL7.SetValueAt(RequestMsgHL7.FindSegmentValues("PV1:42"),"PV1:3")
			s tSC1=MososMsgHL7.SetValueAt(RequestMsgHL7.FindSegmentValues("PV1:42"),"PV1:3")
			s tSC1=MvMsgHL7.SetValueAt(RequestMsgHL7.FindSegmentValues("PV1:42"),"PV1:3")
			s tSC1=GlimsMsgHL7.SetValueAt(RequestMsgHL7.FindSegmentValues("PV1:42"),"PV1:3")
		}
		
		// Correction du prénom
        i (MsgType'="A05") & (MsgType'="A38") & ('conv) & (NewMsgHL7.FindSegmentValues("PID:5.2")="-") s tSC1=NewMsgHL7.SetValueAt("X","PID:5.2"),tSC1=NewMsgHL7iPlan.SetValueAt("X","PID:5.2"),tSC1=NewMsgHL7Ina8.SetValueAt("X","PID:5.2")
        ;CWY add process for other msg
	

		//==============================================================================================================================================
		// ROUTE MESSAGES ==============================================================================================================================
		//==============================================================================================================================================
        // Send to Cache ---------------------------------------------------------------------------------------
        i Instance="ENS2017M" {
	      i '$g(^CHUBXL.Parameter("MedWish","Cache")) s tSC = ..SendRequestAsync("WishCacheAllAdtHl7FcpOut",RequestMsgHL7)  Quit:$$$ISERR(tSC) tSC
	      i $g(^CHUBXL.Parameter("MedWish","Cache")) s tSC = ..SendRequestAsync("WishCacheAllAdtHl7FcpOut",RequestMsgHL7Ina8)  Quit:$$$ISERR(tSC) tSC
        }
        // Send to Brain  ---------------------------------------------------------------------------------------  
        i Nhop=27 {
	          i (MsgType="A01") ! (MsgType="A02") ! (MsgType="A03") ! (MsgType="A08") ! (MsgType="A11") ! (MsgType="A12") ! (MsgType="A13") ! (MsgType="A37") ! (MsgType="A40") {
		            s unite = $p(pRequest.FindSegmentValues("PV1:3"),"^",1)
		            i (unite = "66M") {
			          i Instance="ENS2017M" {
				        i '$g(^CHUBXL.Parameter("MedWish","Brain")) s tSC = ..SendRequestAsync("WishBrainRtHudAdtHl7TcpOut",RequestMsgHL7)  Quit:$$$ISERR(tSC) tSC
				        i $g(^CHUBXL.Parameter("MedWish","Brain")) s tSC = ..SendRequestAsync("WishBrainRtHudAdtHl7TcpOut",RequestMsgHL7Ina8)  Quit:$$$ISERR(tSC) tSC
				        ;i '$g(^CHUBXL.Parameter("MedWish","BrainNew")) s tSC = ..SendRequestAsync("WishBrainRtNewHudAdtHl7TcpOut",RequestMsgHL7)  Quit:$$$ISERR(tSC) tSC
				        ;i $g(^CHUBXL.Parameter("MedWish","BrainNew")) s tSC = ..SendRequestAsync("WishBrainRtNewHudAdtHl7TcpOut",RequestMsgHL7Ina8)  Quit:$$$ISERR(tSC) tSC
			          }
		            }
	          }
        }           
        // Send to Infopartner  ---------------------------------------------------------------------------------------           
        i (MsgType'="A05") & (MsgType'="A38") & ('conv) {
              i Instance="ENS2017M" {
	            i '$g(^CHUBXL.Parameter("MedWish","InfopartnerNew")) s tSC = ..SendRequestAsync("WishNewInfopartnerAllAdtHl7TcpOut",NewMsgHL7)  Quit:$$$ISERR(tSC) tSC
	            i $g(^CHUBXL.Parameter("MedWish","InfopartnerNew")) s tSC = ..SendRequestAsync("WishNewInfopartnerAllAdtHl7TcpOut",NewMsgHL7Ina8)  Quit:$$$ISERR(tSC) tSC
              }
        }
        // Send to Diamic ---------------------------------------------------------------------------------------           
        i (MsgType'="A05") & (MsgType'="A38") & ('conv) {
              i Instance="ENS2017M" {
	            i '$g(^CHUBXL.Parameter("MedWish","Diamic")) s tSC = ..SendRequestAsync("WishDiamicAllAdtHl7TcpOut",NewMsgHL7)  Quit:$$$ISERR(tSC) tSC
	            i $g(^CHUBXL.Parameter("MedWish","Diamic")) s tSC = ..SendRequestAsync("WishDiamicAllAdtHl7TcpOut",NewMsgHL7Ina8)  Quit:$$$ISERR(tSC) tSC
              }
        }
        // Send to Astraia  ---------------------------------------------------------------------------------------            
        i Nhop=26 {
	        s CodLieu=NewMsgHL7.FindSegmentValues("PV2:12.4")
        	s CodeLieuOk=##class(CHUBXL.DT.Utils).CtrlCodeLieu(CodLieu)
        	i (TypeSej="I") ! (MsgType="A11") s CodeLieuOk=1
        	$$$TRACE("Code Lieu : "_CodLieu_"******"_CodeLieuOk)
	        i (((MsgType="A28") ! (MsgType="A31") ! (MsgType="A40") ! (MsgType="A01") ! (MsgType="A04")) & (Instance="ENS2017M")) {
		      i '$g(^CHUBXL.Parameter("MedWish","Astraia")) s tSC = ..SendRequestAsync("WishAstraiaBruAdtHl7TcpOut",NewMsgHL7)  Quit:$$$ISERR(tSC) tSC
		      i $g(^CHUBXL.Parameter("MedWish","Astraia")) s tSC = ..SendRequestAsync("WishAstraiaBruAdtHl7TcpOut",NewMsgHL7Ina8)  Quit:$$$ISERR(tSC) tSC
	        }
	        i Instance="ENS2017TEST" {
		      i '$g(^CHUBXL.Parameter("MedWish","Astraia")) s:(MsgType="A28")!(MsgType="A31")!(MsgType="A40")!(MsgType="A01")!(MsgType="A04") tSC = ..SendRequestAsync("WishAstraiaBruAdtHl7TcpOut",NewMsgHL7)  Quit:$$$ISERR(tSC) tSC
		      i $g(^CHUBXL.Parameter("MedWish","Astraia")) s:(MsgType="A28")!(MsgType="A31")!(MsgType="A40")!(MsgType="A01")!(MsgType="A04") tSC = ..SendRequestAsync("WishAstraiaBruAdtHl7TcpOut",NewMsgHL7Ina8)  Quit:$$$ISERR(tSC) tSC
		      i '$g(^CHUBXL.Parameter("MedWish","Astraia")) s:((Ndosm=200500086)!(Ndosm=200520631)!(Ndosm=200561445))&(CodeLieuOk) tSC = ..SendRequestAsync("WishNewAstraiaBruAdtHl7TcpOut",NewMsgHL7)  Quit:$$$ISERR(tSC) tSC
		      i $g(^CHUBXL.Parameter("MedWish","Astraia")) s:((Ndosm=200500086)!(Ndosm=200520631)!(Ndosm=200561445))&(CodeLieuOk) tSC = ..SendRequestAsync("WishNewAstraiaBruAdtHl7TcpOut",NewMsgHL7Ina8)  Quit:$$$ISERR(tSC) tSC
	          i '$g(^CHUBXL.Parameter("MedWish","Astraia")) ;s tSC = ..SendRequestAsync("WishAstraiaBruAdtHl7TcpFwd",NewMsgHL7)  Quit:$$$ISERR(tSC) tSC
	          i $g(^CHUBXL.Parameter("MedWish","Astraia")) ;s tSC = ..SendRequestAsync("WishAstraiaBruAdtHl7TcpFwd",NewMsgHL7Ina8)  Quit:$$$ISERR(tSC) tSC
	        }
        }
        // Send to Innovian ---------------------------------------------------------------------------------------
        i (TypeSej="I") ! ((PV1="") & (TypeSej'="O")) {
	          i (Nhop=27) & (MsgType'="A05") & (MsgType'="A38") & (MsgType'="A40") & ('conv) & (Instance="ENS2017M") {
		        i '$g(^CHUBXL.Parameter("MedWish","Innovian")) s tSC = ..SendRequestAsync("WishInnovianHudAdtHl7TcpOut",NewMsgHL7)  Quit:$$$ISERR(tSC) tSC
		        i $g(^CHUBXL.Parameter("MedWish","Innovian")) s tSC = ..SendRequestAsync("WishInnovianHudAdtHl7TcpOut",NewMsgHL7Ina8)  Quit:$$$ISERR(tSC) tSC
		        i '$g(^CHUBXL.Parameter("MedWish","Innovian")) s tSC = ..SendRequestAsync("WishNewInnovianHudAdtHl7TcpOut",NewMsgHL7)  Quit:$$$ISERR(tSC) tSC
		        i $g(^CHUBXL.Parameter("MedWish","Innovian")) s tSC = ..SendRequestAsync("WishNewInnovianHudAdtHl7TcpOut",NewMsgHL7Ina8)  Quit:$$$ISERR(tSC) tSC
	          }
	    }
        // Send to Opera ---------------------------------------------------------------------------------------
        i (TypeSej="I") ! ((PV1="") & (TypeSej'="O")) {
	          i (MsgType'="A05") & (MsgType'="A38") & ('conv) & (Instance="ENS2017M") {
		        i '$g(^CHUBXL.Parameter("MedWish","Opera")) s tSC = ..SendRequestAsync("WishOperaBruAdtHl7TcpOut",NewMsgHL7)  Quit:$$$ISERR(tSC) tSC
		        i $g(^CHUBXL.Parameter("MedWish","Opera")) s tSC = ..SendRequestAsync("WishOperaBruAdtHl7TcpOut",NewMsgHL7Ina8)  Quit:$$$ISERR(tSC) tSC
	          }
	    }
        // Send to Icip  ---------------------------------------------------------------------------------------  
         i Nhop=27 {
	          i (MsgType'="A05") & (MsgType'="A38") & (MsgType'="A40") & ('conv) & (Instance="ENS2017M") { 
	            i '$g(^CHUBXL.Parameter("MedWish","Icip")) s tSC = ..SendRequestAsync("WishIcipHudAdtHl7TcpOut",NewMsgHL7)  Quit:$$$ISERR(tSC) tSC
	            i $g(^CHUBXL.Parameter("MedWish","Icip")) s tSC = ..SendRequestAsync("WishIcipHudAdtHl7TcpOut",NewMsgHL7Ina8)  Quit:$$$ISERR(tSC) tSC
	          }
        }
        // Send to PacsOnWeb Brugmann  ---------------------------------------------------------------------------------------  
         i Nhop=26 {
	          i ((MsgType="A28") ! (MsgType="A31") ! (MsgType="A38") ! (MsgType="A40")) & ('conv) & (Instance="ENS2017M") { 
	            i '$g(^CHUBXL.Parameter("MedWish","PacsOnWebBru")) s tSC = ..SendRequestAsync("WishPacsOnWebBruAdtHl7TcpOut",NewMsgHL7)  Quit:$$$ISERR(tSC) tSC
	            i $g(^CHUBXL.Parameter("MedWish","PacsOnWebBru")) s tSC = ..SendRequestAsync("WishPacsOnWebBruAdtHl7TcpOut",NewMsgHL7Ina8)  Quit:$$$ISERR(tSC) tSC
	          }
        }
        // Send to PacsOnWeb HUDERF  ---------------------------------------------------------------------------------------  
         i Nhop=27 {
	          i ((MsgType="A28") ! (MsgType="A31") ! (MsgType="A38") ! (MsgType="A40")) & ('conv) & (Instance="ENS2017M") { 
	            i '$g(^CHUBXL.Parameter("MedWish","PacsOnWebHud")) s tSC = ..SendRequestAsync("WishPacsOnWebHudAdtHl7TcpOut",NewMsgHL7)  Quit:$$$ISERR(tSC) tSC
	            i $g(^CHUBXL.Parameter("MedWish","PacsOnWebHud")) s tSC = ..SendRequestAsync("WishPacsOnWebHudAdtHl7TcpOut",NewMsgHL7Ina8)  Quit:$$$ISERR(tSC) tSC
	          }
        }
        // Send to Ophtalmo HUDE ---------------------------------------------------------------------------------------  
         i Nhop=27 {
	          i (MsgType'="A05") & (MsgType'="A38") & (MsgType'="A40") & ('conv) & (Instance="ENS2017M") { 
	            i '$g(^CHUBXL.Parameter("MedWish","Ophtalmo")) s tSC = ..SendRequestAsync("WishOphtalmoHudAdtHl7TcpOut",NewMsgHL7)  Quit:$$$ISERR(tSC) tSC
	            i $g(^CHUBXL.Parameter("MedWish","Ophtalmo")) s tSC = ..SendRequestAsync("WishOphtalmoHudAdtHl7TcpOut",NewMsgHL7Ina8)  Quit:$$$ISERR(tSC) tSC
	          }
        }
        // Send to Ophtalmo Brugmann ---------------------------------------------------------------------------------------  
        i Nhop=26 {
	          i (MsgType'="A05") & (MsgType'="A38") & ('conv) & ((Instance="ENS2017M") ! (Instance="ENS2017TEST")) { 
	            i '$g(^CHUBXL.Parameter("MedWish","OphtalmoBru")) s tSC = ..SendRequestAsync("WishOphtalmoBruAdtHl7TcpOut",NewMsgHL7)  Quit:$$$ISERR(tSC) tSC
	            i $g(^CHUBXL.Parameter("MedWish","OphtalmoBru")) s tSC = ..SendRequestAsync("WishOphtalmoBruAdtHl7TcpOut",NewMsgHL7Ina8)  Quit:$$$ISERR(tSC) tSC
	          }
        }
        // Send to Diablink (Diabétologie) Brugmann ---------------------------------------------------------------------------------------  
        i Nhop=26 {
	          i (MsgType'="A05") & (MsgType'="A38") & ('conv) & (Instance="ENS2017M") { 
	            i '$g(^CHUBXL.Parameter("MedWish","Diablink")) s tSC = ..SendRequestAsync("WishDiablinkBruAdtHl7TcpOut",NewMsgHL7)  Quit:$$$ISERR(tSC) tSC
	            i $g(^CHUBXL.Parameter("MedWish","Diablink")) s tSC = ..SendRequestAsync("WishDiablinkBruAdtHl7TcpOut",NewMsgHL7Ina8)  Quit:$$$ISERR(tSC) tSC
	          }
        }
        // Send to Datameal, MobiTrace and Connex ---------------------------------------------------------------------------------------
        i (TypeSej="I") ! ((PV1="") & (TypeSej'="O")) {
	          i (Nhop=26) & (MsgType'="A05") & (MsgType'="A38") & ('conv) {
		            i (Instance="ENS2017M") {
			          i '$g(^CHUBXL.Parameter("MedWish","MobiTrace")) s tSC = ..SendRequestAsync("WishMobitraceBruAdtHl7TcpOut",NewMsgHL7)  Quit:$$$ISERR(tSC) tSC
			          i $g(^CHUBXL.Parameter("MedWish","MobiTrace")) s tSC = ..SendRequestAsync("WishMobitraceBruAdtHl7TcpOut",NewMsgHL7Ina8)  Quit:$$$ISERR(tSC) tSC
					  ;i '$g(^CHUBXL.Parameter("MedWish","Connex")) s tSC = ..SendRequestAsync("WishConnexBruAdtHl7TcpOut",NewMsgHL7)  Quit:$$$ISERR(tSC) tSC
					  ;i $g(^CHUBXL.Parameter("MedWish","Connex")) s tSC = ..SendRequestAsync("WishConnexBruAdtHl7TcpOut",NewMsgHL7Ina8)  Quit:$$$ISERR(tSC) tSC
		            }
		            i ((##class(CHUBXL.DT.Utils).CtrlUnite(pRequest.FindSegmentValues("PV1:3.1")))!($tr(pRequest.FindSegmentValues("PV1:3.1")," ")="")) {
		              i (Instance="ENS2017M") {
			            i '$g(^CHUBXL.Parameter("MedWish","Datameal")) s tSC = ..SendRequestAsync("WishDatamealBruAdtHl7TcpOut",NewMsgHL7)  Quit:$$$ISERR(tSC) tSC
			            i $g(^CHUBXL.Parameter("MedWish","Datameal")) s tSC = ..SendRequestAsync("WishDatamealBruAdtHl7TcpOut",NewMsgHL7Ina8)  Quit:$$$ISERR(tSC) tSC
		              }
	            	}
	          }
	    }
        // Send to Oxygen ---------------------------------------------------------------------------------------
        i Nhop=26 {
          		i Instance="ENS2017M" {
	          	  s:'conv tSC = ..SendRequestAsync("WishOxygenBruAdtHl7TcpOut",OxygenMsgHL7)  Quit:$$$ISERR(tSC) tSC
          		}
        }
	    // Send to Agfa   ---------------------------------------------------------------------------------------
        i (MsgType="A04") & (pRequest.FindSegmentValues("PV2:2")=59) {
	          s tSC1=NewMsgHL7.SetValueAt("999999","IN1grp(1).IN1:3")
	          s tSC1=NewMsgHL7.SetValueAt("PAYANT TOTAL","IN1grp(1).IN1:4")
	          s tSC1=NewMsgHL7.SetValueAt("X","IN1grp(1).IN1:5")
	          s tSC1=NewMsgHL7.SetValueAt("20120101","IN1grp(1).IN1:12")
	          s tSC1=NewMsgHL7.SetValueAt("99991231","IN1grp(1).IN1:13")
	          s tSC1=NewMsgHL7Ina8.SetValueAt("999999","IN1grp(1).IN1:3")
	          s tSC1=NewMsgHL7Ina8.SetValueAt("PAYANT TOTAL","IN1grp(1).IN1:4")
	          s tSC1=NewMsgHL7Ina8.SetValueAt("X","IN1grp(1).IN1:5")
	          s tSC1=NewMsgHL7Ina8.SetValueAt("20120101","IN1grp(1).IN1:12")
	          s tSC1=NewMsgHL7Ina8.SetValueAt("99991231","IN1grp(1).IN1:13")
        }
        i Nhop=26 {
	          s tel1=NewMsgHL7.FindSegmentValues("PID:13(1).1")
	          s tel2=NewMsgHL7.FindSegmentValues("PID:13(2).1")
	          s tel1=NewMsgHL7iPlan.FindSegmentValues("PID:13(1).1")
	          s tel2=NewMsgHL7iPlan.FindSegmentValues("PID:13(2).1")
	          s DtDeces=NewMsgHL7iPlan.FindSegmentValues("PID:29")
	          $$$TRACE("***** N° téléphone 1 : "_tel1) 
	          $$$TRACE("$$$$$ N° téléphone 2 : "_tel2)
	          $$$TRACE("///// Date de décès	 : "_DtDeces)
	          i tel1="" s tSC1=NewMsgHL7iPlan.SetValueAt("""""","PID:13(1).1")
	          i tel2="" s tSC1=NewMsgHL7iPlan.SetValueAt("""""","PID:13(2).1")
	          i DtDeces="" s tSC1=NewMsgHL7iPlan.SetValueAt("""""","PID:29")
	          s tel3=NewMsgHL7iPlan.FindSegmentValues("PID:13(1).1")
	          s tel4=NewMsgHL7iPlan.FindSegmentValues("PID:13(2).1")
	          s DtDeces=NewMsgHL7iPlan.FindSegmentValues("PID:29")
	          $$$TRACE("***** N° téléphone 3 : "_tel3) 
	          $$$TRACE("$$$$$ N° téléphone 4 : "_tel4)
	          $$$TRACE("///// Date de décès	 : "_DtDeces)
	          
	          i (MsgType="A04") & (pRequest.FindSegmentValues("PV1:2")="O") & (pRequest.FindSegmentValues("PV1:7")="") {
		            s meddoc=$p(pRequest.FindSegmentValues("PV2:12"),"^",3)
		            s tSC1=NewMsgHL7.SetValueAt(meddoc,"PV1:7")
		            ;CWY pas de MOD97 à la demande de LBI
		            ;s tSC1=NewMsgHL7Ina8.SetValueAt(meddoc_$tr($j((97-(meddoc#97)),2)," ","0"),"PV1:7")
		            s tSC1=NewMsgHL7Ina8.SetValueAt(meddoc,"PV1:7")
	          }
              i (MsgType="A04") & (NewMsgHL7.FindSegmentValues("PV2:20.1")'="") {
			    i '$g(^CHUBXL.Parameter("MedWish","Agfa")) s tSC=##class(CHUBXL.DT.RDVtoAgfa).Transform(NewMsgHL7iPlan,.RDVtoAgfa)  Quit:$$$ISERR(tSC) tSC
			    i $g(^CHUBXL.Parameter("MedWish","Agfa")) s tSC=##class(CHUBXL.DT.RDVtoAgfa).Transform(NewMsgHL7iPlan,.RDVtoAgfa)  Quit:$$$ISERR(tSC) tSC
			    i Instance="ENS2017M" s tSC = ..SendRequestAsync("WishAgfaNewBruAdtHl7TcpOut",RDVtoAgfa)  Quit:$$$ISERR(tSC) tSC
              }
              i (MsgType="A28") & ('conv) {
		            i Instance="ENS2017M" {
			          s tSC=##class(CHUBXL.DT.WishToAgfaei).Transform(pRequest,.oWishAgfaeiOut) Quit:$$$ISERR(tSC) tSC
			          s tSC = ..SendRequestAsync("WishAgfaeiBruAdtHl7TcpOut",oWishAgfaeiOut)  Quit:$$$ISERR(tSC) tSC
		            }
	          }
	          i (MsgType'="A05") & (MsgType'="A38") & (MsgType'="A28") & ('conv) {
		            i Instance="ENS2017M" {
			          i '$g(^CHUBXL.Parameter("MedWish","Agfaei")) s tSC = ..SendRequestAsync("WishAgfaeiBruAdtHl7TcpOut",NewMsgHL7)  Quit:$$$ISERR(tSC) tSC
			          i $g(^CHUBXL.Parameter("MedWish","Agfaei")) s tSC = ..SendRequestAsync("WishAgfaeiBruAdtHl7TcpOut",NewMsgHL7Ina8)  Quit:$$$ISERR(tSC) tSC
		            }
	          }
	          i (MsgType'="A05") & (MsgType'="A38") & ('conv) {
		            i Instance="ENS2017M" {
			          i '$g(^CHUBXL.Parameter("MedWish","Agfa")) s tSC = ..SendRequestAsync("WishAgfaBruAdtHl7TcpOut",NewMsgHL7)  Quit:$$$ISERR(tSC) tSC
			          i $g(^CHUBXL.Parameter("MedWish","Agfa")) s tSC = ..SendRequestAsync("WishAgfaBruAdtHl7TcpOut",NewMsgHL7Ina8)  Quit:$$$ISERR(tSC) tSC
		            }
		            i Instance="ENS2017M" {
			          i '$g(^CHUBXL.Parameter("MedWish","Agfa")) s tSC = ..SendRequestAsync("WishAgfaNewBruAdtHl7TcpOut",NewMsgHL7iPlan)  Quit:$$$ISERR(tSC) tSC
			          i $g(^CHUBXL.Parameter("MedWish","Agfa")) s tSC = ..SendRequestAsync("WishAgfaNewBruAdtHl7TcpOut",NewMsgHL7iPlan)  Quit:$$$ISERR(tSC) tSC
		            }
   		            i Instance="ENS2017TEST" {
			          ;s tSC = ..SendRequestAsync("WishAgfaNewBruAdtHl7TcpOut",NewMsgHL7Iplan)  Quit:$$$ISERR(tSC) tSC
			          ;i '$g(^CHUBXL.Parameter("MedWish","Agfa")) s tSC = ..SendRequestAsync("WishAgfaNewBruAdtHl7TcpOut",NewMsgHL7)  Quit:$$$ISERR(tSC) tSC
			          ;i $g(^CHUBXL.Parameter("MedWish","Agfa")) s tSC = ..SendRequestAsync("WishAgfaNewBruAdtHl7TcpOut",NewMsgHL7Ina8)  Quit:$$$ISERR(tSC) tSC
		            }
	          }
	          i MsgType="A04" {
		            i '$g(^CHUBXL.Parameter("MedWish","Agfa")) s tSC=##class(CHUBXL.DT.WishToORMQuadrat).Transform(NewMsgHL7,.oWishQuadratOut) Quit:$$$ISERR(tSC) tSC
		            i $g(^CHUBXL.Parameter("MedWish","Agfa")) s tSC=##class(CHUBXL.DT.WishToORMQuadrat).Transform(NewMsgHL7Ina8,.oWishQuadratOut) Quit:$$$ISERR(tSC) tSC
		            i Instance="ENS2017M" s tSC = ..SendRequestAsync("WishAgfaBruAdtHl7TcpOut",oWishQuadratOut)  Quit:$$$ISERR(tSC) tSC
		            ;CWY s tSC = ..SendRequestAsync("WishAgfaNewBruAdtHl7TcpOut",oWishQuadratOut)  Quit:$$$ISERR(tSC) tSC
		            i '$g(^CHUBXL.Parameter("MedWish","Agfa")) s NewVar=NewMsgHL7.FindSegmentValues("PV2:20.1")
		            i $g(^CHUBXL.Parameter("MedWish","Agfa")) s NewVar=$tr($p($p(PV2Ina8,"|",21),"^",3)," ")
		            i NewVar'="" {
			              i '$g(^CHUBXL.Parameter("MedWish","Agfa")) s tSC=##class(CHUBXL.DT.RDVtoAgfa).Transform(NewMsgHL7,.RDVtoAgfa)  Quit:$$$ISERR(tSC) tSC
			              i $g(^CHUBXL.Parameter("MedWish","Agfa")) s tSC=##class(CHUBXL.DT.RDVtoAgfa).Transform(NewMsgHL7Ina8,.RDVtoAgfa)  Quit:$$$ISERR(tSC) tSC
			              i Instance="ENS2017M" s tSC = ..SendRequestAsync("WishAgfaBruAdtHl7TcpOut",RDVtoAgfa)  Quit:$$$ISERR(tSC) tSC
			              ;CWY s tSC = ..SendRequestAsync("WishAgfaNewBruAdtHl7TcpOut",RDVtoAgfa)  Quit:$$$ISERR(tSC) tSC
		            }
	          }
        }
        i Nhop=27 {
	          i (MsgType'="A05") & (MsgType'="A38") & ('conv) {
		            i Instance="ENS2017M" {
			          i '$g(^CHUBXL.Parameter("MedWish","Agfahud")) s tSC = ..SendRequestAsync("WishAgfaHudAdtHl7TcpOut",NewMsgHL7)  Quit:$$$ISERR(tSC) tSC
			          i $g(^CHUBXL.Parameter("MedWish","Agfahud")) s tSC = ..SendRequestAsync("WishAgfaHudAdtHl7TcpOut",NewMsgHL7Ina8)  Quit:$$$ISERR(tSC) tSC
		            }
		            i Instance="ENS2017M" {
			          ;i '$g(^CHUBXL.Parameter("MedWish","Agfahud")) s tSC = ..SendRequestAsync("WishAgfaTestV6HudAdtHl7TcpOut",NewMsgHL7)  Quit:$$$ISERR(tSC) tSC
			          ;i $g(^CHUBXL.Parameter("MedWish","Agfahud")) s tSC = ..SendRequestAsync("WishAgfaTestV6HudAdtHl7TcpOut",NewMsgHL7Ina8)  Quit:$$$ISERR(tSC) tSC
		            }
		            i (MsgType="A04") & (NewMsgHL7.FindSegmentValues("PV2:20.1")'="") {
			              i '$g(^CHUBXL.Parameter("MedWish","Agfahud")) s tSC=##class(CHUBXL.DT.RDVtoAgfa).Transform(NewMsgHL7,.RDVtoAgfa)  Quit:$$$ISERR(tSC) tSC
			              i $g(^CHUBXL.Parameter("MedWish","Agfahud")) s tSC=##class(CHUBXL.DT.RDVtoAgfa).Transform(NewMsgHL7Ina8,.RDVtoAgfa)  Quit:$$$ISERR(tSC) tSC
			              i Instance="ENS2017M" s tSC = ..SendRequestAsync("WishAgfaHudAdtHl7TcpOut",RDVtoAgfa)  Quit:$$$ISERR(tSC) tSC
			              ;i Instance="ENS2017M" s tSC = ..SendRequestAsync("WishAgfaTestV6HudAdtHl7TcpOut",RDVtoAgfa)  Quit:$$$ISERR(tSC) tSC
		            }
	          }
        }
        // Send to Alpha ---------------------------------------------------------------------------------------
        i (MsgType'="A05") & (MsgType'="A38") & (MsgType'="A40") & ('conv) {
		      i '$g(^CHUBXL.Parameter("MedWish","Alpha")) s tSC=##class(CHUBXL.DT.WishSignaToAlpha).Transform(NewMsgHL7,.oWishSigAlphaOut) Quit:$$$ISERR(tSC) tSC
		      i $g(^CHUBXL.Parameter("MedWish","Alpha")) s tSC=##class(CHUBXL.DT.WishSignaToAlpha).Transform(NewMsgHL7Ina8,.oWishSigAlphaOut) Quit:$$$ISERR(tSC) tSC
		      i Instance="ENS2017M" s tSC = ..SendRequestAsync("WishCigesNewAllAdtDlmTcpOut",oWishSigAlphaOut)  Quit:$$$ISERR(tSC) tSC
        }
        i (MsgType="A40") {
		      $$$TRACE("Message A40 : *********** : "_pRequest.RawContent)
		      i '$g(^CHUBXL.Parameter("MedWish","Alpha")) s tSC=##class(CHUBXL.DT.WishFusionToAlpha).Transform(NewMsgHL7,.oWishSigAlphaOut) Quit:$$$ISERR(tSC) tSC
		      i $g(^CHUBXL.Parameter("MedWish","Alpha")) s tSC=##class(CHUBXL.DT.WishFusionToAlpha).Transform(NewMsgHL7Ina8,.oWishSigAlphaOut) Quit:$$$ISERR(tSC) tSC
		      s oWishSigAlphaOut.NDOSM=$p(pRequest.FindSegmentValues("MRG"),"|",2)
		      s oWishSigAlphaOut.TDOSM2="A"
		      $$$TRACE("Message : "_oWishSigAlphaOut.NDOSM2)
		      i Instance="ENS2017M" s tSC = ..SendRequestAsync("WishCigesNewAllAdtDlmTcpOut",oWishSigAlphaOut)  Quit:$$$ISERR(tSC) tSC
        }
        ;CWY A effacer lors de l'optimisation !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        i (TypeSej="I") ! ((PV1="") & (TypeSej'="O")) {
	          i IN11'="" {
		            i (MsgType'="A05") & (MsgType'="A38") & (('conv)!(convdia)) {
			          i '$g(^CHUBXL.Parameter("MedWish","Alpha")) s tSC=##class(CHUBXL.DT.WishMutToAlpha).Transform(NewMsgHL7,.oWishMutAlphaOut) Quit:$$$ISERR(tSC) tSC
			          i $g(^CHUBXL.Parameter("MedWish","Alpha")) s tSC=##class(CHUBXL.DT.WishMutToAlpha).Transform(NewMsgHL7Ina8,.oWishMutAlphaOut) Quit:$$$ISERR(tSC) tSC
		            }
		            i (MsgType'="A05") & (MsgType'="A38") & (('conv)!(convdia))&(ZIN1'="") s oWishMutAlphaOut.CT1=$p(ZIN1,"|",4),oWishMutAlphaOut.CT2=$p(ZIN1,"|",5)
		            i (MsgType'="A05") & (MsgType'="A38") & (('conv)!(convdia)) i Instance="ENS2017M" s tSC = ..SendRequestAsync("WishCigesNewAllAdtDlmTcpOut",oWishMutAlphaOut)  Quit:$$$ISERR(tSC) tSC
	          }
	          i (MsgType'="A05") & (MsgType'="A38") & (MsgType'="A40") & (('conv)!(convdia)) {
	            i '$g(^CHUBXL.Parameter("MedWish","Alpha")) s tSC=##class(CHUBXL.DT.WishHospToAlpha).Transform(NewMsgHL7,.oWishHospAlphaOut) Quit:$$$ISERR(tSC) tSC
	            i $g(^CHUBXL.Parameter("MedWish","Alpha")) s tSC=##class(CHUBXL.DT.WishHospToAlpha).Transform(NewMsgHL7Ina8,.oWishHospAlphaOut) Quit:$$$ISERR(tSC) tSC
	          }
	          i (MsgType'="A05") & (MsgType'="A38") & (MsgType'="A40") & (('conv)!(convdia)) i Instance="ENS2017M" s tSC = ..SendRequestAsync("WishCigesNewAllAdtDlmTcpOut",oWishHospAlphaOut)  Quit:$$$ISERR(tSC) tSC
	          }
	        else {
	          i IN11'="" {
		            i (MsgType'="A05") & (MsgType'="A38") & (('conv)!(convdia)) {
			          i '$g(^CHUBXL.Parameter("MedWish","Alpha")) s tSC=##class(CHUBXL.DT.WishMutToAlpha).Transform(NewMsgHL7,.oWishMutAlphaOut) Quit:$$$ISERR(tSC) tSC
			          i $g(^CHUBXL.Parameter("MedWish","Alpha")) s tSC=##class(CHUBXL.DT.WishMutToAlpha).Transform(NewMsgHL7Ina8,.oWishMutAlphaOut) Quit:$$$ISERR(tSC) tSC
		            }
		            i (MsgType'="A05") & (MsgType'="A38") & (('conv)!(convdia))&($g(ZIN1)'="") s oWishMutAlphaOut.CT1=$p(ZIN1,"|",4),oWishMutAlphaOut.CT2=$p(ZIN1,"|",5)
		            i (MsgType'="A05") & (MsgType'="A38") & (('conv)!(convdia)) i Instance="ENS2017M" s tSC = ..SendRequestAsync("WishCigesNewAllAdtDlmTcpOut",oWishMutAlphaOut)  Quit:$$$ISERR(tSC) tSC
	          }
	          i TypeSej="O" {
		            i (MsgType'="A05") & (MsgType'="A38") & (MsgType'="A40") & (('conv)!(convdia)) {
			          i '$g(^CHUBXL.Parameter("MedWish","Alpha")) s tSC=##class(CHUBXL.DT.WishAmbuToAlpha).Transform(NewMsgHL7,.oWishAmbuAlphaOut) Quit:$$$ISERR(tSC) tSC
			          i $g(^CHUBXL.Parameter("MedWish","Alpha")) s tSC=##class(CHUBXL.DT.WishAmbuToAlpha).Transform(NewMsgHL7Ina8,.oWishAmbuAlphaOut) Quit:$$$ISERR(tSC) tSC
		            }
		            i (MsgType'="A05") & (MsgType'="A38") & (MsgType'="A40") & (('conv)!(convdia)) i Instance="ENS2017M" s tSC = ..SendRequestAsync("WishCigesNewAllAdtDlmTcpOut",oWishAmbuAlphaOut)  Quit:$$$ISERR(tSC) tSC
	          }
          }
        // Send to Dialyse ---------------------------------------------------------------------------------------
        i (TypeSej="I") & (TypeAdm="Z") & (CodeForfait="020") & (Nhop=26) {
	          i '$g(^CHUBXL.Parameter("MedWish","Dialyse")) s tSC=##class(CHUBXL.DT.WishHospToDiaH).Transform(NewMsgHL7,.oWishDIAOut) Quit:$$$ISERR(tSC) tSC
	          i $g(^CHUBXL.Parameter("MedWish","Dialyse")) s tSC=##class(CHUBXL.DT.WishHospToDiaH).Transform(NewMsgHL7Ina8,.oWishDIAOut) Quit:$$$ISERR(tSC) tSC
	          i Instance="ENS2017M" s tSC = ..SendRequestAsync("WishDialyseAllAdtXmlTcpOut",oWishDIAOut)  Quit:$$$ISERR(tSC) tSC
        }
        // Send to Mosos  ---------------------------------------------------------------------------------------            
        i Nhop=26 {
              i (MsgType'="A05") & (MsgType'="A38") s tSC = MososMsgHL7.SetValueAt("NE","MSH:16")
              i (MsgType'="A05") & (MsgType'="A38") & ('conv) i Instance="ENS2017M" s tSC = ..SendRequestAsync("WishMososBruAdtHl7TcpOut",MososMsgHL7)  Quit:$$$ISERR(tSC) tSC
        }
        
        // Send to Ecare Brugmann | HUDERF ---------------------------------------------------------------------------------------
        
        i ((ServHosp="8300") ! (ServHosp="1521") ! (ServHosp="1523") ! (ServHosp="151") ! (ServHosp="152") ! ($tr(TypeSej," ")="")) {
            i ((TypeSej="O") & (TypeAdm="E")) ! (TypeSej="") ! (TypeSej="I") {
	            s tSC1=EcareMsgHL7.SetValueAt(##class(CHUBXL.DT.Utils).getCodeAss($e(pRequest.FindSegmentValues("PV1:19"),1,9),""),"PV1:38")
	            s nomed=EcareMsgHL7.FindSegmentValues("PD1:PatientPrimaryCareProviderNa().IDNumber",,.tSC)
	            s tSC1=EcareMsgHL7.SetValueAt(##class(CHUBXL.DT.Utils).NumMed(nomed),"PD1:PatientPrimaryCareProviderNa().IDNumber") 
	            ;CWY A revoir lors de l'optimisation !!!!!!!!!!!!!!!!!!!!!!!!
	            i ZMG'="" s tSC1=EcareMsgHL7.SetValueAt(ZMG,"UB2")
	            i (Nhop=26) & (MsgType'="A05") & (MsgType'="A38") & ('conv) i (Instance="ENS2017M") ! (Instance="ENS2017TEST") s tSC = ..SendRequestAsync("WishEcareBruAdtHl7TcpOut",EcareMsgHL7)  Quit:$$$ISERR(tSC) tSC
	            i $g(^CHUBXL.Parameter("NewCom","Ecare-Hud")) i (Nhop=27) & (MsgType'="A05") & (MsgType'="A38") & ('conv) i (Instance="ENS2017M") ! (Instance="ENS2017TEST") s tSC = ..SendRequestAsync("WishEcareHudAdtHl7TcpOut",EcareMsgHL7)  Quit:$$$ISERR(tSC) tSC
           }
        }
        
        // Send to Canexis/Stérilisation  ---------------------------------------------------------------------------------------            
        i Nhop=26 {
              ;CWYi (MsgType'="A05") & (MsgType'="A38") & ('conv) & (Ndosm=201063264) s:(Instance="ENS2017TEST") tSC = ..SendRequestAsync("WishCanexisBruAdtHl7TcpOut",CanexisMsgHL7)  Quit:$$$ISERR(tSC) tSC
              ;i (MsgType'="A05") & (MsgType'="A38") & ('conv) s:(Instance="ENS2017TEST") tSC = ..SendRequestAsync("WishCanexisBruAdtHl7TcpOut",CanexisMsgHL7)  Quit:$$$ISERR(tSC) tSC
              i (MsgType'="A05") & (MsgType'="A38") & ('conv) s:(Instance'="ENS2017PREP") tSC = ..SendRequestAsync("WishCanexisBruAdtHl7TcpOut",CanexisMsgHL7)  Quit:$$$ISERR(tSC) tSC
        }
        
        // Send to DentAdmin ---------------------------------------------------------------------------------------
        i (Nhop=26) {
          i ((MsgType="A31") ! (MsgType="A13") ! (MsgType="A04") ! (MsgType="A40")) {
            i (((Instance="ENS2017M") ! (Instance="ENS2017TEST")) & (MsgType'="A04")) s:(Instance="ENS2017M") tSC = ..SendRequestAsync("WishDentAdminBruAdtHl7TcpOut",DentAdminMsgHL7)  Quit:$$$ISERR(tSC) tSC
	        i ((CodeServ="8460") ! (CodeServ="8461") ! (CodeServ="8462") ! (CodeServ="8463")) & (MsgType="A04") {
	          i (Instance="ENS2017M") ! (Instance="ENS2017TEST") s:(Instance="ENS2017M") tSC = ..SendRequestAsync("WishDentAdminBruAdtHl7TcpOut",DentAdminMsgHL7)  Quit:$$$ISERR(tSC) tSC
	        }
          }
        }
        
        // Send to Infohos   ---------------------------------------------------------------------------------------  
        i PV2'="" {
        	s DteAdm=pRequest.FindSegmentValues("PV2:8")
       	 	s $p(PV2,"|",9)="" 
       	 	$$$TRACE("Date Adm : "_DteAdm)
        }
        s Unit=InfohosMsgHL7.FindSegmentValues("PV1:AssignedPatientLocation.PointofCare")
		i Unit'="" {
			s UnitInfohos=##class(CHUBXL.DT.Utils).getNewUnitInfohos(Unit)
			s tSC1=InfohosMsgHL7.SetValueAt(UnitInfohos,"PV1:AssignedPatientLocation.PointofCare")
		}         
        i MsgType="A04" {
              s tSC1=InfohosMsgHL7.SetValueAt($e(InfohosMsgHL7.FindSegmentValues("PV1:19"),1,9),"PV1:19")
              s tSC1=InfohosMsgHL7.SetValueAt("ADT^A01","MSH:9")
              s tSC1=InfohosMsgHL7.SetValueAt("A01","EVN:1")
              i $d(DteAdm)'="" s tSC1=InfohosMsgHL7.SetValueAt(DteAdm,"PV2:8")
              s tSC1=InfohosMsgHL7.SetValueAt(##class(CHUBXL.DT.Utils).getNewUnitInfohos(InfohosMsgHL7.FindSegmentValues("PV2:20.4")),"PV1:3")
        }
        i (convdia) ! ('conv) ! (convoxy) ! (convinfohos) i (Instance="ENS2017M") ! (Instance="ENS2017TEST") s tSC = ..SendRequestAsync("WishInfohosAllAdtHl7TcpOut",InfohosMsgHL7)  Quit:$$$ISERR(tSC) tSC
        // Send to MV  ---------------------------------------------------------------------------------------           
        i (MsgType'="A05") & (MsgType'="A38") {
              s cfrais=MvMsgHL7.FindSegmentValues("PV2:12.4")
              i cfrais="" {
					s tSC1=MvMsgHL7.SetValueAt(MvMsgHL7.FindSegmentValues("PV1:10"),"PV2:12.4")
					s tSC1=MvMsgHL7.SetValueAt(MvMsgHL7.FindSegmentValues("PV1:10"),"PV2:20.4")
              }
              i $e(MvMsgHL7.FindSegmentValues("PID:3"),1)="0" s tSC1=MvMsgHL7.SetValueAt(+MvMsgHL7.FindSegmentValues("PID:3"),"PID:3")
              i MvMsgHL7.FindSegmentValues("PID:5.2")="" {
					s tSC1=MvMsgHL7.SetValueAt("X","PID:5.2")
              }
              i Instance="ENS2017M" s tSC = ..SendRequestAsync("WishMvAllAdtHl7TcpOut",MvMsgHL7)  Quit:$$$ISERR(tSC) tSC
        }
        // Send to Glims & CyberLab ---------------------------------------------------------------------------------------           
        i (MsgType'="A05") & (MsgType'="A38") & ('conv) {
              i GlimsMsgHL7.FindSegmentValues("PID:5.2")="-" {
                	s tSC1=GlimsMsgHL7.SetValueAt("X","PID:5.2")
              }
        }
        s DteAdm0=""
        i (MsgType'="A38") & (('conv) ! (convdia)) {
			  i (MsgType="A04") & ("~151~152~8300~1521~1523~"[("~"_pRequest.FindSegmentValues("PV1:10")_"~")) {
					s DteAdm0=pRequest.FindSegmentValues("PV1:44"),%DS=$e(DteAdm0,1,8),DteSor0=pRequest.FindSegmentValues("PV1:45")
					d INT^%DATE
					s DteSor=$zd(%DN+1,8)_$e(DteAdm0,9,14)
					s tSC1=GlimsMsgHL7.SetValueAt(DteSor,"PV1:45")
					s tSC1=GlimsMsgHL7.SetValueAt(pRequest.FindSegmentValues("PV1:10"),"PV1:20")
					s tSC1=GlimsMsgHL7.SetValueAt(pRequest.FindSegmentValues("PV1:10"),"PV2:12.4")
					s tSC1=GlimsMsgHL7.SetValueAt(pRequest.FindSegmentValues("PV1:10"),"PV2:20.4")
			  }
			  i (MsgType="A03") & ("~151~152~8300~1521~1523~"[("~"_pRequest.FindSegmentValues("PV1:10")_"~")) & (pRequest.FindSegmentValues("PV1:2")="O") {
					s DteAdm0=pRequest.FindSegmentValues("PV1:44"),%DS=$e(DteAdm0,1,8),DteSor0=pRequest.FindSegmentValues("PV1:45")
					d INT^%DATE
					s DteSor=$zd(%DN+1,8)_$e(DteAdm0,9,14)
					s tSC1=GlimsMsgHL7.SetValueAt(DteSor,"PV1:45")
					s tSC1=GlimsMsgHL7.SetValueAt(pRequest.FindSegmentValues("PV1:10"),"PV1:20")
			  }
			  i (Nhop=26) & ("~500~501~502~505~506~507~"'[("~"_GlimsMsgHL7.FindSegmentValues("PV2:12.4")_"~")) {
					i Instance="ENS2017M" s tSC = ..SendRequestAsync("WishGlimsBruAdtHl7TcpOut",GlimsMsgHL7)  Quit:$$$ISERR(tSC) tSC
					i (Instance="ENS2017M") ! (Instance="ENS2017TEST") s tSC = ..SendRequestAsync("WishGlimsCyberlabAllAdtHl7TcpOut",GlimsMsgHL7)  Quit:$$$ISERR(tSC) tSC
			  }
			  i (Nhop=27) & ("~I502~I503~RM26~RM27~"'[("~"_GlimsMsgHL7.FindSegmentValues("PV2:12.4")_"~")) {
					i Instance="ENS2017M" s tSC = ..SendRequestAsync("WishGlimsHudAdtHl7TcpOut",GlimsMsgHL7)  Quit:$$$ISERR(tSC) tSC
			  }
        }
        // Send to Bdoc  ---------------------------------------------------------------------------------------          
        i ZMG'="" s tSC1=BdocMsgHL7.SetValueAt(ZMG,"UB2")
        s UniteDPI=BdocMsgHL7.FindSegmentValues("PV1:AssignedPatientLocation.PointofCare")
        s CodLieuDPI=BdocMsgHL7.FindSegmentValues("PV1:10")
        s NewUniteDPI=##class(CHUBXL.DT.Utils).getMicroMvt(UniteDPI)
        i Instance="ENS2017M" s tSC = ..SendRequestAsync("WishEnsTestAllAdtHl7TcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
		i Instance="ENS2017M" s tSC = ..SendRequestAsync("WishEnsTestIR4HAllAdtHl7TcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC		;CWY 06/04/2021 add IR4HTEST	
        i Instance="ENS2017M" s tSC = ..SendRequestAsync("WishEnsPrepAllAdtHl7TcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
        s tSC1=BdocMsgHL7.SetValueAt(NewUniteDPI,"PV1:AssignedPatientLocation.LocationStatus")

        i Nhop=26 {
	          i Instance="ENS2017M" s tSC = ..SendRequestAsync("WishBdocBruAdtHl7TcpOut",BdocMsgHL7)  Quit:$$$ISERR(tSC) tSC
	          i Instance="ENS2017PREP" {
		        s tSC = ..SendRequestAsync("WishBdocprepBruAdtHl7TcpOut",BdocMsgHL7)  Quit:$$$ISERR(tSC) tSC
		        s tSC = ..SendRequestAsync("WishBdocNewprepBruAdtHl7TcpOut",BdocMsgHL7)  Quit:$$$ISERR(tSC) tSC
	          }
	          i Instance="ENS2017TEST" s tSC = ..SendRequestAsync("WishBdoctestBruAdtHl7TcpOut",BdocMsgHL7)  Quit:$$$ISERR(tSC) tSC
        }
        i Nhop=27 {
	          s NewCodLieuDPI=##class(CHUBXL.DT.Utils).getUrgLocHUDERF(CodLieuDPI)
	          i MsgType="A04",CodLieuDPI'=NewCodLieuDPI {
	            	s tSC1=BdocMsgHL7.SetValueAt(NewCodLieuDPI,"PV2:12.4")
	          }
	          i MsgType="A03",UniteDPI="" {
	            	s tSC1=BdocMsgHL7.SetValueAt(NewCodLieuDPI,"PV1:3.1")
	          }
	          i Instance="ENS2017M" s tSC = ..SendRequestAsync("WishBdocHudAdtHl7TcpOut",BdocMsgHL7)  Quit:$$$ISERR(tSC) tSC
	          i Instance="ENS2017PREP" {
		        s tSC = ..SendRequestAsync("WishBdocprepHudAdtHl7TcpOut",BdocMsgHL7)  Quit:$$$ISERR(tSC) tSC
		        s tSC = ..SendRequestAsync("WishBdocNewprepHudAdtHl7TcpOut",BdocMsgHL7)  Quit:$$$ISERR(tSC) tSC
	          }
	          i Instance="ENS2017TEST" ;s tSC = ..SendRequestAsync("WishBdoctestHudAdtHl7TcpOut",BdocMsgHL7)  Quit:$$$ISERR(tSC) tSC
        }
        // Send mail when merging ---------------------------------------------------------------------------------------
        i MsgType="A40" {
	          d ..SendEmail("Astraia",pRequest.RawContent,$p($g(MRG),"|",2),pRequest.FindSegmentValues("PID:3"))
	          d ..SendEmail("Glims",pRequest.RawContent,$p($g(MRG),"|",2),pRequest.FindSegmentValues("PID:3"))
	          d ..SendEmail("Dialyse",pRequest.RawContent,$p($g(MRG),"|",2),pRequest.FindSegmentValues("PID:3"))
	          d ..SendEmail("BDoc",pRequest.RawContent,$p($g(MRG),"|",2),pRequest.FindSegmentValues("PID:3"))
	          d ..SendEmail("Opera",pRequest.RawContent,$p($g(MRG),"|",2),pRequest.FindSegmentValues("PID:3"))
	          d ..SendEmail("Mosos",pRequest.RawContent,$p($g(MRG),"|",2),pRequest.FindSegmentValues("PID:3"))  
	          d ..SendEmail("Alpha",pRequest.RawContent,$p($g(MRG),"|",2),pRequest.FindSegmentValues("PID:3"))
	          d ..SendEmail("Agfa-Quadrat",pRequest.RawContent,$p($g(MRG),"|",2),pRequest.FindSegmentValues("PID:3"))
	          d ..SendEmail("Infohos",pRequest.RawContent,$p($g(MRG),"|",2),pRequest.FindSegmentValues("PID:3"))
	          d ..SendEmail("Cache/PLUS",pRequest.RawContent,$p($g(MRG),"|",2),pRequest.FindSegmentValues("PID:3"))
	          d ..SendEmail("Ecare",pRequest.RawContent,$p($g(MRG),"|",2),pRequest.FindSegmentValues("PID:3"))
	          d ..SendEmail("Medical Viewer",pRequest.RawContent,$p($g(MRG),"|",2),pRequest.FindSegmentValues("PID:3"))
	          d ..SendEmail("Datameal",pRequest.RawContent,$p($g(MRG),"|",2),pRequest.FindSegmentValues("PID:3"))
	          d ..SendEmail("Diamic",pRequest.RawContent,$p($g(MRG),"|",2),pRequest.FindSegmentValues("PID:3"))
	          d ..SendEmail("Infopartner",pRequest.RawContent,$p($g(MRG),"|",2),pRequest.FindSegmentValues("PID:3"))
	          d ..SendEmail("Innovian",pRequest.RawContent,$p($g(MRG),"|",2),pRequest.FindSegmentValues("PID:3"))
	          d ..SendEmail("ICIP",pRequest.RawContent,$p($g(MRG),"|",2),pRequest.FindSegmentValues("PID:3"))
	          d ..SendEmail("Ophtalmo",pRequest.RawContent,$p($g(MRG),"|",2),pRequest.FindSegmentValues("PID:3"))
	          d ..SendEmail("Kine",pRequest.RawContent,$p($g(MRG),"|",2),pRequest.FindSegmentValues("PID:3"))
		}
	} // End of valid BS
	Else {
        $$$LOGWARNING("Unsupported message received :"_tSourceConfigName_"****"_pRequest.RawContent)
    }
Exit  
	$$$TRACE("== Stop BP WishHL7MLLPRouting ==========")  
    Quit tSC
ErrorTrap
    Set $ZTrap = ""
    Write $ZError,!
    $$$TRACE("Error BP - Wish : "_$ZError)
    Set tSC=$$$EnsSystemError Goto Exit
}

Method OnResponse(request As Ens.Request, ByRef response As Ens.Response, callrequest As Ens.Request, callresponse As Ens.Response, pCompletionKey As %String) As %Status
{
    ;$$$TRACE("Dummy Asynchronous request returned")
    Set response=callresponse
    Quit $$$OK
}

ClassMethod SendEmail(Appli As %String, MessageText As %String, Ndos1 As %String, Ndos2 As %String)
{
    Set Mailer = ##class(%Net.SMTP).%New()
    Set Mailer.smtpserver = "smtp.chu-brugmann.be"
    
    Set MsgSend="Le patient avec le numéro de dossier "_Ndos1_" est fusionné au patient dont le numéro de dossier est "
    Set MsgSend=MsgSend_Ndos2_$c(13)_$C(10)_$c(13)_$C(10)_"Message : "_$c(13)_$C(10)_$c(13)_$C(10)_MessageText
    
    Set Msg = ##class(%Net.MailMessage).%New()
    if $p($SYSTEM,":",2) = "ENS2017PREP" Set Msg.From="Ensemble2017Boron01PREP@chu-brugmann.be"
    if $p($SYSTEM,":",2) = "ENS2017TEST" Set Msg.From="Ensemble2017Boron02TEST@chu-brugmann.be"
    if $p($SYSTEM,":",2) = "ENS2017M" Set Msg.From="Ensemble2017Boron01PROD@chu-brugmann.be"
    ;Do Msg.To.Insert("Christian.WYNS@chu-brugmann.be")
    Do Msg.To.Insert("dulio.ambrogetti@chu-brugmann.be")
    Set Msg.Subject = "Fusion de patient sur "_Appli_" (A40)"
    Do Msg.TextData.Write(MsgSend)
    
    set status=Mailer.Send(Msg)
    if $$$ISERR(status) do $system.OBJ.DisplayError(status) quit

    Quit $$$OK
}

/*
================================================================================================================================
SEGMENTS DESCRIPTION
================================================================================================================================
MSH	DESCRIPTION									NAME								WISH	WISH-CONVENTION	
---	-----------									----								----	---------------
1	Field Separator								FieldSeparator		 
2	Encoding Characters							EncodingCharacters		 	 
3	Sending Application							SendingApplication					MSH-03	ITF_CHUB = Passerelle CHUB.	
4	Sending Facility							SendingFacility	
5	Receiving Application						ReceivingApplication	
6	Receiving Facility							ReceivingFacility	
7	Date/Time Of Message						DateTimeOfMessage	 	 
8	Security									Security	 
9	Message Type								MessageType							MSH-09	XXX = ADT ou MFN et YYY = Axx ou M02.	 	 
10	Message Control ID							MessageControlID		 
11	Processing ID								ProcessingID						MSH-11	P = Production.		 	 
12	Version ID									VersionID	 	 
13	Sequence Number								SequenceNumber		 
14	Continuation Pointer						ContinuationPointer		 
15	Accept Acknowledgment Type					AcceptAcknowledgmentType			MSH-15	AL = Toujours un accusé de réception.	
16	Application Acknowledgment Type				ApplicationAcknowledgmentTyp		MSH-16	AL = Toujours un accusé de réception.	 
17	Country Code								CountryCode	
18	Character Set								CharacterSet	
19	Principal Language Of Message				PrincipalLanguageOfMessage	
20	Alternate Character Set Handling Scheme		AltCharsetHandlingScheme	
21	Message Profile Identifier					MessageProfileIdentifier
--------------------------------------------------------------------------------------------------------------------------------
EVN	DESCRIPTION									NAME								WISH	WISH-CONVENTION	
---	-----------									----								----	---------------
1	Event Type Code								EventTypeCode						EVN-01	YYY = Axx ou M02.
2	Recorded Date/Time							RecordedDateTime	 	 
3	Date/Time Planned Event						DateTimePlannedEvent		 	 
4	Event Reason Code							EventReasonCode	
5	Operator ID									OperatorID	
6	Event Occurred								EventOccurred	 	 
7	Event Facility								EventFacility
--------------------------------------------------------------------------------------------------------------------------------
PID	DESCRIPTION									NAME								WISH	WISH-CONVENTION	
---	-----------									----								----	---------------
1	Set ID - PID								SetIDPID
2	Patient ID									PatientID	
3	Patient Identifier List						PatientIdentifierList
4	Alternate Patient ID - PID					AlternatePatientIDPID
5	Patient Name								PatientName	
6	Mother's Maiden Name						MothersMaidenName	
7	Date/Time of Birth							DateTimeofBirth
8	Administrative Sex							AdministrativeSex					PID-08	M = Homme, F = Femme, U = Inconnu, Blanc = Inconnu.	
9	Patient Alias								PatientAlias	 
10	Race										Race	
11	Patient Address								PatientAddress		 
12	County Code									CountyCode	
13	Phone Number - Home							PhoneNumberHome 
14	Phone Number - Business						PhoneNumberBusiness		 
15	Primary Language							PrimaryLanguage	
16	Marital Status								MaritalStatus						PID-16	C = Célibataire, D = Divorcé, M = Marié, S = Séparé, V= Veuf, Vide = Inconnu.	
17	Religion									Religion	
18	Patient Account Number						PatientAccountNumber 
19	SSN Number - Patient						SSNNumberPatient 
20	Driver's License Number - Patient			DriversLicenseNumberPatient
21	Mother's Identifier							MothersIdentifier 
22	Ethnic Group								EthnicGroup
23	Birth Place									BirthPlace
24	Multiple Birth Indicator					MultipleBirthIndicator
25	Birth Order									BirthOrder	
26	Citizenship									Citizenship	
27	Veterans Military Status					VeteransMilitaryStatus	
28	Nationality									Nationality	
29	Patient Death Date and Time					PatientDeathDateandTime	
30	Patient Death Indicator						PatientDeathIndicator				PID-30	Y = Oui, N = Non.	
31	Identity Unknown Indicator					IdentityUnknownIndicator	
32	Identity Reliability Code					IdentityReliabilityCode 
33	Last Update Date/Time						LastUpdateDateTime	 
34	Last Update Facility						LastUpdateFacility	 	 
35	Species Code								SpeciesCode							PID-35	Y = Oui, Blanc = Non.	
36	Breed Code									BreedCode	
37	Strain										Strain	
38	Production Class Code						ProductionClassCode	
39	Tribal Citizenship							TribalCitizenship
--------------------------------------------------------------------------------------------------------------------------------
PD1	DESCRIPTION									NAME								WISH	WISH-CONVENTION	
---	-----------									----								----	---------------
1	Living Dependency							LivingDependency	
2	Living Arrangement							LivingArrangement	
3	Patient Primary Facility					PatientPrimaryFacility	 	 
4	Patient Primary Care Provider Name & ID No.	PatientPrimaryCareProviderNa	 	 
5	Student Indicator							StudentIndicator	
6	Handicap									Handicap	
7	Living Will Code							LivingWillCode	
8	Organ Donor Code							OrganDonorCode	
9	Separate Bill								SeparateBill	 
10	Duplicate Patient							DuplicatePatient 	 
11	Publicity Code								PublicityCode	
12	Protection Indicator						ProtectionIndicator	2.5:ID			PD1-12	Y = Oui, N = Non. 	 	 	 
13	Protection Indicator Effective Date			ProtectionIndicatorEffective	 	 
14	Place of Worship							PlaceofWorship	
15	Advance Directive Code						AdvanceDirectiveCode	
16	Immunization Registry Status				ImmunizationRegistryStatus			PD1-16	Y = Oui, N = Non.
17	Immunization Registry Status Effective Date	ImmunizationRegistryStatusEf		 
18	Publicity Code Effective Date				PublicityCodeEffectiveDate	 	 
19	Military Branch								MilitaryBranch	
20	Military Rank/Grade							MilitaryRankGrade	
21	Military Status								MilitaryStatus
--------------------------------------------------------------------------------------------------------------------------------
NK1	DESCRIPTION									NAME								WISH	WISH-CONVENTION	
---	-----------									----								----	---------------
1	Set ID - NK1								SetIDNK1		 
2	Name										Name		 
3	Relationship								Relationship						NK1-03	CH = Enfant, FA = Père, MO = Mère, SP = Conjoint, UN = Inconnu, WI = Veuf.
4	Address										Address	 	 
5	Phone Number								PhoneNumber		 
6	Business Phone Number						BusinessPhoneNumber		 	 
7	Contact Role								ContactRole	 
8	Start Date									StartDate	 	 
9	End Date									EndDate		 
10	Next of Kin / Associated Parties Job Title			NextofKinAssocJobTitle		 	 
11	Next of Kin / Associated Parties Job Code/Class		NextofKinAssocJobCodeClass		 	 
12	Next of Kin / Associated Parties Employee Number	NextofKinAssocEmployeeNumber		 
13	Organization Name - NK1						OrganizationNameNK1		 
14	Marital Status								MaritalStatus	
15	Administrative Sex							AdministrativeSex	 
16	Date/Time of Birth							DateTimeofBirth		 
17	Living Dependency							LivingDependency	
18	Ambulatory Status							AmbulatoryStatus		 
19	Citizenship									Citizenship	
20	Primary Language							PrimaryLanguage	
21	Living Arrangement							LivingArrangement	
22	Publicity Code								PublicityCode	
23	Protection Indicator						ProtectionIndicator	 
24	Student Indicator							StudentIndicator	
25	Religion									Religion	
26	Mother's Maiden Name						MothersMaidenName	 
27	Nationality									Nationality	
28	Ethnic Group								EthnicGroup	
29	Contact Reason								ContactReason	
30	Contact Person's Name						ContactPersonsName	
31	Contact Person's Telephone Number			ContactPersonsTelephoneNumbe	
32	Contact Person's Address					ContactPersonsAddress	
33	Next of Kin/Associated Party's Identifiers	NextofKinAssociatedPartysIde
34	Job Status									JobStatus	
35	Race										Race		 
36	Handicap									Handicap	5	 
37	Contact Person Social Security Number		ContactPersonSocialSecurityN	
38	Next of Kin Birth Place						NextofKinBirthPlace
39	VIP Indicator								VIPIndicator

--------------------------------------------------------------------------------------------------------------------------------
PV1	DESCRIPTION									NAME								WISH	WISH-CONVENTION	
---	-----------									----								----	---------------
1	Set ID - PV1								SetIDPV1	
2	Patient Class								PatientClass						PV1-02	I = Hospitalisé, O = Externe.	 
3	Assigned Patient Location					AssignedPatientLocation	 
4	Admission Type								AdmissionType						PV1-04	E = Ambulant Urgences, Z = Hôpital de jour ou convention (Suivant code forfait en PV1-24).		 
5	Preadmit Number								PreadmitNumber	 	 
6	Prior Patient Location						PriorPatientLocation	 	 
7	Attending Doctor							AttendingDoctor	 
8	Referring Doctor							ReferringDoctor	 
9	Consulting Doctor							ConsultingDoctor	 
10	Hospital Service							HospitalService	 
11	Temporary Location							TemporaryLocation		 	 
12	Preadmit Test Indicator						PreadmitTestIndicator				PV1-12	P = Préadmission.	 
13	Re-admission Indicator						ReadmissionIndicator	
14	Admit Source								AdmitSource	
15	Ambulatory Status							AmbulatoryStatus		 
16	VIP Indicator								VIPIndicator						PV1-16	Y = Oui, Blanc = Non.	
17	Admitting Doctor							AdmittingDoctor		 
18	Patient Type								PatientType	
19	Visit Number								VisitNumber							PV1-19	Le n° de séjour est x par 1000 + le n° de visite (001 à 999) pour les visites.	 
20	Financial Class								FinancialClass	4	 
21	Charge Price Indicator						ChargePriceIndicator	
22	Courtesy Code								CourtesyCode	 
23	Credit Rating								CreditRating	 
24	Contract Code								ContractCode	
25	Contract Effective Date						ContractEffectiveDate		 	 
26	Contract Amount								ContractAmount	 	 
27	Contract Period								ContractPeriod		 	 
28	Interest Code								InterestCode	
29	Transfer to Bad Debt Code					TransfertoBadDebtCode	
30	Transfer to Bad Debt Date					TransfertoBadDebtDate	
31	Bad Debt Agency Code						BadDebtAgencyCode		 
32	Bad Debt Transfer Amount					BadDebtTransferAmount		 	 
33	Bad Debt Recovery Amount					BadDebtRecoveryAmount		 	 
34	Delete Account Indicator					DeleteAccountIndicator	
35	Delete Account Date							DeleteAccountDate		 	 
36	Discharge Disposition						DischargeDisposition	
37	Discharged to Location						DischargedtoLocation	
38	Diet Type									DietType	
39	Servicing Facility							ServicingFacility	
40	Bed Status									BedStatus	
41	Account Status								AccountStatus	 
42	Pending Location							PendingLocation		 
43	Prior Temporary Location					PriorTemporaryLocation 	 
44	Admit Date/Time								AdmitDateTime		 
45	Discharge Date/Time							DischargeDateTime		 	 
46	Current Patient Balance						CurrentPatientBalance		 
47	Total Charges								TotalCharges		 
48	Total Adjustments							TotalAdjustments	 	 
49	Total Payments								TotalPayments	
50	Alternate Visit ID							AlternateVisitID	
51	Visit Indicator								VisitIndicator	
52	Other Healthcare 							Provider							PV1-52	C = Création, M = Modification, S = Suppression.
--------------------------------------------------------------------------------------------------------------------------------
PV2	DESCRIPTION									NAME								WISH	WISH-CONVENTION	
---	-----------									----								----	---------------
1	Prior Pending Location						PriorPendingLocation	
2	Accommodation Code							AccommodationCode	
3	Admit Reason								AdmitReason 
4	Transfer Reason								TransferReason	
5	Patient Valuables							PatientValuables		 
6	Patient Valuables Location					PatientValuablesLocation
7	Visit User Code								VisitUserCode	
8	Expected Admit Date/Time					ExpectedAdmitDateTime				PV2-08	Si préadmission ou A04.	
9	Expected Discharge Date/Time				ExpectedDischargeDateTime	 
10	Estimated Length of Inpatient Stay			EstimatedLengthofInpatientSt		 
11	Actual Length of Inpatient Stay				ActualLengthofInpatientStay 
12	Visit Description							VisitDescription					PV2-12	Uniquement si A04.	
13	Referral Source Code						ReferralSourceCode		 	 
14	Previous Service Date						PreviousServiceDate 
15	Employment Illness Related Indicator		EmploymentIllnessRelatedIndi	
16	Purge Status Code							PurgeStatusCode	
17	Purge Status Date							PurgeStatusDate	
18	Special Program Code						SpecialProgramCode	
19	Retention Indicator							RetentionIndicator	
20	Expected Number of Insurance Plans			ExpectedNumberofInsurancePla		PV2-20	Uniquement si A04.		 	 
21	Visit Publicity Code						VisitPublicityCode	
22	Visit Protection Indicator					VisitProtectionIndicator			PV2-22	Y = Oui, Blanc = Non.	 
23	Clinic Organization Name					ClinicOrganizationName	 	 
24	Patient Status Code							PatientStatusCode					PV2-24	Uniquement si évènement de type congé.	
25	Visit Priority Code							VisitPriorityCode	
26	Previous Treatment Date						PreviousTreatmentDate
27	Expected Discharge Disposition				ExpectedDischargeDisposition	
28	Signature on File Date						SignatureonFileDate	 	 
29	First Similar Illness Date					FirstSimilarIllnessDate		 	 
30	Patient Charge Adjustment Code				PatientChargeAdjustmentCode	 
31	Recurring Service Code						RecurringServiceCode	
32	Billing Media Code							BillingMediaCode	
33	Expected Surgery Date and Time				ExpectedSurgeryDateandTime		 	 
34	Military Partnership Code					MilitaryPartnershipCode	
35	Military Non-Availability Code				MilitaryNonAvailabilityCode
36	Newborn Baby Indicator						NewbornBabyIndicator	
37	Baby Detained Indicator						BabyDetainedIndicator	
38	Mode of Arrival Code						ModeofArrivalCode	
39	Recreational Drug Use Code					RecreationalDrugUseCode	2
40	Admission Level of Care Code				AdmissionLevelofCareCode	
41	Precaution Code								PrecautionCode	
42	Patient Condition Code						PatientConditionCode	 
43	Living Will Code							LivingWillCode	
44	Organ Donor Code							OrganDonorCode	 
45	Advance Directive Code						AdvanceDirectiveCode	
46	Patient Status Effective Date				PatientStatusEffectiveDate	 	 
47	Expected LOA Return Date/Time				ExpectedLOAReturnDateTime		 	 
48	Expected Pre-admission Testing Date/Time	ExpectedPreadmissionTestingD	 	 
49	Notify Clergy Code							NotifyClergyCode
--------------------------------------------------------------------------------------------------------------------------------
IN1	DESCRIPTION									NAME								WISH	WISH-CONVENTION	
---	-----------									----								----	---------------
1	Set ID - IN1								SetIDIN1	
2	Insurance Plan ID							InsurancePlanID	
3	Insurance Company ID						InsuranceCompanyID					IN1-03	1 = Non mutuelliste, 2 = Mutuelle, 3= Assurance.	 	 
4	Insurance Company Name						InsuranceCompanyName		 	 
5	Insurance Company Address					InsuranceCompanyAddress		 
6	Insurance Co Contact Person					InsuranceCoContactPerson	 	 
7	Insurance Co Phone Number					InsuranceCoPhoneNumber		 	 
8	Group Number								GroupNumber	
9	Group Name									GroupName		 
10	Insured's Group Emp ID						InsuredsGroupEmpID	 	 
11	Insured's Group Emp Name					InsuredsGroupEmpName		 	 
12	Plan Effective Date							PlanEffectiveDate		 
13	Plan Expiration Date						PlanExpirationDate		 
14	Authorization Information					AuthorizationInformation	 	 
15	Plan Type									PlanType	
16	Name Of Insured								NameOfInsured		 
17	Insured's Relationship To Patient			InsuredsRelationshipToPatien	 
18	Insured's Date Of Birth						InsuredsDateOfBirth	 
19	Insured's Address							InsuredsAddress		 
20	Assignment Of Benefits						AssignmentOfBenefits	
21	Coordination Of Benefits					CoordinationOfBenefits	
22	Coord Of Ben. Priority						CoordOfBenPriority	 	 
23	Notice Of Admission Flag					NoticeOfAdmissionFlag	 
24	Notice Of Admission Date					NoticeOfAdmissionDate	 	 
25	Report Of Eligibility Flag					ReportOfEligibilityFlag	
26	Report Of Eligibility Date					ReportOfEligibilityDate	 
27	Release Information Code					ReleaseInformationCode	
28	Pre-Admit Cert (PAC)						PreAdmitCertPAC	 	 
29	Verification Date/Time						VerificationDateTime
30	Verification By								VerificationBy		 	 
31	Type Of Agreement Code						TypeOfAgreementCode	 
32	Billing Status								BillingStatus		 
33	Lifetime Reserve Days						LifetimeReserveDays		 	 
34	Delay Before L.R. Day						DelayBeforeLRDay	 	 
35	Company Plan Code							CompanyPlanCode	
36	Policy Number								PolicyNumber	 	 
37	Policy Deductible							PolicyDeductible		 	 
38	Policy Limit - Amount						PolicyLimitAmount		 
39	Policy Limit - Days							PolicyLimitDays	 	 
40	Room Rate - Semi-Private					RoomRateSemiPrivate	 	 
41	Room Rate - Private							RoomRatePrivate	
42	Insured's Employment Status					InsuredsEmploymentStatus	 
43	Insured's Administrative Sex				InsuredsAdministrativeSex		 
44	Insured's Employer's Address				InsuredsEmployersAddress	 	 
45	Verification Status							VerificationStatus		 
46	Prior Insurance Plan ID						PriorInsurancePlanID	
47	Coverage Type								CoverageType
48	Handicap									Handicap	
49	Insured's ID Number							InsuredsIDNumber	 	 
50	Signature Code								SignatureCode	
51	Signature Code Date							SignatureCodeDate		 	 
52	Insured's Birth Place						InsuredsBirthPlace	 	 
53	VIP Indicator								VIPIndicator
--------------------------------------------------------------------------------------------------------------------------------
MRG	DESCRIPTION									NAME								WISH	WISH-CONVENTION	
---	-----------									----								----	---------------
1	Prior Patient Identifier List				PriorPatientIdentifierList		 
2	Prior Alternate Patient ID					PriorAlternatePatientID		 	 
3	Prior Patient Account Number				PriorPatientAccountNumber		 	 
4	Prior Patient ID							PriorPatientID	 	 
5	Prior Visit Number							PriorVisitNumber		 	 
6	Prior Alternate Visit ID					PriorAlternateVisitID	 	 
7	Prior Patient Name							PriorPatientName
--------------------------------------------------------------------------------------------------------------------------------
OBX	DESCRIPTION									NAME								WISH	WISH-CONVENTION	
---	-----------									----								----	---------------
1	Set ID - OBX								SetIDOBX		 
2	Value Type									ValueType		 
3	Observation Identifier						ObservationIdentifier		 	 
4	Observation Sub-ID							ObservationSubID		 	 
5	Observation Value							ObservationValue	 		 	 
6	Units										Units	 
7	References Range							ReferencesRange	 
8	Abnormal Flags								AbnormalFlags		 
9	Probability									Probability	 	 
10	Nature of Abnormal Test						NatureofAbnormalTest		 
11	Observation Result Status					ObservationResultStatus	
12	Effective Date of Reference Range			EffectiveDateofReferenceRang	
13	User Defined Access Checks					UserDefinedAccessChecks
14	Date/Time of the Observation				DateTimeoftheObservation	 	 
15	Producer's ID								ProducersID	
16	Responsible Observer						ResponsibleObserver	 	 
17	Observation Method							ObservationMethod	 	 
18	Equipment Instance Identifier				EquipmentInstanceIdentifier		 	 
19	Date/Time of the Analysis					DateTimeoftheAnalysis
--------------------------------------------------------------------------------------------------------------------------------

================================================================================================================================
ADT DETAILS
================================================================================================================================
Création Patient 
ADT_A28	 MSH,EVN,PID,PD1,NK1(x),[OBX] 	 Création inscription patient 

1 MSH|^~\&|ITF_CHUB||ALL||20170124103418||ADT^A28|05581297|P|2.5|||AL|AL
2 EVN|A28|20170124103418|||BILLAU|20170124103400
3 PID|||200930986||ZZWISH^DETAILSADT||19970124|M|||PLACE A. VAN GEHUCHTEN 4^^LAEKEN^^1020^B||02/1234567^^PH~0475/332211^^CP~^^Internet^test@chu-brugmann.be||F|C||||000000000000||||||||B||N|||20170124103400||
4 PD1||||100001^MEDECIN^FF^PL ARTHUR VANGEHUCHTEN 4^^LAEKEN^^1020^B||||||||N||||N
5 NK1|1|PAS DE^PARTENAIRE|SP

Champs principaux:
	1. Numéro de Patient
	2. Nom Patient
	3. Prénom Patient
	4. Date de naissance
	5. Sexe
	6. Adresse Patient
	7. Médecin traitant (+ adresse du médecin)
--------------------------------------------------------------------------------------------------------------------------------

Modification Patient

ADT_A31	 MSH,EVN,PID,PD1,NK1(x),[OBX],[IN1+ZIN](x) 	 Mise à jour inscription patient 
1 MSH|^~\&|ITF_CHUB||ALL||20170124103419||ADT^A31|05581298|P|2.5|||AL|AL
2 EVN|A31|20170124103419|||BILLAU|20170124103400
3 PID|||200930986||ZZWISH^DETAILSADT||19970124|M|||PLACE A. VAN GEHUCHTEN 4^^LAEKEN^^1020^B||02/1234567^^PH~0475/332211^^CP~^^Internet^test@chu-brugmann.be||F|C||||000000000000||||||||B||N|||20170124103400||
4 PD1||||100001^MEDECIN^FF^PL ARTHUR VANGEHUCHTEN 4^^LAEKEN^^1020^B||||||||N||||N
5 NK1|1|PAS DE^PARTENAIRE|SP

Champs principaux:
	1. Numéro de Patient
	2. Nom Patient
	3. Prénom Patient
	4. Date de naissance
	5. Sexe
	6. Adresse Patient
	7. Médecin traitant (+ adresse du médecin)
--------------------------------------------------------------------------------------------------------------------------------

Séjours Ambulatoires

Création/Modification Séjour Ambulatoire
ADT_A04	 MSH,EVN,PID,PD1,NK1(x),PV1,IN1+ZIN (x)+[ZMG] 	 Création/modification visite + séjours urgences/kiné 
1 MSH|^~\&|ITF_CHUB||ALL||20170124104457||ADT^A04|05581463|P|2.5|||AL|AL
2 EVN|A04|20170124104457|||BILLAU|20170124104300
3 PID|||200930986||ZZWISH^DETAILSADT||19970124|M|||PLACE A. VAN GEHUCHTEN 4^^LAEKEN^^1020^B||02/1234567^^PH~0475/332211^^CP~^^Internet^test@chu-brugmann.be||F|C||||000000000000||||||||B||N|||20170124103400||
4 PD1||||100001^MEDECIN^FF^PL ARTHUR VANGEHUCHTEN 4^^LAEKEN^^1020^B||||||||N||||N
5 NK1|1|PAS DE^PARTENAIRE|SP
6 PV1||O|^^|N||||^^|100001^MEDECIN^FF|810|||||||||250873659|||||000||||||||||||||||||^^||201701241043||||||||C
7 PV2||59||||||201701241043||||^^^^^^^||||||||^^^^^^^
8 IN1|0001|1|||||||||||||FAC

Champs principaux
	1. Numéro de Patient
	2. Nom Patient
	3. Prénom Patient
	4. Date de naissance
	5. Sexe
	6. Adresse Patient
	7. Médecin traitant (+ adresse du médecin)
	8. Service (810 pour Horta, 8100 pour Brien)
	9. Numéro de séjour
	10. Date/Heure ouverture séjour au format YYYYMMDDHHMM

--------------------------------------------------------------------------------------------------------------------------------

Clôture Séjour Ambulatoire
ADT_A03	 MSH,EVN,PID,PD1,PV1 	 Sortie réelle patient 

1 MSH|^~\&|ITF_CHUB||ALL||20170124104953||ADT^A03|05581704|P|2.5|||AL|AL
2 EVN|A03|20170124104953|||BILLAU|20170131170000
3 PID|||200930986||ZZWISH^DETAILSADT||19970124|M|||PLACE A. VAN GEHUCHTEN 4^^LAEKEN^^1020^B||02/1234567^^PH~0475/332211^^CP~^^Internet^test@chu-brugmann.be||F|C||||000000000000||||||||B||N|||20170124103400||
4 PD1||||100001^MEDECIN^FF^PL ARTHUR VANGEHUCHTEN 4^^LAEKEN^^1020^B||||||||N||||N
5 PV1||O|^^|N|||||100001^MEDECIN^FF|810|||||||||250873659|||||000||||||||||||1|1|||||^^||201701241043|201701311700|

Champs principaux
	1. Numéro de Patient
	2. Nom Patient
	3. Prénom Patient
	4. Date de naissance
	5. Sexe
	6. Adresse Patient
	7. Médecin traitant (+ adresse du médecin)
	8. Service (810 pour Horta, 8100 pour Brien)
	9. Numéro de séjour
	10. Date/Heure ouverture séjour au format YYYYMMDDHHMM
	11. Date/Heure de cloture du séjour au format YYYYMMDDHHMM
--------------------------------------------------------------------------------------------------------------------------------

Annulation Clôture de séjour ambulatoire
ADT_A13	 MSH,EVN,PID,PD1,NK1(x),PV1 	 Annulation sortie réelle patient 

1 MSH|^~\&|ITF_CHUB||ALL||20170124105346||ADT^A13|05581766|P|2.5|||AL|AL
2 EVN|A13|20170124105346|||BILLAU|20170131170000
3 PID|||200930986||ZZWISH^DETAILSADT||19970124|M|||PLACE A. VAN GEHUCHTEN 4^^LAEKEN^^1020^B||02/1234567^^PH~0475/332211^^CP~^^Internet^test@chu-brugmann.be||F|C||||000000000000||||||||B||N|||20170124103400||
4 PD1||||100001^MEDECIN^FF^PL ARTHUR VANGEHUCHTEN 4^^LAEKEN^^1020^B||||||||N||||N
5 NK1|1|PAS DE^PARTENAIRE|SP
6 PV1||O|^^|N||||^^|100001^MEDECIN^FF|810|||||||||250873659|||||000||||||||||||||||||^^||201701241043||

Champs principaux
	1. Numéro de Patient
	2. Nom Patient
	3. Prénom Patient
	4. Date de naissance
	5. Sexe
	6. Adresse Patient
	7. Médecin traitant (+ adresse du médecin)
	8. Service (810 pour Horta, 8100 pour Brien)
	9. Numéro de séjour
	10. Date/Heure ouverture séjour au format YYYYMMDDHHMM
--------------------------------------------------------------------------------------------------------------------------------

Suppression Séjour Ambulatoire
ADT_A11	 MSH,EVN,PID,PD1,PV1 	 Suppression admission 

1 MSH|^~\&|ITF_CHUB||ALL||20170124105653||ADT^A11|05581795|P|2.5|||AL|AL
2 EVN|A11|20170124105653|||BILLAU|20170124104300
3 PID|||200930986||ZZWISH^DETAILSADT||19970124|M|||PLACE A. VAN GEHUCHTEN 4^^LAEKEN^^1020^B||02/1234567^^PH~0475/332211^^CP~^^Internet^test@chu-brugmann.be||F|C||||000000000000||||||||B||N|||20170124103400||
4 PD1||||100001^MEDECIN^FF^PL ARTHUR VANGEHUCHTEN 4^^LAEKEN^^1020^B||||||||N||||N
5 PV1||O|^^|N||||^^|100001^MEDECIN^FF|810|||||||||250873659|||||000||||||||||||1|1|||||^^||201701241043|201701241044|

Champs principaux
	1. Numéro de Patient
	2. Nom Patient
	3. Prénom Patient
	4. Date de naissance
	5. Sexe
	6. Adresse Patient
	7. Médecin traitant (+ adresse du médecin)
	8. Service (810 pour Horta, 8100 pour Brien)
	9. Numéro de séjour
	10. Date/Heure ouverture séjour au format YYYYMMDDHHMM
	11. Date/Heure de cloture du séjour au format YYYYMMDDHHMM
--------------------------------------------------------------------------------------------------------------------------------

Séjours Hospitalisés et OneDay

Création Séjour

ADT_A01	 MSH,EVN,PID,PD1,NK1(x),PV1,IN1+ZIN (x) 	 Création admission (Séjours hospi) 

1 MSH|^~\&|ITF_CHUB||ALL||20170124110231||ADT^A01|05581853|P|2.5|||AL|AL
2 EVN|A01|20170124110231|||BILLAU|20170124110100
3 PID|||200930986||ZZWISH^DETAILSADT||19970124|M|||PLACE A. VAN GEHUCHTEN 4^^LAEKEN^^1020^B||02/1234567^^PH~0475/332211^^CP~^^Internet^test@chu-brugmann.be||F|C||||000000000000||||||||B||N|||20170124103400||
4 PD1||||100001^MEDECIN^FF^PL ARTHUR VANGEHUCHTEN 4^^LAEKEN^^1020^B||||||||N||||N
5 NK1|1|PAS DE^PARTENAIRE|SP
6 PV1||I|BG1^00^00|N|||128670|128670^CAVENAILE^JEAN-CHRISTOP|100001^MEDECIN^FF|999||||3^1^1|||||250873682|| 9| 9||000||||||||||||||||||BG1^00^00||201701241101||
7 PV2||59|||||||
8 IN1|0001|1|||||||||||||FAC

Champs principaux
	1. Numéro de Patient
	2. Nom Patient
	3. Prénom Patient
	4. Date de naissance
	5. Sexe
	6. Adresse Patient
	7. Médecin traitant (+ adresse du médecin)
	8. Localisation (UnitéDeSoins^Chambre^Lit)
	9. Type Admission (N= Normale, Z= OneDay)
	10. Service d'hospitalisation
	11. Numéro de séjour
	12. Date/Heure ouverture séjour au format YYYYMMDDHHMM

--------------------------------------------------------------------------------------------------------------------------------

Modification Séjour
ADT_A08	 MSH,EVN,PID,PD1,NK1(x),PV1,IN1+ZIN (x) 	 Mise à jour données admission 

1 MSH|^~\&|ITF_CHUB||ALL||20170124110812||ADT^A08|05581919|P|2.5|||AL|AL
2 EVN|A08|20170124110812|||BILLAU|20170124110100
3 PID|||200930986||ZZWISH^DETAILSADT||19970124|M|||PLACE A. VAN GEHUCHTEN 4^^LAEKEN^^1020^B||02/1234567^^PH~0475/332211^^CP~^^Internet^test@chu-brugmann.be||F|C||||000000000000||||||||B||N|||20170124103400||
4 PD1||||100001^MEDECIN^FF^PL ARTHUR VANGEHUCHTEN 4^^LAEKEN^^1020^B||||||||N||||N
5 NK1|1|PAS DE^PARTENAIRE|SP
6 PV1||I|BG1^13^01|N|||128670|128670^CAVENAILE^JEAN-CHRISTOP|100001^MEDECIN^FF|999||||3^1^1|||||250873682|| 9| 9||000||||||||||||||||||BG1^13^01||201701241101||
7 PV2||59|||||||
8 IN1|0001|1|||||||||||||FAC


Champs Principaux
	1. Numéro de Patient
	2. Localisation (UnitéDeSoins^Chambre^Lit)
	3. Numéro de séjour
--------------------------------------------------------------------------------------------------------------------------------

Création Transfert
ADT_A02	 MSH,EVN,PID,PD1,PV1 	 Transfert patient 

1 MSH|^~\&|ITF_CHUB||ALL||20170124111224||ADT^A02|05581969|P|2.5|||AL|AL
2 EVN|A02|20170124111224|||BILLAU|20170124110700
3 PID|||200930986||ZZWISH^DETAILSADT||19970124|M|||PLACE A. VAN GEHUCHTEN 4^^LAEKEN^^1020^B||02/1234567^^PH~0475/332211^^CP~^^Internet^test@chu-brugmann.be||F|C||||000000000000||||||||B||N|||20170124103400||
4 PD1||||100001^MEDECIN^FF^PL ARTHUR VANGEHUCHTEN 4^^LAEKEN^^1020^B||||||||N||||N
5 PV1||I|BG1^21^02|N|||128670|128670^CAVENAILE^JEAN-CHRISTOP|100001^MEDECIN^FF|999||||3^1^1|||||250873682|| 9| 9||000||||||||||||||||||BG1^21^02||201701241101||

Champs Principaux
	1. Date évènement (Dans ce cas-ci: date du transfert)
	2. Numéro de Patient
	3. Localisation (UnitéDeSoins^Chambre^Lit)
	4. Numéro de séjour
--------------------------------------------------------------------------------------------------------------------------------

Suppression Transfert

ADT_A12	 MSH,EVN,PID,PD1,PV1 	 Suppression transfert 

1 MSH|^~\&|ITF_CHUB||ALL||20170124111656||ADT^A12|05582033|P|2.5|||AL|AL
2 EVN|A12|20170124111656|||BILLAU|20170124110700
3 PID|||200930986||ZZWISH^DETAILSADT||19970124|M|||PLACE A. VAN GEHUCHTEN 4^^LAEKEN^^1020^B||02/1234567^^PH~0475/332211^^CP~^^Internet^test@chu-brugmann.be||F|C||||000000000000||||||||B||N|||20170124103400||
4 PD1||||100001^MEDECIN^FF^PL ARTHUR VANGEHUCHTEN 4^^LAEKEN^^1020^B||||||||N||||N
5 PV1||I|BG1^21^02|N|||128670|128670^CAVENAILE^JEAN-CHRISTOP|100001^MEDECIN^FF|999||||3^1^1|||||250873682|| 9| 9||000||||||||||||||||||BG1^21^02||201701241101||

Champs Principaux
	1. Date évènement (Dans ce cas-ci: date du transfert)
	2. Numéro de Patient
	3. Localisation (UnitéDeSoins^Chambre^Lit)
	4. Numéro de séjour
--------------------------------------------------------------------------------------------------------------------------------

Départ en congé
ADT_A21	 MSH,EVN,PID,PD1,PV1,PV2 	 Départ en congé 

1 MSH|^~\&|ITF_CHUB||ALL||20170124111947||ADT^A21|05582060|P|2.5|||AL|AL
2 EVN|A21|20170124111947|||BILLAU|20170124111500
3 PID|||200930986||ZZWISH^DETAILSADT||19970124|M|||PLACE A. VAN GEHUCHTEN 4^^LAEKEN^^1020^B||02/1234567^^PH~0475/332211^^CP~^^Internet^test@chu-brugmann.be||F|C||||000000000000||||||||B||N|||20170124103400||
4 PD1||||100001^MEDECIN^FF^PL ARTHUR VANGEHUCHTEN 4^^LAEKEN^^1020^B||||||||N||||N
5 PV1||I|BG1^13^01|N|||128670|128670^CAVENAILE^JEAN-CHRISTOP|100001^MEDECIN^FF|999||||3^1^1|||||250873682|| 9| 9||000||||||||||||||||||BG1^13^01||201701241101||

Champs Principaux
	1. Date évènement (Dans ce cas-ci: date du transfert)
	2. Numéro de Patient
	3. Numéro de séjour

--------------------------------------------------------------------------------------------------------------------------------

Retour Congé
ADT_A22	 MSH,EVN,PID,PD1,PV1,PV2 	 Retour de congé 

1 MSH|^~\&|ITF_CHUB||ALL||20170124114409||ADT^A22|05582316|P|2.5|||AL|AL
2 EVN|A22|20170124114409|||BILLAU|20170124113000
3 PID|||200930986||ZZWISH^DETAILSADT||19970124|M|||PLACE A. VAN GEHUCHTEN 4^^LAEKEN^^1020^B||02/1234567^^PH~0475/332211^^CP~^^Internet^test@chu-brugmann.be||F|C||||000000000000||||||||B||N|||20170124103400||
4 PD1||||100001^MEDECIN^FF^PL ARTHUR VANGEHUCHTEN 4^^LAEKEN^^1020^B||||||||N||||N
5 PV1||I|BG1^13^01|N|||128670|128670^CAVENAILE^JEAN-CHRISTOP|100001^MEDECIN^FF|999||||3^1^1|||||250873682|| 9| 9||000||||||||||||||||||BG1^13^01||201701241101||

Champs Principaux
	1. Date évènement (Dans ce cas-ci: date du transfert)
	2. Numéro de Patient
	3. Numéro de séjour

--------------------------------------------------------------------------------------------------------------------------------

Annulation Retour Congé
ADT_A53	 MSH,EVN,PID,PD1,PV1,PV2 	 Annulation retour de congé 

1 MSH|^~\&|ITF_CHUB||ALL||20170124114828||ADT^A53|05582370|P|2.5|||AL|AL
2 EVN|A53|20170124114828|||BILLAU|20170124113000
3 PID|||200930986||ZZWISH^DETAILSADT||19970124|M|||PLACE A. VAN GEHUCHTEN 4^^LAEKEN^^1020^B||02/1234567^^PH~0475/332211^^CP~^^Internet^test@chu-brugmann.be||F|C||||000000000000||||||||B||N|||20170124103400||
4 PD1||||100001^MEDECIN^FF^PL ARTHUR VANGEHUCHTEN 4^^LAEKEN^^1020^B||||||||N||||N
5 PV1||I|BG1^13^01|N|||128670|128670^CAVENAILE^JEAN-CHRISTOP|100001^MEDECIN^FF|999||||3^1^1|||||250873682|| 9| 9||000||||||||||||||||||BG1^13^01||201701241101||
6 PV2||59|||||||||||||||||||||||||||||||||||||||||||||20170124113000
--------------------------------------------------------------------------------------------------------------------------------

Annulation Départ Congé
ADT_A52	 MSH,EVN,PID,PD1,PV1,PV2 	 Suppression départ en congé 

1 MSH|^~\&|ITF_CHUB||ALL||20170124115008||ADT^A52|05582389|P|2.5|||AL|AL
2 EVN|A52|20170124115008|||BILLAU|20170124111500
3 PID|||200930986||ZZWISH^DETAILSADT||19970124|M|||PLACE A. VAN GEHUCHTEN 4^^LAEKEN^^1020^B||02/1234567^^PH~0475/332211^^CP~^^Internet^test@chu-brugmann.be||F|C||||000000000000||||||||B||N|||20170124103400||
4 PD1||||100001^MEDECIN^FF^PL ARTHUR VANGEHUCHTEN 4^^LAEKEN^^1020^B||||||||N||||N
5 PV1||I|BG1^13^01|N|||128670|128670^CAVENAILE^JEAN-CHRISTOP|100001^MEDECIN^FF|999||||3^1^1|||||250873682|| 9| 9||000||||||||||||||||||BG1^13^01||201701241101||
--------------------------------------------------------------------------------------------------------------------------------

Sortie Patient (Clôture Séjour Hospit)
ADT_A03	 MSH,EVN,PID,PD1,PV1 	 Sortie réelle patient 

1 MSH|^~\&|ITF_CHUB||ALL||20170124115145||ADT^A03|05582413|P|2.5|||AL|AL
2 EVN|A03|20170124115145|||BILLAU|20170124170000
3 PID|||200930986||ZZWISH^DETAILSADT||19970124|M|||PLACE A. VAN GEHUCHTEN 4^^LAEKEN^^1020^B||02/1234567^^PH~0475/332211^^CP~^^Internet^test@chu-brugmann.be||F|C||||000000000000||||||||B||N|||20170124103400||
4 PD1||||100001^MEDECIN^FF^PL ARTHUR VANGEHUCHTEN 4^^LAEKEN^^1020^B||||||||N||||N
5 PV1||I|BG1^13^01|Z|||128670||100001^MEDECIN^FF|999||||3^1^1|||||250873682|| 9| 9||000||||||||||||1|1|||||BG1^13^01||201701241101|201701241700|
--------------------------------------------------------------------------------------------------------------------------------

Annulation Sortie Patient
ADT_A13	 MSH,EVN,PID,PD1,NK1(x),PV1 	 Annulation sortie réelle patient 

1 MSH|^~\&|ITF_CHUB||ALL||20170124120841||ADT^A13|05582578|P|2.5|||AL|AL
2 EVN|A13|20170124120841|||BILLAU|20170124170000
3 PID|||200930986||ZZWISH^DETAILSADT||19970124|M|||PLACE A. VAN GEHUCHTEN 4^^LAEKEN^^1020^B||02/1234567^^PH~0475/332211^^CP~^^Internet^test@chu-brugmann.be||F|C||||000000000000||||||||B||N|||20170124103400||
4 PD1||||100001^MEDECIN^FF^PL ARTHUR VANGEHUCHTEN 4^^LAEKEN^^1020^B||||||||N||||N
5 NK1|1|PAS DE^PARTENAIRE|SP
6 PV1||I|BG1^13^01|Z|||128670|128670^CAVENAILE^JEAN-CHRISTOP|100001^MEDECIN^FF|999||||3^1^1|||||250873682|| 9| 9||000||||||||||||||||||BG1^13^01||201701241101||
--------------------------------------------------------------------------------------------------------------------------------

Suppression Séjour
ADT_A11	 MSH,EVN,PID,PD1,PV1 	 Suppression admission 

1 MSH|^~\&|ITF_CHUB||ALL||20170124121108||ADT^A11|05582589|P|2.5|||AL|AL
2 EVN|A11|20170124121108|||BILLAU|20170124110100
3 PID|||200930986||ZZWISH^DETAILSADT||19970124|M|||PLACE A. VAN GEHUCHTEN 4^^LAEKEN^^1020^B||02/1234567^^PH~0475/332211^^CP~^^Internet^test@chu-brugmann.be||F|C||||000000000000||||||||B||N|||20170124103400||
4 PD1||||100001^MEDECIN^FF^PL ARTHUR VANGEHUCHTEN 4^^LAEKEN^^1020^B||||||||N||||N
5 PV1||I|BG1^13^01|Z|||128670|128670^CAVENAILE^JEAN-CHRISTOP|100001^MEDECIN^FF|999||||3^1^1|||||250873682|| 9| 9||000||||||||||||1|1|||||BG1^13^01||201701241101|201701241105|
--------------------------------------------------------------------------------------------------------------------------------

Préadmissions
Création/Modification
ADT_A05	 MSH,EVN,PID,PD1,NK1(x),PV1 	 Création pré-admission 

1 MSH|^~\&|ITF_CHUB||ALL||20170124121404||ADT^A05|05582605|P|2.5|||AL|AL
2 EVN|A05|20170124121404|||BILLAU|20170125080000
3 PID|||200930986||ZZWISH^DETAILSADT||19970124|M|||PLACE A. VAN GEHUCHTEN 4^^LAEKEN^^1020^B||02/1234567^^PH~0475/332211^^CP~^^Internet^test@chu-brugmann.be||F|C||||000000000000||||||||B||N|||20170124103400||
4 PD1||||100001^MEDECIN^FF^PL ARTHUR VANGEHUCHTEN 4^^LAEKEN^^1020^B||||||||N||||N
5 NK1|1|PAS DE^PARTENAIRE|SP
6 PV1||I|BG1^00^00|Z|||128670|128670^CAVENAILE^JEAN-CHRISTOP|100001^MEDECIN^FF|999||||3^1^1|||||250873814|| 9| 9||000||||||||||||||||||BG1^00^00||201701250800||
7 PV2||59||||||201701250800|201701251700
8 IN1|0001|1|||||||||||||FAC
--------------------------------------------------------------------------------------------------------------------------------

Date/Heure de sortie prévue de la préadmission

Suppression Préadmission
ADT_A38	 MSH,EVN,PID,PD1,PV1 	 Suppression pré-admission 

1 MSH|^~\&|ITF_CHUB||ALL||20170124121702||ADT^A38|05582618|P|2.5|||AL|AL
2 EVN|A38|20170124121702|||BILLAU|20170125080000
3 PID|||200930986||ZZWISH^DETAILSADT||19970124|M|||PLACE A. VAN GEHUCHTEN 4^^LAEKEN^^1020^B||02/1234567^^PH~0475/332211^^CP~^^Internet^test@chu-brugmann.be||F|C||||000000000000||||||||B||N|||20170124103400||
4 PD1||||100001^MEDECIN^FF^PL ARTHUR VANGEHUCHTEN 4^^LAEKEN^^1020^B||||||||N||||N
5 PV1||I|BG1^00^00|Z|||128670|128670^CAVENAILE^JEAN-CHRISTOP|100001^MEDECIN^FF|999||||3^1^1|||||250873814|| 9| 9||000||||||||||||||||||BG1^00^00||201701250800||

--------------------------------------------------------------------------------------------------------------------------------

Transformation Séjour Externe en séjour Interne
ADT_A06	 MSH,EVN,PID,PD1,NK1(x),PV1 	 Changer un séjour ambulant en séjour hospitalisé 

1 MSH|^~\&|ITF_CHUB||ALL||20170124122015||ADT^A06|05582637|P|2.5|||AL|AL
2 EVN|A06|20170124122015|||BILLAU|20170124121900
3 PID|||200930986||ZZWISH^DETAILSADT||19970124|M|||PLACE A. VAN GEHUCHTEN 4^^LAEKEN^^1020^B||02/1234567^^PH~0475/332211^^CP~^^Internet^test@chu-brugmann.be||F|C||||000000000000||||||||B||N|||20170124103400||
4 PD1||||100001^MEDECIN^FF^PL ARTHUR VANGEHUCHTEN 4^^LAEKEN^^1020^B||||||||N||||N
5 NK1|1|PAS DE^PARTENAIRE|SP
6 PV1||I|BG1^00^00|Z|||128670|128670^CAVENAILE^JEAN-CHRISTOP|100001^MEDECIN^FF|810||||^^|||||250873819|| 9| 0||000||||||||||||||||||BG1^00^00||201701241219||
================================================================================================================================
*/
Storage Default
{
<Data name="WishAdtHl7RoutingDefaultData">
<Subscript>"WishAdtHl7Routing"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>WishAdtHl7RoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
