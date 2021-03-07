Class CHUBXL.ProductionPROD20180802newClass Extends Ens.Production [ ClassType = "", ProcedureBlock ]
{

/*
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
Production ENSPROD

VERSION
-------
DAM	13/04/2018	Initial Version
CWY	01/08/2018	Add comment
CWY	02/08/2018	Put NEW Class

APPLICATIONS
------------
SYSTEM
WISH
BDOC
AGFA
GLIMS
INFOHOS
MV
MEDECIN
OXYGEN
ECARE
DIAMIC
OPERA
MOSOS
ASTRAIA
ICIP
OPTHALMO
ENDOBASE
PLUS 
RSBEVENT
ALPHA
=======================================================================================================================================================================================================================================================================================================================
Disabled Cfg
------------
BS
	AgfaBruDocHl7TcpInNew
	AgfaBruDocXmlTcpInNew
	AgfaBruImgHl7TcpInNew
	GlimsAllLabHl7FcpIn
	GlimsAllMFUHl7FcpIn
	GlimsAllMFUHl7TcpIn
BP
	GlimsAllMFURouting
BO
	GlimsGlimsBruMFUHl7FcpOut
	GlimsGlimsHudMFUHl7TcpOut
	GlimsMvAllLabXmlFcpOut
=======================================================================================================================================================================================================================================================================================================================
OLD CLASS										NEW CLASS
---------										---------
CHUBXL.BO.BatchFtpWishOut						CHUBXL.BO.NEW.AllFtpOut
CHUBXL.BO.Hl7MessageFileOut						CHUBXL.BO.NEW.Hl7FcpOut
CHUBXL.BO.HL7TcpOut								CHUBXL.BO.NEW.Hl7TcpOut
CHUBXL.BO.MBFileOut								CHUBXL.BO.NEW.AllFcpOut
CHUBXL.BO.ParsedTcpOut							CHUBXL.BO.NEW.ParsedTcpOut
CHUBXL.BO.RawTcpOut								CHUBXL.BO.NEW.RawTcpOut
CHUBXL.BO.SendDocToDPI							CHUBXL.BO.NEW.Hl7okFcpOut
CHUBXL.BO.SendDocToMv							CHUBXL.BO.NEW.XmlFcpOut
CHUBXL.BP.AlphaQDoc								CHUBXL.BP.NEW.AlphaQDoc
CHUBXL.BP.AstraiaRouting						CHUBXL.BP.NEW.AstraiaHl7Routing
CHUBXL.BP.BDocMBRouting							CHUBXL.BP.NEW.BdocHcRouting
CHUBXL.BP.BDocRouting							CHUBXL.BP.NEW.BdocHl7Routing
CHUBXL.BP.DiamicRouting							CHUBXL.BP.NEW.DiamicHl7Routing
CHUBXL.BP.EcareRouting							CHUBXL.BP.NEW.EcareHl7Routing
CHUBXL.BP.GlimsHL7MFURouting					CHUBXL.BP.NEW.GlimsHl7MFURouting
CHUBXL.BP.GlimsHL7Routing						CHUBXL.BP.NEW.GlimsHl7Routing
CHUBXL.BP.GlimsMBRouting						CHUBXL.BP.NEW.GlimsHcRouting
CHUBXL.BP.ICIPRouting							CHUBXL.BP.NEW.IcipHl7Routing
CHUBXL.BP.InfohosBDocMedicRouting				CHUBXL.BP.NEW.InfohosMdHl7Routing
CHUBXL.BP.InfohosRouting						CHUBXL.BP.NEW.InfohosArtXmlRouting
CHUBXL.BP.InfohosTSRouting						CHUBXL.BP.NEW.InfohosTsRouting
CHUBXL.BP.InfohosWishRouting					CHUBXL.BP.NEW.InfohosSpeHl7Routing
CHUBXL.BP.KineRouting							CHUBXL.BP.NEW.OxygenHl7Routing
CHUBXL.BP.RefmedRouting							CHUBXL.BP.NEW.RefmedHl7Routing
CHUBXL.BP.MedecinRouting						CHUBXL.BP.NEW.WishMedHl7Routing
CHUBXL.BP.MOSOSRouting							CHUBXL.BP.NEW.MososHl7Routing
CHUBXL.BP.MVHL7Routing							CHUBXL.BP.NEW.MvHl7Routing
CHUBXL.BP.OperaHL7Routing						CHUBXL.BP.NEW.OperaHl7Routing
CHUBXL.BP.OphtalmoRouting						CHUBXL.BP.NEW.OphtalmoHl7Routing
CHUBXL.BP.PLUSRouting							CHUBXL.BP.NEW.PlusXmlRouting
CHUBXL.BP.QuadratORMHL7Routing					CHUBXL.BP.NEW.AgfaImgHl7Routing
CHUBXL.BP.QuadratORURouting						CHUBXL.BP.NEW.AgfaDocHl7Routing
CHUBXL.BP.QuadratRouting						CHUBXL.BP.NEW.AgfaDocXmlRouting
CHUBXL.BP.QuadratRVHL7Routing					CHUBXL.BP.NEW.AgfaRdvHl7Routing
CHUBXL.BP.RsbEventRouting						CHUBXL.BP.NEW.RsbEventXmlRouting
CHUBXL.BP.WishAllAdtRouting						CHUBXL.BP.NEW.WishAdtHl7Routing
CHUBXL.BS.AlphaFcpIn							CHUBXL.BS.NEW.AlphaDlmFcpIn
CHUBXL.BS.AstraiaFile							CHUBXL.BS.NEW.AstraiaHl7FcpIn
CHUBXL.BS.BDocFile								CHUBXL.BS.NEW.BdocHl7FcpIn
CHUBXL.BS.BDocMBFile							CHUBXL.BS.NEW.BdocHcFcpIn
CHUBXL.BS.DiamicFile							CHUBXL.BS.NEW.DiamicHl7FcpIn
CHUBXL.BS.EcareFile								CHUBXL.BS.NEW.EcareHl7FcpIn
CHUBXL.BS.EndoBaseFile							CHUBXL.BS.NEW.EndobaseHl7FcpIn
CHUBXL.BS.GlimsMBFile							CHUBXL.BS.NEW.GlimsHcFcpIn
CHUBXL.BS.GlimsFile								CHUBXL.BS.NEW.GlimsPdfFcpIn
CHUBXL.BS.GlimsHL7MFUFile						CHUBXL.BS.NEW.GlimsHl7FcpIn
CHUBXL.BS.GlimsHL7File							CHUBXL.BS.NEW.GlimsHl7FcpIn
CHUBXL.BS.GlimsMFUTcpIn							CHUBXL.BS.NEW.GlimsHl7TcpIn
CHUBXL.BS.GlimsTcpIn							CHUBXL.BS.NEW.GlimsHl7TcpIn
CHUBXL.BS.HL7TcpIn								CHUBXL.BS.NEW.Hl7MllpTcpIn
CHUBXL.BS.ICIPFile								CHUBXL.BS.NEW.IcipHl7FcpIn
CHUBXL.BS.InfohosBDocMedicFile					CHUBXL.BS.NEW.InfohosHl7FcpIn
CHUBXL.BS.InfohosFile							CHUBXL.BS.NEW.InfohosHl7FcpIn
CHUBXL.BS.InfohosFileIn							CHUBXL.BS.NEW.InfohosHl7FcpIn
CHUBXL.BS.InfohosMultiFile						CHUBXL.BS.NEW.InfohosTsFcpIn
CHUBXL.BS.KineFile								CHUBXL.BS.NEW.OxygenHl7FcpIn
CHUBXL.BS.MedecinMultiFile						CHUBXL.BS.NEW.RefmedHl7FcpIn
CHUBXL.BS.MOSOSFile								CHUBXL.BS.NEW.MososHl7FcpIn
CHUBXL.BS.OphtalmoFile							CHUBXL.BS.NEW.OphtalmoHl7FcpIn
CHUBXL.BS.PLUSFile								CHUBXL.BS.NEW.PlusXmlFcpIn
CHUBXL.BS.QuadratORMHUDTcpIn					CHUBXL.BS.NEW.AgfaHl7TcpIn
CHUBXL.BS.QuadratORUTcpIn						CHUBXL.BS.NEW.AgfaHl7TcpIn
CHUBXL.BS.QuadratRVTcpIn						CHUBXL.BS.NEW.AgfaHl7TcpIn
CHUBXL.BS.QuadratTcpIn							CHUBXL.BS.NEW.AgfaXmlTcpIn
CHUBXL.BS.RsbEventFile							CHUBXL.BS.NEW.RsbEventXmlFcpIn
CHUBXL.BS.WishHL7File							CHUBXL.BS.NEW.WishHl7FcpIn
=======================================================================================================================================================================================================================================================================================================================
Name								Category										ClassName											Comment
____								________										_________											_______

SYSTEM
------
CHUBXLGeneralMetric 				S-Metric,S-Alert								CHUBXL.MET.GeneralMetric							
AlertEmail 							S-Alert                              			EnsLib.EMail.AlertOperation							Gestion des alertes par E-mail
Ens.Alert 							S-Alert                              			EnsLib.MsgRouter.RoutingEngine						
ActivityChecker 					S-Alert                              			Ciges.BS.ActivityChecker							Service de vérification de l&apos;état des connecteurs afin de voir s&apos;ils sont actifs
ActivityCheckerAlertRegulator 		S-Alert                              			Ciges.BP.AlertRegulator								Régulation des alertes envoyées par l&apos;ActivityChecker pour ne pas envoyer trop de mails
ActivityCheckerAlert 				S-Alert                              			Ciges.BO.AlertSender								
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
WISH
----
WishAllAdtRouting 					A-Wish,T-ADT									CHUBXL.BP.NEW.WishAllAdtRouting						Routing des messsages de données administratives des patients (Wish)
WishBruAdtHl7TcpIn 					A-Wish,T-ADT,MIT								CHUBXL.BS.NEW.HL7TcpIn								Reception des messages de données administratives des patients Brugmann.
WishHudAdtHl7TcpIn 					A-Wish,T-ADT,MIT								CHUBXL.BS.NEW.HL7TcpIn								Reception des messages de données administratives des patients de l&apos;HUDERF.
WishAllAdtHl7FcpIn 					A-Wish											CHUBXL.BS.NEW.WishHL7File							Ré envoie des messages HL7 de Wish
WishBruMedHl7TcpIn 					A-Wish,A-Medecin,MIT							CHUBXL.BS.NEW.HL7TcpIn								Réception des messages de données médecins Wish Brugmann.
WishHudMedHl7TcpIn 					A-Wish,A-Medecin,MIT							CHUBXL.BS.NEW.HL7TcpIn								Réception des messages de données médecins Wish H.U.D.E.R.F.
WishAgfaHudAdtHl7TcpOut 			A-Wish,A-Agfa,T-ADT								CHUBXL.BO.NEW.HL7TcpOut								Envoie des données administratives patients de Wish vers Agfa-Quadrat HUDERF
WishDialyseAllAdtXmlTcpOut 			A-Wish,A-Dialyse,T-ADT							CHUBXL.BO.NEW.ParsedTcpOut							Transmission des données Administratives vers le logiciel de dialyses (hemadial)
WishIcipHudAdtHl7TcpOut 			A-Wish,A-Icip,T-ADT								CHUBXL.BO.NEW.HL7TcpOut								Transmission des données Administratives le logiciel des USI (ICIP) de l&apos;HUDERF
WishInnovianHudAdtHl7TcpOut 		A-Wish,A-Innovian,T-ADT							CHUBXL.BO.NEW.HL7TcpOut								Transmission des données Administratives vers le logiciel de gestion du département d&apos;anésthésie (Innovian) de l&apos;HUDERF
WishCacheAllAdtHl7FcpOut 			A-Wish,A-Cache,T-ADT							CHUBXL.BO.NEW.Hl7MessageFileOut						Envoi des données administratives des patients de Wish vers Datameal
WishCigesAllAdtDlmTcpOut 			A-Wish,A-Ciges,T-ADT							CHUBXL.BO.NEW.ParsedTcpOut							Transmission des données Administratives vers l&apos;Alpha
WishMvAllAdtHl7TcpOut 				A-Wish,A-Mv,T-ADT								CHUBXL.BO.NEW.HL7TcpOut								Envoi des données administratives des patients de Wish vers Medical Viewer
WishOxygenBruAdtHl7TcpOut 			A-Wish,A-Oxygen,A-Refmed,A-Medecin,T-ADT,T-GDR	CHUBXL.BO.NEW.HL7TcpOut								Envoi des données administratives des patients de Wish vers la Kine
WishAgfaBruAdtHl7TcpOut 			A-Wish,A-Agfa,T-ADT								CHUBXL.BO.NEW.HL7TcpOut								Envoie des données administratives patients de Wish vers Agfa-Quadrat Brugmann
WishAgfaeiBruAdtHl7TcpOut 			Wish,Quadrat									CHUBXL.BO.NEW.HL7TcpOut								Envoie des données administratives patients de Wish vers Agfa-Quadrat Brugmann
WishGlimsBruAdtHl7TcpOut 			A-Wish,A-Glims,T-ADT							CHUBXL.BO.NEW.HL7TcpOut								Envoie des données administratives de Wish Brugmann vers Glims
WishGlimsHudAdtHl7TcpOut 			A-Wish,A-Glims,T-ADT							CHUBXL.BO.NEW.HL7TcpOut								Envoie des données administratives de Wish Brugmann vers Glims
WishDiamicAllAdtHl7TcpOut 			A-Wish,A-Diamic,T-ADT							CHUBXL.BO.NEW.HL7TcpOut								Envoie des données adminstratives des aptiens de Wish vers Diamic
WishInfohosAllAdtHl7TcpOut 			A-Wish,A-Infohos,T-ADT,A-Medecin				CHUBXL.BO.NEW.HL7TcpOut								Envoi des données administratives des patients de Wish vers Infohos
WishAstraiaBruAdtHl7TcpOut 			A-Wish,A-Astraia,T-ADT							CHUBXL.BO.NEW.HL7TcpOut								
WishEcareBruAdtHl7TcpOut 			A-Wish,A-Ecare,T-ADT							CHUBXL.BO.NEW.HL7TcpOut								
WishMososBruAdtHl7TcpOut 			A-Wish,A-Mosos,T-ADT							CHUBXL.BO.NEW.HL7TcpOut								Transmission des données administratives WIsh vers le logiciel de gynécologie (Mosos)
WishDatamealBruAdtHl7TcpOut 		A-Wish,A-Datameal,T-ADT							CHUBXL.BO.NEW.HL7TcpOut								Envoi des données administratives des patients de Wish vers Datameal
WishInfopartnerAllAdtHl7TcpOut 		A-Wish,A-Infopartner,T-ADT						CHUBXL.BO.NEW.HL7TcpOut								Envoi des données administratives des patients de Wish vers Datameal
WishEnstestBruAdtHl7TcpOut 			A-Wish											CHUBXL.BO.NEW.HL7TcpOut								Transmission des données Administratives vers l&apos;environnement de Pre-Production
WishBdocHudAdtHl7TcpOut 			A-Wish,A-Bdoc,A-Refmed,A-Medecin,T-ADT			CHUBXL.BO.NEW.HL7TcpOut								Envoi des données administratives des patients de Wish vers le DPI (Bdoc)
WishOphtalmoHudAdtHl7TcpOut 		A-Wish,A-Ophtalmo,T-ADT							CHUBXL.BO.NEW.HL7TcpOut								Envoi des données administratives des patients de Wish vers l&apos;ophtalmo
WishBdocBruAdtHl7TcpOut 			A-Wish,A-Bdoc,A-Refmed,A-Medecin,T-ADT,T-GDR	CHUBXL.BO.NEW.HL7TcpOut								Envoi des données administratives des patients de Wish vers le DPI (Bdoc)
WishGlimsCyberlabAllAdtHl7TcpOut 	A-Wish,A-Glims,T-ADT							CHUBXL.BO.NEW.HL7TcpOut								Envoie des données administratives de Wish Brugmann vers Glims CyberLab
WishBrainRtHudAdtHl7TcpOut			A-Wish,A-BrainRt,T-ADT							CHUBXL.BO.NEW.HL7TcpOut								Adt Wish vers Brainrt (labo sommeil Huderf)
WishOperaBruAdtHl7TcpOut 			A-Wish,A-Opera,T-ADT							CHUBXL.BO.NEW.HL7TcpOut								Envoi des données adminsitratives patient de Wish vers Opera
WishAgfaNewBruAdtHl7TcpOut 			A-Wish,A-Agfa,T-ADT								CHUBXL.BO.NEW.HL7TcpOut								Envoie des données administratives patients de Wish vers Agfa-Quadrat Brugmann
WishBdocPrepHudAdtHl7TcpOut 		A-Wish,A-Bdoc,T-ADT								CHUBXL.BO.NEW.HL7TcpOut								Envoi des données administratives des patients de Wish vers le DPI (Bdoc)
WishCacheAllMedHl7FcpOut 			A-Wish,A-Ciges,A-Medecin,A-Cache				CHUBXL.BO.NEW.Hl7MessageFileOut						Envoi des données administratives des patients de Wish vers Datameal
WishEcareBruMedHl7FcpOut 			A-Medecin,A-Ecare								CHUBXL.BO.NEW.Hl7MessageFileOut						Transmission des données médecin vers Ecare
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
BDOC
----
BdocAllDocRouting 					A-Bdoc,A-Mv,T-DOC								CHUBXL.BP.NEW.BDocRouting							Routage des rapports de Bdoc
BdocAllHcRouting 					A-Bdoc,A-HealthConnect							CHUBXL.BP.NEW.BDocMBRouting							Routage des résultats Bdoc vers MediBridge LogTraceEvents=true Schedule=>
BdocHudDocHl7FcpIn 					A-Bdoc,A-Mv,T-DOC								CHUBXL.BS.NEW.BDocFile								Reception des rapports de Bdoc HUDERF
BdocBruDocHl7FcpIn 					A-Bdoc,A-Mv,T-DOC								CHUBXL.BS.NEW.BDocFile								Reception des rapports de Bdoc BRU
BdocMvAllDocHl7FcpOut 				A-Bdoc,A-Mv,T-DOC								CHUBXL.BO.NEW.Hl7MessageFileOut						Transmission des rapports de Bdoc) vers Medical Viewer
BdocBruHcHealthoneFcpIn 			A-Bdoc,A-HealthConnect,T-HC						CHUBXL.BS.NEW.BDocMBFile							Fichiers Bdoc pour Medibridge
BdocBruHcMedidocFcpIn 				A-Bdoc,A-HealthConnect							CHUBXL.BS.NEW.BDocMBFile							Fichiers Bdoc  pour Medibridge
BdocBruHcMedimailFcpIn 				A-Bdoc,A-HealthConnect,T-HC						CHUBXL.BS.NEW.BDocMBFile							Fichiers Bdoc  pour Medibridge
BdocBruHcSocrateFcpIn 				A-Bdoc,A-HealthConnect							CHUBXL.BS.NEW.BDocMBFile							Fichiers Bdoc  pour Medibridge
BdocBruHcTexteFcpIn 				A-Bdoc,A-HealthConnect,T-HC						CHUBXL.BS.NEW.BDocMBFile							Fichiers Bdoc  pour Medibridge
BdocAllHcHealthoneFcpOut 			A-Bdoc,A-HealthConnect,T-HC						CHUBXL.BO.NEW.MBFileOut								Transmission des résultats de Bdoc vers MediBridge format hone LogTraceEvents=true Schedule=>
BdocAllHcMedidocFcpOut 				A-Bdoc,A-HealthConnect							CHUBXL.BO.NEW.MBFileOut								Transmission des résultats de Bdoc vers MediBridge format BJP LogTraceEvents=true Schedule=>
BdocAllHcMedimailFcpOut 			A-Bdoc,A-HealthConnect,T-HC						CHUBXL.BO.NEW.MBFileOut								Transmission des résultats de Bdoc vers MediBridge format Medar LogTraceEvents=true Schedule=>
BdocAllHcSocrateFcpOut 				A-Bdoc,A-HealthConnect							CHUBXL.BO.NEW.MBFileOut								Transmission des résultats de Bdoc vers MediBridge format Medidoc LogTraceEvents=true Schedule=>
BdocAllHcTexteFcpOut 				A-Bdoc,A-HealthConnect,T-HC						CHUBXL.BO.NEW.MBFileOut								Transmission des résultats de Bdoc vers MediBridge format Medigest
BdocHudHcHealthoneFcpIn 			A-Bdoc,A-HealthConnect,T-HC						CHUBXL.BS.NEW.BDocMBFile							Fichiers Bdoc pour Medibridge
BdocHudHcMedidocFcpIn 				A-Bdoc,A-HealthConnect,T-HC						CHUBXL.BS.NEW.BDocMBFile							Fichiers Bdoc  pour Medibridge
BdocHudHcMedimailFcpIn 				A-Bdoc,A-HealthConnect							CHUBXL.BS.NEW.BDocMBFile							Fichiers Bdoc  pour Medibridge
BdocHudHcSocrateFcpIn 				A-Bdoc,A-HealthConnect,T-HC						CHUBXL.BS.NEW.BDocMBFile							Fichiers Bdoc  pour Medibridge
BdocHudHcTexteFcpIn 				A-Bdoc,A-HealthConnect,T-HC						CHUBXL.BS.NEW.BDocMBFile							Fichiers Bdoc  pour Medibridge
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AGFA
----
AgfaAllDocRouting 					A-Agfa,T-DOC									CHUBXL.BP.NEW.QuadratORURouting						Routing résultats Quadrat-Agfa HL7 ORU vers DPI
AgfaAllImgRouting 					A-Agfa,T-IMG									CHUBXL.BP.NEW.QuadratORMHL7Routing					Envoi des informations pour l&apos;imagerie d&apos;Agfa vers Bdoc
AgfaAllRdvRouting 					A-Agfa,T-RDV									CHUBXL.BP.NEW.QuadratRVHL7Routing					Rendez-vous QPlanner vers DPIO
AgfaMvAllDocRouting 				A-Agfa,A-Mv,T-DOC								CHUBXL.BP.NEW.QuadratRouting						Routage des rapports de la radiologie et de QDReport
AgfaBruDocHl7TcpIn 					A-Agfa,T-DOC,MIT								CHUBXL.BS.NEW.QuadratORUTcpIn						Résultats Quadrat-Agfa vers DPI
AgfaBruDocXmlTcpInNew 				A-Agfa,A-Mv,T-DOC,MIT,NewRis					CHUBXL.BS.NEW.QuadratTcpIn 							Reception des rapports de radiologie et de QDReport pour Brugmann
AgfaBruDocHl7TcpInNew 				A-Agfa,T-DOC,MIT,NewRis							CHUBXL.BS.NEW.QuadratORUTcpIn 						Résultats Quadrat-Agfa vers DPI
AgfaBruRdvHl7TcpInNew 				A-Agfa,T-RDV,MIT,NewRis							CHUBXL.BS.NEW.QuadratRVTcpIn						Rendez-vous QPlanner vers DPI LogTraceEvents=true Schedule=>
AgfaHudDocHl7TcpIn 					A-Agfa,T-DOC,MIT								CHUBXL.BS.NEW.QuadratORUTcpIn						Résultats Quadrat-Agfa vers DPI
AgfaBruDocXmlTcpIn 					A-Agfa,A-Mv,T-DOC,MIT							CHUBXL.BS.NEW.QuadratTcpIn							Reception des rapports de radiologie et de QDReport pour Brugmann
AgfaHudDocXmlTcpIn 					A-Agfa,A-Mv,T-DOC,MIT							CHUBXL.BS.NEW.QuadratTcpIn							Reception des rapports de radiologie et de QDReport pour l&apos;HUDERF
AgfaBdocBruDocHl7FcpOut 			A-Agfa,A-Bdoc,T-DOC								CHUBXL.BO.NEW.SendDocToDPI							Résultats HUDERF Quadrat vers DPI
AgfaBdocprepBruDocHl7FcpOut 		A-Agfa,A-Bdoc,T-DOC								CHUBXL.BO.NEW.SendDocToDPI							Résultats HUDERF Quadrat vers DPI
AgfaBdocHudDocHl7FcpOut 			A-Agfa,A-Bdoc,T-DOC								CHUBXL.BO.NEW.SendDocToDPI							Résultats HUDERF Quadrat vers DPI
AgfaBdocprepHudDocHl7FcpOut 		A-Agfa,A-Bdoc,T-DOC								CHUBXL.BO.NEW.SendDocToDPI							Résultats HUDERF Quadrat vers DPI
AgfaMvAllDocXmlFcpOut 				A-Agfa,A-Mv,T-DOC								CHUBXL.BO.NEW.SendDocToMv							Transmission des résultats Quadrat vers Medical Viewer
AgfaWishBruRdvHl7FcpOut 			A-Wish,A-Agfa,T-RDV								CHUBXL.BO.NEW.Hl7MessageFileOut						Envoi des données administratives des patients de Wish vers Datameal
AgfaWishHudRdvHl7FcpOut 			A-Wish,A-Agfa,T-RDV								CHUBXL.BO.NEW.Hl7MessageFileOut						Envoi des données administratives des patients de Wish vers Datameal
AgfaBdocBruImgHl7TcpOut 			A-Agfa,A-Bdoc									CHUBXL.BO.NEW.HL7TcpOut								Envoi des références d&apos;imagerie d&apos;Agfa vers le DPI
AgfaBdocBruImgHl7TcpFwd 			A-Agfa,A-Bdoc,T-IMG								CHUBXL.BO.NEW.HL7TcpOut								Envoi des références d&apos;imagerie d&apos;Agfa vers le DPI
AgfaBdocHudImgHl7TcpOut 			A-Agfa,A-Bdoc									CHUBXL.BO.NEW.HL7TcpOut								Envoi des références d&apos;imagerie d&apos;Agfa vers le DPI
AgfaBdocHudImgHl7FcpFwd 			A-Agfa,A-Bdoc,T-IMG								CHUBXL.BO.NEW.Hl7MessageFileOut						Imagerie vers le DPI
AgfaBruImgHl7TcpIn 					A-Agfa,T-IMG,MIT								CHUBXL.BS.NEW.QuadratORMHUDTcpIn					Envoi des informations pour l&apos;imagerie d&apos;Agfa vers Bdoc
AgfaBruImgHl7TcpInNew 				A-Agfa,T-IMG,MIT,NewRis							CHUBXL.BS.NEW.QuadratORMHUDTcpIn					Envoi des informations pour l&apos;imagerie d&apos;Agfa vers BDoc
AgfaHudImgHl7TcpIn 					A-Agfa,T-IMG,MIT								CHUBXL.BS.NEW.QuadratORMHUDTcpIn					Envoi des informations pour l&apos;imagerie d&apos;Agfa vers Bdoc
AgfaeiBruImgHl7TcpIn 				A-Agfa,T-IMG,MIT								CHUBXL.BS.NEW.HL7TcpIn								Messages ORM EI Quadrat-Agfa vers DPI
AgfaBruRdvHl7TcpIn 					A-Agfa,T-RDV,MIT								CHUBXL.BS.NEW.QuadratRVTcpIn						Rendez-vous QPlanner vers DPI
AgfaHudRdvHl7TcpIn 					A-Agfa,T-RDV,MIT								CHUBXL.BS.NEW.QuadratRVTcpIn						Rendez-vous QPlanner HUDERF vers Wish
AgfaBdocBruRdvHl7TcpOut 			A-Bdoc,A-Agfa,T-RDV								CHUBXL.BO.NEW.HL7TcpOut								Envoi des rendez-vous QPlanner H.U.D.E.R.F. vers le DPI
AgfaBdocBruRdvHl7TcpFwd 			A-Bdoc,A-Agfa,T-RDV								CHUBXL.BO.NEW.HL7TcpOut								Envoi des rendez-vous QPlanner H.U.D.E.R.F. vers le DPI
AgfaBdocHudRdvHl7TcpOut 			A-Bdoc,A-Agfa,T-RDV								CHUBXL.BO.NEW.HL7TcpOut								Envoi des rendez-vous QPlanner H.U.D.E.R.F. vers le DPI
AgfaBdocHudRdvHl7FcpFwd 			A-Bdoc,A-Agfa,T-RDV								CHUBXL.BO.NEW.Hl7MessageFileOut						Envoie rendez-vous APlanner vers DPI
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
GLIMS
-----
GlimsAllLabRouting 					A-Glims,T-LAB									CHUBXL.BP.NEW.GlimsHL7Routing						Routage des analyses de laboratoire
GlimsAllMFURouting 					A-Glims,T-LAB,T-MFU								CHUBXL.BP.NEW.GlimsHL7MFURouting							
GlimsAllHcRouting 					A-Glims,A-HealthConnect,T-HC					CHUBXL.BP.NEW.GlimsMBRouting						Routage des résultats de laboratoire vers MediBridge
GlimsabruHudDocHl7FcpIn 			A-Glims,T-DOC									CHUBXL.BS.NEW.GlimsFile								Envoie des résultats labo vers Abrumet
GlimsabruBruDocHl7FcpIn 			A-Glims,T-DOC									CHUBXL.BS.NEW.GlimsFile								Envoie des résultats labo vers Abrumet
GlimsBdocabruBruDocHl7FcpFwd 		A-Glims,A-Bdoc,T-DOC							CHUBXL.BO.NEW.SendDocToDPI							Envoie résultat Ecare vers MediWeb Brugmann
GlimsBdocabruBruDocHl7FcpOut 		A-Glims,A-Bdoc,T-DOC							CHUBXL.BO.NEW.SendDocToDPI							Envoie résultat Ecare vers MediWeb Brugmann
GlimsBdocabruHudDocHl7FcpOut 		A-Glims,A-Bdoc									CHUBXL.BO.NEW.SendDocToDPI							Envoie résultat Ecare vers MediWeb Brugmann
GlimsMvabruMvAllDocXmlFcpOut 		A-Glims,T-DOC,T-LAB								CHUBXL.BO.NEW.SendDocToMv							Envoie des iReport Glims vers Medical Viewer
GlimsAllHchoneFcpIn			 		A-Glims,A-HealthConnect,T-HC					CHUBXL.BS.NEW.GlimsMBFile							Fichiers Labo Glims pour Medibridge LogTraceEvents=true Schedule=>
GlimsAllHcBJPFcpIn 					A-Glims,A-HealthConnect,T-HC					CHUBXL.BS.NEW.GlimsMBFile							Fichiers Labo Glims pour Medibridge
GlimsAllHcMedarFcpIn				A-Glims,A-HealthConnect,T-HC					CHUBXL.BS.NEW.GlimsMBFile							Fichiers Labo Glims pour Medibridge
GlimsAllHcMedidocFcpIn 				A-Glims,A-HealthConnect,T-HC					CHUBXL.BS.NEW.GlimsMBFile							Fichiers Labo Glims pour Medibridge
GlimsAllHcMedigestFcpIn 			A-Glims,A-HealthConnect,T-HC					CHUBXL.BS.NEW.GlimsMBFile							Fichiers Labo Glims pour Medibridge
GlimsAllHcSocrateFcpIn 				A-Glims,A-HealthConnect,T-HC					CHUBXL.BS.NEW.GlimsMBFile							Fichiers Labo Glims pour Medibridge
GlimsAllHchoneFcpOut 				A-Glims,A-HealthConnect,T-HC					CHUBXL.BO.NEW.MBFileOut								Transmission des résultats de laboratoire vers MediBridge format hone LogTraceEvents=true Schedule=>
GlimsAllHcBJPFcpOut 				A-Glims,A-HealthConnect,T-HC					CHUBXL.BO.NEW.MBFileOut								Transmission des résultats de laboratoire vers MediBridge format BJP
GlimsAllHcMedarFcpOut 				A-Glims,A-HealthConnect,T-HC					CHUBXL.BO.NEW.MBFileOut								Transmission des résultats de laboratoire vers MediBridge format Medar
GlimsAllHcMedidocFcpOut 			A-Glims,A-HealthConnect,T-HC					CHUBXL.BO.NEW.MBFileOut								Transmission des résultats de laboratoire vers MediBridge format Medidoc
GlimsAllHcMedigestFcpOut 			A-Glims,A-HealthConnect,T-HC					CHUBXL.BO.NEW.MBFileOut								Transmission des résultats de laboratoire vers MediBridge format Medigest
GlimsAllHcSocrateFcpOut 			A-Glims,A-HealthConnect							CHUBXL.BO.NEW.MBFileOut								Transmission des résultats de laboratoire vers MediBridge format  Socrate
GlimsAllLabHl7FcpIn 				A-Glims											CHUBXL.BS.NEW.GlimsHL7File 							Fichiers Labo Glims
GlimsBruLabHl7TcpIn 				A-Glims,T-LAB,MIT								CHUBXL.BS.NEW.GlimsTcpIn							Reception des résultats de laboratoire pour Brugmann (Glims)
GlimsHudLabHl7TcpIn 				A-Glims,T-LAB,MIT								CHUBXL.BS.NEW.GlimsTcpIn							Reception des résultats de laboratoire pour HUDERF (Glims)
GlimsIcipHudLabHl7TcpOut 			A-Glims,A-Icip,T-LAB							CHUBXL.BO.NEW.HL7TcpOut								Transmission des résultats de laboratoire vers le logiciel des USI (ICIP) de l&apos;HUDERF
GlimsEcareBruLabHl7FcpOut 			A-Glims,A-Ecare,T-LAB							CHUBXL.BO.NEW.Hl7MessageFileOut						Transmission des résultats de laboratoire vers le logiciel des urgences (Ecare)  Brugmann
GlimsDialyseAllLabHl7TcpOut 		A-Glims,A-Dialyse,T-LAB							CHUBXL.BO.NEW.RawTcpOut								Trnsmission des résultats de laboratoire vers le logiciel de dialyse (hemadial)
GlimsMvAllLabXmlFcpOut 				A-Glims,A-Mv									CHUBXL.BO.NEW.SendDocToMv 							Transmission des résultats de laboratoire vers Medical Viewer LogTraceEvents=false Schedule=START:*-*-*T19:00:00,STOP:*-*-*T20:00:00>
GlimsBdocBruLabHl7TcpOut 			A-Glims,A-Bdoc,T-LAB							CHUBXL.BO.NEW.HL7TcpOut								Envoie des résultats laboratoire vers l&apos;environnement de test du DPI
GlimsBdocBruLabHl7TcpFwd 			A-Glims,A-Bdoc,T-LAB							CHUBXL.BO.NEW.HL7TcpOut								Envoie des résultats laboratoire vers l&apos;environnement de test du DPI
GlimsBdocHudLabHl7TcpOut 			A-Glims,A-Bdoc									CHUBXL.BO.NEW.HL7TcpOut								Envoie des résultats laboratoire vers l&apos;environnement de test du DPI
GlimsBdocHudLabHl7TcpFwd 			A-Glims,A-Bdoc,T-LAB							CHUBXL.BO.NEW.HL7TcpOut								Transmission des réultats laboratoire HUDERF vers l&apos;environnement de PREPROD
GlimsAllMFUHl7FcpIn 				A-Glims,T-LAB,T-MFU								CHUBXL.BS.NEW.GlimsHL7MFUFile 						Fichiers Labo Glims
GlimsAllMFUHl7TcpIn 				A-Glims,T-LAB,T-MFU								CHUBXL.BS.NEW.GlimsMFUTcpIn 						Reception du fichier des analyses laboratoire 
GlimsGlimsBruMFUHl7FcpOut 			A-Glims,A-Agfa,T-LAB,T-MFU						CHUBXL.BO.NEW.Hl7MessageFileOut 					Transmission des analysess de laboratoire vers MediWeb Brugmann
GlimsGlimsHudMFUHl7TcpOut 			A-Glims,T-LAB,T-MFU								CHUBXL.BO.NEW.RawTcpOut								Transmission du fichier des analyses de laboratoires vers l&apos;environnement de PREPRO
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INFOHOS
-------  
InfohosMdAllPhaRouting 				A-Infohos										CHUBXL.BP.NEW.InfohosBdocMedicRouting								
InfohosSpeAllPhaRouting 			A-Infohos,T-FAC,A-Oxygen						CHUBXL.BP.NEW.InfohosWishRouting					Transfert des spécialités d&apos;Infohos vers Wish
InfohosArtAllPhaRouting 			A-Infohos										CHUBXL.BP.NEW.InfohosRouting						Articles Infohos vers Intranet
InfohosTsAllPhaRouting 				A-Infohos										CHUBXL.BP.NEW.InfohosTSRouting								
InfohosBdocBruPhaHl7TcpOut 			A-Infohos,A-Bdoc								CHUBXL.BO.NEW.HL7TcpOut								
InfohosBdocBruPhaHl7TcpOutPre 		A-Infohos,A-Bdoc								CHUBXL.BO.NEW.HL7TcpOut								
InfohosBdocHudPhaHl7TcpOut 			A-Infohos,A-Bdoc								CHUBXL.BO.NEW.HL7TcpOut								
InfohosBdocHudPhaHl7TcpOutPre 		A-Infohos,A-Bdoc								CHUBXL.BO.NEW.HL7TcpOut								
InfohosBdocBruPhaForHl7TcpOut 		A-Infohos,A-Bdoc								CHUBXL.BO.NEW.HL7TcpOut								
InfohosBdocHudForPhaHl7TcpOut 		A-Infohos,A-Bdoc								CHUBXL.BO.NEW.HL7TcpOut								
InfohosBdocBruPhaNotHl7TcpOut 		A-Infohos,A-Bdoc								CHUBXL.BO.NEW.HL7TcpOut								
InfohosBdocHudPhaNotHl7TcpOut 		A-Infohos,A-Bdoc								CHUBXL.BO.NEW.HL7TcpOut								
InfohosSpeAllPhaDlmFcpIn 			A-Infohos										CHUBXL.BS.NEW.InfohosFileIn							Fichier spécialités et implants d&apos;Infohos vers Wish
InfohosTsAllPhaXmlFcpIn 			A-Infohos										CHUBXL.BS.NEW.InfohosMultiFile								
InfohosArtAllPhaXmlFcpIn 			A-Infohos										CHUBXL.BS.NEW.InfohosFile							Articles Infohos vers l&apos;intranet
InfohosArtAllPhaXmlFcpOut 			A-Infohos										CHUBXL.BO.NEW.MBFileOut								Articles Infohos vers Intranet
InfohosTsAllPhaDlmWsOut 			A-Infohos										CHUBXL.BO.NEW.HealthConnect.JournalEntryServiceSoap								
InfohosMdAllPhaHl7FcpIn 			A-Infohos										CHUBXL.BS.NEW.InfohosBDocMedicFile								
InfohosSpeBruPhaHl7FtpOut 			A-Infohos										CHUBXL.BO.NEW.BatchFtpWishOut						Fichier des spécialités d&apos;Infohos vers Wish
InfohosSpeHudPhaHl7FtpOut 			A-Infohos										CHUBXL.BO.NEW.BatchFtpWishOut						Envoi du signalétique des médicaments iNFOHOS VERS wISH huderf
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
MV
--  
MvAllArcRouting 					A-Mv											CHUBXL.BP.NEW.MVHL7Routing							MV vers DPI
MvAllArcHl7TcpIn 					A-Mv,MIT										CHUBXL.BS.NEW.HL7TcpIn								Envoie des documents archivés vers DPI
MvBdocHudArcHl7TcpOut 				A-Mv,A-Bdoc										CHUBXL.BO.NEW.HL7TcpOut								Envoi des références des documents scannés vers le DPI
MvBdocHudArcHl7TcpFwd 				A-Mv,A-Bdoc										CHUBXL.BO.NEW.HL7TcpOut								ENvoi des références des documents scannés vers le DPI
MvBdocBruArcHl7TcpOut 				A-Mv,A-Bdoc										CHUBXL.BO.NEW.HL7TcpOut								Envoi des références des documents scannés Brugmann vers le DPI (Bdoc)
MvBdocBruArcHl7TcpFwd 				A-Mv,A-Bdoc										CHUBXL.BO.NEW.HL7TcpOut								ENvoi des références des documents scannés vers le DPI
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
MEDECIN
-------
MedecinAllMedRouting 				A-Medecin										CHUBXL.BP.NEW.MedecinRouting						Routage des messages médecins vers périphériques
RefmedAllMedRouting 				A-Medecin,A-Refmed,T-GDR						CHUBXL.BP.NEW.RefmedRouting							Routage des messages médecins vers périphériques
RefmedAllMedHl7FcpIn 				A-Medecin,A-Refmed,T-GDR						CHUBXL.BS.NEW.MedecinMultiFile						Données Médecins
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
OXYGEN
------
OxygenAllDocRouting 				A-Oxygen,A-Mv,T-DOC								CHUBXL.BP.NEW.KineRouting							Envoi des résultats d&apos;Astraia (Gyné) vers Medical Viewer
OxygenBruDocHl7FcpIn 				A-Oxygen,T-DOC									CHUBXL.BS.NEW.KineFile								Reception des rapports de Kine (Oxygen)
OxygenBdocHudDocHl7FcpOut 			A-Oxygen,A-Bdoc,T-DOC							CHUBXL.BO.NEW.SendDocToDPI							Envoi des rapports du logiciel EndoBase HUDERF vers le DPI
OxygenBdocBruDocHl7FcpOut 			A-Oxygen,A-Bdoc,T-DOC							CHUBXL.BO.NEW.SendDocToDPI							Envoi des rapports du logiciel EndoBase HUDERF vers le DPI
OxygenMvAllDocHl7FcpOut 			A-Oxygen,A-Mv,T-DOC								CHUBXL.BO.NEW.SendDocToMv							Envoi des rapports Kine (Oxygen) vers Medical Viewer
OxygenBruFacDlmFcpIn 				A-Oxygen,T-FAC									CHUBXL.BS.NEW.InfohosFileIn							Fichier facturation Kine Oxygen
OxygenWishBruFacDlmFtpOut 			A-Oxygen,A-Wish,T-FAC							CHUBXL.BO.NEW.BatchFtpWishOut						Facturation Kine Oxygen vers Wish
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ECARE
-----
EcareBruDocRouting 					A-Ecare,T-DOC									CHUBXL.BP.NEW.EcareRouting							Routage rapport Ecare vers MV
EcareBruDocHl7FcpIn 				A-Ecare,T-DOC									CHUBXL.BS.NEW.EcareFile								Reception des rapports des urgences (Ecare)
EcareBdocBruDocHl7FcpOut 			A-Ecare,A-Bdoc,T-DOC							CHUBXL.BO.NEW.SendDocToDPI							Envoie résultat Ecare vers MediWeb Brugmann
EcareMvAllDocHl7FcpOut 				A-Ecare,A-Mv,T-DOC								CHUBXL.BO.NEW.SendDocToMv							Rapports Ecare vers MV
EcareAgfaBruDocHl7FcpOut 			A-Ecare,A-Agfa,T-DOC							CHUBXL.BO.NEW.Hl7MessageFileOut						Envoie résultat Ecare vers MediWeb Brugmann
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DIAMIC
------
DiamicAllDocRouting 				A-Diamic,A-Mv,T-DOC								CHUBXL.BP.NEW.DiamicRouting							Routage des résultats médicaux (format impression)
DiamicAllDocHl7FcpIn 				A-Diamic,T-DOC									CHUBXL.BS.NEW.DiamicFile							Reception des rapports d&apos;anatomie-pathologique (Diamic)
DiamicBdocBruDocHl7FcpOut 			A-Bdoc,A-Diamic,T-DOC							CHUBXL.BO.NEW.SendDocToDPI							Transmission des rapport d&apos;anatomie-pathologique (Diamic) vers MediWeb HUDERF de test
DiamicBdocHudDocHl7FcpOut 			A-Bdoc,A-Diamic,T-DOC							CHUBXL.BO.NEW.SendDocToDPI							Transmission des rapport d&apos;anatomie-pathologique (Diamic) vers MediWeb HUDERF de test
DiamicBdocBruDocHl7FcpOutPrep 		A-Bdoc,A-Diamic,T-DOC							CHUBXL.BO.NEW.SendDocToDPI							Transmission des rapport d&apos;anatomie-pathologique (Diamic) vers MediWeb HUDERF de test
DiamicBdocHudDocHl7FcpOutPrep 		A-Bdoc,A-Diamic,T-DOC							CHUBXL.BO.NEW.SendDocToDPI							Transmission des rapport d&apos;anatomie-pathologique (Diamic) vers MediWeb HUDERF de test
DiamicMvAllDocHl7FcpOut 			A-Mv,T-DOC										CHUBXL.BO.NEW.SendDocToMv							Transmission des rapport d&apos;anatomie-pathologique (Diamic) vers Medical Viewer
DiamicAgfaBruDocHl7FcpOut 			A-Diamic,A-Agfa,T-DOC							CHUBXL.BO.NEW.Hl7MessageFileOut						Transmission des rapport d&apos;anatomie-pathologique (Diamic) vers MediWeb Brugmann
DiamicAgfaHudDocHl7FcpOut 			A-Diamic,A-Agfa,T-DOC							CHUBXL.BO.NEW.Hl7MessageFileOut						Transmission des rapport d&apos;anatomie-pathologique (Diamic) vers MediWeb HUDERF
DiamicAllFacDlmFcpIn 				A-Diamic,T-FAC									CHUBXL.BS.NEW.InfohosFileIn							Fichier facturation Diamic
DiamicWishBruFacDlmFtpOut 			A-Diamic,A-Wish,T-FAC							CHUBXL.BO.NEW.BatchFtpWishOut						Facturation Diamic vers Wish
DiamicWishHudFacDlmFtpOut 			A-Diamic,A-Wish,T-FAC							CHUBXL.BO.NEW.BatchFtpWishOut						Facturation Diamic vers Wish
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
OPERA
-----
OperaAllRdvRouting 					A-Opera,T-RDV									CHUBXL.BP.NEW.OperaHL7Routing						Rendez-vous QPlanner vers DPI
OperaAllRdvHl7TcpIn 				A-Opera,T-RDV,MIT								CHUBXL.BS.NEW.HL7TcpIn								Transfert des rendez-vous Opera vers Bdoc
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
MOSOS
-----
MososBruDocRouting 					A-Mosos,A-Mv,T-DOC								CHUBXL.BP.NEW.MOSOSRouting							Envoi des résultats de MOSOS (Gyné) vers Medical Viewer
MososBruDocHl7FcpIn 				A-Mosos,T-DOC									CHUBXL.BS.NEW.MOSOSFile								Envoi des résultats de MOSOS (Gyné) vers Medical Viewer
MososMvBruDocHl7FcpOut 				A-Mosos,A-Mv,T-DOC								CHUBXL.BO.NEW.SendDocToMv							Envoi des rapports de MOSOS (Gyné) vers Medical Viewer
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ASTRAIA
-------
AstraiaAllDocRouting 				A-Astraia,A-Mv,T-DOC							CHUBXL.BP.NEW.AstraiaRouting						Envoi des résultats d&apos;Astraia (Gyné) vers Medical Viewer
AstraiaBruDocHl7FcpIn 				A-Astraia,A-Mv,T-DOC							CHUXL.BS.AstraiaFile							Envoi des résultats d&apos;Astraia (Gyné) vers Medical Viewer
AstraiaMvBruDocHl7FcpOut 			A-Astraia,A-Mv,T-DOC							CHUBXL.BO.NEW.SendDocToMv							Envoi des rapports d&apos;Astraia (Gyné) vers Medical Viewer
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ICIP
----
IcipHudDocRouting 					A-Icip,A-Mv,T-DOC								CHUBXL.BP.NEW.ICIPRouting							Routage des résultats ICIP vers Medical Viewer
IcipHudDocHl7FcpIn 					A-Icip,T-DOC									CHUBXL.BS.NEW.ICIPFile								Reception des rapports des USI de l&apos;HUDERF ( ICIP)
IcipMvHudDocHl7FcpOut 				A-Icip,A-Mv,T-DOC								CHUBXL.BO.NEW.SendDocToMv							Résultats ICIP vers Medical Viewer
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
OPHTALMO
--------
OphtalmoHudDocRouting 				A-Ophtalmo,A-Mv,T-DOC							CHUBXL.BP.NEW.OphtalmoRouting						Routage des résultats Ophtalmo vers Medical Viewer
OphtalmoHudDocHl7FcpIn 				A-Ophtalmo,T-DOC								CHUBXL.BS.NEW.OphtalmoFile							Reception des rapports d&apos;Ophtalmologie pour l&apos;HUDERF
OphtalmoMvHudDocHl7FcpOut 			A-Ophtalmo,A-Mv,T-DOC							CHUBXL.BO.NEW.SendDocToMv							Transmission des rapports d&apos;ophtalmologie vers Medical Viewer
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ENDOBASE
--------
EndobaseHudDocRouting 				A-Endobase,T-DOC								CHUBXL.BP.NEW.BDocRouting							Routage des rapports de Bdoc
EndobaseHudDocHl7FcpIn 				A-Endobase,T-DOC								CHUBXL.BS.NEW.EndoBaseFile							Reception des rapports du logiciel EndoBase HUDERF
EndobaseBdocHudDocHl7FcpOut 		A-Endobase,A-Bdoc,T-DOC							CHUBXL.BO.NEW.SendDocToDPI							Envoi des rapports du logiciel EndoBase HUDERF vers le DPI
EndobaseMvHudDocHl7FcpOut 			A-Endobase,A-Mv,T-DOC							CHUBXL.BO.NEW.SendDocToMv							Envoi des rapports EndoBase vers Medical Viewer
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
PLUS
----
PlusAllDocRouting 					A-Plus,A-Mv,T-DOC								CHUBXL.BP.NEW.PLUSRouting							Routage des rapports de Bdoc
PlusAllDocXmlFcpIn 					A-Plus,T-DOC									CHUBXL.BS.NEW.PLUSFile								Reception des rapports de Bdoc HUDERF
PlusMvAllDocXmlFcpOut 				A-Mv,A-Plus,T-DOC								CHUBXL.BO.NEW.SendDocToMv							Test suppresion documents Agfa vers MV
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RSBEVENT
--------
RsbEventAllRouting 					A-RsbEvent										CHUBXL.BP.NEW.RsbEventRouting 						Articles Infohos vers Intranet
RsbEventAllDocXmlFcpIn 				A-RsbEvent,T-DOC								CHUBXL.BS.NEW.RsbEventFile 							Réception fichiers Abrumet RsbEvent
RsbBdocBruDocXmlFcpOut 				A-Bdoc,A-RsbEvent,T-DOC							CHUBXL.BO.NEW.MBFileOut								Envoie fichier Abrumet RsbEvent vers Bdoc Brugmann
RsbBdocHudDocXmlFcpOut 				A-Bdoc,A-RsbEvent,T-DO						 	CHUBXL.BO.NEW.MBFileOut								Envoie fichier Abrumet RsbEvent vers Bdoc Brugmann
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ALPHA
-----
AlphaAllArcRouting 					A-Alpha,A-Ciges									CHUBXL.BP.NEW.AlphaQDoc 							Dossiers archives de l&apos;application CIGES à Medical Viewer
AlphaAllArcDlmFcpIn 				A-Alpha,A-Cige									CHUBXL.BS.NEW.AlphaFcpIn							Dossiers archives de l&apos;application CIGES à Medical Viewer
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/
XData ProductionDefinition
{
<Production Name="CHUBXL.ProductionPROD" TestingEnabled="false" LogGeneralTraceEvents="false">
  <Description>Production CHUBXL de PRODUCTION - BORON</Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="CHUBXLGeneralMetric" Category="S-Metric,S-Alert" ClassName="CHUBXL.MET.GeneralMetric" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="AlertEmail" Category="S-Alert" ClassName="EnsLib.EMail.AlertOperation" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Gestion des alertes par E-mail" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="SMTPServer">smtp.chu-brugmann.be</Setting>
    <Setting Target="Adapter" Name="SMTPPort">25</Setting>
    <Setting Target="Adapter" Name="Credentials"></Setting>
    <Setting Target="Adapter" Name="Recipient">dulio.ambrogetti@chu-brugmann.be</Setting>
    <Setting Target="Adapter" Name="Cc"></Setting>
    <Setting Target="Adapter" Name="From">ensembleBoronPROD@chu-brugmann.be</Setting>
  </Item>
  <Item Name="Ens.Alert" Category="S-Alert" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="BusinessRuleName">CHUBXL.Ens.Alert</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="ActivityChecker" Category="S-Alert" ClassName="Ciges.BS.ActivityChecker" PoolSize="1" Enabled="true" Foreground="false" Comment="Service de vérification de l&apos;état des connecteurs afin de voir s&apos;ils sont actifs" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="ActivityCheckerAlertRegulator" Category="S-Alert" ClassName="Ciges.BP.AlertRegulator" PoolSize="1" Enabled="true" Foreground="false" Comment="Régulation des alertes envoyées par l&apos;ActivityChecker pour ne pas envoyer trop de mails" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="target">ActivityCheckerAlert</Setting>
    <Setting Target="Host" Name="sendInterval">60</Setting>
    <Setting Target="Host" Name="activityCheckerConfigName">Ens.Alert</Setting>
  </Item>
  <Item Name="ActivityCheckerAlert" Category="S-Alert" ClassName="Ciges.BO.AlertSender" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="From">ProductionEnsemble@Brugmann.be</Setting>
    <Setting Target="Adapter" Name="Recipient">dulio.ambrogetti@chu-brugmann.be</Setting>
    <Setting Target="Adapter" Name="SMTPPort">25</Setting>
    <Setting Target="Adapter" Name="SMTPServer">smtp.chu-brugmann.be</Setting>
  </Item>
  <Item Name="WishAllAdtRouting" Category="A-Wish,T-ADT" ClassName="CHUBXL.BP.NEW.WishAdtHl7Routing" PoolSize="1" Enabled="true" Foreground="false" Comment="Routing des messsages de données administratives des patients (Wish)" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="AddToMetric">1</Setting>
  </Item>
  <Item Name="WishBruAdtHl7TcpIn" Category="A-Wish,T-ADT,MIT" ClassName="CHUBXL.BS.NEW.Hl7MllpTcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Reception des messages de données administratives des patients Brugmann." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">WishAllAdtRouting</Setting>
    <Setting Target="Adapter" Name="Port">21461</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\archive\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\archive\Bru</Setting>
    <Setting Target="Host" Name="IgnoreInboundAck">0</Setting>
    <Setting Target="Host" Name="UseAckCommitCodes">0</Setting>
    <Setting Target="Host" Name="LocalFacilityApplication">Wish_Adt_Bru</Setting>
    <Setting Target="Host" Name="SearchTableClass">EnsLib.HL7.SearchTable</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="SaveReplies">IndexNotOKs</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">2.5</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="Framing">MLLP</Setting>
    <Setting Target="Host" Name="PreACKTCPClear">0</Setting>
  </Item>
  <Item Name="WishHudAdtHl7TcpIn" Category="A-Wish,T-ADT,MIT" ClassName="CHUBXL.BS.NEW.Hl7MllpTcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Reception des messages de données administratives des patients de l&apos;HUDERF." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">WishAllAdtRouting</Setting>
    <Setting Target="Adapter" Name="Port">21471</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\archive\Hud</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\archive\Hud</Setting>
    <Setting Target="Host" Name="IgnoreInboundAck">0</Setting>
    <Setting Target="Host" Name="UseAckCommitCodes">0</Setting>
    <Setting Target="Host" Name="LocalFacilityApplication">Wish_Adt_Bru</Setting>
    <Setting Target="Host" Name="SearchTableClass">EnsLib.HL7.SearchTable</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="SaveReplies">IndexNotOKs</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">2.5</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="Framing">MLLP</Setting>
    <Setting Target="Host" Name="PreACKTCPClear">0</Setting>
  </Item>
  <Item Name="WishAllAdtHl7FcpIn" Category="A-Wish" ClassName="CHUBXL.BS.NEW.WishHl7FcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Ré envoie des messages HL7 de Wish" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Wish\archive\All</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\PROD\Wish\in</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\archive\All</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
  </Item>
  <Item Name="WishBruMedHl7TcpIn" Category="A-Wish,A-Medecin,MIT" ClassName="CHUBXL.BS.NEW.Hl7MllpTcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Réception des messages de données médecins Wish Brugmann." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">MedecinAllMedRouting</Setting>
    <Setting Target="Adapter" Name="Port">21131</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\Medecin\archive\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\Medecin\archive\Bru</Setting>
    <Setting Target="Host" Name="IgnoreInboundAck">0</Setting>
    <Setting Target="Host" Name="UseAckCommitCodes">0</Setting>
    <Setting Target="Host" Name="LocalFacilityApplication">Wish_MED_BRU</Setting>
    <Setting Target="Host" Name="SearchTableClass">EnsLib.HL7.SearchTable</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="SaveReplies">IndexNotOKs</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">2.5</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="PreACKTCPClear">0</Setting>
    <Setting Target="Host" Name="Framing">MLLP</Setting>
  </Item>
  <Item Name="WishHudMedHl7TcpIn" Category="A-Wish,A-Medecin,MIT" ClassName="CHUBXL.BS.NEW.Hl7MllpTcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Réception des messages de données médecins Wish H.U.D.E.R.F." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="MessageSchemaCategory">2.5</Setting>
    <Setting Target="Host" Name="TargetConfigNames">MedecinAllMedRouting</Setting>
    <Setting Target="Adapter" Name="Port">21141</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\Medecin\archive\Hud</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\Medecin\archive\Hud</Setting>
    <Setting Target="Host" Name="LocalFacilityApplication">Wish_MED_HUD</Setting>
    <Setting Target="Host" Name="IgnoreInboundAck">0</Setting>
    <Setting Target="Host" Name="UseAckCommitCodes">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="SaveReplies">IndexNotOKs</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="PreACKTCPClear">0</Setting>
    <Setting Target="Host" Name="Framing">MLLP</Setting>
  </Item>
  <Item Name="WishAgfaHudAdtHl7TcpOut" Category="A-Wish,A-Agfa,T-ADT" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie des données administratives patients de Wish vers Agfa-Quadrat HUDERF" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Agfa\Hud</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Agfa\Hud</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Adapter" Name="Port">21761</Setting>
    <Setting Target="Adapter" Name="IPAddress">HUQITFI01</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="WishDialyseAllAdtXmlTcpOut" Category="A-Wish,A-Dialyse,T-ADT" ClassName="CHUBXL.BO.NEW.ParsedTcpOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des données Administratives vers le logiciel de dialyses (hemadial)" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">Wish</Setting>
    <Setting Target="Host" Name="SystemDestination">Dialyse</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Dialyse\All</Setting>
    <Setting Target="Host" Name="STX">11</Setting>
    <Setting Target="Host" Name="ETX">13</Setting>
    <Setting Target="Host" Name="EOT">10</Setting>
    <Setting Target="Host" Name="ACK">6</Setting>
    <Setting Target="Host" Name="NACK">15</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="IPAddress">brhema01</Setting>
    <Setting Target="Adapter" Name="Port">21122</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">15</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">5</Setting>
    <Setting Target="Adapter" Name="ReconnectRetry">5</Setting>
    <Setting Target="Adapter" Name="GetReply">1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">30</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="WishIcipHudAdtHl7TcpOut" Category="A-Wish,A-Icip,T-ADT" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Transmission des données Administratives le logiciel des USI (ICIP) de l&apos;HUDERF" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Icip\Hud</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Icip\Hud</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="NoFailWhileDisconnected">0</Setting>
    <Setting Target="Host" Name="Separators"><![CDATA[|^~\&]]></Setting>
    <Setting Target="Host" Name="SearchTableClass"></Setting>
    <Setting Target="Host" Name="DefCharEncoding">Latin1</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="Framing">MLLP</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.109</Setting>
    <Setting Target="Adapter" Name="Port">21641</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">30</Setting>
    <Setting Target="Adapter" Name="ReconnectRetry">5</Setting>
    <Setting Target="Adapter" Name="GetReply">1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="WishInnovianHudAdtHl7TcpOut" Category="A-Wish,A-Innovian,T-ADT" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Transmission des données Administratives vers le logiciel de gestion du département d&apos;anésthésie (Innovian) de l&apos;HUDERF" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Innovian\Hud</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Innovian\Hud</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="NoFailWhileDisconnected">0</Setting>
    <Setting Target="Host" Name="Separators"><![CDATA[|^~\&]]></Setting>
    <Setting Target="Host" Name="SearchTableClass"></Setting>
    <Setting Target="Host" Name="DefCharEncoding">Latin1</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="Framing">MLLP</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.222.222</Setting>
    <Setting Target="Adapter" Name="Port">21581</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">5</Setting>
    <Setting Target="Adapter" Name="ReconnectRetry">5</Setting>
    <Setting Target="Adapter" Name="GetReply">1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="WishCacheAllAdtHl7FcpOut" Category="A-Wish,A-Cache,T-ADT" ClassName="CHUBXL.BO.NEW.Hl7FcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers Datameal" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="NoFailWhileDisconnected">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\PROD\Wish\out\Cache\All</Setting>
    <Setting Target="Host" Name="SystemDestination">Cache</Setting>
    <Setting Target="Host" Name="SystemSource">Wish</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\PROD\Wish\out\Cache\All</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7">\\brdevtask1\FTPincoming$\Wish</Setting>
    <Setting Target="Host" Name="RPFileHL7"></Setting>
  </Item>
  <Item Name="WishCigesAllAdtDlmTcpOut" Category="A-Wish,A-Ciges,T-ADT" ClassName="CHUBXL.BO.NEW.ParsedTcpOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des données Administratives vers l&apos;Alpha" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">Wish</Setting>
    <Setting Target="Host" Name="SystemDestination">Ciges</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Ciges\All</Setting>
    <Setting Target="Host" Name="STX">11</Setting>
    <Setting Target="Host" Name="ETX">13</Setting>
    <Setting Target="Host" Name="EOT">10</Setting>
    <Setting Target="Host" Name="ACK">6</Setting>
    <Setting Target="Host" Name="NACK">15</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.10</Setting>
    <Setting Target="Adapter" Name="Port">21531</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">15</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">5</Setting>
    <Setting Target="Adapter" Name="ReconnectRetry">5</Setting>
    <Setting Target="Adapter" Name="GetReply">1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="WishMvAllAdtHl7TcpOut" Category="A-Wish,A-Mv,T-ADT" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Mv\All</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Mv\All</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="NoFailWhileDisconnected">0</Setting>
    <Setting Target="Host" Name="Separators"><![CDATA[|^~\&]]></Setting>
    <Setting Target="Host" Name="SearchTableClass"></Setting>
    <Setting Target="Host" Name="DefCharEncoding">Latin1</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="Framing">MLLP</Setting>
    <Setting Target="Adapter" Name="IPAddress">Sharatan</Setting>
    <Setting Target="Adapter" Name="Port">21561</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">5</Setting>
    <Setting Target="Adapter" Name="ReconnectRetry">5</Setting>
    <Setting Target="Adapter" Name="GetReply">1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="WishOxygenBruAdtHl7TcpOut" Category="A-Wish,A-Oxygen,A-Refmed,A-Medecin,T-ADT,T-GDR" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers la Kine" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Oxygen\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Oxygen\Bru</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="NoFailWhileDisconnected">0</Setting>
    <Setting Target="Host" Name="Separators"><![CDATA[|^~\&]]></Setting>
    <Setting Target="Host" Name="SearchTableClass"></Setting>
    <Setting Target="Host" Name="DefCharEncoding">Latin1</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="Framing">MLLP</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.9.60</Setting>
    <Setting Target="Adapter" Name="Port">21171</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">5</Setting>
    <Setting Target="Adapter" Name="ReconnectRetry">5</Setting>
    <Setting Target="Adapter" Name="GetReply">1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="WishAgfaBruAdtHl7TcpOut" Category="A-Wish,A-Agfa,T-ADT" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie des données administratives patients de Wish vers Agfa-Quadrat Brugmann" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">BRQITFI01</Setting>
    <Setting Target="Adapter" Name="Port">21641</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Agfa\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Agfa\Bru</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="Framing">MLLP</Setting>
  </Item>
  <Item Name="WishAgfaeiBruAdtHl7TcpOut" Category="Wish,Quadrat" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie des données administratives patients de Wish vers Agfa-Quadrat Brugmann" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">10.20.10.127</Setting>
    <Setting Target="Adapter" Name="Port">21132</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Agfaei\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Agfaei\Bru</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
  </Item>
  <Item Name="WishGlimsBruAdtHl7TcpOut" Category="A-Wish,A-Glims,T-ADT" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie des données administratives de Wish Brugmann vers Glims" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">21253</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Glims\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Glims\Bru</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.60.2.11</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
  </Item>
  <Item Name="WishGlimsHudAdtHl7TcpOut" Category="A-Wish,A-Glims,T-ADT" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie des données administratives de Wish Brugmann vers Glims" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">21252</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Glims\Hud</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Glims\Hud</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.60.2.11</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="WishDiamicAllAdtHl7TcpOut" Category="A-Wish,A-Diamic,T-ADT" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie des données adminstratives des aptiens de Wish vers Diamic" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Diamic\All</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Diamic\All</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="NoFailWhileDisconnected">0</Setting>
    <Setting Target="Host" Name="Separators"><![CDATA[|^~\&]]></Setting>
    <Setting Target="Host" Name="SearchTableClass"></Setting>
    <Setting Target="Host" Name="DefCharEncoding">Latin1</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="Framing">MLLP</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.15.102.10</Setting>
    <Setting Target="Adapter" Name="Port">21571</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">30</Setting>
    <Setting Target="Adapter" Name="ReconnectRetry">5</Setting>
    <Setting Target="Adapter" Name="GetReply">1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="WishInfohosAllAdtHl7TcpOut" Category="A-Wish,A-Infohos,T-ADT,A-Medecin" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers Infohos" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Infohos\All</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Infohos\All</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="NoFailWhileDisconnected">0</Setting>
    <Setting Target="Host" Name="Separators"><![CDATA[|^~\&]]></Setting>
    <Setting Target="Host" Name="SearchTableClass"></Setting>
    <Setting Target="Host" Name="DefCharEncoding">Latin1</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="Framing">MLLP</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.102</Setting>
    <Setting Target="Adapter" Name="Port">21551</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">5</Setting>
    <Setting Target="Adapter" Name="ReconnectRetry">5</Setting>
    <Setting Target="Adapter" Name="GetReply">1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="WishAstraiaBruAdtHl7TcpOut" Category="A-Wish,A-Astraia,T-ADT" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Astraia\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Astraia\Bru</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="NoFailWhileDisconnected">0</Setting>
    <Setting Target="Host" Name="Separators"><![CDATA[|^~\&]]></Setting>
    <Setting Target="Host" Name="SearchTableClass"></Setting>
    <Setting Target="Host" Name="DefCharEncoding">Latin1</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="Framing">MLLP</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.9.68</Setting>
    <Setting Target="Adapter" Name="Port">22002</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">5</Setting>
    <Setting Target="Adapter" Name="ReconnectRetry">5</Setting>
    <Setting Target="Adapter" Name="GetReply">1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Astraia\Bru</Setting>
  </Item>
  <Item Name="WishEcareBruAdtHl7TcpOut" Category="A-Wish,A-Ecare,T-ADT" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Ecare\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Ecare\Bru</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="NoFailWhileDisconnected">0</Setting>
    <Setting Target="Host" Name="Separators"><![CDATA[|^~\&]]></Setting>
    <Setting Target="Host" Name="SearchTableClass"></Setting>
    <Setting Target="Host" Name="DefCharEncoding">Latin1</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="Framing">MLLP</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.10.27</Setting>
    <Setting Target="Adapter" Name="Port">2501</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">30</Setting>
    <Setting Target="Adapter" Name="ReconnectRetry">5</Setting>
    <Setting Target="Adapter" Name="GetReply">1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="WishMososBruAdtHl7TcpOut" Category="A-Wish,A-Mosos,T-ADT" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Transmission des données administratives WIsh vers le logiciel de gynécologie (Mosos)" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">22116</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Mosos\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Mosos\Bru</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.9.212</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="WishDatamealBruAdtHl7TcpOut" Category="A-Wish,A-Datameal,T-ADT" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers Datameal" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Datameal\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Datameal\Bru</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="NoFailWhileDisconnected">0</Setting>
    <Setting Target="Host" Name="Separators"><![CDATA[|^~\&]]></Setting>
    <Setting Target="Host" Name="SearchTableClass"></Setting>
    <Setting Target="Host" Name="DefCharEncoding">Latin1</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="Framing">MLLP</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.60.4.12</Setting>
    <Setting Target="Adapter" Name="Port">25001</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">5</Setting>
    <Setting Target="Adapter" Name="ReconnectRetry">5</Setting>
    <Setting Target="Adapter" Name="GetReply">1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">15</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="WishInfopartnerAllAdtHl7TcpOut" Category="A-Wish,A-Infopartner,T-ADT" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers Datameal" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Infopartner\All</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Infopartner\All</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="NoFailWhileDisconnected">0</Setting>
    <Setting Target="Host" Name="Separators"><![CDATA[|^~\&]]></Setting>
    <Setting Target="Host" Name="SearchTableClass"></Setting>
    <Setting Target="Host" Name="DefCharEncoding">Latin1</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="Framing">MLLP</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.44</Setting>
    <Setting Target="Adapter" Name="Port">21701</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">5</Setting>
    <Setting Target="Adapter" Name="ReconnectRetry">5</Setting>
    <Setting Target="Adapter" Name="GetReply">1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="WishEnstestBruAdtHl7TcpOut" Category="A-Wish" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Transmission des données Administratives vers l&apos;environnement de Pre-Production" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">boron02</Setting>
    <Setting Target="Adapter" Name="Port">21465</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Test\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Test\Bru</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">30</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="WishBdocHudAdtHl7TcpOut" Category="A-Wish,A-Bdoc,A-Refmed,A-Medecin,T-ADT" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers le DPI (Bdoc)" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">21771</Setting>
    <Setting Target="Adapter" Name="IPAddress">ATAIR</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="WishOphtalmoHudAdtHl7TcpOut" Category="A-Wish,A-Ophtalmo,T-ADT" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers l&apos;ophtalmo" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">ruthenium</Setting>
    <Setting Target="Adapter" Name="Port">21501</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Ophtalmo\Hud</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Ophtalmo\Hud</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="WishBdocBruAdtHl7TcpOut" Category="A-Wish,A-Bdoc,A-Refmed,A-Medecin,T-ADT,T-GDR" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers le DPI (Bdoc)" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">21951</Setting>
    <Setting Target="Adapter" Name="IPAddress">SPICA</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="WishGlimsCyberlabAllAdtHl7TcpOut" Category="A-Wish,A-Glims,T-ADT" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie des données administratives de Wish Brugmann vers Glims CyberLab" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">21631</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Glims\CyberLab\All</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Glims\CyberLab\All</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.10.8.43</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="WishBrainRtHudAdtHl7TcpOut" Category="A-Wish,A-BrainRt,T-ADT" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Adt Wish vers Brainrt (labo sommeil Huderf)" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">huBrainRT</Setting>
    <Setting Target="Adapter" Name="Port">21121</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\BrainRT\Hud</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\BrainRT\Hud</Setting>
  </Item>
  <Item Name="WishOperaBruAdtHl7TcpOut" Category="A-Wish,A-Opera,T-ADT" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des données adminsitratives patient de Wish vers Opera" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">BROPERAINT01</Setting>
    <Setting Target="Adapter" Name="Port">21591</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\opera\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\opera\Bru</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="WishAgfaNewBruAdtHl7TcpOut" Category="A-Wish,A-Agfa,T-ADT" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie des données administratives patients de Wish vers Agfa-Quadrat Brugmann" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">brRisIN01</Setting>
    <Setting Target="Adapter" Name="Port">21651</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\NewAgfa\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\NewAgfa\Bru</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
  </Item>
  <Item Name="WishBdocPrepHudAdtHl7TcpOut" Category="A-Wish,A-Bdoc,T-ADT" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers le DPI (Bdoc)" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">21721</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.26</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="WishCacheAllMedHl7FcpOut" Category="A-Wish,A-Ciges,A-Medecin,A-Cache" ClassName="CHUBXL.BO.NEW.Hl7FcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers Datameal" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="NoFailWhileDisconnected">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\PROD\Wish\Medecin\archive\All</Setting>
    <Setting Target="Host" Name="SystemDestination">Cache</Setting>
    <Setting Target="Host" Name="SystemSource">Wish</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\PROD\Wish\Medecin\archive\All</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7">\\brdevtask1\FTPincoming$\WishMFN</Setting>
    <Setting Target="Host" Name="RPFileHL7"></Setting>
  </Item>
  <Item Name="WishEcareBruMedHl7FcpOut" Category="A-Medecin,A-Ecare" ClassName="CHUBXL.BO.NEW.Hl7FcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Transmission des données médecin vers Ecare" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">Medecin</Setting>
    <Setting Target="Host" Name="SystemDestination">Ecare</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\PROD\Medecin\out\Ecare\Bru</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7">\\brecareprod\hl7\gp\inbox\</Setting>
    <Setting Target="Host" Name="RPFileHL7">G:\PROD\Medecin\out\Ecare\Bru</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\PROD\Medecin\out\Ecare\Bru</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="BdocAllDocRouting" Category="A-Bdoc,A-Mv,T-DOC" ClassName="CHUBXL.BP.NEW.BdocHl7Routing" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Routage des rapports de Bdoc" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="BdocAllHcRouting" Category="A-Bdoc,A-HealthConnect" ClassName="CHUBXL.BP.NEW.BdocHcRouting" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Routage des résultats Bdoc vers MediBridge" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="BdocHudDocHl7FcpIn" Category="A-Bdoc,A-Mv,T-DOC" ClassName="CHUBXL.BS.NEW.BdocHl7FcpIn" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Reception des rapports de Bdoc HUDERF" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Bdoc\archive\Hud</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\ATAIR\b$\Export\MedicalViewer</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.ACK</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Bdoc\archive\Hud</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Binary</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="BdocBruDocHl7FcpIn" Category="A-Bdoc,A-Mv,T-DOC" ClassName="CHUBXL.BS.NEW.BdocHl7FcpIn" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Reception des rapports de Bdoc BRU" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\BDoc\archive\Bru</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\spica\a$\Export\MedicalViewer</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.ACK</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\BDoc\archive\Bru</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Binary</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="BdocMvAllDocHl7FcpOut" Category="A-Bdoc,A-Mv,T-DOC" ClassName="CHUBXL.BO.NEW.Hl7FcpOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des rapports de Bdoc) vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">Bdoc</Setting>
    <Setting Target="Host" Name="SystemDestination">MV</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\PROD\Bdoc\out\Mv\All</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\PROD\Bdoc\out\Mv\All</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7">\\Sharatan\ACScanImport$\BDoc\Hude</Setting>
    <Setting Target="Host" Name="RPFileHL7">\\Sharatan\ACScanImport$\BDoc\Hude</Setting>
  </Item>
  <Item Name="BdocBruHcHealthoneFcpIn" Category="A-Bdoc,A-HealthConnect,T-HC" ClassName="CHUBXL.BS.NEW.BdocHcFcpIn" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Bdoc pour Medibridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Medibridge\archive\Bru</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\SPICA\a$\Export\Medibridge\HEALTHONE</Setting>
    <Setting Target="Adapter" Name="FileSpec">HEA*.*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Medibridge\archive\Bru</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="BdocBruHcMedidocFcpIn" Category="A-Bdoc,A-HealthConnect" ClassName="CHUBXL.BS.NEW.BdocHcFcpIn" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Bdoc  pour Medibridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Medibridge\archive\Bru</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\SPICA\a$\Export\Medibridge\MEDIDOC</Setting>
    <Setting Target="Adapter" Name="FileSpec">DOC*.*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Medibridge\archive\Bru</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="BdocBruHcMedimailFcpIn" Category="A-Bdoc,A-HealthConnect,T-HC" ClassName="CHUBXL.BS.NEW.BdocHcFcpIn" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Bdoc  pour Medibridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Medibridge\archive\Bru</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\SPICA\a$\Export\Medibridge\MEDIMAIL</Setting>
    <Setting Target="Adapter" Name="FileSpec">MM*.*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Medibridge\archive\Bru</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="BdocBruHcSocrateFcpIn" Category="A-Bdoc,A-HealthConnect" ClassName="CHUBXL.BS.NEW.BdocHcFcpIn" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Bdoc  pour Medibridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Medibridge\archive\Bru</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\SPICA\a$\Export\Medibridge\SOCRATE</Setting>
    <Setting Target="Adapter" Name="FileSpec">SO*.*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Medibridge\archive\Bru</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="BdocBruHcTexteFcpIn" Category="A-Bdoc,A-HealthConnect,T-HC" ClassName="CHUBXL.BS.NEW.BdocHcFcpIn" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Bdoc  pour Medibridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Medibridge\archive\Bru</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\SPICA\a$\Export\Medibridge\TEXTE</Setting>
    <Setting Target="Adapter" Name="FileSpec">TXT*.*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Medibridge\archive\Bru</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="BdocAllHcHealthoneFcpOut" Category="A-Bdoc,A-HealthConnect,T-HC" ClassName="CHUBXL.BO.NEW.AllFcpOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de Bdoc vers MediBridge format hone" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\brmedbrid01\Interfaces\In\BDOC-HEALTHONE</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="BdocAllHcMedidocFcpOut" Category="A-Bdoc,A-HealthConnect" ClassName="CHUBXL.BO.NEW.AllFcpOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de Bdoc vers MediBridge format BJP" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\brmedbrid01\Interfaces\In\BDOC-MEDIDOC</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="BdocAllHcMedimailFcpOut" Category="A-Bdoc,A-HealthConnect,T-HC" ClassName="CHUBXL.BO.NEW.AllFcpOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de Bdoc vers MediBridge format Medar" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\brmedbrid01\Interfaces2\byxml</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="BdocAllHcSocrateFcpOut" Category="A-Bdoc,A-HealthConnect" ClassName="CHUBXL.BO.NEW.AllFcpOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de Bdoc vers MediBridge format Medidoc" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\brmedbrid01\Interfaces\In\BDOC-SOCRATE</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="BdocAllHcTexteFcpOut" Category="A-Bdoc,A-HealthConnect,T-HC" ClassName="CHUBXL.BO.NEW.AllFcpOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de Bdoc vers MediBridge format Medigest" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\brmedbrid01\Interfaces\In\BDOC-TEXTE</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="BdocHudHcHealthoneFcpIn" Category="A-Bdoc,A-HealthConnect,T-HC" ClassName="CHUBXL.BS.NEW.BdocHcFcpIn" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Bdoc pour Medibridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Medibridge\archive\Hud</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\ATAIR\b$\Export\Medibridge\HEALTHONE</Setting>
    <Setting Target="Adapter" Name="FileSpec">HEA*.*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Medibridge\archive\Hud</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="BdocHudHcMedidocFcpIn" Category="A-Bdoc,A-HealthConnect,T-HC" ClassName="CHUBXL.BS.NEW.BdocHcFcpIn" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Bdoc  pour Medibridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Medibridge\archive\Hud</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\ATAIR\b$\Export\Medibridge\MEDIDOC</Setting>
    <Setting Target="Adapter" Name="FileSpec">DOC*.*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Medibridge\archive\Hud</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="BdocHudHcMedimailFcpIn" Category="A-Bdoc,A-HealthConnect" ClassName="CHUBXL.BS.NEW.BdocHcFcpIn" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Bdoc  pour Medibridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Medibridge\archive\Hud</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\ATAIR\b$\Export\Medibridge\MEDIMAIL</Setting>
    <Setting Target="Adapter" Name="FileSpec">MM*.*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Medibridge\archive\Hud</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="BdocHudHcSocrateFcpIn" Category="A-Bdoc,A-HealthConnect,T-HC" ClassName="CHUBXL.BS.NEW.BdocHcFcpIn" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Bdoc  pour Medibridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Medibridge\archive\Hud</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\ATAIR\b$\Export\Medibridge\SOCRATE</Setting>
    <Setting Target="Adapter" Name="FileSpec">SO*.*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Medibridge\archive\Hud</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="BdocHudHcTexteFcpIn" Category="A-Bdoc,A-HealthConnect,T-HC" ClassName="CHUBXL.BS.NEW.BdocHcFcpIn" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Bdoc  pour Medibridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Medibridge\archive\Hud</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\ATAIR\b$\Export\Medibridge\TEXTE</Setting>
    <Setting Target="Adapter" Name="FileSpec">TXT*.*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Medibridge\archive\Hud</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="AgfaAllDocRouting" Category="A-Agfa,T-DOC" ClassName="CHUBXL.BP.NEW.AgfaDocHl7Routing" PoolSize="1" Enabled="true" Foreground="false" Comment="Routing résultats Quadrat-Agfa HL7 ORU vers DPI" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="AgfaAllImgRouting" Category="A-Agfa,T-IMG" ClassName="CHUBXL.BP.NEW.AgfaImgHl7Routing" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des informations pour l&apos;imagerie d&apos;Agfa vers Bdoc" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="AgfaAllRdvRouting" Category="A-Agfa,T-RDV" ClassName="CHUBXL.BP.NEW.AgfaRdvHl7Routing" PoolSize="1" Enabled="true" Foreground="false" Comment="Rendez-vous QPlanner vers DPIO" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="AgfaMvAllDocRouting" Category="A-Agfa,A-Mv,T-DOC" ClassName="CHUBXL.BP.NEW.AgfaDocXmlRouting" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Routage des rapports de la radiologie et de QDReport" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="AgfaBruDocHl7TcpIn" Category="A-Agfa,T-DOC,MIT" ClassName="CHUBXL.BS.NEW.AgfaHl7TcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Résultats Quadrat-Agfa vers DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">21873</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\AgfaORU\archive\Bru</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="ConnectionName">AgfaBruDocHl7TcpIn</Setting>
    <Setting Target="Adapter" Name="UseStream">1</Setting>
  </Item>
  <Item Name="AgfaBruDocXmlTcpInNew" Category="A-Agfa,A-Mv,T-DOC,MIT,NewRis" ClassName="CHUBXL.BS.NEW.AgfaXmlTcpIn" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Reception des rapports de radiologie et de QDReport pour Brugmann" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Agfa\archive\BruNew</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="Starter">11</Setting>
    <Setting Target="Adapter" Name="EndOfText">4</Setting>
    <Setting Target="Adapter" Name="Terminator">10</Setting>
    <Setting Target="Adapter" Name="MaxMessagesPerIteration">5</Setting>
    <Setting Target="Adapter" Name="AllowedOutOfSequenceStarters">1</Setting>
    <Setting Target="Adapter" Name="Ack">6</Setting>
    <Setting Target="Adapter" Name="Nack">15</Setting>
    <Setting Target="Adapter" Name="ConnectionName">QuadratTcpIn</Setting>
    <Setting Target="Adapter" Name="SourceName">quadratbru</Setting>
    <Setting Target="Adapter" Name="UseStream">1</Setting>
    <Setting Target="Adapter" Name="JobPerConnection">1</Setting>
    <Setting Target="Adapter" Name="AllowedIPAddresses"></Setting>
    <Setting Target="Adapter" Name="QSize">100</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
    <Setting Target="Adapter" Name="Port">21235</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="AgfaBruDocHl7TcpInNew" Category="A-Agfa,T-DOC,MIT,NewRis" ClassName="CHUBXL.BS.NEW.AgfaHl7TcpIn" PoolSize="1" Enabled="false" Foreground="false" Comment="Résultats Quadrat-Agfa vers DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">21875</Setting>
    <Setting Target="Adapter" Name="ConnectionName">AgfaNew</Setting>
    <Setting Target="Adapter" Name="MaxMessagesPerIteration">5</Setting>
    <Setting Target="Adapter" Name="SourceName">ORU</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\AgfaORU\archive\BruNew</Setting>
    <Setting Target="Adapter" Name="UseStream">1</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="AgfaBruRdvHl7TcpInNew" Category="A-Agfa,T-RDV,MIT,NewRis" ClassName="CHUBXL.BS.NEW.AgfaHl7TcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Rendez-vous QPlanner vers DPI" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Port">21715</Setting>
    <Setting Target="Adapter" Name="MaxMessagesPerIteration">5</Setting>
    <Setting Target="Adapter" Name="ConnectionName">QuadratRVTcpIn</Setting>
    <Setting Target="Adapter" Name="SourceName">QPlanner</Setting>
    <Setting Target="Adapter" Name="UseStream">1</Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\AgfaRV\archive\BruNew</Setting>
  </Item>
  <Item Name="AgfaHudDocHl7TcpIn" Category="A-Agfa,T-DOC,MIT" ClassName="CHUBXL.BS.NEW.AgfaHl7TcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Résultats Quadrat-Agfa vers DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">21841</Setting>
    <Setting Target="Adapter" Name="ConnectionName">Agfa</Setting>
    <Setting Target="Adapter" Name="MaxMessagesPerIteration">5</Setting>
    <Setting Target="Adapter" Name="SourceName">Résultats</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\AgfaORU\archive\Hud</Setting>
    <Setting Target="Adapter" Name="UseStream">1</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="AgfaBruDocXmlTcpIn" Category="A-Agfa,A-Mv,T-DOC,MIT" ClassName="CHUBXL.BS.NEW.AgfaXmlTcpIn" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Reception des rapports de radiologie et de QDReport pour Brugmann" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\AGFA\archive\Bru</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="Starter">11</Setting>
    <Setting Target="Adapter" Name="EndOfText">4</Setting>
    <Setting Target="Adapter" Name="Terminator">10</Setting>
    <Setting Target="Adapter" Name="MaxMessagesPerIteration">5</Setting>
    <Setting Target="Adapter" Name="AllowedOutOfSequenceStarters">1</Setting>
    <Setting Target="Adapter" Name="Ack">6</Setting>
    <Setting Target="Adapter" Name="Nack">15</Setting>
    <Setting Target="Adapter" Name="ConnectionName">AgfaTcpIn</Setting>
    <Setting Target="Adapter" Name="SourceName">AgfaBru</Setting>
    <Setting Target="Adapter" Name="UseStream">1</Setting>
    <Setting Target="Adapter" Name="JobPerConnection">1</Setting>
    <Setting Target="Adapter" Name="AllowedIPAddresses"></Setting>
    <Setting Target="Adapter" Name="QSize">100</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
    <Setting Target="Adapter" Name="Port">21231</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="AgfaHudDocXmlTcpIn" Category="A-Agfa,A-Mv,T-DOC,MIT" ClassName="CHUBXL.BS.NEW.AgfaXmlTcpIn" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Reception des rapports de radiologie et de QDReport pour l&apos;HUDERF" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Agfa\archive\Hud</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="Starter">11</Setting>
    <Setting Target="Adapter" Name="EndOfText">4</Setting>
    <Setting Target="Adapter" Name="Terminator">10</Setting>
    <Setting Target="Adapter" Name="MaxMessagesPerIteration">5</Setting>
    <Setting Target="Adapter" Name="AllowedOutOfSequenceStarters">1</Setting>
    <Setting Target="Adapter" Name="Ack">6</Setting>
    <Setting Target="Adapter" Name="Nack">15</Setting>
    <Setting Target="Adapter" Name="ConnectionName">AgfaTcpIn</Setting>
    <Setting Target="Adapter" Name="SourceName">AgfaHud</Setting>
    <Setting Target="Adapter" Name="UseStream">1</Setting>
    <Setting Target="Adapter" Name="JobPerConnection">0</Setting>
    <Setting Target="Adapter" Name="AllowedIPAddresses"></Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
    <Setting Target="Adapter" Name="Port">21241</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="AgfaBdocBruDocHl7FcpOut" Category="A-Agfa,A-Bdoc,T-DOC" ClassName="CHUBXL.BO.NEW.Hl7okFcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Résultats HUDERF Quadrat vers DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="SystemDestination">Bdoc</Setting>
    <Setting Target="Host" Name="SystemSource">Agfa</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\PROD\AgfaORU\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\PROD\AgfaORU\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\SPICA\a$\Integrations-Br\Documents\</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\SPICA\a$\Integrations-Br\Documents\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\SPICA\a$\Integrations-Br\Documents\</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
  </Item>
  <Item Name="AgfaBdocprepBruDocHl7FcpOut" Category="A-Agfa,A-Bdoc,T-DOC" ClassName="CHUBXL.BO.NEW.Hl7okFcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Résultats HUDERF Quadrat vers DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="SystemDestination">Bdoc</Setting>
    <Setting Target="Host" Name="SystemSource">Agfa</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\PREP\AgfaORU\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\PREP\AgfaORU\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\bohrium\f$\Integrations-Br\Documents\</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\bohrium\f$\Integrations-Br\Documents\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\bohrium\f$\Integrations-Br\Documents\</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
  </Item>
  <Item Name="AgfaBdocHudDocHl7FcpOut" Category="A-Agfa,A-Bdoc,T-DOC" ClassName="CHUBXL.BO.NEW.Hl7okFcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Résultats HUDERF Quadrat vers DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="SystemDestination">DPI</Setting>
    <Setting Target="Host" Name="SystemSource">Quadrat-Agfa</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\PROD\AgfaORU\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\PROD\AgfaORU\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\ATAIR\b$\Integrations\Documents\</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\ATAIR\b$\Integrations\Documents\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\ATAIR\b$\Integrations\Documents\</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
  </Item>
  <Item Name="AgfaBdocprepHudDocHl7FcpOut" Category="A-Agfa,A-Bdoc,T-DOC" ClassName="CHUBXL.BO.NEW.Hl7okFcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Résultats HUDERF Quadrat vers DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="SystemDestination">DPI</Setting>
    <Setting Target="Host" Name="SystemSource">Quadrat-Agfa</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\PREP\AgfaORU\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\PREP\AgfaORU\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\bohrium\f$\Integrations\Documents\</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\bohrium\f$\Integrations\Documents\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\bohrium\f$\Integrations\Documents\</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
  </Item>
  <Item Name="AgfaMvAllDocXmlFcpOut" Category="A-Agfa,A-Mv,T-DOC" ClassName="CHUBXL.BO.NEW.XmlFcpOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats Quadrat vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">AGFA</Setting>
    <Setting Target="Host" Name="SystemDestination">MV</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\PROD\Agfa\out\Mv\All</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\PROD\Agfa\out\Mv\All</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\Sharatan\ACScanImport$\RTF1\QUADRAT</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\Sharatan\ACScanImport$\RTF1\QUADRAT</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\Sharatan\ACScanImport$\RTF1\QUADRAT\</Setting>
    <Setting Target="Host" Name="ExtentionBLOB">RTF</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\PROD\Agfa\out\Mv\All</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="AgfaWishBruRdvHl7FcpOut" Category="A-Wish,A-Agfa,T-RDV" ClassName="CHUBXL.BO.NEW.Hl7FcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers Datameal" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="NoFailWhileDisconnected">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\PROD\AgfaRV\out\Wish\Bru</Setting>
    <Setting Target="Host" Name="SystemDestination">Wish</Setting>
    <Setting Target="Host" Name="SystemSource">Quadrat</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\PROD\AgfaRV\out\Wish\Bru</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7">\\Brwitfio01\HL7$\HL7\IN</Setting>
    <Setting Target="Host" Name="RPFileHL7"></Setting>
  </Item>
  <Item Name="AgfaWishHudRdvHl7FcpOut" Category="A-Wish,A-Agfa,T-RDV" ClassName="CHUBXL.BO.NEW.Hl7FcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers Datameal" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="NoFailWhileDisconnected">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\PROD\AgfaRV\out\Wish\Hud</Setting>
    <Setting Target="Host" Name="SystemDestination">Wish</Setting>
    <Setting Target="Host" Name="SystemSource">Quadrat</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\PROD\AgfaRV\out\Wish\Hud</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7">\\Brwitfio01\HL7$\HL7HUD\IN</Setting>
    <Setting Target="Host" Name="RPFileHL7"></Setting>
  </Item>
  <Item Name="AgfaBdocBruImgHl7TcpOut" Category="A-Agfa,A-Bdoc" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des références d&apos;imagerie d&apos;Agfa vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">SPICA</Setting>
    <Setting Target="Adapter" Name="Port">21971</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\AgfaORM\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\AgfaORM\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="AgfaBdocBruImgHl7TcpFwd" Category="A-Agfa,A-Bdoc,T-IMG" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des références d&apos;imagerie d&apos;Agfa vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">10.20.8.26</Setting>
    <Setting Target="Adapter" Name="Port">21921</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PREP\AgfaORM\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PREP\AgfaORM\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="AgfaBdocHudImgHl7TcpOut" Category="A-Agfa,A-Bdoc" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des références d&apos;imagerie d&apos;Agfa vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">ATAIR</Setting>
    <Setting Target="Adapter" Name="Port">21791</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\AgfaORM\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\AgfaORM\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="AgfaBdocHudImgHl7FcpFwd" Category="A-Agfa,A-Bdoc,T-IMG" ClassName="CHUBXL.BO.NEW.Hl7FcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Imagerie vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">G:\PREP\AgfaORM\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7"></Setting>
    <Setting Target="Host" Name="SystemDestination">DPI</Setting>
    <Setting Target="Host" Name="SystemSource">Agfa</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7">\\10.20.8.10\d$\dataTEST\QUADRAT\in</Setting>
    <Setting Target="Host" Name="RPFileHL7"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="AgfaBruImgHl7TcpIn" Category="A-Agfa,T-IMG,MIT" ClassName="CHUBXL.BS.NEW.AgfaHl7TcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des informations pour l&apos;imagerie d&apos;Agfa vers Bdoc" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">21922</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="UseStream">1</Setting>
    <Setting Target="Adapter" Name="ConnectionName">AgfaORMTcpIn</Setting>
    <Setting Target="Adapter" Name="SourceName">AgfaImagerie</Setting>
    <Setting Target="Adapter" Name="MaxMessagesPerIteration">5</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\AgfaORM\archive\Bru</Setting>
  </Item>
  <Item Name="AgfaBruImgHl7TcpInNew" Category="A-Agfa,T-IMG,MIT,NewRis" ClassName="CHUBXL.BS.NEW.AgfaHl7TcpIn" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des informations pour l&apos;imagerie d&apos;Agfa vers BDoc" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">21925</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="UseStream">1</Setting>
    <Setting Target="Adapter" Name="ConnectionName">QuadratORMTcpIn</Setting>
    <Setting Target="Adapter" Name="SourceName">AgfaImagerie</Setting>
    <Setting Target="Adapter" Name="MaxMessagesPerIteration">5</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\QUADRATORM\archive\BRU</Setting>
  </Item>
  <Item Name="AgfaHudImgHl7TcpIn" Category="A-Agfa,T-IMG,MIT" ClassName="CHUBXL.BS.NEW.AgfaHl7TcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des informations pour l&apos;imagerie d&apos;Agfa vers Bdoc" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">21831</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="UseStream">1</Setting>
    <Setting Target="Adapter" Name="ConnectionName">QuadratORMTcpIn</Setting>
    <Setting Target="Adapter" Name="SourceName">AgfaImagerie</Setting>
    <Setting Target="Adapter" Name="MaxMessagesPerIteration">5</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\AgfaORM\archive\Hud</Setting>
  </Item>
  <Item Name="AgfaeiBruImgHl7TcpIn" Category="A-Agfa,T-IMG,MIT" ClassName="CHUBXL.BS.NEW.Hl7MllpTcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Messages ORM EI Quadrat-Agfa vers DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">21932</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\AgfaORM\archive\Bruei</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="JobPerConnection">1</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">2.3</Setting>
    <Setting Target="Host" Name="TargetConfigNames">AgfaAllImgRouting</Setting>
  </Item>
  <Item Name="AgfaBruRdvHl7TcpIn" Category="A-Agfa,T-RDV,MIT" ClassName="CHUBXL.BS.NEW.AgfaHl7TcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Rendez-vous QPlanner vers DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">21711</Setting>
    <Setting Target="Adapter" Name="MaxMessagesPerIteration">5</Setting>
    <Setting Target="Adapter" Name="ConnectionName">QuadratRVTcpIn</Setting>
    <Setting Target="Adapter" Name="SourceName">QPlanner</Setting>
    <Setting Target="Adapter" Name="UseStream">1</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\AgfaRV\archive\Bru</Setting>
  </Item>
  <Item Name="AgfaHudRdvHl7TcpIn" Category="A-Agfa,T-RDV,MIT" ClassName="CHUBXL.BS.NEW.AgfaHl7TcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Rendez-vous QPlanner HUDERF vers Wish" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">21751</Setting>
    <Setting Target="Adapter" Name="MaxMessagesPerIteration">5</Setting>
    <Setting Target="Adapter" Name="ConnectionName">QuadratRVTcpIn</Setting>
    <Setting Target="Adapter" Name="SourceName">QPlanner</Setting>
    <Setting Target="Adapter" Name="UseStream">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\AgfaRV\archive\Hud</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="AgfaBdocBruRdvHl7TcpOut" Category="A-Bdoc,A-Agfa,T-RDV" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des rendez-vous QPlanner H.U.D.E.R.F. vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\AgfaRV\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">G:\PROD\AgfaRV\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Adapter" Name="IPAddress">SPICA</Setting>
    <Setting Target="Adapter" Name="Port">21961</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="AgfaBdocBruRdvHl7TcpFwd" Category="A-Bdoc,A-Agfa,T-RDV" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des rendez-vous QPlanner H.U.D.E.R.F. vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\PREP\AgfaRV\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">G:\PREP\AgfaRV\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.26</Setting>
    <Setting Target="Adapter" Name="Port">21911</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="AgfaBdocHudRdvHl7TcpOut" Category="A-Bdoc,A-Agfa,T-RDV" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des rendez-vous QPlanner H.U.D.E.R.F. vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\AgfaRV\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">G:\PROD\AgfaRV\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Adapter" Name="IPAddress">ATAIR</Setting>
    <Setting Target="Adapter" Name="Port">21781</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="AgfaBdocHudRdvHl7FcpFwd" Category="A-Bdoc,A-Agfa,T-RDV" ClassName="CHUBXL.BO.NEW.Hl7FcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie rendez-vous APlanner vers DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="SystemDestination">DPI</Setting>
    <Setting Target="Host" Name="SystemSource">QPlanner</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\PREP\AgfaRV\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7"></Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7">g:\PROD\AgfaRV\in</Setting>
    <Setting Target="Host" Name="RPFileHL7"></Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
  </Item>
  <Item Name="GlimsAllLabRouting" Category="A-Glims,T-LAB" ClassName="CHUBXL.BP.NEW.GlimsHl7Routing" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Routage des analyses de laboratoire" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">15</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="GlimsAllMFURouting" Category="A-Glims,T-LAB,T-MFU" ClassName="CHUBXL.BP.NEW.GlimsHl7MFURouting" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="GlimsAllHcRouting" Category="A-Glims,A-HealthConnect,T-HC" ClassName="CHUBXL.BP.NEW.GlimsHcRouting" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Routage des résultats de laboratoire vers MediBridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="GlimsabruHudDocHl7FcpIn" Category="A-Glims,T-DOC" ClassName="CHUBXL.BS.NEW.GlimsPdfFcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie des résultats labo vers Abrumet" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">\\chubxl.be\data\glims-partage\bDOC\HUDERF</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.PDF</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Glimsabru\archive\Hud</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="GlimsabruBruDocHl7FcpIn" Category="A-Glims,T-DOC" ClassName="CHUBXL.BS.NEW.GlimsPdfFcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie des résultats labo vers Abrumet" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">\\chubxl.be\data\glims-partage\bDOC\HBR</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.PDF</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Glimsabru\archive\Bru</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="GlimsBdocabruBruDocHl7FcpFwd" Category="A-Glims,A-Bdoc,T-DOC" ClassName="CHUBXL.BO.NEW.Hl7okFcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie résultat Ecare vers MediWeb Brugmann" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">GLIMSABRU</Setting>
    <Setting Target="Host" Name="SystemDestination">BdocPrep_Bru</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\PROD\Glimsabru\out\Bdoc\Bru</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\10.20.8.26\f$\Integrations-Br\DocumentsLabo\</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\10.20.8.26\f$\Integrations-Br\DocumentsLabo\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\10.20.8.26\f$\Integrations-Br\DocumentsLabo\</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\PROD\Glimsabru\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\PROD\Glimsabru\out\Bdoc\Bru</Setting>
  </Item>
  <Item Name="GlimsBdocabruBruDocHl7FcpOut" Category="A-Glims,A-Bdoc,T-DOC" ClassName="CHUBXL.BO.NEW.Hl7okFcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie résultat Ecare vers MediWeb Brugmann" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">GLIMSABRU</Setting>
    <Setting Target="Host" Name="SystemDestination">Bdoc_Bru</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\PROD\Glimsabru\out\Bdoc\Bru</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\spica\a$\Integrations-Br\DocumentsLABO\</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\spica\a$\Integrations-Br\DocumentsLABO\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\spica\a$\Integrations-Br\DocumentsLABO\</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\PROD\Glimsabru\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\PROD\Glimsabru\out\Bdoc\Bru</Setting>
  </Item>
  <Item Name="GlimsBdocabruHudDocHl7FcpOut" Category="A-Glims,A-Bdoc" ClassName="CHUBXL.BO.NEW.Hl7okFcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie résultat Ecare vers MediWeb Brugmann" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">GLIMSABRU</Setting>
    <Setting Target="Host" Name="SystemDestination">Bdoc_Hud</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\PROD\Glimsabru\out\Bdoc\Hud</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\atair\b$\Integrations\DocumentsLABO\</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\atair\b$\Integrations\DocumentsLABO\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\atair\b$\Integrations\DocumentsLABO\</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\PROD\Glimsabru\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\PROD\Glimsabru\out\Bdoc\Hud</Setting>
  </Item>
  <Item Name="GlimsMvabruMvAllDocXmlFcpOut" Category="A-Glims,T-DOC,T-LAB" ClassName="CHUBXL.BO.NEW.XmlFcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie des iReport Glims vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ExtentionBLOB">pdf</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\Sharatan\ACScanImport$\PDF1\GLIMS\</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\PROD\Glimsabru\out\Mv\All</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\PROD\Glimsabru\out\Mv\All</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\Sharatan\ACScanImport$\PDF1\GLIMS\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\Sharatan\ACScanImport$\PDF1\GLIMS\</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="SystemDestination">MV</Setting>
    <Setting Target="Host" Name="SystemSource">GLIMS</Setting>
  </Item>
  <Item Name="GlimsAllHchoneFcpIn" Category="A-Glims,A-HealthConnect,T-HC" ClassName="CHUBXL.BS.NEW.GlimsHcFcpIn" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Labo Glims pour Medibridge" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Medibridge\archive\all</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\chubxl.be\data\glims-partage\MEDIBRIDGE\HBR\out\HEALTHONE</Setting>
    <Setting Target="Adapter" Name="FileSpec">H1*.*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Medibridge\archive\all</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="GlimsAllHcBJPFcpIn" Category="A-Glims,A-HealthConnect,T-HC" ClassName="CHUBXL.BS.NEW.GlimsHcFcpIn" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Labo Glims pour Medibridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Medibridge\archive\all</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\chubxl.be\data\glims-partage\MEDIBRIDGE\HBR\out\BJP</Setting>
    <Setting Target="Adapter" Name="FileSpec">BJP*.*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Medibridge\archive\all</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="GlimsAllHcMedarFcpIn" Category="A-Glims,A-HealthConnect,T-HC" ClassName="CHUBXL.BS.NEW.GlimsHcFcpIn" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Labo Glims pour Medibridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Medibridge\archive\all</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\chubxl.be\data\glims-partage\MEDIBRIDGE\HBR\out\Medar</Setting>
    <Setting Target="Adapter" Name="FileSpec">Mdar*.*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Medibridge\archive\all</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="GlimsAllHcMedidocFcpIn" Category="A-Glims,A-HealthConnect,T-HC" ClassName="CHUBXL.BS.NEW.GlimsHcFcpIn" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Labo Glims pour Medibridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Medibridge\archive\all</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\chubxl.be\data\glims-partage\MEDIBRIDGE\HBR\out\MEDIDOC</Setting>
    <Setting Target="Adapter" Name="FileSpec">MDoc*.*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Medibridge\archive\all</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="GlimsAllHcMedigestFcpIn" Category="A-Glims,A-HealthConnect,T-HC" ClassName="CHUBXL.BS.NEW.GlimsHcFcpIn" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Labo Glims pour Medibridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Medibridge\archive\all</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\chubxl.be\data\glims-partage\MEDIBRIDGE\HBR\out\MEDIGEST</Setting>
    <Setting Target="Adapter" Name="FileSpec">MGes*.*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Medibridge\archive\all</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
    <Setting Target="Host" Name="BusinessPartner"></Setting>
  </Item>
  <Item Name="GlimsAllHcSocrateFcpIn" Category="A-Glims,A-HealthConnect,T-HC" ClassName="CHUBXL.BS.NEW.GlimsHcFcpIn" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Labo Glims pour Medibridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Medibridge\archive\all</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\chubxl.be\data\glims-partage\MEDIBRIDGE\HBR\out\Socrate</Setting>
    <Setting Target="Adapter" Name="FileSpec">Soc*.*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Medibridge\archive\all</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="GlimsAllHchoneFcpOut" Category="A-Glims,A-HealthConnect,T-HC" ClassName="CHUBXL.BO.NEW.AllFcpOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers MediBridge format hone" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\brmedbrid01\Interfaces\in\h1-lab</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="GlimsAllHcBJPFcpOut" Category="A-Glims,A-HealthConnect,T-HC" ClassName="CHUBXL.BO.NEW.AllFcpOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers MediBridge format BJP" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\brmedbrid01\Interfaces\in\bjp-lab</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="GlimsAllHcMedarFcpOut" Category="A-Glims,A-HealthConnect,T-HC" ClassName="CHUBXL.BO.NEW.AllFcpOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers MediBridge format Medar" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\brmedbrid01\Interfaces\in\ala-lab</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="GlimsAllHcMedidocFcpOut" Category="A-Glims,A-HealthConnect,T-HC" ClassName="CHUBXL.BO.NEW.AllFcpOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers MediBridge format Medidoc" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\brmedbrid01\Interfaces\in\dma-lab</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="GlimsAllHcMedigestFcpOut" Category="A-Glims,A-HealthConnect,T-HC" ClassName="CHUBXL.BO.NEW.AllFcpOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers MediBridge format Medigest" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\brmedbrid01\Interfaces\in\cog-lab</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="GlimsAllHcSocrateFcpOut" Category="A-Glims,A-HealthConnect" ClassName="CHUBXL.BO.NEW.AllFcpOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers MediBridge format  Socrate" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\brmedbrid01\Interfaces\in\cec-lab</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="GlimsAllLabHl7FcpIn" Category="A-Glims" ClassName="CHUBXL.BS.NEW.GlimsHl7FcpIn" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Labo Glims" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Glims\archive\All</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\PROD\Glims\in</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Glims\archive\All</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="GlimsBruLabHl7TcpIn" Category="A-Glims,T-LAB,MIT" ClassName="CHUBXL.BS.NEW.GlimsHl7TcpIn" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Reception des résultats de laboratoire pour Brugmann (Glims)" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Glims\archive\Bru</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="Starter">11</Setting>
    <Setting Target="Adapter" Name="EndOfText">4</Setting>
    <Setting Target="Adapter" Name="Terminator">10</Setting>
    <Setting Target="Adapter" Name="MaxMessagesPerIteration">5</Setting>
    <Setting Target="Adapter" Name="AllowedOutOfSequenceStarters">1</Setting>
    <Setting Target="Adapter" Name="Ack">6</Setting>
    <Setting Target="Adapter" Name="Nack">15</Setting>
    <Setting Target="Adapter" Name="ConnectionName">GlimsBRUTcpIn</Setting>
    <Setting Target="Adapter" Name="SourceName">glimsbru</Setting>
    <Setting Target="Adapter" Name="UseStream">1</Setting>
    <Setting Target="Adapter" Name="JobPerConnection">0</Setting>
    <Setting Target="Adapter" Name="AllowedIPAddresses"></Setting>
    <Setting Target="Adapter" Name="QSize">100</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
    <Setting Target="Adapter" Name="Port">21191</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="GlimsHudLabHl7TcpIn" Category="A-Glims,T-LAB,MIT" ClassName="CHUBXL.BS.NEW.GlimsHl7TcpIn" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Reception des résultats de laboratoire pour HUDERF (Glims)" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Glims\archive\Hud</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="Starter">11</Setting>
    <Setting Target="Adapter" Name="EndOfText">4</Setting>
    <Setting Target="Adapter" Name="Terminator">10</Setting>
    <Setting Target="Adapter" Name="MaxMessagesPerIteration">5</Setting>
    <Setting Target="Adapter" Name="AllowedOutOfSequenceStarters">1</Setting>
    <Setting Target="Adapter" Name="Ack">6</Setting>
    <Setting Target="Adapter" Name="Nack">15</Setting>
    <Setting Target="Adapter" Name="ConnectionName">GlimsHUDTcpIn</Setting>
    <Setting Target="Adapter" Name="SourceName">glimshud</Setting>
    <Setting Target="Adapter" Name="UseStream">1</Setting>
    <Setting Target="Adapter" Name="JobPerConnection">0</Setting>
    <Setting Target="Adapter" Name="AllowedIPAddresses"></Setting>
    <Setting Target="Adapter" Name="QSize">100</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
    <Setting Target="Adapter" Name="Port">21351</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="GlimsIcipHudLabHl7TcpOut" Category="A-Glims,A-Icip,T-LAB" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers le logiciel des USI (ICIP) de l&apos;HUDERF" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Glims\out\Icip\Hud</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Glims\out\Icip\Hud</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="NoFailWhileDisconnected">0</Setting>
    <Setting Target="Host" Name="Separators"><![CDATA[|^~\&]]></Setting>
    <Setting Target="Host" Name="SearchTableClass"></Setting>
    <Setting Target="Host" Name="DefCharEncoding">Latin1</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="Framing">MLLP</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.109</Setting>
    <Setting Target="Adapter" Name="Port">12500</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">5</Setting>
    <Setting Target="Adapter" Name="ReconnectRetry">5</Setting>
    <Setting Target="Adapter" Name="GetReply">1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="GlimsEcareBruLabHl7FcpOut" Category="A-Glims,A-Ecare,T-LAB" ClassName="CHUBXL.BO.NEW.Hl7FcpOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers le logiciel des urgences (Ecare)  Brugmann" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">GLIMS</Setting>
    <Setting Target="Host" Name="SystemDestination">Ecare</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\PROD\Glims\out\Ecare\Bru</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7">\\brecareprod\Ecare_Transfers\GLIMS\Import</Setting>
    <Setting Target="Host" Name="RPFileHL7"></Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\PROD\Glims\out\Ecare\Bru</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="GlimsDialyseAllLabHl7TcpOut" Category="A-Glims,A-Dialyse,T-LAB" ClassName="CHUBXL.BO.NEW.RawTcpOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Trnsmission des résultats de laboratoire vers le logiciel de dialyse (hemadial)" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">GLIMS</Setting>
    <Setting Target="Host" Name="SystemDestination">DIALYSE</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Glims\out\Dialyse\All</Setting>
    <Setting Target="Host" Name="STX">11</Setting>
    <Setting Target="Host" Name="ETX">13</Setting>
    <Setting Target="Host" Name="EOT">10</Setting>
    <Setting Target="Host" Name="ACK">6</Setting>
    <Setting Target="Host" Name="NACK">15</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="IPAddress">brhema01</Setting>
    <Setting Target="Adapter" Name="Port">21282</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">15</Setting>
    <Setting Target="Adapter" Name="ReconnectRetry">5</Setting>
    <Setting Target="Adapter" Name="GetReply">1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="GlimsMvAllLabXmlFcpOut" Category="A-Glims,A-Mv" ClassName="CHUBXL.BO.NEW.XmlFcpOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers Medical Viewer" LogTraceEvents="false" Schedule="START:*-*-*T19:00:00,STOP:*-*-*T20:00:00">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">GLIMS</Setting>
    <Setting Target="Host" Name="SystemDestination">MV</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\PROD\Glims\out\Mv\All</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\PROD\Glims\out\Mv\All</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\Sharatan\ACScanImport$\PCL\GLIMS\</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\Sharatan\ACScanImport$\PCL\GLIMS\</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\Sharatan\ACScanImport$\PCL\GLIMS\</Setting>
    <Setting Target="Host" Name="ExtentionBLOB">PCL</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\chubxl.be\data\glims-partage\Medical Viewer\BRU\OUT</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="GlimsBdocBruLabHl7TcpOut" Category="A-Glims,A-Bdoc,T-LAB" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie des résultats laboratoire vers l&apos;environnement de test du DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Glims\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Glims\out\Bdoc\Bru</Setting>
    <Setting Target="Adapter" Name="IPAddress">SPICA</Setting>
    <Setting Target="Adapter" Name="Port">21981</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="GlimsBdocBruLabHl7TcpFwd" Category="A-Glims,A-Bdoc,T-LAB" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie des résultats laboratoire vers l&apos;environnement de test du DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Glims\out\BdocFwd\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Glims\out\BdocFwd\Bru</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.26</Setting>
    <Setting Target="Adapter" Name="Port">21931</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="GlimsBdocHudLabHl7TcpOut" Category="A-Glims,A-Bdoc" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie des résultats laboratoire vers l&apos;environnement de test du DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Glims\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Glims\out\Bdoc\Hud</Setting>
    <Setting Target="Adapter" Name="IPAddress">ATAIR</Setting>
    <Setting Target="Adapter" Name="Port">21801</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="GlimsBdocHudLabHl7TcpFwd" Category="A-Glims,A-Bdoc,T-LAB" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Transmission des réultats laboratoire HUDERF vers l&apos;environnement de PREPROD" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Glims\out\BdocFwd\Bru</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.26</Setting>
    <Setting Target="Adapter" Name="Port">21082</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="GlimsAllMFUHl7FcpIn" Category="A-Glims,T-LAB,T-MFU" ClassName="CHUBXL.BS.NEW.GlimsHl7FcpIn" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Labo Glims" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\GlimsMFU\archive\All</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\PROD\GlimsMFU\in</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\GlimsMFU\archive\All</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="GlimsAllMFUHl7TcpIn" Category="A-Glims,T-LAB,T-MFU" ClassName="CHUBXL.BS.NEW.GlimsHl7TcpIn" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Reception du fichier des analyses laboratoire " LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\GlimsMFU\archive\All</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="Starter">11</Setting>
    <Setting Target="Adapter" Name="EndOfText">4</Setting>
    <Setting Target="Adapter" Name="Terminator">10</Setting>
    <Setting Target="Adapter" Name="MaxMessagesPerIteration">5</Setting>
    <Setting Target="Adapter" Name="AllowedOutOfSequenceStarters">1</Setting>
    <Setting Target="Adapter" Name="Ack">6</Setting>
    <Setting Target="Adapter" Name="Nack">15</Setting>
    <Setting Target="Adapter" Name="ConnectionName">GlimsMFUTcpIn</Setting>
    <Setting Target="Adapter" Name="SourceName">glimsmfu</Setting>
    <Setting Target="Adapter" Name="UseStream">1</Setting>
    <Setting Target="Adapter" Name="JobPerConnection">0</Setting>
    <Setting Target="Adapter" Name="AllowedIPAddresses"></Setting>
    <Setting Target="Adapter" Name="QSize">100</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
    <Setting Target="Adapter" Name="Port">21401</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="GlimsGlimsBruMFUHl7FcpOut" Category="A-Glims,A-Agfa,T-LAB,T-MFU" ClassName="CHUBXL.BO.NEW.Hl7FcpOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des analysess de laboratoire vers MediWeb Brugmann" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">GLIMS</Setting>
    <Setting Target="Host" Name="SystemDestination">QUADRAT_MFU</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\PROD\GlimsMFU\out\Agfa\Bru</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7">\\BRQITFI01\Agfa$\Interfaces\LabResultLink\Files\LabMfuMips\InENS</Setting>
    <Setting Target="Host" Name="RPFileHL7"></Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\PROD\GlimsMFU\out\Agfa\Bru</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="GlimsGlimsHudMFUHl7TcpOut" Category="A-Glims,T-LAB,T-MFU" ClassName="CHUBXL.BO.NEW.RawTcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Transmission du fichier des analyses de laboratoires vers l&apos;environnement de PREPRO" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">10.20.8.61</Setting>
    <Setting Target="Adapter" Name="Port">21411</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="SystemDestination">MFU</Setting>
    <Setting Target="Host" Name="SystemSource">Glims</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PREP\GlimsMF\archive\Hud</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
  </Item>
  <Item Name="InfohosMdAllPhaRouting" Category="A-Infohos" ClassName="CHUBXL.BP.NEW.InfohosMdHl7Routing" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="InfohosSpeAllPhaRouting" Category="A-Infohos,T-FAC,A-Oxygen" ClassName="CHUBXL.BP.NEW.InfohosSpeHl7Routing" PoolSize="1" Enabled="true" Foreground="false" Comment="Transfert des spécialités d&apos;Infohos vers Wish" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="InfohosArtAllPhaRouting" Category="A-Infohos" ClassName="CHUBXL.BP.NEW.InfohosArtXmlRouting" PoolSize="1" Enabled="true" Foreground="false" Comment="Articles Infohos vers Intranet" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">15</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="InfohosTsAllPhaRouting" Category="A-Infohos" ClassName="CHUBXL.BP.NEW.InfohosTsRouting" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">15</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="InfohosBdocBruPhaHl7TcpOut" Category="A-Infohos,A-Bdoc" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\InfohosMd\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\InfohosMd\out\Bdoc\Bru</Setting>
    <Setting Target="Adapter" Name="IPAddress">SPICA</Setting>
    <Setting Target="Adapter" Name="Port">21962</Setting>
    <Setting Target="Host" Name="AddToMetric">0</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
  </Item>
  <Item Name="InfohosBdocBruPhaHl7TcpOutPre" Category="A-Infohos,A-Bdoc" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\PREP\InfohosMd\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PREP\InfohosMd\out\Bdoc\Bru</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.26</Setting>
    <Setting Target="Adapter" Name="Port">21972</Setting>
    <Setting Target="Host" Name="AddToMetric">0</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="InfohosBdocHudPhaHl7TcpOut" Category="A-Infohos,A-Bdoc" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\InfohosMd\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\InfohosMd\out\Bdoc\Bru</Setting>
    <Setting Target="Adapter" Name="IPAddress">ATAIR</Setting>
    <Setting Target="Adapter" Name="Port">21952</Setting>
    <Setting Target="Host" Name="AddToMetric">0</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
  </Item>
  <Item Name="InfohosBdocHudPhaHl7TcpOutPre" Category="A-Infohos,A-Bdoc" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath"></Setting>
    <Setting Target="Host" Name="FileErrorArchivePath"></Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.26</Setting>
    <Setting Target="Adapter" Name="Port">21952</Setting>
    <Setting Target="Host" Name="AddToMetric">0</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="InfohosBdocBruPhaForHl7TcpOut" Category="A-Infohos,A-Bdoc" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath"></Setting>
    <Setting Target="Host" Name="FileErrorArchivePath"></Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.26</Setting>
    <Setting Target="Adapter" Name="Port">21982</Setting>
    <Setting Target="Host" Name="AddToMetric">0</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="InfohosBdocHudForPhaHl7TcpOut" Category="A-Infohos,A-Bdoc" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath"></Setting>
    <Setting Target="Host" Name="FileErrorArchivePath"></Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.26</Setting>
    <Setting Target="Adapter" Name="Port">21992</Setting>
    <Setting Target="Host" Name="AddToMetric">0</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="InfohosBdocBruPhaNotHl7TcpOut" Category="A-Infohos,A-Bdoc" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath"></Setting>
    <Setting Target="Host" Name="FileErrorArchivePath"></Setting>
    <Setting Target="Adapter" Name="IPAddress">BRDPIDEV01</Setting>
    <Setting Target="Adapter" Name="Port">21953</Setting>
    <Setting Target="Host" Name="AddToMetric">0</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="InfohosBdocHudPhaNotHl7TcpOut" Category="A-Infohos,A-Bdoc" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath"></Setting>
    <Setting Target="Host" Name="FileErrorArchivePath"></Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.9.85</Setting>
    <Setting Target="Adapter" Name="Port">21952</Setting>
    <Setting Target="Host" Name="AddToMetric">0</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="InfohosSpeAllPhaDlmFcpIn" Category="A-Infohos" ClassName="CHUBXL.BS.NEW.InfohosHl7FcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Fichier spécialités et implants d&apos;Infohos vers Wish" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\InfohosSpe\archive\All</Setting>
    <Setting Target="Adapter" Name="FilePath">\\brapo01\Infofile\ToIbm\Facturation\Articles</Setting>
    <Setting Target="Adapter" Name="FileSpec">S*</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\InfohosSpe\archive\All</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="InfohosTsAllPhaXmlFcpIn" Category="A-Infohos" ClassName="CHUBXL.BS.NEW.InfohosTsFcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\InfohosTs\archive\All</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\brape01\Timestamping</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.xml</Setting>
    <Setting Target="Adapter" Name="ArchivePath"></Setting>
    <Setting Target="Adapter" Name="WorkPath">G:\PROD\InfohosTs\archive\All</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">60</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="InfohosArtAllPhaXmlFcpIn" Category="A-Infohos" ClassName="CHUBXL.BS.NEW.InfohosHl7FcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Articles Infohos vers l&apos;intranet" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\InfohosArt\archive\All</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\brapo01\Infofile\articles</Setting>
    <Setting Target="Adapter" Name="FileSpec">P*.*xml</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\InfohosArt\archive\All</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp"></Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="InfohosArtAllPhaXmlFcpOut" Category="A-Infohos" ClassName="CHUBXL.BO.NEW.AllFcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Articles Infohos vers Intranet" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\BRDEVTASK01\FTPincoming$\infofile\articles</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="InfohosTsAllPhaDlmWsOut" Category="A-Infohos" ClassName="CHUBXL.BO.HealthConnect.JournalEntryServiceSoap" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">15</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="WebServiceURL"><![CDATA[<default>]]></Setting>
    <Setting Target="Adapter" Name="WebServiceClientClass"></Setting>
    <Setting Target="Adapter" Name="SOAPCredentials"></Setting>
    <Setting Target="Adapter" Name="Credentials"></Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
    <Setting Target="Adapter" Name="ProxyServer"></Setting>
    <Setting Target="Adapter" Name="ProxyPort">80</Setting>
    <Setting Target="Adapter" Name="ProxyHTTPS">0</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">30</Setting>
  </Item>
  <Item Name="InfohosMdAllPhaHl7FcpIn" Category="A-Infohos" ClassName="CHUBXL.BS.NEW.InfohosHl7FcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\InfohosMd\archive\All</Setting>
    <Setting Target="Host" Name="TargetConfigNames">InfohosMdAllPhaRouting</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\InfohosMd\archive</Setting>
    <Setting Target="Adapter" Name="FilePath">\\BRAPOEINT01\FromAPOToEveryone.MFN</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">2.6</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="InfohosSpeBruPhaHl7FtpOut" Category="A-Infohos" ClassName="CHUBXL.BO.NEW.AllFtpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Fichier des spécialités d&apos;Infohos vers Wish" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\InfohosMd\out\Bru</Setting>
    <Setting Target="Host" Name="System">AS400</Setting>
    <Setting Target="Adapter" Name="Credentials">WISH</Setting>
    <Setting Target="Adapter" Name="FTPPort">21</Setting>
    <Setting Target="Adapter" Name="FTPServer">br400prd</Setting>
    <Setting Target="Adapter" Name="FilePath">FITPBRNS</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Host" Name="FailureTimeout">60</Setting>
  </Item>
  <Item Name="InfohosSpeHudPhaHl7FtpOut" Category="A-Infohos" ClassName="CHUBXL.BO.NEW.AllFtpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi du signalétique des médicaments iNFOHOS VERS wISH huderf" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">WISH</Setting>
    <Setting Target="Adapter" Name="FTPPort">21</Setting>
    <Setting Target="Adapter" Name="FTPServer">br400prd</Setting>
    <Setting Target="Adapter" Name="FilePath">FITPHUNS</Setting>
    <Setting Target="Host" Name="System">AS400</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\InfohosMd\out\Hud</Setting>
    <Setting Target="Host" Name="FailureTimeout">60</Setting>
  </Item>
  <Item Name="MvAllArcRouting" Category="A-Mv" ClassName="CHUBXL.BP.NEW.MvHl7Routing" PoolSize="1" Enabled="true" Foreground="false" Comment="MV vers DPI" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="MvAllArcHl7TcpIn" Category="A-Mv,MIT" ClassName="CHUBXL.BS.NEW.Hl7MllpTcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie des documents archivés vers DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Mv\archive\All</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Mv\archive\All</Setting>
    <Setting Target="Adapter" Name="Port">21381</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">2.3</Setting>
    <Setting Target="Host" Name="TargetConfigNames">MvAllArcRouting</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AddNackERR">0</Setting>
    <Setting Target="Host" Name="UseAckCommitCodes">0</Setting>
    <Setting Target="Host" Name="AckMode">Immed</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="IgnoreInboundAck">0</Setting>
  </Item>
  <Item Name="MvBdocHudArcHl7TcpOut" Category="A-Mv,A-Bdoc" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des références des documents scannés vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">ATAIR</Setting>
    <Setting Target="Adapter" Name="Port">21811</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Mv\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Mv\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
  </Item>
  <Item Name="MvBdocHudArcHl7TcpFwd" Category="A-Mv,A-Bdoc" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="ENvoi des références des documents scannés vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">10.20.8.26</Setting>
    <Setting Target="Adapter" Name="Port">21441</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PREP\Mv\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PREP\Mv\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
  </Item>
  <Item Name="MvBdocBruArcHl7TcpOut" Category="A-Mv,A-Bdoc" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des références des documents scannés Brugmann vers le DPI (Bdoc)" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">SPICA</Setting>
    <Setting Target="Adapter" Name="Port">21991</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Mv\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Mv\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
  </Item>
  <Item Name="MvBdocBruArcHl7TcpFwd" Category="A-Mv,A-Bdoc" ClassName="CHUBXL.BO.NEW.Hl7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="ENvoi des références des documents scannés vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">10.20.8.26</Setting>
    <Setting Target="Adapter" Name="Port">21941</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PREP\Mv\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PREP\Mv\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
  </Item>
  <Item Name="MedecinAllMedRouting" Category="A-Medecin" ClassName="CHUBXL.BP.NEW.WishMedHl7Routing" PoolSize="1" Enabled="true" Foreground="false" Comment="Routage des messages médecins vers périphériques" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">15</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="RefmedAllMedRouting" Category="A-Medecin,A-Refmed,T-GDR" ClassName="CHUBXL.BP.NEW.RefmedHl7Routing" PoolSize="1" Enabled="true" Foreground="false" Comment="Routage des messages médecins vers périphériques" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">15</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="RefmedAllMedHl7FcpIn" Category="A-Medecin,A-Refmed,T-GDR" ClassName="CHUBXL.BS.NEW.RefmedHl7FcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Données Médecins" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Medecin\archive\All</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\GDR\REFMED\ENSEMBLE\out\All</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Medecin\archive\All</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp"></Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="OxygenAllDocRouting" Category="A-Oxygen,A-Mv,T-DOC" ClassName="CHUBXL.BP.NEW.OxygenHl7Routing" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des résultats d&apos;Astraia (Gyné) vers Medical Viewer" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="OxygenBruDocHl7FcpIn" Category="A-Oxygen,T-DOC" ClassName="CHUBXL.BS.NEW.OxygenHl7FcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Reception des rapports de Kine (Oxygen)" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Oxygen\archive\Bru</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\broxy01\hl7$\rapports</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Oxygen\archive\Bru</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="OxygenBdocHudDocHl7FcpOut" Category="A-Oxygen,A-Bdoc,T-DOC" ClassName="CHUBXL.BO.NEW.Hl7okFcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des rapports du logiciel EndoBase HUDERF vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ExtentionBLOB">PDF</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\atair\b$\Integrations\Documents\</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\PROD\Oxygen\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\PROD\Oxygen\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\atair\b$\Integrations\Documents\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\atair\b$\Integrations\Documents\</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="SystemDestination">Bdoc</Setting>
    <Setting Target="Host" Name="SystemSource">Oxygen</Setting>
  </Item>
  <Item Name="OxygenBdocBruDocHl7FcpOut" Category="A-Oxygen,A-Bdoc,T-DOC" ClassName="CHUBXL.BO.NEW.Hl7okFcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des rapports du logiciel EndoBase HUDERF vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ExtentionBLOB">PDF</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\spica\a$\Integrations-Br\Documents\</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\PROD\Oxygen\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\PROD\Oxygen\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\spica\a$\Integrations-Br\Documents\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\spica\a$\Integrations-Br\Documents\</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="SystemDestination">Bdoc</Setting>
    <Setting Target="Host" Name="SystemSource">Oxygen</Setting>
  </Item>
  <Item Name="OxygenMvAllDocHl7FcpOut" Category="A-Oxygen,A-Mv,T-DOC" ClassName="CHUBXL.BO.NEW.XmlFcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des rapports Kine (Oxygen) vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FilePathLocalTXT">G:\PROD\Oxygen\out\Mv\All</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\PROD\Oxygen\out\Mv\All</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\Sharatan\ACScanImport$\PDF1\KINE\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\Sharatan\ACScanImport$\PDF1\KINE\</Setting>
    <Setting Target="Host" Name="SystemDestination">Medcial Viewer</Setting>
    <Setting Target="Host" Name="SystemSource">Kine</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\PROD\Oxygen\out\Mv\All</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
    <Setting Target="Host" Name="ExtentionBLOB">PDF</Setting>
    <Setting Target="Host" Name="FailureTimeout">1</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\Sharatan\ACScanImport$\PDF1\KINE\</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="OxygenBruFacDlmFcpIn" Category="A-Oxygen,T-FAC" ClassName="CHUBXL.BS.NEW.InfohosHl7FcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Fichier facturation Kine Oxygen" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FileSpec">ki*.tf</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Oxygen\Fact\archive</Setting>
    <Setting Target="Adapter" Name="FilePath">\\broxy01\c$\Facturation</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Oxygen\Fact\archive</Setting>
    <Setting Target="Adapter" Name="Charset">Native</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="OxygenWishBruFacDlmFtpOut" Category="A-Oxygen,A-Wish,T-FAC" ClassName="CHUBXL.BO.NEW.AllFtpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Facturation Kine Oxygen vers Wish" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">WISH</Setting>
    <Setting Target="Adapter" Name="FTPPort">21</Setting>
    <Setting Target="Adapter" Name="FTPServer">br400prd</Setting>
    <Setting Target="Adapter" Name="FilePath">FITPBRNS</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Kine\fact\out</Setting>
    <Setting Target="Host" Name="System">AS400</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Host" Name="FailureTimeout">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="EcareBruDocRouting" Category="A-Ecare,T-DOC" ClassName="CHUBXL.BP.NEW.EcareHl7Routing" PoolSize="1" Enabled="true" Foreground="false" Comment="Routage rapport Ecare vers MV" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">15</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="EcareBruDocHl7FcpIn" Category="A-Ecare,T-DOC" ClassName="CHUBXL.BS.NEW.EcareHl7FcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Reception des rapports des urgences (Ecare)" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Ecare\archive\Bru</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\brEcareprod\hl7\doc\outbox</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Ecare\archive\Bru</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="EcareBdocBruDocHl7FcpOut" Category="A-Ecare,A-Bdoc,T-DOC" ClassName="CHUBXL.BO.NEW.Hl7okFcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie résultat Ecare vers MediWeb Brugmann" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">Ecare</Setting>
    <Setting Target="Host" Name="SystemDestination">DPI_BRU</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\PROD\Ecare\out\Bdoc\Bru</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\Spica\a$\Integrations-Br\Documents\</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\Spica\a$\Integrations-Br\Documents\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\Spica\a$\Integrations-Br\Documents\</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\PROD\Ecare\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\PROD\Ecare\out\Bdoc\Bru</Setting>
  </Item>
  <Item Name="EcareMvAllDocHl7FcpOut" Category="A-Ecare,A-Mv,T-DOC" ClassName="CHUBXL.BO.NEW.XmlFcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Rapports Ecare vers MV" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">Ecare</Setting>
    <Setting Target="Host" Name="SystemDestination">MV</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\PROD\Ecare\out\Mv\All</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\PROD\Ecare\out\Mv\All</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\Sharatan\ACScanImport$\DIGI2\ECARE</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\Sharatan\ACScanImport$\DIGI2\ECARE</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\Sharatan\ACScanImport$\DIGI2\ECARE\</Setting>
    <Setting Target="Host" Name="ExtentionBLOB">RTF</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\PROD\Ecare\out\Mv\All</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="EcareAgfaBruDocHl7FcpOut" Category="A-Ecare,A-Agfa,T-DOC" ClassName="CHUBXL.BO.NEW.Hl7FcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie résultat Ecare vers MediWeb Brugmann" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">Ecare</Setting>
    <Setting Target="Host" Name="SystemDestination">AGFA_BRU</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\PROD\Ecare\out\Agfa\Bru</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7">\\brqitfi01\Agfa$\Interfaces\ReportsInbound\Files\IN</Setting>
    <Setting Target="Host" Name="RPFileHL7">\\brqitfi01\Agfa$\Interfaces\ReportsInbound\Files\IN</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\PROD\Ecare\out\Agfa\Bru</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="DiamicAllDocRouting" Category="A-Diamic,A-Mv,T-DOC" ClassName="CHUBXL.BP.NEW.DiamicHl7Routing" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Routage des résultats médicaux (format impression)" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="DiamicAllDocHl7FcpIn" Category="A-Diamic,T-DOC" ClassName="CHUBXL.BS.NEW.DiamicHl7FcpIn" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Reception des rapports d&apos;anatomie-pathologique (Diamic)" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\DIAMIC\archive\All</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\10.15.102.10\diamicliaisons\DiffRes\Brugmann\Out</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.Ok</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\DIAMIC\archive\All</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Binary</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="DiamicBdocBruDocHl7FcpOut" Category="A-Bdoc,A-Diamic,T-DOC" ClassName="CHUBXL.BO.NEW.Hl7okFcpOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des rapport d&apos;anatomie-pathologique (Diamic) vers MediWeb HUDERF de test" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">DIAMIC</Setting>
    <Setting Target="Host" Name="SystemDestination">BDOC_BRU</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath"></Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\SPICA\a$\Integrations-br\Diamic\</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\PROD\Diamic\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\PROD\Diamic\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\SPICA\a$\Integrations-br\Diamic\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\SPICA\a$\Integrations-br\Diamic\</Setting>
  </Item>
  <Item Name="DiamicBdocHudDocHl7FcpOut" Category="A-Bdoc,A-Diamic,T-DOC" ClassName="CHUBXL.BO.NEW.Hl7okFcpOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des rapport d&apos;anatomie-pathologique (Diamic) vers MediWeb HUDERF de test" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">DIAMIC</Setting>
    <Setting Target="Host" Name="SystemDestination">BDOC_HUD</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath"></Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\atair\b$\Integrations\Diamic\</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\PROD\Diamic\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\PROD\Diamic\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\atair\b$\Integrations\Diamic\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\atair\b$\Integrations\Diamic\</Setting>
  </Item>
  <Item Name="DiamicBdocBruDocHl7FcpOutPrep" Category="A-Bdoc,A-Diamic,T-DOC" ClassName="CHUBXL.BO.NEW.Hl7okFcpOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des rapport d&apos;anatomie-pathologique (Diamic) vers MediWeb HUDERF de test" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">DIAMIC</Setting>
    <Setting Target="Host" Name="SystemDestination">BDOC_BRU</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath"></Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\bohrium\f$\Integrations-br\Diamic\</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\PREP\Diamc\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\PREP\Diamic\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\10.20.8.26\f$\Integrations-br\Diamic\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\10.20.8.26\f$\Integrations-br\Diamic\</Setting>
  </Item>
  <Item Name="DiamicBdocHudDocHl7FcpOutPrep" Category="A-Bdoc,A-Diamic,T-DOC" ClassName="CHUBXL.BO.NEW.Hl7okFcpOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des rapport d&apos;anatomie-pathologique (Diamic) vers MediWeb HUDERF de test" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">DIAMIC</Setting>
    <Setting Target="Host" Name="SystemDestination">BDOC_HUD</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath"></Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\bohrium\f$\Integrations\Diamic\</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\PREP\Diamc\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\PREP\Diamic\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\10.20.8.26\f$\Integrations\Diamic\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\10.20.8.26\f$\Integrations\Diamic\</Setting>
  </Item>
  <Item Name="DiamicMvAllDocHl7FcpOut" Category="A-Mv,T-DOC" ClassName="CHUBXL.BO.NEW.XmlFcpOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des rapport d&apos;anatomie-pathologique (Diamic) vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">DIAMIC</Setting>
    <Setting Target="Host" Name="SystemDestination">MV</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\PROD\Diamic\out\Mv\all</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\PROD\Diamic\out\Mv\all</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\Sharatan\ACScanImport$\DIGI1\Diamic</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\Sharatan\ACScanImport$\DIGI1\Diamic</Setting>
    <Setting Target="Host" Name="FilePathBLOB">G:\Allgeier\ACScanImport\DIGI1\Diamic\</Setting>
    <Setting Target="Host" Name="ExtentionBLOB">RTF</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\PROD\Diamic\out\Mv\All</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="DiamicAgfaBruDocHl7FcpOut" Category="A-Diamic,A-Agfa,T-DOC" ClassName="CHUBXL.BO.NEW.Hl7FcpOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des rapport d&apos;anatomie-pathologique (Diamic) vers MediWeb Brugmann" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">DIAMIC</Setting>
    <Setting Target="Host" Name="SystemDestination">AGFA_BRU</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\PROD\Diamic\out\Agfa\Bru</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7">\\BRQITFI01\Agfa$\Interfaces\ReportsInbound\Files\In</Setting>
    <Setting Target="Host" Name="RPFileHL7">\\BRQITFI01\Agfa$\Interfaces\ReportsInbound\Files\In</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\PROD\Diamic\out\Agfa\Bru</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="DiamicAgfaHudDocHl7FcpOut" Category="A-Diamic,A-Agfa,T-DOC" ClassName="CHUBXL.BO.NEW.Hl7FcpOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des rapport d&apos;anatomie-pathologique (Diamic) vers MediWeb HUDERF" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">DIAMIC</Setting>
    <Setting Target="Host" Name="SystemDestination">AGFA_HUD</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\PROD\Diamic\out\Agfa\Hud</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7">\\HUQITFI01\Agfa\Interfaces\ReportsInbound\Files\In</Setting>
    <Setting Target="Host" Name="RPFileHL7">\\HUQITFI01\Agfa\Interfaces\ReportsInbound\Files\In</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\PROD\Diamic\out\Agfa\Hud</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="DiamicAllFacDlmFcpIn" Category="A-Diamic,T-FAC" ClassName="CHUBXL.BS.NEW.InfohosHl7FcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Fichier facturation Diamic" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FileSpec">EL*.txt</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Diamic\Fact\archive</Setting>
    <Setting Target="Adapter" Name="FilePath">\\10.15.102.10\diamicliaisons\activite\BRG\out</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Diamic\Fact\archive</Setting>
    <Setting Target="Adapter" Name="Charset">Native</Setting>
  </Item>
  <Item Name="DiamicWishBruFacDlmFtpOut" Category="A-Diamic,A-Wish,T-FAC" ClassName="CHUBXL.BO.NEW.AllFtpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Facturation Diamic vers Wish" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">WISH</Setting>
    <Setting Target="Adapter" Name="FTPPort">21</Setting>
    <Setting Target="Adapter" Name="FTPServer">br400prd</Setting>
    <Setting Target="Adapter" Name="FilePath">FITPBRNS</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Diamic\Fact\out\Wish\Bru</Setting>
    <Setting Target="Host" Name="System">AS400</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Host" Name="FailureTimeout">60</Setting>
  </Item>
  <Item Name="DiamicWishHudFacDlmFtpOut" Category="A-Diamic,A-Wish,T-FAC" ClassName="CHUBXL.BO.NEW.AllFtpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Facturation Diamic vers Wish" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">WISH</Setting>
    <Setting Target="Adapter" Name="FTPPort">21</Setting>
    <Setting Target="Adapter" Name="FTPServer">br400prd</Setting>
    <Setting Target="Adapter" Name="FilePath">FITPHUNS</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Diamic\Fact\out\Wish\Hud</Setting>
    <Setting Target="Host" Name="System">AS400</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Host" Name="FailureTimeout">60</Setting>
  </Item>
  <Item Name="OperaAllRdvRouting" Category="A-Opera,T-RDV" ClassName="CHUBXL.BP.NEW.OperaHl7Routing" PoolSize="1" Enabled="true" Foreground="false" Comment="Rendez-vous QPlanner vers DPI" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="OperaAllRdvHl7TcpIn" Category="A-Opera,T-RDV,MIT" ClassName="CHUBXL.BS.NEW.Hl7MllpTcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Transfert des rendez-vous Opera vers Bdoc" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\OperaRV\archive\All</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\OperaRV\archive\All</Setting>
    <Setting Target="Adapter" Name="Port">21181</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">2.3.1</Setting>
    <Setting Target="Host" Name="TargetConfigNames">OperaAllRdvRouting</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AddNackERR">0</Setting>
    <Setting Target="Host" Name="UseAckCommitCodes">0</Setting>
    <Setting Target="Host" Name="AckMode">Immed</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="IgnoreInboundAck">0</Setting>
  </Item>
  <Item Name="MososBruDocRouting" Category="A-Mosos,A-Mv,T-DOC" ClassName="CHUBXL.BP.NEW.MvHl7Routing" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des résultats de MOSOS (Gyné) vers Medical Viewer" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="MososBruDocHl7FcpIn" Category="A-Mosos,T-DOC" ClassName="CHUBXL.BS.NEW.MososHl7FcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des résultats de MOSOS (Gyné) vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Mosos\archive\Bru</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="FilePath">\\brmosos01\Verzonden$</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Mosos\archive\Bru</Setting>
  </Item>
  <Item Name="MososMvBruDocHl7FcpOut" Category="A-Mosos,A-Mv,T-DOC" ClassName="CHUBXL.BO.NEW.XmlFcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des rapports de MOSOS (Gyné) vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ExtentionBLOB">RTF</Setting>
    <Setting Target="Host" Name="FailureTimeout">1</Setting>
    <Setting Target="Host" Name="FilePathBLOB">G:\Allgeier\ACScanImport\RTF1\MOSOS\</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\PROD\Mosos\out\Mv\Bru</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\PROD\Mosos\out\Mv\Bru</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\Sharatan\ACScanImport$\RTF1\MOSOS</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\Sharatan\ACScanImport$\RTF1\MOSOS</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="SystemDestination">Medcial Viewer</Setting>
    <Setting Target="Host" Name="SystemSource">MOSOS</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\PROD\Mosos\out\Mv\Bru</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="AstraiaAllDocRouting" Category="A-Astraia,A-Mv,T-DOC" ClassName="CHUBXL.BP.NEW.AstraiaHl7Routing" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des résultats d&apos;Astraia (Gyné) vers Medical Viewer" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="AstraiaBruDocHl7FcpIn" Category="A-Astraia,A-Mv,T-DOC" ClassName="CHUBXL.BS.NEW.AstraiaHl7FcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des résultats d&apos;Astraia (Gyné) vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Astraia\archive\Bru</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Astraia\archive</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="FilePath">\\brastraia01\oru_pdf</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="AstraiaMvBruDocHl7FcpOut" Category="A-Astraia,A-Mv,T-DOC" ClassName="CHUBXL.BO.NEW.XmlFcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des rapports d&apos;Astraia (Gyné) vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FilePathLocalTXT">G:\PROD\Astraia\out\Mv\Bru</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\PROD\Astraia\out\Mv\Bru</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\Sharatan\ACScanImport$\PDF1\Astraia</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\Sharatan\ACScanImport$\PDF1\Astraia</Setting>
    <Setting Target="Host" Name="SystemDestination">Medcial Viewer</Setting>
    <Setting Target="Host" Name="SystemSource">Astraia</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\PROD\Astraia\out\Mv\Bru</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
    <Setting Target="Host" Name="ExtentionBLOB">PDF</Setting>
    <Setting Target="Host" Name="FailureTimeout">1</Setting>
    <Setting Target="Host" Name="FilePathBLOB">G:\Allgeier\ACScanImport\PDF1\Astraia\</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
  </Item>
  <Item Name="IcipHudDocRouting" Category="A-Icip,A-Mv,T-DOC" ClassName="CHUBXL.BP.NEW.IcipHl7Routing" PoolSize="1" Enabled="true" Foreground="false" Comment="Routage des résultats ICIP vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
  </Item>
  <Item Name="IcipHudDocHl7FcpIn" Category="A-Icip,T-DOC" ClassName="CHUBXL.BS.NEW.IcipHl7FcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Reception des rapports des USI de l&apos;HUDERF ( ICIP)" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Icip\archive\Hud</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\huicca02\huderf-export</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.HL7</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Icip\archive\Hud</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="IcipMvHudDocHl7FcpOut" Category="A-Icip,A-Mv,T-DOC" ClassName="CHUBXL.BO.NEW.XmlFcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Résultats ICIP vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">ICIP</Setting>
    <Setting Target="Host" Name="SystemDestination">Medical Viewer</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\PROD\Icip\out\Mv\Hud</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\PROD\Icip\out\Mv\Hud</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\Sharatan\ACScanImport$\PDF1\ICIP</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\Sharatan\ACScanImport$\PDF1\ICIP</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\Sharatan\ACScanImport$\PDF1\ICIP</Setting>
    <Setting Target="Host" Name="ExtentionBLOB">PDF</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\PROD\Icip\out\Mv\Hud</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="OphtalmoHudDocRouting" Category="A-Ophtalmo,A-Mv,T-DOC" ClassName="CHUBXL.BP.NEW.OphtalmoHl7Routing" PoolSize="1" Enabled="true" Foreground="false" Comment="Routage des résultats Ophtalmo vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
  </Item>
  <Item Name="OphtalmoHudDocHl7FcpIn" Category="A-Ophtalmo,T-DOC" ClassName="CHUBXL.BS.NEW.OphtalmoHl7FcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Reception des rapports d&apos;Ophtalmologie pour l&apos;HUDERF" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Ophtalmo\archive\Hud</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\ruthenium\c$\ORUPROD</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.Ok</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Ophtalmo\archive\Hud</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="OphtalmoMvHudDocHl7FcpOut" Category="A-Ophtalmo,A-Mv,T-DOC" ClassName="CHUBXL.BO.NEW.XmlFcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Transmission des rapports d&apos;ophtalmologie vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">Ophtalmo</Setting>
    <Setting Target="Host" Name="SystemDestination">Medical Viewer</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\PROD\Ophtalmo\out\Mv\Hud</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\PROD\Ophtalmo\out\Mv\Hud</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\Sharatan\ACScanImport$\DIGI2\OPHTALMO</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\Sharatan\ACScanImport$\DIGI2\OPHTALMO</Setting>
    <Setting Target="Host" Name="FilePathBLOB">G:\Allgeier\ACScanImport\DIGI2\OPHTALMO\</Setting>
    <Setting Target="Host" Name="ExtentionBLOB">RTF</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\PROD\Ophtalmo\out\Mv\Hud</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="EndobaseHudDocRouting" Category="A-Endobase,T-DOC" ClassName="CHUBXL.BP.NEW.BdocHl7Routing" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Routage des rapports de Bdoc" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="EndobaseHudDocHl7FcpIn" Category="A-Endobase,T-DOC" ClassName="CHUBXL.BS.NEW.EndobaseHl7FcpIn" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Reception des rapports du logiciel EndoBase HUDERF" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Endobase\archive\Hud</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\huEndobase\EB3_FILE\HL7_Queue\LegacyFile\EXPORT</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.HL7</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Endobase\archive\Hud</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Binary</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
    <Setting Target="Host" Name="FileProdPath">\\10.20.8.127\f$\Integrations\Documents\</Setting>
  </Item>
  <Item Name="EndobaseBdocHudDocHl7FcpOut" Category="A-Endobase,A-Bdoc,T-DOC" ClassName="CHUBXL.BO.NEW.Hl7okFcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des rapports du logiciel EndoBase HUDERF vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ExtentionBLOB">PDF</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\atair\b$\Integrations\Documents\</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\PROD\Endobase\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\PROD\Endobase\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\atair\b$\Integrations\Documents\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\atair\b$\Integrations\Documents\</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="SystemDestination">DPI</Setting>
    <Setting Target="Host" Name="SystemSource">EndoBase</Setting>
  </Item>
  <Item Name="EndobaseMvHudDocHl7FcpOut" Category="A-Endobase,A-Mv,T-DOC" ClassName="CHUBXL.BO.NEW.XmlFcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des rapports EndoBase vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FilePathLocalTXT">G:\PROD\Endobase\out\Mv\Hud</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\PROD\Endobase\out\Mv\Hud</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\Sharatan\ACScanImport$\PDF1\EndoBase\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\Sharatan\ACScanImport$\PDF1\EndoBase\</Setting>
    <Setting Target="Host" Name="SystemDestination">Medical Viewer</Setting>
    <Setting Target="Host" Name="SystemSource">EndoBase</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataProd\EndoBase\out\MV\</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
    <Setting Target="Host" Name="ExtentionBLOB">PDF</Setting>
    <Setting Target="Host" Name="FailureTimeout">1</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\Sharatan\ACScanImport$\PDF1\EndoBase\</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="PlusAllDocRouting" Category="A-Plus,A-Mv,T-DOC" ClassName="CHUBXL.BP.NEW.PlusXmlRouting" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Routage des rapports de Bdoc" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="PlusAllDocXmlFcpIn" Category="A-Plus,T-DOC" ClassName="CHUBXL.BS.NEW.PlusXmlFcpIn" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Reception des rapports de Bdoc HUDERF" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Plus\archive\All</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\Prod\Plus\in</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.xml</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\PLUS\archive\All</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Binary</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="PlusMvAllDocXmlFcpOut" Category="A-Mv,A-Plus,T-DOC" ClassName="CHUBXL.BO.NEW.XmlFcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Test suppresion documents Agfa vers MV" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ExtentionBLOB">pdf</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\Sharatan\ACScanImport$\PDF1\PLUS</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\PROD\PLUS\out\Mv\All</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\PROD\PLUS\out\Mv\All</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\Sharatan\ACScanImport$\PDF1\PLUS</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\Sharatan\ACScanImport$\PDF1\PLUS</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="SystemDestination">MV</Setting>
    <Setting Target="Host" Name="SystemSource">PLUS</Setting>
  </Item>

  <Item Name="RsbEventAllRouting" Category="A-RsbEvent" ClassName="CHUBXL.BP.NEW.RsbEventXmlRouting" PoolSize="1" Enabled="true" Foreground="false" Comment="Articles Infohos vers Intranet" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">15</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="RsbEventAllDocXmlFcpIn" Category="A-RsbEvent,T-DOC" ClassName="CHUBXL.BS.NEW.RsbEventXmlFcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Réception fichiers Abrumet RsbEvent" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\RsbEvent\archive\All</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">Z:</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.*xml</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\RsbEvent\archive\All</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp"></Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="RsbBdocBruDocXmlFcpOut" Category="A-Bdoc,A-RsbEvent,T-DOC" ClassName="CHUBXL.BO.NEW.AllFcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie fichier Abrumet RsbEvent vers Bdoc Brugmann" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\SPICA\a$\Integrations-Br\RSWEVENT</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="RsbBdocHudDocXmlFcpOut" Category="A-Bdoc,A-RsbEvent,T-DOC" ClassName="CHUBXL.BO.NEW.AllFcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie fichier Abrumet RsbEvent vers Bdoc Brugmann" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\ATAIR\b$\Integrations\RSWEVENT</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  
  <Item Name="AlphaAllArcRouting" Category="A-Alpha,A-Ciges" ClassName="CHUBXL.BP.NEW.AlphaQDoc" PoolSize="1" Enabled="true" Foreground="false" Comment="Dossiers archives de l&apos;application CIGES à Medical Viewer" LogTraceEvents="false" Schedule="">
  </Item>
    <Item Name="AlphaAllArcDlmFcpIn" Category="A-Alpha,A-Ciges" ClassName="CHUBXL.BS.NEW.AlphaDlmFcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Dossiers archives de l&apos;application CIGES à Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Ciges\archive\All</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="FilePath">\\holmium\d$\dataTest\Alpha\Archive</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.txt</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
</Production>
}

}
