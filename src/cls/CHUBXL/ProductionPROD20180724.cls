Class CHUBXL.ProductionPROD20180724 Extends Ens.Production [ ClassType = "", ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
Production ENSPROD

VERSION
-------
DAM	13/04/2018	Initial Version

APPLICATIONS
------------
SYSTEME
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
ALPHA
RSBEVENT
--------------------------------------------------------------------------------------------------------------------------------
*/
XData ProductionDefinition
{
<Production Name="CHUBXL.ProductionPROD" TestingEnabled="false" LogGeneralTraceEvents="false">
  <Description>Production CHUBXL de PRODUCTION - BORON</Description>
  <ActorPoolSize>2</ActorPoolSize>
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
  <Item Name="ChubxlGeneralMetric" Category="S-Metric,S-Alert" ClassName="CHUBXL.MET.GeneralMetric" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
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
  <Item Name="WishAllAdtRouting" Category="A-Wish,T-ADT" ClassName="CHUBXL.BP.WishAllAdtRouting" PoolSize="1" Enabled="true" Foreground="false" Comment="Routing des messsages de données administratives des patients (Wish)" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="AddToMetric">1</Setting>
  </Item>
  <Item Name="WishBruAdtHl7TcpIn" Category="A-Wish,T-ADT,MIT" ClassName="CHUBXL.BS.HL7TcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Reception des messages de données administratives des patients Brugmann." LogTraceEvents="false" Schedule="">
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
  <Item Name="WishHudAdtHl7TcpIn" Category="A-Wish,T-ADT,MIT" ClassName="CHUBXL.BS.HL7TcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Reception des messages de données administratives des patients de l&apos;HUDERF." LogTraceEvents="false" Schedule="">
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
  <Item Name="WishAllAdtHl7FcpIn" Category="A-Wish" ClassName="CHUBXL.BS.WishHL7File" PoolSize="1" Enabled="true" Foreground="false" Comment="Ré envoie des messages HL7 de Wish" LogTraceEvents="false" Schedule="">
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
  <Item Name="WishBruMedHl7TcpIn" Category="A-Wish,A-Medecin,MIT" ClassName="CHUBXL.BS.HL7TcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Réception des messages de données médecins Wish Brugmann." LogTraceEvents="false" Schedule="">
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
  <Item Name="WishHudMedHl7TcpIn" Category="A-Wish,A-Medecin,MIT" ClassName="CHUBXL.BS.HL7TcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Réception des messages de données médecins Wish H.U.D.E.R.F." LogTraceEvents="false" Schedule="">
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
  <Item Name="WishAgfaHudAdtHl7TcpOut" Category="A-Wish,A-Agfa,T-ADT" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie des données administratives patients de Wish vers Agfa-Quadrat HUDERF" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Agfa\Hud</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Agfa\Hud</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Adapter" Name="Port">21761</Setting>
    <Setting Target="Adapter" Name="IPAddress">HUQITFI01</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="WishDialyseAllAdtXmlTcpOut" Category="A-Wish,A-Dialyse,T-ADT" ClassName="CHUBXL.BO.ParsedTcpOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des données Administratives vers le logiciel de dialyses (hemadial)" LogTraceEvents="false" Schedule="">
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
  <Item Name="WishIcipHudAdtHl7TcpOut" Category="A-Wish,A-Icip,T-ADT" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Transmission des données Administratives le logiciel des USI (ICIP) de l&apos;HUDERF" LogTraceEvents="false" Schedule="">
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
  <Item Name="WishInnovianHudAdtHl7TcpOut" Category="A-Wish,A-Innovian,T-ADT" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Transmission des données Administratives vers le logiciel de gestion du département d&apos;anésthésie (Innovian) de l&apos;HUDERF" LogTraceEvents="false" Schedule="">
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
  <Item Name="WishCacheAllAdtHl7FcpOut" Category="A-Wish,A-Cache,T-ADT" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers Datameal" LogTraceEvents="false" Schedule="">
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
  <Item Name="WishCigesAllAdtDlmTcpOut" Category="A-Wish,A-Ciges,T-ADT" ClassName="CHUBXL.BO.ParsedTcpOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des données Administratives vers l&apos;Alpha" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">Wish</Setting>
    <Setting Target="Host" Name="SystemDestination">Ciges</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Ciges</Setting>
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
  <Item Name="WishMvAllAdtHl7TcpOut" Category="A-Wish,A-Mv,T-ADT" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers Medical Viewer" LogTraceEvents="false" Schedule="">
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
  <Item Name="WishOxygenBruAdtHl7TcpOut" Category="A-Wish,A-Oxygen,A-Refmed,A-Medecin,T-ADT,T-GDR" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers la Kine" LogTraceEvents="false" Schedule="">
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
  <Item Name="WishAgfaBruAdtHl7TcpOut" Category="A-Wish,A-Agfa,T-ADT" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie des données administratives patients de Wish vers Agfa-Quadrat Brugmann" LogTraceEvents="false" Schedule="">
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
  <Item Name="WishAgfaeiBruAdtHl7TcpOut" Category="Wish,Quadrat" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie des données administratives patients de Wish vers Agfa-Quadrat Brugmann" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">10.20.10.127</Setting>
    <Setting Target="Adapter" Name="Port">21132</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Agfaei\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Agfaei\Bru</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
  </Item>
  <Item Name="WishGlimsBruAdtHl7TcpOut" Category="A-Wish,A-Glims,T-ADT" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie des données administratives de Wish Brugmann vers Glims" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">21253</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Glims\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Glims\Bru</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.60.2.11</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
  </Item>
  <Item Name="WishGlimsHudAdtHl7TcpOut" Category="A-Wish,A-Glims,T-ADT" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie des données administratives de Wish Brugmann vers Glims" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">21252</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Glims\Hud</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Glims\Hud</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.60.2.11</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="WishDiamicAllAdtHl7TcpOut" Category="A-Wish,A-Diamic,T-ADT" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie des données adminstratives des aptiens de Wish vers Diamic" LogTraceEvents="false" Schedule="">
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
  <Item Name="WishInfohosAllAdtHl7TcpOut" Category="A-Wish,A-Infohos,T-ADT,A-Medecin" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers Infohos" LogTraceEvents="false" Schedule="">
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
  <Item Name="WishAstraiaBruAdtHl7TcpOut" Category="A-Wish,A-Astraia,T-ADT" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="" LogTraceEvents="false" Schedule="">
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
  <Item Name="WishEcareBruAdtHl7TcpOut" Category="A-Wish,A-Ecare,T-ADT" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
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
  <Item Name="WishMososBruAdtHl7TcpOut" Category="A-Wish,A-Mosos,T-ADT" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Transmission des données administratives WIsh vers le logiciel de gynécologie (Mosos)" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">22116</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Mosos\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Mosos\Bru</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.9.212</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="WishDatamealBruAdtHl7TcpOut" Category="A-Wish,A-Datameal,T-ADT" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers Datameal" LogTraceEvents="false" Schedule="">
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
  <Item Name="WishInfopartnerAllAdtHl7TcpOut" Category="A-Wish,A-Infopartner,T-ADT" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers Datameal" LogTraceEvents="false" Schedule="">
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
  <Item Name="WishEnstestBruAdtHl7TcpOut" Category="A-Wish" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Transmission des données Administratives vers l&apos;environnement de Pre-Production" LogTraceEvents="false" Schedule="">
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
  <Item Name="WishBdocHudAdtHl7TcpOut" Category="A-Wish,A-Bdoc,A-Refmed,A-Medecin,T-ADT" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers le DPI (Bdoc)" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">21771</Setting>
    <Setting Target="Adapter" Name="IPAddress">ATAIR</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="WishOphtalmoHudAdtHl7TcpOut" Category="A-Wish,A-Ophtalmo,T-ADT" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers l&apos;ophtalmo" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">ruthenium</Setting>
    <Setting Target="Adapter" Name="Port">21501</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Ophtalmo\Hud</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Ophtalmo\Hud</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="WishBdocBruAdtHl7TcpOut" Category="A-Wish,A-Bdoc,A-Refmed,A-Medecin,T-ADT,T-GDR" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers le DPI (Bdoc)" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">21951</Setting>
    <Setting Target="Adapter" Name="IPAddress">SPICA</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="WishGlimsCyberlabAllAdtHl7TcpOut" Category="A-Wish,A-Glims,T-ADT" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie des données administratives de Wish Brugmann vers Glims CyberLab" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">21631</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Glims\CyberLab\All</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Glims\CyberLab\All</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.10.8.43</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="WishBrainRtHudAdtHl7TcpOut" Category="A-Wish,A-BrainRt,T-ADT" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Adt Wish vers Brainrt (labo sommeil Huderf)" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">huBrainRT</Setting>
    <Setting Target="Adapter" Name="Port">21121</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\BrainRT\Hud</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\BrainRT\Hud</Setting>
  </Item>
  <Item Name="WishOperaBruAdtHl7TcpOut" Category="A-Wish,A-Opera,T-ADT" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des données adminsitratives patient de Wish vers Opera" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">BROPERAINT01</Setting>
    <Setting Target="Adapter" Name="Port">21591</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\opera\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\opera\Bru</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="WishAgfaNewBruAdtHl7TcpOut" Category="A-Wish,A-Agfa,T-ADT" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie des données administratives patients de Wish vers Agfa-Quadrat Brugmann" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">brRisIN01</Setting>
    <Setting Target="Adapter" Name="Port">21651</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\NewAgfa\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\NewAgfa\Bru</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
  </Item>
  <Item Name="WishBdocPrepHudAdtHl7TcpOut" Category="A-Wish,A-Bdoc,T-ADT" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers le DPI (Bdoc)" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">21721</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.26</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Wish\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Wish\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="WishCacheAllMedHl7FcpOut" Category="A-Wish,A-Ciges,A-Medecin,A-Cache" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers Datameal" LogTraceEvents="false" Schedule="">
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
  <Item Name="WishEcareBruMedHl7FcpOut" Category="A-Medecin,A-Ecare" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Transmission des données médecin vers Ecare" LogTraceEvents="false" Schedule="">
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
  <Item Name="BdocAllDocRouting" Category="A-Bdoc,A-Mv,T-DOC" ClassName="CHUBXL.BP.BDocRouting" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Routage des rapports de Bdoc" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="BdocAllHcRouting" Category="A-Bdoc,A-HealthConnect" ClassName="CHUBXL.BP.BDocMBRouting" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Routage des résultats Bdoc vers MediBridge" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="BdocHudDocHl7FcpIn" Category="A-Bdoc,A-Mv,T-DOC" ClassName="CHUBXL.BS.BDocFile" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Reception des rapports de Bdoc HUDERF" LogTraceEvents="false" Schedule="">
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
  <Item Name="BdocBruDocHl7FcpIn" Category="A-Bdoc,A-Mv,T-DOC" ClassName="CHUBXL.BS.BDocFile" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Reception des rapports de Bdoc BRU" LogTraceEvents="false" Schedule="">
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
  <Item Name="BdocMvAllDocHl7FcpOut" Category="A-Bdoc,A-Mv,T-DOC" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des rapports de Bdoc) vers Medical Viewer" LogTraceEvents="false" Schedule="">
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
  <Item Name="BdocBruHcHealthoneFcpIn" Category="A-Bdoc,A-HealthConnect,T-HC" ClassName="CHUBXL.BS.BDocMBFile" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Bdoc pour Medibridge" LogTraceEvents="false" Schedule="">
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
  <Item Name="BdocBruHcMedidocFcpIn" Category="A-Bdoc,A-HealthConnect" ClassName="CHUBXL.BS.BDocMBFile" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Bdoc  pour Medibridge" LogTraceEvents="false" Schedule="">
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
  <Item Name="BdocBruHcMedimailFcpIn" Category="A-Bdoc,A-HealthConnect,T-HC" ClassName="CHUBXL.BS.BDocMBFile" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Bdoc  pour Medibridge" LogTraceEvents="false" Schedule="">
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
  <Item Name="BdocBruHcSocrateFcpIn" Category="A-Bdoc,A-HealthConnect" ClassName="CHUBXL.BS.BDocMBFile" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Bdoc  pour Medibridge" LogTraceEvents="false" Schedule="">
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
  <Item Name="BdocBruHcTexteFcpIn" Category="A-Bdoc,A-HealthConnect,T-HC" ClassName="CHUBXL.BS.BDocMBFile" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Bdoc  pour Medibridge" LogTraceEvents="false" Schedule="">
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
  <Item Name="BdocAllHcHealthoneFcpOut" Category="A-Bdoc,A-HealthConnect,T-HC" ClassName="CHUBXL.BO.MBFileOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de Bdoc vers MediBridge format hone" LogTraceEvents="true" Schedule="">
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
  <Item Name="BdocAllHcMedidocFcpOut" Category="A-Bdoc,A-HealthConnect" ClassName="CHUBXL.BO.MBFileOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de Bdoc vers MediBridge format BJP" LogTraceEvents="true" Schedule="">
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
  <Item Name="BdocAllHcMedimailFcpOut" Category="A-Bdoc,A-HealthConnect,T-HC" ClassName="CHUBXL.BO.MBFileOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de Bdoc vers MediBridge format Medar" LogTraceEvents="true" Schedule="">
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
  <Item Name="BdocAllHcSocrateFcpOut" Category="A-Bdoc,A-HealthConnect" ClassName="CHUBXL.BO.MBFileOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de Bdoc vers MediBridge format Medidoc" LogTraceEvents="true" Schedule="">
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
  <Item Name="BdocAllHcTexteFcpOut" Category="A-Bdoc,A-HealthConnect,T-HC" ClassName="CHUBXL.BO.MBFileOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de Bdoc vers MediBridge format Medigest" LogTraceEvents="false" Schedule="">
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
  <Item Name="BdocHudHcHealthoneFcpIn" Category="A-Bdoc,A-HealthConnect,T-HC" ClassName="CHUBXL.BS.BDocMBFile" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Bdoc pour Medibridge" LogTraceEvents="false" Schedule="">
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
  <Item Name="BdocHudHcMedidocFcpIn" Category="A-Bdoc,A-HealthConnect,T-HC" ClassName="CHUBXL.BS.BDocMBFile" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Bdoc  pour Medibridge" LogTraceEvents="false" Schedule="">
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
  <Item Name="BdocHudHcMedimailFcpIn" Category="A-Bdoc,A-HealthConnect" ClassName="CHUBXL.BS.BDocMBFile" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Bdoc  pour Medibridge" LogTraceEvents="false" Schedule="">
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
  <Item Name="BdocHudHcSocrateFcpIn" Category="A-Bdoc,A-HealthConnect,T-HC" ClassName="CHUBXL.BS.BDocMBFile" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Bdoc  pour Medibridge" LogTraceEvents="false" Schedule="">
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
  <Item Name="BdocHudHcTexteFcpIn" Category="A-Bdoc,A-HealthConnect,T-HC" ClassName="CHUBXL.BS.BDocMBFile" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Bdoc  pour Medibridge" LogTraceEvents="false" Schedule="">
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
  <Item Name="AgfaAllDocRouting" Category="A-Agfa,T-DOC" ClassName="CHUBXL.BP.QuadratORURouting" PoolSize="1" Enabled="true" Foreground="false" Comment="Routing résultats Quadrat-Agfa HL7 ORU vers DPI" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="AgfaAllImgRouting" Category="A-Agfa,T-IMG" ClassName="CHUBXL.BP.QuadratORMHL7Routing" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des informations pour l&apos;imagerie d&apos;Agfa vers Bdoc" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="AgfaAllRdvRouting" Category="A-Agfa,T-RDV" ClassName="CHUBXL.BP.QuadratRVHL7Routing" PoolSize="1" Enabled="true" Foreground="false" Comment="Rendez-vous QPlanner vers DPIO" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="AgfaMvAllDocRouting" Category="A-Agfa,A-Mv,T-DOC" ClassName="CHUBXL.BP.QuadratRouting" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Routage des rapports de la radiologie et de QDReport" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="AgfaBruDocHl7TcpIn" Category="A-Agfa,T-DOC,MIT" ClassName="CHUBXL.BS.QuadratORUTcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Résultats Quadrat-Agfa vers DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">21873</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\AgfaORU\archive\Bru</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="ConnectionName">AgfaBruDocHl7TcpIn</Setting>
    <Setting Target="Adapter" Name="UseStream">1</Setting>
  </Item>
  <Item Name="AgfaBruDocXmlTcpInNew" Category="A-Agfa,A-Mv,T-DOC,MIT,NewRis" ClassName="CHUBXL.BS.QuadratTcpIn" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Reception des rapports de radiologie et de QDReport pour Brugmann" LogTraceEvents="false" Schedule="">
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
  <Item Name="AgfaBruDocHl7TcpInNew" Category="A-Agfa,T-DOC,MIT,NewRis" ClassName="CHUBXL.BS.QuadratORUTcpIn" PoolSize="1" Enabled="false" Foreground="false" Comment="Résultats Quadrat-Agfa vers DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">21875</Setting>
    <Setting Target="Adapter" Name="ConnectionName">AgfaNew</Setting>
    <Setting Target="Adapter" Name="MaxMessagesPerIteration">5</Setting>
    <Setting Target="Adapter" Name="SourceName">ORU</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\AgfaORU\archive\BruNew</Setting>
    <Setting Target="Adapter" Name="UseStream">1</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="AgfaBruRdvHl7TcpInNew" Category="A-Agfa,T-RDV,MIT,NewRis" ClassName="CHUBXL.BS.QuadratRVTcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Rendez-vous QPlanner vers DPI" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Port">21715</Setting>
    <Setting Target="Adapter" Name="MaxMessagesPerIteration">5</Setting>
    <Setting Target="Adapter" Name="ConnectionName">QuadratRVTcpIn</Setting>
    <Setting Target="Adapter" Name="SourceName">QPlanner</Setting>
    <Setting Target="Adapter" Name="UseStream">1</Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\AgfaRV\archive\BruNew</Setting>
  </Item>
  <Item Name="AgfaHudDocHl7TcpIn" Category="A-Agfa,T-DOC,MIT" ClassName="CHUBXL.BS.QuadratORUTcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Résultats Quadrat-Agfa vers DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">21841</Setting>
    <Setting Target="Adapter" Name="ConnectionName">Agfa</Setting>
    <Setting Target="Adapter" Name="MaxMessagesPerIteration">5</Setting>
    <Setting Target="Adapter" Name="SourceName">Résultats</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\AgfaORU\archive\Hud</Setting>
    <Setting Target="Adapter" Name="UseStream">1</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="AgfaBruDocXmlTcpIn" Category="A-Agfa,A-Mv,T-DOC,MIT" ClassName="CHUBXL.BS.QuadratTcpIn" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Reception des rapports de radiologie et de QDReport pour Brugmann" LogTraceEvents="false" Schedule="">
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
  <Item Name="AgfaHudDocXmlTcpIn" Category="A-Agfa,A-Mv,T-DOC,MIT" ClassName="CHUBXL.BS.QuadratTcpIn" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Reception des rapports de radiologie et de QDReport pour l&apos;HUDERF" LogTraceEvents="false" Schedule="">
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
  <Item Name="AgfaBdocBruDocHl7FcpOut" Category="A-Agfa,A-Bdoc,T-DOC" ClassName="CHUBXL.BO.SendDocToDPI" PoolSize="1" Enabled="true" Foreground="false" Comment="Résultats HUDERF Quadrat vers DPI" LogTraceEvents="false" Schedule="">
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
  <Item Name="AgfaBdocprepBruDocHl7FcpOut" Category="A-Agfa,A-Bdoc,T-DOC" ClassName="CHUBXL.BO.SendDocToDPI" PoolSize="1" Enabled="true" Foreground="false" Comment="Résultats HUDERF Quadrat vers DPI" LogTraceEvents="false" Schedule="">
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
  <Item Name="AgfaBdocHudDocHl7FcpOut" Category="A-Agfa,A-Bdoc,T-DOC" ClassName="CHUBXL.BO.SendDocToDPI" PoolSize="1" Enabled="true" Foreground="false" Comment="Résultats HUDERF Quadrat vers DPI" LogTraceEvents="false" Schedule="">
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
  <Item Name="AgfaBdocprepHudDocHl7FcpOut" Category="A-Agfa,A-Bdoc,T-DOC" ClassName="CHUBXL.BO.SendDocToDPI" PoolSize="1" Enabled="true" Foreground="false" Comment="Résultats HUDERF Quadrat vers DPI" LogTraceEvents="false" Schedule="">
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
  <Item Name="AgfaMvAllDocXmlFcpOut" Category="A-Agfa,A-Mv,T-DOC" ClassName="CHUBXL.BO.SendDocToMv" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats Quadrat vers Medical Viewer" LogTraceEvents="false" Schedule="">
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
  <Item Name="AgfaWishBruRdvHl7FcpOut" Category="A-Wish,A-Agfa,T-RDV" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers Datameal" LogTraceEvents="false" Schedule="">
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
  <Item Name="AgfaWishHudRdvHl7FcpOut" Category="A-Wish,A-Agfa,T-RDV" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers Datameal" LogTraceEvents="false" Schedule="">
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
  <Item Name="AgfaBdocBruImgHl7TcpOut" Category="A-Agfa,A-Bdoc" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des références d&apos;imagerie d&apos;Agfa vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">SPICA</Setting>
    <Setting Target="Adapter" Name="Port">21971</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\AgfaORM\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\AgfaORM\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="AgfaBdocBruImgHl7TcpFwd" Category="A-Agfa,A-Bdoc,T-IMG" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des références d&apos;imagerie d&apos;Agfa vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">10.20.8.26</Setting>
    <Setting Target="Adapter" Name="Port">21921</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PREP\AgfaORM\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PREP\AgfaORM\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="AgfaBdocHudImgHl7TcpOut" Category="A-Agfa,A-Bdoc" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des références d&apos;imagerie d&apos;Agfa vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">ATAIR</Setting>
    <Setting Target="Adapter" Name="Port">21791</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\AgfaORM\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\AgfaORM\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="AgfaBdocHudImgHl7FcpFwd" Category="A-Agfa,A-Bdoc,T-IMG" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Imagerie vers le DPI" LogTraceEvents="false" Schedule="">
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
  <Item Name="AgfaBruImgHl7TcpIn" Category="A-Agfa,T-IMG,MIT" ClassName="CHUBXL.BS.QuadratORMHUDTcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des informations pour l&apos;imagerie d&apos;Agfa vers Bdoc" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">21922</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="UseStream">1</Setting>
    <Setting Target="Adapter" Name="ConnectionName">AgfaORMTcpIn</Setting>
    <Setting Target="Adapter" Name="SourceName">AgfaImagerie</Setting>
    <Setting Target="Adapter" Name="MaxMessagesPerIteration">5</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\AgfaORM\archive\Bru</Setting>
  </Item>
  <Item Name="AgfaBruImgHl7TcpInNew" Category="A-Agfa,T-IMG,MIT,NewRis" ClassName="CHUBXL.BS.QuadratORMHUDTcpIn" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des informations pour l&apos;imagerie d&apos;Agfa vers BDoc" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">21925</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="UseStream">1</Setting>
    <Setting Target="Adapter" Name="ConnectionName">QuadratORMTcpIn</Setting>
    <Setting Target="Adapter" Name="SourceName">AgfaImagerie</Setting>
    <Setting Target="Adapter" Name="MaxMessagesPerIteration">5</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\QUADRATORM\archive\BRU</Setting>
  </Item>
  <Item Name="AgfaHudImgHl7TcpIn" Category="A-Agfa,T-IMG,MIT" ClassName="CHUBXL.BS.QuadratORMHUDTcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des informations pour l&apos;imagerie d&apos;Agfa vers Bdoc" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">21831</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="UseStream">1</Setting>
    <Setting Target="Adapter" Name="ConnectionName">QuadratORMTcpIn</Setting>
    <Setting Target="Adapter" Name="SourceName">AgfaImagerie</Setting>
    <Setting Target="Adapter" Name="MaxMessagesPerIteration">5</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\AgfaORM\archive\Hud</Setting>
  </Item>
  <Item Name="AgfaeiBruImgHl7TcpIn" Category="A-Agfa,T-IMG,MIT" ClassName="CHUBXL.BS.HL7TcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Messages ORM EI Quadrat-Agfa vers DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">21932</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\AgfaORM\archive\Bruei</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="JobPerConnection">1</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">2.3</Setting>
    <Setting Target="Host" Name="TargetConfigNames">AgfaAllImgRouting</Setting>
  </Item>
  <Item Name="AgfaBruRdvHl7TcpIn" Category="A-Agfa,T-RDV,MIT" ClassName="CHUBXL.BS.QuadratRVTcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Rendez-vous QPlanner vers DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">21711</Setting>
    <Setting Target="Adapter" Name="MaxMessagesPerIteration">5</Setting>
    <Setting Target="Adapter" Name="ConnectionName">QuadratRVTcpIn</Setting>
    <Setting Target="Adapter" Name="SourceName">QPlanner</Setting>
    <Setting Target="Adapter" Name="UseStream">1</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\AgfaRV\archive\Bru</Setting>
  </Item>
  <Item Name="AgfaHudRdvHl7TcpIn" Category="A-Agfa,T-RDV,MIT" ClassName="CHUBXL.BS.QuadratRVTcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Rendez-vous QPlanner HUDERF vers Wish" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">21751</Setting>
    <Setting Target="Adapter" Name="MaxMessagesPerIteration">5</Setting>
    <Setting Target="Adapter" Name="ConnectionName">QuadratRVTcpIn</Setting>
    <Setting Target="Adapter" Name="SourceName">QPlanner</Setting>
    <Setting Target="Adapter" Name="UseStream">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\AgfaRV\archive\Hud</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="AgfaBdocBruRdvHl7TcpOut" Category="A-Bdoc,A-Agfa,T-RDV" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des rendez-vous QPlanner H.U.D.E.R.F. vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\AgfaRV\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">G:\PROD\AgfaRV\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Adapter" Name="IPAddress">SPICA</Setting>
    <Setting Target="Adapter" Name="Port">21961</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="AgfaBdocBruRdvHl7TcpFwd" Category="A-Bdoc,A-Agfa,T-RDV" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des rendez-vous QPlanner H.U.D.E.R.F. vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\PREP\AgfaRV\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">G:\PREP\AgfaRV\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.26</Setting>
    <Setting Target="Adapter" Name="Port">21911</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="AgfaBdocHudRdvHl7TcpOut" Category="A-Bdoc,A-Agfa,T-RDV" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des rendez-vous QPlanner H.U.D.E.R.F. vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\AgfaRV\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">G:\PROD\AgfaRV\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Adapter" Name="IPAddress">ATAIR</Setting>
    <Setting Target="Adapter" Name="Port">21781</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="AgfaBdocHudRdvHl7FcpFwd" Category="A-Bdoc,A-Agfa,T-RDV" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie rendez-vous APlanner vers DPI" LogTraceEvents="false" Schedule="">
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
  <Item Name="GlimsAllLabRouting" Category="A-Glims,T-LAB" ClassName="CHUBXL.BP.GlimsHL7Routing" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Routage des analyses de laboratoire" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">15</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="GlimsAllMFURouting" Category="A-Glims,T-LAB,T-MFU" ClassName="CHUBXL.BP.GlimsHL7MFURouting" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="GlimsAllHcRouting" Category="A-Glims,A-HealthConnect,T-HC" ClassName="CHUBXL.BP.GlimsMBRouting" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Routage des résultats de laboratoire vers MediBridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="GlimsabruHudDocHl7FcpIn" Category="A-Glims,T-DOC" ClassName="CHUBXL.BS.GlimsFile" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie des résultats labo vers Abrumet" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">\\chubxl.be\data\glims-partage\bDOC\HUDERF</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.PDF</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Glimsabru\archive\Hud</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="GlimsabruBruDocHl7FcpIn" Category="A-Glims,T-DOC" ClassName="CHUBXL.BS.GlimsFile" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie des résultats labo vers Abrumet" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">\\chubxl.be\data\glims-partage\bDOC\HBR</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.PDF</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Glimsabru\archive\Bru</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="GlimsBdocabruBruDocHl7FcpFwd" Category="A-Glims,A-Bdoc,T-DOC" ClassName="CHUBXL.BO.SendDocToDPI" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie résultat Ecare vers MediWeb Brugmann" LogTraceEvents="false" Schedule="">
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
  <Item Name="GlimsBdocabruBruDocHl7FcpOut" Category="A-Glims,A-Bdoc,T-DOC" ClassName="CHUBXL.BO.SendDocToDPI" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie résultat Ecare vers MediWeb Brugmann" LogTraceEvents="false" Schedule="">
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
  <Item Name="GlimsBdocabruHudDocHl7FcpOut" Category="A-Glims,A-Bdoc" ClassName="CHUBXL.BO.SendDocToDPI" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie résultat Ecare vers MediWeb Brugmann" LogTraceEvents="false" Schedule="">
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
  <Item Name="GlimsMvabruMvAllDocXmlFcpOut" Category="A-Glims,T-DOC,T-LAB" ClassName="CHUBXL.BO.SendDocToMv" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie des iReport Glims vers Medical Viewer" LogTraceEvents="false" Schedule="">
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
  <Item Name="GlimsAllHchoneFcpIn" Category="A-Glims,A-HealthConnect,T-HC" ClassName="CHUBXL.BS.GlimsMBFile" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Labo Glims pour Medibridge" LogTraceEvents="true" Schedule="">
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
  <Item Name="GlimsAllHcBJPFcpIn" Category="A-Glims,A-HealthConnect,T-HC" ClassName="CHUBXL.BS.GlimsMBFile" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Labo Glims pour Medibridge" LogTraceEvents="false" Schedule="">
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
  <Item Name="GlimsAllHcMedarFcpIn" Category="A-Glims,A-HealthConnect,T-HC" ClassName="CHUBXL.BS.GlimsMBFile" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Labo Glims pour Medibridge" LogTraceEvents="false" Schedule="">
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
  <Item Name="GlimsAllHcMedidocFcpIn" Category="A-Glims,A-HealthConnect,T-HC" ClassName="CHUBXL.BS.GlimsMBFile" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Labo Glims pour Medibridge" LogTraceEvents="false" Schedule="">
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
  <Item Name="GlimsAllHcMedigestFcpIn" Category="A-Glims,A-HealthConnect,T-HC" ClassName="CHUBXL.BS.GlimsMBFile" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Labo Glims pour Medibridge" LogTraceEvents="false" Schedule="">
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
  <Item Name="GlimsAllHcSocrateFcpIn" Category="A-Glims,A-HealthConnect,T-HC" ClassName="CHUBXL.BS.GlimsMBFile" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Labo Glims pour Medibridge" LogTraceEvents="false" Schedule="">
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
  <Item Name="GlimsAllHchoneFcpOut" Category="A-Glims,A-HealthConnect,T-HC" ClassName="CHUBXL.BO.MBFileOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers MediBridge format hone" LogTraceEvents="true" Schedule="">
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
  <Item Name="GlimsAllHcBJPFcpOut" Category="A-Glims,A-HealthConnect,T-HC" ClassName="CHUBXL.BO.MBFileOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers MediBridge format BJP" LogTraceEvents="false" Schedule="">
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
  <Item Name="GlimsAllHcMedarFcpOut" Category="A-Glims,A-HealthConnect,T-HC" ClassName="CHUBXL.BO.MBFileOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers MediBridge format Medar" LogTraceEvents="false" Schedule="">
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
  <Item Name="GlimsAllHcMedidocFcpOut" Category="A-Glims,A-HealthConnect,T-HC" ClassName="CHUBXL.BO.MBFileOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers MediBridge format Medidoc" LogTraceEvents="false" Schedule="">
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
  <Item Name="GlimsAllHcMedigestFcpOut" Category="A-Glims,A-HealthConnect,T-HC" ClassName="CHUBXL.BO.MBFileOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers MediBridge format Medigest" LogTraceEvents="false" Schedule="">
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
  <Item Name="GlimsAllHcSocrateFcpOut" Category="A-Glims,A-HealthConnect" ClassName="CHUBXL.BO.MBFileOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers MediBridge format  Socrate" LogTraceEvents="false" Schedule="">
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
  <Item Name="GlimsAllLabHl7FcpIn" Category="A-Glims" ClassName="CHUBXL.BS.GlimsHL7File" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Labo Glims" LogTraceEvents="false" Schedule="">
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
  <Item Name="GlimsBruLabHl7TcpIn" Category="A-Glims,T-LAB,MIT" ClassName="CHUBXL.BS.GlimsTcpIn" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Reception des résultats de laboratoire pour Brugmann (Glims)" LogTraceEvents="false" Schedule="">
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
  <Item Name="GlimsHudLabHl7TcpIn" Category="A-Glims,T-LAB,MIT" ClassName="CHUBXL.BS.GlimsTcpIn" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Reception des résultats de laboratoire pour HUDERF (Glims)" LogTraceEvents="false" Schedule="">
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
  <Item Name="GlimsIcipHudLabHl7TcpOut" Category="A-Glims,A-Icip,T-LAB" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers le logiciel des USI (ICIP) de l&apos;HUDERF" LogTraceEvents="false" Schedule="">
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
  <Item Name="GlimsEcareBruLabHl7FcpOut" Category="A-Glims,A-Ecare,T-LAB" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers le logiciel des urgences (Ecare)  Brugmann" LogTraceEvents="false" Schedule="">
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
  <Item Name="GlimsDialyseAllLabHl7TcpOut" Category="A-Glims,A-Dialyse,T-LAB" ClassName="CHUBXL.BO.RawTcpOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Trnsmission des résultats de laboratoire vers le logiciel de dialyse (hemadial)" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">GLIMS</Setting>
    <Setting Target="Host" Name="SystemDestination">DIALYSE</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Glims\out\Dialyse</Setting>
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
  <Item Name="GlimsMvAllLabXmlFcpOut" Category="A-Glims,A-Mv" ClassName="CHUBXL.BO.SendDocToMv" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers Medical Viewer" LogTraceEvents="false" Schedule="START:*-*-*T19:00:00,STOP:*-*-*T20:00:00">
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
  <Item Name="GlimsBdocBruLabHl7TcpOut" Category="A-Glims,A-Bdoc,T-LAB" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie des résultats laboratoire vers l&apos;environnement de test du DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Glims\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Glims\out\Bdoc\Bru</Setting>
    <Setting Target="Adapter" Name="IPAddress">SPICA</Setting>
    <Setting Target="Adapter" Name="Port">21981</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="GlimsBdocBruLabHl7TcpFwd" Category="A-Glims,A-Bdoc,T-LAB" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie des résultats laboratoire vers l&apos;environnement de test du DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Glims\out\BdocFwd\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Glims\out\BdocFwd\Bru</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.26</Setting>
    <Setting Target="Adapter" Name="Port">21931</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="GlimsBdocHudLabHl7TcpOut" Category="A-Glims,A-Bdoc" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie des résultats laboratoire vers l&apos;environnement de test du DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Glims\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Glims\out\Bdoc\Hud</Setting>
    <Setting Target="Adapter" Name="IPAddress">ATAIR</Setting>
    <Setting Target="Adapter" Name="Port">21801</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="GlimsBdocHudLabHl7TcpFwd" Category="A-Glims,A-Bdoc,T-LAB" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Transmission des réultats laboratoire HUDERF vers l&apos;environnement de PREPROD" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Glims\out\BdocFwd\Bru</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.26</Setting>
    <Setting Target="Adapter" Name="Port">21082</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="GlimsAllMFUHl7FcpIn" Category="A-Glims,T-LAB,T-MFU" ClassName="CHUBXL.BS.GlimsHL7MFUFile" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Labo Glims" LogTraceEvents="false" Schedule="">
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
  <Item Name="GlimsAllMFUHl7TcpIn" Category="A-Glims,T-LAB,T-MFU" ClassName="CHUBXL.BS.GlimsMFUTcpIn" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Reception du fichier des analyses laboratoire " LogTraceEvents="false" Schedule="">
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
  <Item Name="GlimsGlimsBruMFUHl7FcpOut" Category="A-Glims,A-Agfa,T-LAB,T-MFU" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des analysess de laboratoire vers MediWeb Brugmann" LogTraceEvents="false" Schedule="">
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
  <Item Name="GlimsGlimsHudMFUHl7TcpOut" Category="A-Glims,T-LAB,T-MFU" ClassName="CHUBXL.BO.RawTcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Transmission du fichier des analyses de laboratoires vers l&apos;environnement de PREPRO" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">10.20.8.61</Setting>
    <Setting Target="Adapter" Name="Port">21411</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="SystemDestination">MFU</Setting>
    <Setting Target="Host" Name="SystemSource">Glims</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PREP\GlimsMF\archive\Hud</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
  </Item>
  <Item Name="InfohosMdAllPhaRouting" Category="A-Infohos" ClassName="CHUBXL.BP.InfohosBdocMedicRouting" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="InfohosSpeAllPhaRouting" Category="A-Infohos,T-FAC,A-Oxygen" ClassName="CHUBXL.BP.InfohosWishRouting" PoolSize="1" Enabled="true" Foreground="false" Comment="Transfert des spécialités d&apos;Infohos vers Wish" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="InfohosArtAllPhaRouting" Category="A-Infohos" ClassName="CHUBXL.BP.InfohosRouting" PoolSize="1" Enabled="true" Foreground="false" Comment="Articles Infohos vers Intranet" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">15</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="InfohosTsAllPhaRouting" Category="A-Infohos" ClassName="CHUBXL.BP.InfohosTSRouting" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">15</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="InfohosBdocBruPhaHl7TcpOut" Category="A-Infohos,A-Bdoc" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\InfohosMd\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\InfohosMd\out\Bdoc\Bru</Setting>
    <Setting Target="Adapter" Name="IPAddress">SPICA</Setting>
    <Setting Target="Adapter" Name="Port">21962</Setting>
    <Setting Target="Host" Name="AddToMetric">0</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
  </Item>
  <Item Name="InfohosBdocBruPhaHl7TcpOutPre" Category="A-Infohos,A-Bdoc" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\PREP\InfohosMd\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PREP\InfohosMd\out\Bdoc\Bru</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.26</Setting>
    <Setting Target="Adapter" Name="Port">21972</Setting>
    <Setting Target="Host" Name="AddToMetric">0</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="InfohosBdocHudPhaHl7TcpOut" Category="A-Infohos,A-Bdoc" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\InfohosMd\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\InfohosMd\out\Bdoc\Bru</Setting>
    <Setting Target="Adapter" Name="IPAddress">ATAIR</Setting>
    <Setting Target="Adapter" Name="Port">21952</Setting>
    <Setting Target="Host" Name="AddToMetric">0</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
  </Item>
  <Item Name="InfohosBdocHudPhaHl7TcpOutPre" Category="A-Infohos,A-Bdoc" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath"></Setting>
    <Setting Target="Host" Name="FileErrorArchivePath"></Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.26</Setting>
    <Setting Target="Adapter" Name="Port">21952</Setting>
    <Setting Target="Host" Name="AddToMetric">0</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="InfohosBdocBruPhaForHl7TcpOut" Category="A-Infohos,A-Bdoc" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath"></Setting>
    <Setting Target="Host" Name="FileErrorArchivePath"></Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.26</Setting>
    <Setting Target="Adapter" Name="Port">21982</Setting>
    <Setting Target="Host" Name="AddToMetric">0</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="InfohosBdocHudForPhaHl7TcpOut" Category="A-Infohos,A-Bdoc" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath"></Setting>
    <Setting Target="Host" Name="FileErrorArchivePath"></Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.26</Setting>
    <Setting Target="Adapter" Name="Port">21992</Setting>
    <Setting Target="Host" Name="AddToMetric">0</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="InfohosBdocBruPhaNotHl7TcpOut" Category="A-Infohos,A-Bdoc" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath"></Setting>
    <Setting Target="Host" Name="FileErrorArchivePath"></Setting>
    <Setting Target="Adapter" Name="IPAddress">BRDPIDEV01</Setting>
    <Setting Target="Adapter" Name="Port">21953</Setting>
    <Setting Target="Host" Name="AddToMetric">0</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="InfohosBdocHudPhaNotHl7TcpOut" Category="A-Infohos,A-Bdoc" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath"></Setting>
    <Setting Target="Host" Name="FileErrorArchivePath"></Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.9.85</Setting>
    <Setting Target="Adapter" Name="Port">21952</Setting>
    <Setting Target="Host" Name="AddToMetric">0</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="InfohosSpeAllPhaDlmFcpIn" Category="A-Infohos" ClassName="CHUBXL.BS.InfohosFileIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Fichier spécialités et implants d&apos;Infohos vers Wish" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\InfohosSpe\archive\All</Setting>
    <Setting Target="Adapter" Name="FilePath">\\brapo01\Infofile\ToIbm\Facturation\Articles</Setting>
    <Setting Target="Adapter" Name="FileSpec">S*</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\InfohosSpe\archive\All</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="InfohosTsAllPhaXmlFcpIn" Category="A-Infohos" ClassName="CHUBXL.BS.InfohosMultiFile" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
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
  <Item Name="InfohosArtAllPhaXmlFcpIn" Category="A-Infohos" ClassName="CHUBXL.BS.InfohosFile" PoolSize="1" Enabled="true" Foreground="false" Comment="Articles Infohos vers l&apos;intranet" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\InfohosArt\archive</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\brapo01\Infofile\articles</Setting>
    <Setting Target="Adapter" Name="FileSpec">P*.*xml</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\InfohosArt\archive</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp"></Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="InfohosArtAllPhaXmlFcpOut" Category="A-Infohos" ClassName="CHUBXL.BO.MBFileOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Articles Infohos vers Intranet" LogTraceEvents="false" Schedule="">
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
  <Item Name="InfohosMdAllPhaHl7FcpIn" Category="A-Infohos" ClassName="CHUBXL.BS.InfohosBDocMedicFile" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\InfohosMd\archive\All</Setting>
    <Setting Target="Host" Name="TargetConfigNames">InfohosMdAllPhaRouting</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\InfohosMd\archive</Setting>
    <Setting Target="Adapter" Name="FilePath">\\BRAPOEINT01\FromAPOToEveryone.MFN</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">2.6</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="InfohosMdBruPhaHl7FtpOut" Category="A-Infohos" ClassName="CHUBXL.BO.BatchFtpWishOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Fichier des spécialités d&apos;Infohos vers Wish" LogTraceEvents="false" Schedule="">
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
  <Item Name="InfohosMdHudPhaHl7FtpOut" Category="A-Infohos" ClassName="CHUBXL.BO.BatchFtpWishOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi du signalétique des médicaments iNFOHOS VERS wISH huderf" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">WISH</Setting>
    <Setting Target="Adapter" Name="FTPPort">21</Setting>
    <Setting Target="Adapter" Name="FTPServer">br400prd</Setting>
    <Setting Target="Adapter" Name="FilePath">FITPHUNS</Setting>
    <Setting Target="Host" Name="System">AS400</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\InfohosMd\out\Hud</Setting>
    <Setting Target="Host" Name="FailureTimeout">60</Setting>
  </Item>
  <Item Name="MvAllArcRouting" Category="A-Mv" ClassName="CHUBXL.BP.MVHL7Routing" PoolSize="1" Enabled="true" Foreground="false" Comment="MV vers DPI" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="MvAllArcHl7TcpIn" Category="A-Mv,MIT" ClassName="CHUBXL.BS.HL7TcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie des documents archivés vers DPI" LogTraceEvents="false" Schedule="">
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
  <Item Name="MvBdocHudArcHl7TcpOut" Category="A-Mv,A-Bdoc" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des références des documents scannés vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">ATAIR</Setting>
    <Setting Target="Adapter" Name="Port">21811</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Mv\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Mv\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
  </Item>
  <Item Name="MvBdocHudArcHl7TcpFwd" Category="A-Mv,A-Bdoc" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="ENvoi des références des documents scannés vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">10.20.8.26</Setting>
    <Setting Target="Adapter" Name="Port">21441</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PREP\Mv\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PREP\Mv\out\Bdoc\Hud</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
  </Item>
  <Item Name="MvBdocBruArcHl7TcpOut" Category="A-Mv,A-Bdoc" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des références des documents scannés Brugmann vers le DPI (Bdoc)" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">SPICA</Setting>
    <Setting Target="Adapter" Name="Port">21991</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Mv\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\Mv\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
  </Item>
  <Item Name="MvBdocBruArcHl7TcpFwd" Category="A-Mv,A-Bdoc" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="true" Foreground="false" Comment="ENvoi des références des documents scannés vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">10.20.8.26</Setting>
    <Setting Target="Adapter" Name="Port">21941</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PREP\Mv\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PREP\Mv\out\Bdoc\Bru</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
  </Item>
  <Item Name="MedecinAllMedRouting" Category="A-Medecin" ClassName="CHUBXL.BP.MedecinRouting" PoolSize="1" Enabled="true" Foreground="false" Comment="Routage des messages médecins vers périphériques" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">15</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="RefmedAllMedRouting" Category="A-Medecin,A-Refmed,T-GDR" ClassName="CHUBXL.BP.RefmedRouting" PoolSize="1" Enabled="true" Foreground="false" Comment="Routage des messages médecins vers périphériques" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">15</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="RefmedAllMedHl7FcpIn" Category="A-Medecin,A-Refmed,T-GDR" ClassName="CHUBXL.BS.MedecinMultiFile" PoolSize="1" Enabled="true" Foreground="false" Comment="Données Médecins" LogTraceEvents="false" Schedule="">
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
  <Item Name="OxygenAllDocRouting" Category="A-Oxygen,A-Mv,T-DOC" ClassName="CHUBXL.BP.KineRouting" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des résultats d&apos;Astraia (Gyné) vers Medical Viewer" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="OxygenBruDocHl7FcpIn" Category="A-Oxygen,T-DOC" ClassName="CHUBXL.BS.KineFile" PoolSize="1" Enabled="true" Foreground="false" Comment="Reception des rapports de Kine (Oxygen)" LogTraceEvents="false" Schedule="">
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
  <Item Name="OxygenBdocHudDocHl7FcpOut" Category="A-Oxygen,A-Bdoc,T-DOC" ClassName="CHUBXL.BO.SendDocToDPI" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des rapports du logiciel EndoBase HUDERF vers le DPI" LogTraceEvents="false" Schedule="">
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
  <Item Name="OxygenBdocBruDocHl7FcpOut" Category="A-Oxygen,A-Bdoc,T-DOC" ClassName="CHUBXL.BO.SendDocToDPI" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des rapports du logiciel EndoBase HUDERF vers le DPI" LogTraceEvents="false" Schedule="">
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
  <Item Name="OxygenMvAllDocHl7FcpOut" Category="A-Oxygen,A-Mv,T-DOC" ClassName="CHUBXL.BO.SendDocToMv" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des rapports Kine (Oxygen) vers Medical Viewer" LogTraceEvents="false" Schedule="">
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
  <Item Name="OxygenBruFacDlmFcpIn" Category="A-Oxygen,T-FAC" ClassName="CHUBXL.BS.InfohosFileIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Fichier facturation Kine Oxygen" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FileSpec">ki*.tf</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Oxygen\Fact\archive</Setting>
    <Setting Target="Adapter" Name="FilePath">\\broxy01\c$\Facturation</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Oxygen\Fact\archive</Setting>
    <Setting Target="Adapter" Name="Charset">Native</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="OxygenWishBruFacDlmFtpOut" Category="A-Oxygen,A-Wish,T-FAC" ClassName="CHUBXL.BO.BatchFtpWishOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Facturation Kine Oxygen vers Wish" LogTraceEvents="false" Schedule="">
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
  <Item Name="EcareBruDocRouting" Category="A-Ecare,T-DOC" ClassName="CHUBXL.BP.EcareRouting" PoolSize="1" Enabled="true" Foreground="false" Comment="Routage rapport Ecare vers MV" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">15</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="EcareBruDocHl7FcpIn" Category="A-Ecare,T-DOC" ClassName="CHUBXL.BS.EcareFile" PoolSize="1" Enabled="true" Foreground="false" Comment="Reception des rapports des urgences (Ecare)" LogTraceEvents="false" Schedule="">
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
  <Item Name="EcareBdocBruDocHl7FcpOut" Category="A-Ecare,A-Bdoc,T-DOC" ClassName="CHUBXL.BO.SendDocToDPI" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie résultat Ecare vers MediWeb Brugmann" LogTraceEvents="false" Schedule="">
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
  <Item Name="EcareMvAllDocHl7FcpOut" Category="A-Ecare,A-Mv,T-DOC" ClassName="CHUBXL.BO.SendDocToMv" PoolSize="1" Enabled="true" Foreground="false" Comment="Rapports Ecare vers MV" LogTraceEvents="false" Schedule="">
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
  <Item Name="EcareAgfaBruDocHl7FcpOut" Category="A-Ecare,A-Agfa,T-DOC" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie résultat Ecare vers MediWeb Brugmann" LogTraceEvents="false" Schedule="">
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
  <Item Name="DiamicAllDocRouting" Category="A-Diamic,A-Mv,T-DOC" ClassName="CHUBXL.BP.DiamicRouting" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Routage des résultats médicaux (format impression)" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="DiamicAllDocHl7FcpIn" Category="A-Diamic,T-DOC" ClassName="CHUBXL.BS.DiamicFile" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Reception des rapports d&apos;anatomie-pathologique (Diamic)" LogTraceEvents="false" Schedule="">
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
  <Item Name="DiamicBdocBruDocHl7FcpOut" Category="A-Bdoc,A-Diamic,T-DOC" ClassName="CHUBXL.BO.SendDocToDPI" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des rapport d&apos;anatomie-pathologique (Diamic) vers MediWeb HUDERF de test" LogTraceEvents="false" Schedule="">
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
  <Item Name="DiamicBdocHudDocHl7FcpOut" Category="A-Bdoc,A-Diamic,T-DOC" ClassName="CHUBXL.BO.SendDocToDPI" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des rapport d&apos;anatomie-pathologique (Diamic) vers MediWeb HUDERF de test" LogTraceEvents="false" Schedule="">
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
  <Item Name="DiamicBdocBruDocHl7FcpOutPrep" Category="A-Bdoc,A-Diamic,T-DOC" ClassName="CHUBXL.BO.SendDocToDPI" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des rapport d&apos;anatomie-pathologique (Diamic) vers MediWeb HUDERF de test" LogTraceEvents="false" Schedule="">
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
  <Item Name="DiamicBdocHudDocHl7FcpOutPrep" Category="A-Bdoc,A-Diamic,T-DOC" ClassName="CHUBXL.BO.SendDocToDPI" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des rapport d&apos;anatomie-pathologique (Diamic) vers MediWeb HUDERF de test" LogTraceEvents="false" Schedule="">
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
  <Item Name="DiamicMvAllDocHl7FcpOut" Category="A-Mv,T-DOC" ClassName="CHUBXL.BO.SendDocToMv" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des rapport d&apos;anatomie-pathologique (Diamic) vers Medical Viewer" LogTraceEvents="false" Schedule="">
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
  <Item Name="DiamicAgfaBruDocHl7FcpOut" Category="A-Diamic,A-Agfa,T-DOC" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des rapport d&apos;anatomie-pathologique (Diamic) vers MediWeb Brugmann" LogTraceEvents="false" Schedule="">
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
  <Item Name="DiamicAgfaHudDocHl7FcpOut" Category="A-Diamic,A-Agfa,T-DOC" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Transmission des rapport d&apos;anatomie-pathologique (Diamic) vers MediWeb HUDERF" LogTraceEvents="false" Schedule="">
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
  <Item Name="DiamicAllFacDlmFcpIn" Category="A-Diamic,T-FAC" ClassName="CHUBXL.BS.InfohosFileIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Fichier facturation Diamic" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FileSpec">EL*.txt</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Diamic\Fact\archive</Setting>
    <Setting Target="Adapter" Name="FilePath">\\10.15.102.10\diamicliaisons\activite\BRG\out</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Diamic\Fact\archive</Setting>
    <Setting Target="Adapter" Name="Charset">Native</Setting>
  </Item>
  <Item Name="DiamicWishBruFacDlmFtpOut" Category="A-Diamic,A-Wish,T-FAC" ClassName="CHUBXL.BO.BatchFtpWishOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Facturation Diamic vers Wish" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">WISH</Setting>
    <Setting Target="Adapter" Name="FTPPort">21</Setting>
    <Setting Target="Adapter" Name="FTPServer">br400prd</Setting>
    <Setting Target="Adapter" Name="FilePath">FITPBRNS</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Diamic\Fact\out\Wish\Bru</Setting>
    <Setting Target="Host" Name="System">AS400</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Host" Name="FailureTimeout">60</Setting>
  </Item>
  <Item Name="DiamicWishHudFacDlmFtpOut" Category="A-Diamic,A-Wish,T-FAC" ClassName="CHUBXL.BO.BatchFtpWishOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Facturation Diamic vers Wish" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">WISH</Setting>
    <Setting Target="Adapter" Name="FTPPort">21</Setting>
    <Setting Target="Adapter" Name="FTPServer">br400prd</Setting>
    <Setting Target="Adapter" Name="FilePath">FITPHUNS</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Diamic\Fact\out\Wish\Hud</Setting>
    <Setting Target="Host" Name="System">AS400</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Host" Name="FailureTimeout">60</Setting>
  </Item>
  <Item Name="OperaAllRdvRouting" Category="A-Opera,T-RDV" ClassName="CHUBXL.BP.OperaHL7Routing" PoolSize="1" Enabled="true" Foreground="false" Comment="Rendez-vous QPlanner vers DPI" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="OperaAllRdvHl7TcpIn" Category="A-Opera,T-RDV,MIT" ClassName="CHUBXL.BS.HL7TcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Transfert des rendez-vous Opera vers Bdoc" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\OperaRV\archive</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\PROD\OperaRV\archive</Setting>
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
  <Item Name="MososBruDocRouting" Category="A-Mosos,A-Mv,T-DOC" ClassName="CHUBXL.BP.MOSOSRouting" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des résultats de MOSOS (Gyné) vers Medical Viewer" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="MososBruDocHl7FcpIn" Category="A-Mosos,T-DOC" ClassName="CHUBXL.BS.MOSOSFile" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des résultats de MOSOS (Gyné) vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Mosos\archive\Bru</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="FilePath">\\brmosos01\Verzonden$</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Mosos\archive\Bru</Setting>
  </Item>
  <Item Name="MososMvBruDocHl7FcpOut" Category="A-Mosos,A-Mv,T-DOC" ClassName="CHUBXL.BO.SendDocToMv" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des rapports de MOSOS (Gyné) vers Medical Viewer" LogTraceEvents="false" Schedule="">
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
  <Item Name="AstraiaAllDocRouting" Category="A-Astraia,A-Mv,T-DOC" ClassName="CHUBXL.BP.AstraiaRouting" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des résultats d&apos;Astraia (Gyné) vers Medical Viewer" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="AstraiaBruDocHl7FcpIn" Category="A-Astraia,A-Mv,T-DOC" ClassName="CHUBXL.BS.AstraiaFile" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des résultats d&apos;Astraia (Gyné) vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\Astraia\archive\Bru</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Astraia\archive</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="FilePath">\\brastraia01\oru_pdf</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="AstraiaMvBruDocHl7FcpOut" Category="A-Astraia,A-Mv,T-DOC" ClassName="CHUBXL.BO.SendDocToMv" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des rapports d&apos;Astraia (Gyné) vers Medical Viewer" LogTraceEvents="false" Schedule="">
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
  <Item Name="IcipHudDocRouting" Category="A-Icip,A-Mv,T-DOC" ClassName="CHUBXL.BP.ICIPRouting" PoolSize="1" Enabled="true" Foreground="false" Comment="Routage des résultats ICIP vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
  </Item>
  <Item Name="IcipHudDocHl7FcpIn" Category="A-Icip,T-DOC" ClassName="CHUBXL.BS.ICIPFile" PoolSize="1" Enabled="true" Foreground="false" Comment="Reception des rapports des USI de l&apos;HUDERF ( ICIP)" LogTraceEvents="false" Schedule="">
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
  <Item Name="IcipMvHudDocHl7FcpOut" Category="A-Icip,A-Mv,T-DOC" ClassName="CHUBXL.BO.SendDocToMv" PoolSize="1" Enabled="true" Foreground="false" Comment="Résultats ICIP vers Medical Viewer" LogTraceEvents="false" Schedule="">
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
  <Item Name="OphtalmoHudDocRouting" Category="A-Ophtalmo,A-Mv,T-DOC" ClassName="CHUBXL.BP.OphtalmoRouting" PoolSize="1" Enabled="true" Foreground="false" Comment="Routage des résultats Ophtalmo vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
  </Item>
  <Item Name="OphtalmoHudDocHl7FcpIn" Category="A-Ophtalmo,T-DOC" ClassName="CHUBXL.BS.OphtalmoFile" PoolSize="1" Enabled="true" Foreground="false" Comment="Reception des rapports d&apos;Ophtalmologie pour l&apos;HUDERF" LogTraceEvents="false" Schedule="">
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
  <Item Name="OphtalmoMvHudDocHl7FcpOut" Category="A-Ophtalmo,A-Mv,T-DOC" ClassName="CHUBXL.BO.SendDocToMv" PoolSize="1" Enabled="true" Foreground="false" Comment="Transmission des rapports d&apos;ophtalmologie vers Medical Viewer" LogTraceEvents="false" Schedule="">
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
  <Item Name="EndobaseHudDocRouting" Category="A-Endobase,T-DOC" ClassName="CHUBXL.BP.BDocRouting" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Routage des rapports de Bdoc" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="EndobaseHudDocHl7FcpIn" Category="A-Endobase,T-DOC" ClassName="CHUBXL.BS.EndoBaseFile" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Reception des rapports du logiciel EndoBase HUDERF" LogTraceEvents="false" Schedule="">
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
  <Item Name="EndobaseBdocHudDocHl7FcpOut" Category="A-Endobase,A-Bdoc,T-DOC" ClassName="CHUBXL.BO.SendDocToDPI" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des rapports du logiciel EndoBase HUDERF vers le DPI" LogTraceEvents="false" Schedule="">
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
  <Item Name="EndobaseMvHudDocHl7FcpOut" Category="A-Endobase,A-Mv,T-DOC" ClassName="CHUBXL.BO.SendDocToMv" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoi des rapports EndoBase vers Medical Viewer" LogTraceEvents="false" Schedule="">
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
  <Item Name="PlusAllDocRouting" Category="A-Plus,A-Mv,T-DOC" ClassName="CHUBXL.BP.PLUSRouting" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Routage des rapports de Bdoc" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="PlusAllDocXmlFcpIn" Category="A-Plus,T-DOC" ClassName="CHUBXL.BS.PLUSFile" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="Reception des rapports de Bdoc HUDERF" LogTraceEvents="false" Schedule="">
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
  <Item Name="PlusMvAllDocXmlFcpOut" Category="A-Mv,A-Plus,T-DOC" ClassName="CHUBXL.BO.SendDocToMv" PoolSize="1" Enabled="true" Foreground="false" Comment="Test suppresion documents Agfa vers MV" LogTraceEvents="false" Schedule="">
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
  <Item Name="AlphaAllArcDlmFcpIn" Category="A-Alpha,A-Ciges" ClassName="CHUBXL.BS.AlphaFcpIn" PoolSize="1" Enabled="true" Foreground="false" Comment="Dossiers archives de l&apos;application CIGES à Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\Ciges\archive</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="FilePath">\\holmium\d$\dataTest\Alpha\Archive</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.txt</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="RsbEventAllRouting" Category="A-RsbEvent" ClassName="CHUBXL.BP.RsbEventRouting" PoolSize="1" Enabled="true" Foreground="false" Comment="Articles Infohos vers Intranet" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">15</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="RsbEventAllDocXmlFcpIn" Category="A-RsbEvent,T-DOC" ClassName="CHUBXL.BS.RsbEventFile" PoolSize="1" Enabled="true" Foreground="false" Comment="Réception fichiers Abrumet RsbEvent" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\PROD\RsbEvent\archive</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">Z:</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.*xml</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\PROD\RsbEvent\archive</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp"></Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="RsbBdocBruDocXmlFcpOut" Category="A-Bdoc,A-RsbEvent,T-DOC" ClassName="CHUBXL.BO.MBFileOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie fichier Abrumet RsbEvent vers Bdoc Brugmann" LogTraceEvents="false" Schedule="">
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
  <Item Name="RsbBdocHudDocXmlFcpOut" Category="A-Bdoc,A-RsbEvent,T-DOC" ClassName="CHUBXL.BO.MBFileOut" PoolSize="1" Enabled="true" Foreground="false" Comment="Envoie fichier Abrumet RsbEvent vers Bdoc Brugmann" LogTraceEvents="false" Schedule="">
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
  <Item Name="AlphaAllArcRouting" Category="A-Alpha,A-Ciges" ClassName="CHUBXL.BP.AlphaQDoc" PoolSize="1" Enabled="true" Foreground="false" Comment="Dossiers archives de l&apos;application CIGES à Medical Viewer" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
