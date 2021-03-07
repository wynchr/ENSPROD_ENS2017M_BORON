Class CHUBXL.ProductionPROD20180410 Extends Ens.Production [ ClassType = "", ProcedureBlock ]
{

XData ProductionDefinition
{
<Production Name="CHUBXL.Production" TestingEnabled="false" LogGeneralTraceEvents="false">
  <Description>Production CHUBXL - BORON</Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="AlertEmail" Category="Alert" ClassName="EnsLib.EMail.AlertOperation" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Gestion des alertes par E-mail" LogTraceEvents="false" Schedule="">
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
    <Setting Target="Adapter" Name="From">ensembleCharonPROD@chu-brugmann.be</Setting>
  </Item>
  <Item Name="Ens.Alert" Category="Alert" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="BusinessRuleName">CHUBXL.Ens.Alert</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="ChubxlGeneralMetric" Category="Metric,Alert" ClassName="CHUBXL.MET.GeneralMetric" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="MessageCheck" Category="Admin,Alert,Simed" ClassName="CHUBXL.BP.MessageCheck" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Routage des messages de check" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="QuadratAdmHUDTcpOut" Category="Wish,Quadrat" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoie des données administratives patients de Wish vers Agfa-Quadrat HUDERF" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\out\Quadrat\HUD</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\Wish\out\Quadrat\HUD</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Adapter" Name="Port">91761</Setting>
    <Setting Target="Adapter" Name="IPAddress">HUQITFI01</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="DialyseAdmTcpOut" Category="Wish,Admin" ClassName="CHUBXL.BO.ParsedTcpOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des données Administratives vers le logiciel de dialyses (hemadial)" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">SIBELMED</Setting>
    <Setting Target="Host" Name="SystemDestination">DIALYSE</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\out\DIALYSE</Setting>
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
    <Setting Target="Adapter" Name="Port">91122</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">15</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">5</Setting>
    <Setting Target="Adapter" Name="ReconnectRetry">5</Setting>
    <Setting Target="Adapter" Name="GetReply">1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">30</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="QuadratMultiFileIn" Category="Quadrat,Medical,MV" ClassName="CHUBXL.BS.QuadratMultiFile" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Reception des rapports de radiologie et de QDReport " LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\QUADRAT\archive</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\QUADRAT\in</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\QUADRAT\archive</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="QuadratBRUTcpIn" Category="Quadrat,Medical,MV" ClassName="CHUBXL.BS.QuadratTcpIn" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Reception des rapports de radiologie et de QDReport pour Brugmann" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\QUADRAT\archive\BRU</Setting>
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
    <Setting Target="Adapter" Name="JobPerConnection">0</Setting>
    <Setting Target="Adapter" Name="AllowedIPAddresses"></Setting>
    <Setting Target="Adapter" Name="QSize">100</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
    <Setting Target="Adapter" Name="Port">91231</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="QuadratHUDTcpIn" Category="Quadrat,Medical,MV" ClassName="CHUBXL.BS.QuadratTcpIn" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Reception des rapports de radiologie et de QDReport pour l&apos;HUDERF" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\QUADRAT\archive\HUD</Setting>
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
    <Setting Target="Adapter" Name="SourceName">quadrathud</Setting>
    <Setting Target="Adapter" Name="UseStream">1</Setting>
    <Setting Target="Adapter" Name="JobPerConnection">0</Setting>
    <Setting Target="Adapter" Name="AllowedIPAddresses"></Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
    <Setting Target="Adapter" Name="Port">91241</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="QuadratMultiIn" Category="Quadrat,Medical,Quadrat,Mv" ClassName="CHUBXL.BP.QuadratMultiIn" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Routage des rapports de la radiologie et de QDReport" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="QuadratRouting" Category="Quadrat,Dermato,Rxiso,Medical,Mv,Quadrat" ClassName="CHUBXL.BP.QuadratRouting" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Routage des rapports de la radiologie et de QDReport" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="QuadratMvFileOut" Category="Quadrat,Medical,MV" ClassName="CHUBXL.BO.SendDocToMv" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats Quadrat vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">QUADRAT</Setting>
    <Setting Target="Host" Name="SystemDestination">MV</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\dataPROD\QUADRAT\out\MV</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\dataPROD\QUADRAT\out\MV</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\oberon\xml$\RTF1\QUADRAT</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\oberon\xml$\RTF1\QUADRAT</Setting>
    <Setting Target="Host" Name="FilePathBLOB">G:\Allgeier\ACScanImport\RTF1\QUADRAT\</Setting>
    <Setting Target="Host" Name="ExtentionBLOB">RTF</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\QUADRAT\out\MV</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="ResultRouting" Category="Omnipro,Dermato,Rxiso,Medical,Mv,Quadrat" ClassName="CHUBXL.BP.ResultRouting" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Routage des résultats médicaux (format impression)" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">15</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="DiamicFileIn" Category="Diamic,Medical,MV" ClassName="CHUBXL.BS.DiamicFile" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Reception des rapports d&apos;anatomie-pathologique (Diamic)" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\DIAMIC\archive</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\10.15.102.10\diamicliaisons\DiffRes\Brugmann\Out</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.Ok</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\DIAMIC\archive</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Binary</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="DiamicRouting" Category="Diamic,Medical,Mv,Quadrat" ClassName="CHUBXL.BP.DiamicRouting" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Routage des résultats médicaux (format impression)" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="DiamicQuadratBRUFileOut" Category="Diamic,Medical,Quadrat" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des rapport d&apos;anatomie-pathologique (Diamic) vers MediWeb Brugmann" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">DIAMIC</Setting>
    <Setting Target="Host" Name="SystemDestination">QUADRAT_BRU</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\dataPROD\DIAMIC\out\QUADRAT_BRU</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7">\\BRQITFI01\Agfa$\Interfaces\ReportsInbound\Files\In</Setting>
    <Setting Target="Host" Name="RPFileHL7">\\BRQITFI01\Agfa$\Interfaces\ReportsInbound\Files\In</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\DIAMIC\out\QUADRAT</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="DiamicQuadratHUDFileOut" Category="Diamic,Medical,Quadrat" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des rapport d&apos;anatomie-pathologique (Diamic) vers MediWeb HUDERF" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">DIAMIC</Setting>
    <Setting Target="Host" Name="SystemDestination">QUADRAT_HUD</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\dataPROD\DIAMIC\out\QUADRAT_HUD</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7">\\HUQITFI01\Agfa\Interfaces\ReportsInbound\Files\In</Setting>
    <Setting Target="Host" Name="RPFileHL7">\\HUQITFI01\Agfa\Interfaces\ReportsInbound\Files\In</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\DIAMIC\out\QUADRAT</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="DiamicQuadratHUDFileTestOut" Category="Diamic,Medical,Quadrat" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des rapport d&apos;anatomie-pathologique (Diamic) vers MediWeb HUDERF de test" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">DIAMIC</Setting>
    <Setting Target="Host" Name="SystemDestination">QUADRAT_HUD</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\dataPROD\DIAMIC\out\QUADRAT_HUDtest</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7">\\BRQITF03\Quadratfs\Agfa2005.3.2_HD\Interfaces\ReportsInbound\Files\In</Setting>
    <Setting Target="Host" Name="RPFileHL7">\\BRQITF03\Quadratfs\Agfa2005.3.2_HD\Interfaces\ReportsInbound\Files\In</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\DIAMIC\out\QUADRATtest</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="DiamicMvFileOut" Category="Diamic,Medical,MV" ClassName="CHUBXL.BO.SendDocToMv" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des rapport d&apos;anatomie-pathologique (Diamic) vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">DIAMIC</Setting>
    <Setting Target="Host" Name="SystemDestination">MV</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\dataPROD\DIAMIC\out\MV</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\dataPROD\DIAMIC\out\MV</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\oberon\xml$\DIGI1\Diamic</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\oberon\xml$\DIGI1\Diamic</Setting>
    <Setting Target="Host" Name="FilePathBLOB">G:\Allgeier\ACScanImport\DIGI1\Diamic\</Setting>
    <Setting Target="Host" Name="ExtentionBLOB">RTF</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\DIAMIC\out\MV</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="GlimsMultiFileIn" Category="Glims,Medical,MV" ClassName="CHUBXL.BS.GlimsMultiFile" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Reception du fichier des analyses laboratoire" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\GLIMSMV\archive</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataProd\GLIMSMV\in</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.out</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\GLIMSMV\archive</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="GlimsMultiIn" Category="Glims,Medical,Mv" ClassName="CHUBXL.BP.GlimsMultiIn" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Routage des résultats de laboratoire" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="GlimsRouting" Category="Glims,Medical,Mv" ClassName="CHUBXL.BP.GlimsRouting" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Routage des résultats de laboratoire" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="GlimsMvFileOut" Category="Glims,MV" ClassName="CHUBXL.BO.SendDocToMv" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers Medical Viewer" LogTraceEvents="false" Schedule="START:*-*-*T19:00:00,STOP:*-*-*T20:00:00">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">GLIMS</Setting>
    <Setting Target="Host" Name="SystemDestination">MV</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\dataPROD\GLIMSMV\out</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\dataPROD\GLIMSMV\out</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\oberon\xml$\PCL\GLIMS\</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\oberon\xml$\PCL\GLIMS\</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\oberon\xml$\PCL\GLIMS\</Setting>
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
  <Item Name="GlimsMBRouting" Category="Glims,MB,Medical" ClassName="CHUBXL.BP.GlimsMBRouting" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Routage des résultats de laboratoire vers MediBridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="GlimsMBhoneFileIn" Category="Glims,Medical,MB" ClassName="CHUBXL.BS.GlimsMBFile" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Labo Glims pour Medibridge" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\MEDIBRIDGE\archive</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\chubxl.be\data\glims-partage\MEDIBRIDGE\HBR\out\HEALTHONE</Setting>
    <Setting Target="Adapter" Name="FileSpec">H1*.*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\MEDIBRIDGE\archive</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="GlimsMBBJPFileIn" Category="Glims,Medical,MB" ClassName="CHUBXL.BS.GlimsMBFile" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Labo Glims pour Medibridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\MEDIBRIDGE\archive</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\chubxl.be\data\glims-partage\MEDIBRIDGE\HBR\out\BJP</Setting>
    <Setting Target="Adapter" Name="FileSpec">BJP*.*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\MEDIBRIDGE\archive</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="GlimsMBMedarFileIn" Category="Glims,Medical,MB" ClassName="CHUBXL.BS.GlimsMBFile" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Labo Glims pour Medibridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\MEDIBRIDGE\archive</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\chubxl.be\data\glims-partage\MEDIBRIDGE\HBR\out\Medar</Setting>
    <Setting Target="Adapter" Name="FileSpec">Mdar*.*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\MEDIBRIDGE\archive</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="GlimsMBMedidocFileIn" Category="Glims,Medical,MB" ClassName="CHUBXL.BS.GlimsMBFile" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Labo Glims pour Medibridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\MEDIBRIDGE\archive</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\chubxl.be\data\glims-partage\MEDIBRIDGE\HBR\out\MEDIDOC</Setting>
    <Setting Target="Adapter" Name="FileSpec">MDoc*.*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\MEDIBRIDGE\archive</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="GlimsMBMedigestFileIn" Category="Glims,Medical,MB" ClassName="CHUBXL.BS.GlimsMBFile" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Labo Glims pour Medibridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\MEDIBRIDGE\archive</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\chubxl.be\data\glims-partage\MEDIBRIDGE\HBR\out\MEDIGEST</Setting>
    <Setting Target="Adapter" Name="FileSpec">MGes*.*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\MEDIBRIDGE\archive</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
    <Setting Target="Host" Name="BusinessPartner"></Setting>
  </Item>
  <Item Name="GlimsMBSocrateFileIn" Category="Glims,Medical,MB" ClassName="CHUBXL.BS.GlimsMBFile" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Labo Glims pour Medibridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\MEDIBRIDGE\archive</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\chubxl.be\data\glims-partage\MEDIBRIDGE\HBR\out\Socrate</Setting>
    <Setting Target="Adapter" Name="FileSpec">Soc*.*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\MEDIBRIDGE\archive</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="MBhoneFileOut" Category="MB,Glims,Medical" ClassName="CHUBXL.BO.MBFileOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers MediBridge format hone" LogTraceEvents="true" Schedule="">
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
  <Item Name="MBBJPFileOut" Category="MB,Glims,Medical" ClassName="CHUBXL.BO.MBFileOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers MediBridge format BJP" LogTraceEvents="false" Schedule="">
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
  <Item Name="MBMedarFileOut" Category="MB,Glims,Medical" ClassName="CHUBXL.BO.MBFileOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers MediBridge format Medar" LogTraceEvents="false" Schedule="">
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
  <Item Name="MBMedidocFileOut" Category="MB,Glims,Medical" ClassName="CHUBXL.BO.MBFileOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers MediBridge format Medidoc" LogTraceEvents="false" Schedule="">
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
  <Item Name="MBMedigestFileOut" Category="MB,Glims,Medical" ClassName="CHUBXL.BO.MBFileOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers MediBridge format Medigest" LogTraceEvents="false" Schedule="">
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
  <Item Name="MBSocrateFileOut" Category="MB,Glims,Medical" ClassName="CHUBXL.BO.MBFileOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers MediBridge format  Socrate" LogTraceEvents="false" Schedule="">
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
  <Item Name="GlimsHL7FileIn" Category="Glims,Medical" ClassName="CHUBXL.BS.GlimsHL7File" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Labo Glims" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\GLIMS\archive</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\GLIMS\in</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\GLIMS\archive</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="GlimsBRUTcpIn" Category="Glims,Medical,Quadrat" ClassName="CHUBXL.BS.GlimsTcpIn" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Reception des résultats de laboratoire pour Brugmann (Glims)" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\GLIMS\archive\BRU</Setting>
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
    <Setting Target="Adapter" Name="Port">91191</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="GlimsHUDTcpIn" Category="Glims,Medical,Quadrat" ClassName="CHUBXL.BS.GlimsTcpIn" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Reception des résultats de laboratoire pour HUDERF (Glims)" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\GLIMS\archive\HUD</Setting>
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
    <Setting Target="Adapter" Name="Port">91351</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="GlimsHL7Routing" Category="Glims,Medical" ClassName="CHUBXL.BP.GlimsHL7Routing" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Routage des analyses de laboratoire" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">15</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="GlimsHL7MFURouting" Category="Glims,Medical" ClassName="CHUBXL.BP.GlimsHL7MFURouting" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="GlimsHL7FileOut" Category="Glims,Medical,Quadrat" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">0</Setting>
    <Setting Target="Host" Name="SystemSource">GLIMS</Setting>
    <Setting Target="Host" Name="SystemDestination">QUADRAT</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\dataPROD\GLIMS\out</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7"></Setting>
    <Setting Target="Host" Name="RPFileHL7"></Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\GLIMS\out</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="GlimsBRUHL7FileOut" Category="Glims,Medical,Quadrat" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers MediWeb Brugmann" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">GLIMS</Setting>
    <Setting Target="Host" Name="SystemDestination">QUADRAT_BRU</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\dataPROD\GLIMS\out\QUADRAT\BRU</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7">\\BRQITFI01\Agfa$\Interfaces\LabResultLink\Files\LabResultMips\In</Setting>
    <Setting Target="Host" Name="RPFileHL7"></Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\GLIMS\out\QUADRAT\BRU</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="GlimsHUDHL7FileOut" Category="Glims,Medical,Quadrat" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers MediWeb HUDERF" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">GLIMS</Setting>
    <Setting Target="Host" Name="SystemDestination">QUADRAT_HUD</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\dataPROD\GLIMS\out\QUADRAT\HUD</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7">\\HUQITFI01\Agfa\Interfaces\LabResultLink\Files\LabResultMips\In</Setting>
    <Setting Target="Host" Name="RPFileHL7"></Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\GLIMS\out\QUADRAT\HUD</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="GlimsHUDHL7FileTestOut" Category="Glims,Medical,Quadrat" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers MediWeb HUDERF de test" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">GLIMS</Setting>
    <Setting Target="Host" Name="SystemDestination">QUADRAT_HUD</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\dataPROD\GLIMS\out\QUADRAT\HUDtest</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7">\\BRQITF03\Quadratfs\Agfa2005.3.2_HD\Interfaces\LabResultlink\Files\LabResultMips\In</Setting>
    <Setting Target="Host" Name="RPFileHL7"></Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\GLIMS\out\QUADRAT\HUDtest</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="GlimsICIPHUDHL7TcpOut" Category="Glims,Medical,ICIP" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers le logiciel des USI (ICIP) de l&apos;HUDERF" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\GLIMS\out\QUADRAT\HUD\ICIP</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\GLIMS\out\QUADRAT\HUD\ICIP</Setting>
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
  <Item Name="GlimsECareBRUHL7FileOut" Category="Glims,Medical,Ecare" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers le logiciel des urgences (Ecare)  Brugmann" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">GLIMS</Setting>
    <Setting Target="Host" Name="SystemDestination">E_Care</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\dataPROD\GLIMS\out\ECare\BRU</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7">\\brecareprod\Ecare_Transfers\GLIMS\Import</Setting>
    <Setting Target="Host" Name="RPFileHL7"></Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\GLIMS\out\ECare\BRU</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="DiaHL7TcpOut" Category="Glims,Dialyse,Medical" ClassName="CHUBXL.BO.RawTcpOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Trnsmission des résultats de laboratoire vers le logiciel de dialyse (hemadial)" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">GLIMS</Setting>
    <Setting Target="Host" Name="SystemDestination">DIALYSE</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\GLIMS\out\DIALYSE</Setting>
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
    <Setting Target="Adapter" Name="Port">91282</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">15</Setting>
    <Setting Target="Adapter" Name="ReconnectRetry">5</Setting>
    <Setting Target="Adapter" Name="GetReply">1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="GlimsDbmotionBRUHL7FileOut" Category="Glims,Medical,Dbmotion" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers Dbimotion Brugmann" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">GLIMS</Setting>
    <Setting Target="Host" Name="SystemDestination">DBMOTION_BRU</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\dataPROD\GLIMS\out\DBMOTION\BRU</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7"></Setting>
    <Setting Target="Host" Name="RPFileHL7"></Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\GLIMS\out\DBMOTION\BRU</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="GlimsDbmotionHUDHL7FileOut" Category="Glims,Medical,Dbmotion" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers Dbmotion HUDERF" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">GLIMS</Setting>
    <Setting Target="Host" Name="SystemDestination">DBMOTION_HUD</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\dataPROD\GLIMS\out\DBMOTION\HUD</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7"></Setting>
    <Setting Target="Host" Name="RPFileHL7"></Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\GLIMS\out\DBMOTION\HUD</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="GlimsInitiateBRUHL7FileOut" Category="Glims,Medical,Initiate" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers Initiate Brugmann" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">GLIMS</Setting>
    <Setting Target="Host" Name="SystemDestination">INITIATE_BRU</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\dataPROD\GLIMS\out\INITIATE\BRU</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7"></Setting>
    <Setting Target="Host" Name="RPFileHL7"></Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\GLIMS\out\INITIATE\BRU</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="GlimsInitiateHUDHL7FileOut" Category="Glims,Medical,Initiate" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de laboratoire vers Initiate HUDERF" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">GLIMS</Setting>
    <Setting Target="Host" Name="SystemDestination">INITIATE_HUD</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\dataPROD\GLIMS\out\INITIATE\HUD</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7"></Setting>
    <Setting Target="Host" Name="RPFileHL7"></Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\GLIMS\out\INITIATE\HUD</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="GlimsHL7MFUFileIn" Category="Glims,Medical" ClassName="CHUBXL.BS.GlimsHL7MFUFile" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Fichiers Labo Glims" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\GLIMS\archive\MFU</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\GLIMS\inMFU</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\GLIMS\archive\MFU</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="GlimsMFUTcpIn" Category="Glims,Medical,Quadrat" ClassName="CHUBXL.BS.GlimsMFUTcpIn" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Reception du fichier des analyses laboratoire " LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\GLIMS\archive\MFU</Setting>
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
    <Setting Target="Adapter" Name="Port">91401</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="GlimsMFUBRUHL7FileOut" Category="Glims,Medical,Quadrat" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des analysess de laboratoire vers MediWeb Brugmann" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">GLIMS</Setting>
    <Setting Target="Host" Name="SystemDestination">QUADRAT_MFU</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\dataPROD\GLIMS\out\QUADRAT\MFU</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7">\\BRQITFI01\Agfa$\Interfaces\LabResultLink\Files\LabMfuMips\InENS</Setting>
    <Setting Target="Host" Name="RPFileHL7"></Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\GLIMS\out\QUADRAT\MFU</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="GlimsMFUHSPHL7FileOut" Category="Glims,Medical,Quadrat" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des analysess de laboratoire vers MediWeb HSP" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">GLIMS</Setting>
    <Setting Target="Host" Name="SystemDestination">QUADRAT_MFUHSP</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\dataPROD\GLIMS\out\QUADRAT\MFUHSP</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7">\\10.10.1.217\InENS</Setting>
    <Setting Target="Host" Name="RPFileHL7"></Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\GLIMS\out\QUADRAT\MFU</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="GlimsMFUHISHL7FileOut" Category="Glims,Medical,Quadrat" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des analysess de laboratoire vers MediWeb HIS" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">GLIMS</Setting>
    <Setting Target="Host" Name="SystemDestination">QUADRAT_MFUHIS</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\dataPROD\GLIMS\out\QUADRAT\MFUHIS</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7">\\chubxl.be\data\glims-partage\MFU\HIS</Setting>
    <Setting Target="Host" Name="RPFileHL7"></Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\GLIMS\out\QUADRAT\MFU</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="OphtalmoMvFileOut" Category="Ophtalmo,Medical,MV" ClassName="CHUBXL.BO.SendDocToMv" PoolSize="1" Enabled="false" Foreground="false" Comment="Transmission des rapports d&apos;ophtalmologie vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">Ophtalmo</Setting>
    <Setting Target="Host" Name="SystemDestination">Medical Viewer</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\dataPROD\Ophtalmo\out\MV</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\dataPROD\Ophtalmo\out\MV</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\oberon\xml$\DIGI2\OPHTALMO</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\oberon\xml$\DIGI2\OPHTALMO</Setting>
    <Setting Target="Host" Name="FilePathBLOB">G:\Allgeier\ACScanImport\DIGI2\OPHTALMO\</Setting>
    <Setting Target="Host" Name="ExtentionBLOB">RTF</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\Ophtalmo\out\MV</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="OphtalmoRouting" Category="Ophalmo,Medical,Mv" ClassName="CHUBXL.BP.OphtalmoRouting" PoolSize="1" Enabled="false" Foreground="false" Comment="Routage des résultats Ophtalmo vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
  </Item>
  <Item Name="OphtalmoFileIn" Category="Ophtalmo,Medical,MV" ClassName="CHUBXL.BS.OphtalmoFile" PoolSize="1" Enabled="false" Foreground="false" Comment="Reception des rapports d&apos;Ophtalmologie pour l&apos;HUDERF" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Ophtalmo\archive</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\ruthenium\c$\ORUPROD</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.Ok</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\Ophtalmo\archive</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="InfohosArticleFileOut" Category="Infohos, intranet" ClassName="CHUBXL.BO.MBFileOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Articles Infohos vers Intranet" LogTraceEvents="false" Schedule="">
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
  <Item Name="InfohosArticleFileIn" Category="Infohos, intranet" ClassName="CHUBXL.BS.InfohosFile" PoolSize="1" Enabled="false" Foreground="false" Comment="Articles Infohos vers l&apos;intranet" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Infohos\archive</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\brapo01\Infofile\articles</Setting>
    <Setting Target="Adapter" Name="FileSpec">P*.*xml</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\Infohos\archive</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp"></Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="InfohosRouting" Category="Infohos, intranet" ClassName="CHUBXL.BP.InfohosRouting" PoolSize="1" Enabled="false" Foreground="false" Comment="Articles Infohos vers Intranet" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">15</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="MedecinEcareFileOut" Category="Medecin, Ecare" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Transmission des données médecin vers Ecare" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">Medecin</Setting>
    <Setting Target="Host" Name="SystemDestination">Ecare</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\dataPROD\MEDECIN\out\Ecare</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7">\\brecareprod\hl7\gp\inbox\</Setting>
    <Setting Target="Host" Name="RPFileHL7">G:\dataPROD\MEDECIN\out\Ecare</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\MEDECIN\out\Ecare</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="MedecinRouting" Category="Medecin" ClassName="CHUBXL.BP.MedecinRouting" PoolSize="1" Enabled="false" Foreground="false" Comment="Routage des messages médecins vers périphériques" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">15</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="MedecinMultiFileIn" Category="Medecin" ClassName="CHUBXL.BS.MedecinMultiFile" PoolSize="1" Enabled="false" Foreground="false" Comment="Données Médecins" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\MEDECIN\archive</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\brdevtask01\FTPout$\FMC\</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.fmc</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\MEDECIN\archive</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp"></Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="ICIPMvFileOut" Category="ICIP,Medical,MV" ClassName="CHUBXL.BO.SendDocToMv" PoolSize="1" Enabled="false" Foreground="false" Comment="Résultats ICIP vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">ICIP</Setting>
    <Setting Target="Host" Name="SystemDestination">Medical Viewer</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\dataPROD\ICIP\out\MV</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\dataPROD\ICIP\out\MV</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\oberon\xml$\PDF1\ICIP</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\oberon\xml$\PDF1\ICIP</Setting>
    <Setting Target="Host" Name="FilePathBLOB">G:\Allgeier\ACScanImport\PDF1\ICIP\</Setting>
    <Setting Target="Host" Name="ExtentionBLOB">PDF</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\ICIP\out\MV</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="ICIPRouting" Category="ICIP,Medical,Mv" ClassName="CHUBXL.BP.ICIPRouting" PoolSize="1" Enabled="false" Foreground="false" Comment="Routage des résultats ICIP vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
  </Item>
  <Item Name="ICIPFileIn" Category="ICIP,Medical,MV" ClassName="CHUBXL.BS.ICIPFile" PoolSize="1" Enabled="false" Foreground="false" Comment="Reception des rapports des USI de l&apos;HUDERF ( ICIP)" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\ICIP\archive</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\icipsrv02\huderf-export</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.HL7</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\ICIP\archive</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="EcareFileIn" Category="Ecare,Medical,MV" ClassName="CHUBXL.BS.EcareFile" PoolSize="1" Enabled="false" Foreground="false" Comment="Reception des rapports des urgences (Ecare)" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Ecare\archive</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\brEcareprod\hl7\doc\outbox</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\Ecare\archive</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="EcareRouting" Category="Ophtalmo,Medical,Mv,PROD" ClassName="CHUBXL.BP.EcareRouting" PoolSize="1" Enabled="false" Foreground="false" Comment="Routage rapport Ecare vers MV" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">15</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="EcareMvFileOut" Category="Ecare,Medical,MV" ClassName="CHUBXL.BO.SendDocToMv" PoolSize="1" Enabled="false" Foreground="false" Comment="Rapports Ecare vers MV" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">Ecare</Setting>
    <Setting Target="Host" Name="SystemDestination">MV</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\dataPROD\Ecare\out\MV</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\dataPROD\Ecare\out\MV</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\oberon\xml$\DIGI2\ECARE</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\oberon\xml$\DIGI2\ECARE</Setting>
    <Setting Target="Host" Name="FilePathBLOB">G:\Allgeier\ACScanImport\DIGI2\ECARE\</Setting>
    <Setting Target="Host" Name="ExtentionBLOB">RTF</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\Ecare\out\MV</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="EcareQuadratBRUFileOut" Category="Ecare,Medical,Quadrat" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoie résultat Ecare vers MediWeb Brugmann" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">Ecare</Setting>
    <Setting Target="Host" Name="SystemDestination">QUADRAT_BRU</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\dataPROD\Ecare\out\QUADRAT_BRU</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7">\\brqitfi01\Agfa$\Interfaces\ReportsInbound\Files\IN</Setting>
    <Setting Target="Host" Name="RPFileHL7">\\brqitfi01\Agfa$\Interfaces\ReportsInbound\Files\IN</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\Ecare\out\QUADRAT_BRU</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="ICIPAdmTcpOut" Category="Simed,Admin,ICIP" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Transmission des données Administratives le logiciel des USI (ICIP) de l&apos;HUDERF" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\out\ICIP</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\Wish\out\ICIP</Setting>
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
    <Setting Target="Adapter" Name="Port">91641</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">30</Setting>
    <Setting Target="Adapter" Name="ReconnectRetry">5</Setting>
    <Setting Target="Adapter" Name="GetReply">1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="InnovianAdmTcpOut" Category="Simed,Admin,Innovian" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Transmission des données Administratives vers le logiciel de gestion du département d&apos;anésthésie (Innovian) de l&apos;HUDERF" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\out\Innovian</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\Wish\out\Innovian</Setting>
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
    <Setting Target="Adapter" Name="Port">91581</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">5</Setting>
    <Setting Target="Adapter" Name="ReconnectRetry">5</Setting>
    <Setting Target="Adapter" Name="GetReply">1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="GlimsHUDDPIHL7TcpOutPreProd" Category="Glims, DPI" ClassName="CHUBXL.BO.RawTcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Transmission des réultats laboratoire HUDERF vers l&apos;environnement de PREPROD" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="SystemDestination">DPI HUDERF</Setting>
    <Setting Target="Host" Name="SystemSource">Glims</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\GLIMS\out\PREPROD\HUD</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.61</Setting>
    <Setting Target="Adapter" Name="Port">91092</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="GlimsMFUHUDHL7TcpOut" Category="Glims, DPI" ClassName="CHUBXL.BO.RawTcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Transmission du fichier des analyses de laboratoires vers l&apos;environnement de PREPRO" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">10.20.8.61</Setting>
    <Setting Target="Adapter" Name="Port">91411</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="SystemDestination">MFU</Setting>
    <Setting Target="Host" Name="SystemSource">Glims</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPREP\GLIMS\archive\MFU\PREPROD</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
  </Item>
  <Item Name="MedecinDPIFileOut" Category="DPI, Medecin,REFMED" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Transmission des données médecins vers le DPI HUDERF" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\MEDECIN\out\DPI</Setting>
    <Setting Target="Host" Name="SystemDestination">DPI</Setting>
    <Setting Target="Host" Name="SystemSource">Medecin</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">\\holmium\D$\DataTEST\Medecin\in</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7">\\holmium\D$\DataTEST\Medecin\in</Setting>
    <Setting Target="Host" Name="RPFileHL7">\\holmium\D$\DataTEST\Medecin\in</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="QuadratHUDDPIHL7TcpOutPreProd" Category="Quadrat, DPI" ClassName="CHUBXL.BO.RawTcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Transmission des rapports Quadrat HUDERF vers l&apos;environnement de PREPROD" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="SystemDestination">DPI HUDERF</Setting>
    <Setting Target="Host" Name="SystemSource">Quadrat</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\QUADRAT\out\DPIHUD</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.61</Setting>
    <Setting Target="Adapter" Name="Port">91102</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="AstraiaMvFileOut" Category="Astraia,Medical,MV" ClassName="CHUBXL.BO.SendDocToMv" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des rapports d&apos;Astraia (Gyné) vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FilePathLocalTXT">G:\dataPROD\Astraia\out\MV</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\dataPROD\Astraia\out\MV</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\oberon\xml$\PDF1\Astraia</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\oberon\xml$\PDF1\Astraia</Setting>
    <Setting Target="Host" Name="SystemDestination">Medcial Viewer</Setting>
    <Setting Target="Host" Name="SystemSource">Astraia</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\Astraia\out\MV</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
    <Setting Target="Host" Name="ExtentionBLOB">PDF</Setting>
    <Setting Target="Host" Name="FailureTimeout">1</Setting>
    <Setting Target="Host" Name="FilePathBLOB">G:\Allgeier\ACScanImport\PDF1\Astraia\</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
  </Item>
  <Item Name="AstraiaRouting" Category="Astraia,MV,Medical" ClassName="CHUBXL.BS.AstraiaRouting" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des résultats d&apos;Astraia (Gyné) vers Medical Viewer" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="AstraiaFile" Category="Astraia,MV,Medical" ClassName="CHUBXL.BS.AstraiaFile" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des résultats d&apos;Astraia (Gyné) vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Astraia\archive</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\Astraia\archive</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="FilePath">\\brastraia01\d$\oru_pdf</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="DiamicDPIHUDPreProdFileOut" Category="DPI,Medical,Quadrat" ClassName="CHUBXL.BO.SendDocToDPI" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des rapport d&apos;anatomie-pathologique (Diamic) vers MediWeb HUDERF de test" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">DIAMIC</Setting>
    <Setting Target="Host" Name="SystemDestination">DPI_HUD</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath"></Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\10.20.8.26\f$\Integrations\Diamic\</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\dataPREP\DIAMIC\out\DPI_HUD</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\dataPREP\DIAMIC\out\DPI_HUD</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\10.20.8.26\f$\Integrations\Diamic\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\10.20.8.26\f$\Integrations\Diamic\</Setting>
  </Item>
  <Item Name="DiamicDPIHUDFileOut" Category="DPI,Medical,Quadrat" ClassName="CHUBXL.BO.SendDocToDPI" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des rapport d&apos;anatomie-pathologique (Diamic) vers MediWeb HUDERF de test" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">DIAMIC</Setting>
    <Setting Target="Host" Name="SystemDestination">DPI_HUD</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath"></Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\10.20.8.127\b$\Integrations\Diamic\</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\dataPROD\DIAMIC\out\DPI_HUD</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\dataPROD\DIAMIC\out\DPI_HUD</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\10.20.8.127\b$\Integrations\Diamic\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\10.20.8.127\b$\Integrations\Diamic\</Setting>
  </Item>
  <Item Name="DiaHL7TcpOutTest" Category="Dialyse,Glims,Medical" ClassName="CHUBXL.BO.RawTcpOut" PoolSize="1" Enabled="false" Foreground="true" Comment="Transmission des réultats de laboratoire vers la Dialyse test" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Port">91282</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="SystemSource">GLIMS</Setting>
    <Setting Target="Host" Name="SystemDestination">DIALYSE</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\GLIMS\out\DIALYSETEST</Setting>
    <Setting Target="Host" Name="ETX">13</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Adapter" Name="IPAddress">brHema01Test</Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">30</Setting>
  </Item>
  <Item Name="MOSOSMvFileOut" Category="MOSOS,Medical,MV" ClassName="CHUBXL.BO.SendDocToMv" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des rapports de MOSOS (Gyné) vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ExtentionBLOB">RTF</Setting>
    <Setting Target="Host" Name="FailureTimeout">1</Setting>
    <Setting Target="Host" Name="FilePathBLOB">G:\Allgeier\ACScanImport\RTF1\MOSOS\</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\dataPROD\MOSOS\out\MV</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\dataPROD\MOSOS\out\MV</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\oberon\xml$\RTF1\MOSOS</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\oberon\xml$\RTF1\MOSOS</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="SystemDestination">Medcial Viewer</Setting>
    <Setting Target="Host" Name="SystemSource">MOSOS</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\MOSOS\out\MV</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="MOSOSRouting" Category="MOSOS,Medical,MV" ClassName="CHUBXL.BP.MOSOSRouting" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des résultats de MOSOS (Gyné) vers Medical Viewer" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="MOSOSFileIn" Category="MOSOS,Medical,MV" ClassName="CHUBXL.BS.MOSOSFile" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des résultats de MOSOS (Gyné) vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\MOSOS\archive</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="FilePath">\\brmosos01\Verzonden$</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\MOSOS\archive</Setting>
  </Item>
  <Item Name="WishBruTcpIn" Category="Wish,Admin" ClassName="CHUBXL.BS.HL7TcpIn" PoolSize="1" Enabled="false" Foreground="false" Comment="Reception des messages de données administratives des patients Brugmann." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">WishHL7MLLPRouting</Setting>
    <Setting Target="Adapter" Name="Port">91461</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\archive\BRU</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\Wish\archive\BRU</Setting>
    <Setting Target="Host" Name="IgnoreInboundAck">0</Setting>
    <Setting Target="Host" Name="UseAckCommitCodes">0</Setting>
    <Setting Target="Host" Name="LocalFacilityApplication">Wish_ADT_BRU</Setting>
    <Setting Target="Host" Name="SearchTableClass">EnsLib.HL7.SearchTable</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="SaveReplies">IndexNotOKs</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">2.5</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
  </Item>
  <Item Name="WishHL7MLLPRouting" Category="Wish,Admin" ClassName="CHUBXL.BP.WishHL7MLLPRouting" PoolSize="1" Enabled="false" Foreground="false" Comment="Routing des messsages de données administratives des patients (Wish)" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="AddToMetric">1</Setting>
  </Item>
  <Item Name="InfohosSpeFileIn" Category="Wish,Infohos" ClassName="CHUBXL.BS.InfohosFileIn" PoolSize="1" Enabled="false" Foreground="false" Comment="Fichier spécialités et implants d&apos;Infohos vers Wish" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\InfohosMedic\archive</Setting>
    <Setting Target="Adapter" Name="FilePath">\\brapo01\Infofile\ToIbm\Facturation\Articles</Setting>
    <Setting Target="Adapter" Name="FileSpec">S*</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\InfohosMedic\archive</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="InfohosWishRouting" Category="Infohos,Wish" ClassName="CHUBXL.BP.InfohosWishRouting" PoolSize="1" Enabled="false" Foreground="false" Comment="Transfert des spécialités d&apos;Infohos vers Wish" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="InfohosWishSpeBRUFtpOut" Category="Infohos,Wish" ClassName="CHUBXL.BO.BatchFtpWishOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Fichier des spécialités d&apos;Infohos vers Wish" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\InfohosMedic\out\BRU</Setting>
    <Setting Target="Host" Name="System">AS400</Setting>
    <Setting Target="Adapter" Name="Credentials">WISH</Setting>
    <Setting Target="Adapter" Name="FTPPort">21</Setting>
    <Setting Target="Adapter" Name="FTPServer">br400prd</Setting>
    <Setting Target="Adapter" Name="FilePath">FITPBRNS</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Host" Name="FailureTimeout">60</Setting>
  </Item>
  <Item Name="QuadratRVBRUTcpIn" Category="DPI,RDV,Quadrat" ClassName="CHUBXL.BS.QuadratRVTcpIn" PoolSize="1" Enabled="false" Foreground="false" Comment="Rendez-vous QPlanner vers DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">91711</Setting>
    <Setting Target="Adapter" Name="MaxMessagesPerIteration">5</Setting>
    <Setting Target="Adapter" Name="ConnectionName">QuadratRVTcpIn</Setting>
    <Setting Target="Adapter" Name="SourceName">QPlanner</Setting>
    <Setting Target="Adapter" Name="UseStream">1</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\QUADRATRV\archive\BRU</Setting>
  </Item>
  <Item Name="QuadratRVHL7Routing" Category="DPI,RDV,Quadrat" ClassName="CHUBXL.BP.QuadratRVHL7Routing" PoolSize="1" Enabled="false" Foreground="false" Comment="Rendez-vous QPlanner vers DPIO" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="QuadratWishBRURVHL7FileOut" Category="Wish,Quadrat" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers Datameal" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="NoFailWhileDisconnected">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\QuadratRV\out\WishBRU</Setting>
    <Setting Target="Host" Name="SystemDestination">Wish</Setting>
    <Setting Target="Host" Name="SystemSource">Quadrat</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\dataPROD\QUADRATRV\out\WishBRU</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7">\\Brwitfio01\HL7$\HL7\IN</Setting>
    <Setting Target="Host" Name="RPFileHL7"></Setting>
  </Item>
  <Item Name="QuadratWishHUDRVHL7FileOut" Category="Wish,Quadrat" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers Datameal" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="NoFailWhileDisconnected">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\QuadratRV\out\WishHUD</Setting>
    <Setting Target="Host" Name="SystemDestination">Wish</Setting>
    <Setting Target="Host" Name="SystemSource">Quadrat</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\dataPROD\QUADRATRV\out\WishHUD</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7">\\Brwitfio01\HL7$\HL7HUD\IN</Setting>
    <Setting Target="Host" Name="RPFileHL7"></Setting>
  </Item>
  <Item Name="QuadratDPIRVHUDHL7TcpOut" Category="DPI,RDV,Quadrat" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des rendez-vous QPlanner H.U.D.E.R.F. vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\QuadratRV\out\DPI\HUD</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">G:\dataPROD\QuadratRV\out\DPI\HUD</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.127</Setting>
    <Setting Target="Adapter" Name="Port">91781</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="CacheHL7FileOut" Category="Wish,Cache" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers Datameal" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="NoFailWhileDisconnected">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\Wish\out\Cache</Setting>
    <Setting Target="Host" Name="SystemDestination">Cache</Setting>
    <Setting Target="Host" Name="SystemSource">Wish</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\dataPROD\Wish\out\Cache</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7">\\brdevtask01\FTPincoming$\Wish</Setting>
    <Setting Target="Host" Name="RPFileHL7"></Setting>
  </Item>
  <Item Name="OperaAdmTcpOut" Category="Wish,Opera" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des données adminsitratives patient de Wish vers Opera" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">bropera01pre</Setting>
    <Setting Target="Adapter" Name="Port">91591</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\out\opera</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\Wish\out\opera</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="AlphaAdmTcpOut" Category="Wish,Alpha" ClassName="CHUBXL.BO.ParsedTcpOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des données Administratives vers l&apos;Alpha" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">Wish</Setting>
    <Setting Target="Host" Name="SystemDestination">ALPHA</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\out\Alpha</Setting>
    <Setting Target="Host" Name="STX">11</Setting>
    <Setting Target="Host" Name="ETX">13</Setting>
    <Setting Target="Host" Name="EOT">10</Setting>
    <Setting Target="Host" Name="ACK">6</Setting>
    <Setting Target="Host" Name="NACK">15</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.37</Setting>
    <Setting Target="Adapter" Name="Port">91521</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">15</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">5</Setting>
    <Setting Target="Adapter" Name="ReconnectRetry">5</Setting>
    <Setting Target="Adapter" Name="GetReply">1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="MVAdmTcpOut" Category="Wish,MV" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\out\MV</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\Wish\out\MV</Setting>
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
    <Setting Target="Adapter" Name="IPAddress">oberon</Setting>
    <Setting Target="Adapter" Name="Port">91561</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">5</Setting>
    <Setting Target="Adapter" Name="ReconnectRetry">5</Setting>
    <Setting Target="Adapter" Name="GetReply">1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="KineAdmTcpOutTest" Category="Wish,Kine,Medecin,REFMED" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers la Kine de test" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\out\KINETest</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\Wish\out\KINETest</Setting>
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
    <Setting Target="Adapter" Name="IPAddress">10.20.9.61</Setting>
    <Setting Target="Adapter" Name="Port">91161</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">5</Setting>
    <Setting Target="Adapter" Name="ReconnectRetry">5</Setting>
    <Setting Target="Adapter" Name="GetReply">1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="KineAdmTcpOut" Category="Wish,Kine,Medecin,REFMED" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers la Kine" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\out\KINE</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\Wish\out\KINE</Setting>
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
    <Setting Target="Adapter" Name="Port">91171</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">5</Setting>
    <Setting Target="Adapter" Name="ReconnectRetry">5</Setting>
    <Setting Target="Adapter" Name="GetReply">1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="QuadratAdmBRUTcpOut" Category="Wish,Quadrat" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoie des données administratives patients de Wish vers Agfa-Quadrat Brugmann" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">BRQITFI01</Setting>
    <Setting Target="Adapter" Name="Port">91641</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\out\Quadrat\BRU</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\Wish\out\Quadrat\BRU</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
  </Item>
  <Item Name="MVHL7TcpIn" Category="MV,DPI" ClassName="CHUBXL.BS.HL7TcpIn" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoie des documents archivés vers DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\MV\archive</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\MV\archive</Setting>
    <Setting Target="Adapter" Name="Port">91381</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">2.3</Setting>
    <Setting Target="Host" Name="TargetConfigNames">MVHL7Routing</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AddNackERR">0</Setting>
    <Setting Target="Host" Name="UseAckCommitCodes">0</Setting>
    <Setting Target="Host" Name="AckMode">Immed</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="IgnoreInboundAck">0</Setting>
  </Item>
  <Item Name="MVHL7Routing" Category="DPI,Mv" ClassName="CHUBXL.BP.MVHL7Routing" PoolSize="1" Enabled="false" Foreground="false" Comment="MV vers DPI" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="MVDPIHUDHL7TcpOut" Category="DPI,Mv" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des références des documents scannés vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">10.20.8.127</Setting>
    <Setting Target="Adapter" Name="Port">91811</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\MV\out\DPI\HUD</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\MV\out\DPI\HUD</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
  </Item>
  <Item Name="MVDPIHUDPrepHL7TcpOut" Category="DPI,Mv" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="ENvoi des références des documents scannés vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">10.20.8.26</Setting>
    <Setting Target="Adapter" Name="Port">91441</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPREP\MV\out\DPI\HUD</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPREP\MV\out\DPI\HUD</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
  </Item>
  <Item Name="GlimsHUDDPIHL7TcpOut" Category="Glims, DPI" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoie des résultats laboratoire vers l&apos;environnement de test du DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\dataPREP\GLIMS\out\DPI\HUD</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPREP\GLIMS\out\DPI\HUD</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.127</Setting>
    <Setting Target="Adapter" Name="Port">91801</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="GlimsAdmBRUTcpOut" Category="Wish,Glims" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoie des données administratives de Wish Brugmann vers Glims" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">91253</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\out\Glims\BRU</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\Wish\out\Glims\BRU</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.60.2.11</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
  </Item>
  <Item Name="GlimsAdmHUDTcpOut" Category="Wish,Glims" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoie des données administratives de Wish Brugmann vers Glims" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">91252</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\out\Glims\HUD</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\Wish\out\Glims\HUD</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.60.2.11</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="DiamicAdmTcpOut" Category="Wish,Diamic" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoie des données adminstratives des aptiens de Wish vers Diamic" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\out\Diamic</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\Wish\out\Diamic</Setting>
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
    <Setting Target="Adapter" Name="Port">91571</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">30</Setting>
    <Setting Target="Adapter" Name="ReconnectRetry">5</Setting>
    <Setting Target="Adapter" Name="GetReply">1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="InfohosAdmWishTcpOut" Category="Wish,Infohos,Medecin" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers Infohos" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\out\Infohos</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\Wish\out\Infohos</Setting>
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
    <Setting Target="Adapter" Name="Port">91551</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">5</Setting>
    <Setting Target="Adapter" Name="ReconnectRetry">5</Setting>
    <Setting Target="Adapter" Name="GetReply">1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="AstraiaMLLPAdmBRUTcpOut" Category="Wish,Astraia" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\out\ASTRAIA</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\Wish\out\ASTRAIA</Setting>
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
    <Setting Target="Adapter" Name="Port">92002</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">5</Setting>
    <Setting Target="Adapter" Name="ReconnectRetry">5</Setting>
    <Setting Target="Adapter" Name="GetReply">1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">D:\dataTEST\Wish\out\ASTRAIA</Setting>
  </Item>
  <Item Name="ECareAdmTcpOut" Category="Simed,Admin,ECare" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\out\ECARE</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\Wish\out\ECARE</Setting>
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
    <Setting Target="Adapter" Name="Port">9501</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">30</Setting>
    <Setting Target="Adapter" Name="ReconnectRetry">5</Setting>
    <Setting Target="Adapter" Name="GetReply">1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="MososMLLPAdmBRUTcpOut" Category="Wish,Mosos" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Transmission des données administratives WIsh vers le logiciel de gynécologie (Mosos)" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">92116</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\out\Mosos</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\Wish\out\Mosos</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.9.212</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="DataMealAdmTcpOut" Category="Wish,DataMeal" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers Datameal" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\out\DataMeal</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\Wish\out\DataMeal</Setting>
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
    <Setting Target="Adapter" Name="Port">95001</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">5</Setting>
    <Setting Target="Adapter" Name="ReconnectRetry">5</Setting>
    <Setting Target="Adapter" Name="GetReply">1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">15</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="InfopartnerAdmTcpOut" Category="Wish,Infopartner" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers Datameal" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\out\Infopartner</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\Wish\out\Infopartner</Setting>
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
    <Setting Target="Adapter" Name="Port">91701</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">5</Setting>
    <Setting Target="Adapter" Name="ReconnectRetry">5</Setting>
    <Setting Target="Adapter" Name="GetReply">1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="WishHL7FileIn" Category="Wish,Admin" ClassName="CHUBXL.BS.WishHL7File" PoolSize="1" Enabled="false" Foreground="false" Comment="Ré envoie des messages HL7 de Wish" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\Wish\archive</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\Wish\in</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\archive</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
  </Item>
  <Item Name="WishHudTcpIn" Category="Admin,Wish" ClassName="CHUBXL.BS.HL7TcpIn" PoolSize="1" Enabled="false" Foreground="false" Comment="Reception des messages de données administratives des patients de l&apos;H.U.D.E.R.F.." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="MessageSchemaCategory">2.5</Setting>
    <Setting Target="Host" Name="TargetConfigNames">WishHL7MLLPRouting</Setting>
    <Setting Target="Adapter" Name="Port">91471</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\archive\HUD</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\Wish\archive\HUD</Setting>
    <Setting Target="Host" Name="LocalFacilityApplication">Wish_ADT_HUD</Setting>
    <Setting Target="Host" Name="IgnoreInboundAck">0</Setting>
    <Setting Target="Host" Name="UseAckCommitCodes">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="SaveReplies">IndexNotOKs</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
  </Item>
  <Item Name="WishBRUAdmTestTcpOut" Category="Wish" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Transmission des données Administratives vers l&apos;environnement de Pre-Production" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">holmium</Setting>
    <Setting Target="Adapter" Name="Port">91465</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\out\Test</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\Wish\out\Test</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">30</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="QuadratORMHUDTcpIn" Category="DPI,Quadrat" ClassName="CHUBXL.BS.QuadratORMHUDTcpIn" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des informations pour l&apos;imagerie d&apos;Agfa vers BDoc" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">91831</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="UseStream">1</Setting>
    <Setting Target="Adapter" Name="ConnectionName">QuadratORMTcpIn</Setting>
    <Setting Target="Adapter" Name="SourceName">AgfaImagerie</Setting>
    <Setting Target="Adapter" Name="MaxMessagesPerIteration">5</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\QUADRATORM\archive\HUD</Setting>
  </Item>
  <Item Name="QuadratORMHL7Routing" Category="DPI,Quadrat" ClassName="CHUBXL.BP.QuadratORMHL7Routing" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des informations pour l&apos;imagerie d&apos;Agfa vers BDoc" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="QuadratDPIORMHUDHL7TcpOut" Category="DPI,Quadrat" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des références d&apos;imagerie d&apos;Agfa vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">10.20.8.127</Setting>
    <Setting Target="Adapter" Name="Port">91791</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\QUADRATORM\out\DPI\HUD</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\QUADRATORM\out\DPI\HUD</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="QuadratORUHUDTcpIn" Category="Quadrat,DPI" ClassName="CHUBXL.BS.QuadratORUTcpIn" PoolSize="1" Enabled="false" Foreground="false" Comment="Résultats Quadrat-Agfa vers DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">91841</Setting>
    <Setting Target="Adapter" Name="ConnectionName">Quadrat-Agfa</Setting>
    <Setting Target="Adapter" Name="MaxMessagesPerIteration">5</Setting>
    <Setting Target="Adapter" Name="SourceName">Résultats</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\QUADRATORU\archive\HUD</Setting>
    <Setting Target="Adapter" Name="UseStream">1</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="QuadratORURouting" Category="Quadrat,DPI" ClassName="CHUBXL.BP.QuadratORURouting" PoolSize="1" Enabled="false" Foreground="false" Comment="Routing résultats Quadrat-Agfa HL7 ORU vers DPI" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="QuadratDPIHUDORUHL7FileOut" Category="Quadrat,DPI" ClassName="CHUBXL.BO.SendDocToDPI" PoolSize="1" Enabled="false" Foreground="false" Comment="Résultats HUDERF Quadrat vers DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="SystemDestination">DPI</Setting>
    <Setting Target="Host" Name="SystemSource">Quadrat-Agfa</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\dataPROD\QUADRATORU\out\DPI\HUD</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\dataPROD\QUADRATORU\out\DPI\HUD</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\10.20.8.127\b$\Integrations\Documents\</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\10.20.8.127\b$\Integrations\Documents\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\10.20.8.127\b$\Integrations\Documents\</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
  </Item>
  <Item Name="QuadratDPIHUDORUPrepHL7FileOut" Category="Quadrat,DPI" ClassName="CHUBXL.BO.SendDocToDPI" PoolSize="1" Enabled="false" Foreground="false" Comment="Résultats HUDERF Quadrat vers DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="SystemDestination">DPI</Setting>
    <Setting Target="Host" Name="SystemSource">Quadrat-Agfa</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\dataPREP\QUADRATORU\out\DPI\HUD</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\dataPREP\QUADRATORU\out\DPI\HUD</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\10.20.8.26\f$\Integrations\Documents\</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\10.20.8.26\f$\Integrations\Documents\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\10.20.8.26\f$\Integrations\Documents\</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
  </Item>
  <Item Name="QuadratDPIORMHL7FileOut" Category="DPI,Quadrat" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Imagerie vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">G:\dataPREP\QUADRATORM\out</Setting>
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
  <Item Name="QuadratDPIRVHUDPrepHL7FileOut" Category="DPI,RDV,Quadrat" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoie rendez-vous APlanner vers DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="SystemDestination">DPI</Setting>
    <Setting Target="Host" Name="SystemSource">QPlanner</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPREP\QUADRATRV\out</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7"></Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7">\\10.20.8.10\d$\dataTEST\QUADRAT\in</Setting>
    <Setting Target="Host" Name="RPFileHL7"></Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
  </Item>
  <Item Name="WishDPIHUDAdmTcpOut" Category="Wish,DPI,Medecin,REFMED" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers le DPI (BDoc)" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">91771</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.127</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\out\DPI\HUD</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\Wish\out\DPI\HUD</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="WishDPIAdmPreProdTcpOut" Category="Wish,DPI" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers le DPI (BDoc)" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">91721</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.26</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPREP\Wish\out\DPI\HUD</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPREP\Wish\out\DPI\HUD</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="WishOphtalmoTcpOut" Category="Wish,Ophtalmo" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers l&apos;ophtalmo" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">ruthenium</Setting>
    <Setting Target="Adapter" Name="Port">91501</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\out\Ophtalmo</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\Wish\out\Ophtalmo</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="QuadratRVHUDTcpIn" Category="RDV,Wish" ClassName="CHUBXL.BS.QuadratRVTcpIn" PoolSize="1" Enabled="false" Foreground="false" Comment="Rendez-vous QPlanner HUDERF vers Wish" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">91751</Setting>
    <Setting Target="Adapter" Name="MaxMessagesPerIteration">5</Setting>
    <Setting Target="Adapter" Name="ConnectionName">QuadratRVTcpIn</Setting>
    <Setting Target="Adapter" Name="SourceName">QPlanner</Setting>
    <Setting Target="Adapter" Name="UseStream">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\QUADRATRV\archive\HUD</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="DiamicFacIn" Category="Diamic,Wish" ClassName="CHUBXL.BS.InfohosFileIn" PoolSize="1" Enabled="false" Foreground="false" Comment="Fichier facturation Diamic" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FileSpec">EL*.txt</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\Diamic\fact\archive</Setting>
    <Setting Target="Adapter" Name="FilePath">\\10.15.102.10\diamicliaisons\activite\BRG\out</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Diamic\fact\archive</Setting>
    <Setting Target="Adapter" Name="Charset">Native</Setting>
  </Item>
  <Item Name="DiamicWishBRUFacFtpOut" Category="Diamic,Wish" ClassName="CHUBXL.BO.BatchFtpWishOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Facturation Diamic vers Wish" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">WISH</Setting>
    <Setting Target="Adapter" Name="FTPPort">21</Setting>
    <Setting Target="Adapter" Name="FTPServer">br400prd</Setting>
    <Setting Target="Adapter" Name="FilePath">FITPBRNS</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Diamic\fact\out</Setting>
    <Setting Target="Host" Name="System">AS400</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Host" Name="FailureTimeout">60</Setting>
  </Item>
  <Item Name="DiamicWishHUDFacFtpOut" Category="Diamic,Wish" ClassName="CHUBXL.BO.BatchFtpWishOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Facturation Diamic vers Wish" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">WISH</Setting>
    <Setting Target="Adapter" Name="FTPPort">21</Setting>
    <Setting Target="Adapter" Name="FTPServer">br400prd</Setting>
    <Setting Target="Adapter" Name="FilePath">FITPHUNS</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Diamic\fact\out</Setting>
    <Setting Target="Host" Name="System">AS400</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Host" Name="FailureTimeout">60</Setting>
  </Item>
  <Item Name="InfohosWishSpeHUDFtpOut" Category="Infiohos,Wish" ClassName="CHUBXL.BO.BatchFtpWishOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi du signalétique des médicaments iNFOHOS VERS wISH huderf" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">WISH</Setting>
    <Setting Target="Adapter" Name="FTPPort">21</Setting>
    <Setting Target="Adapter" Name="FTPServer">br400prd</Setting>
    <Setting Target="Adapter" Name="FilePath">FITPHUNS</Setting>
    <Setting Target="Host" Name="System">AS400</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\InfohosMedic\out\HUD</Setting>
    <Setting Target="Host" Name="FailureTimeout">60</Setting>
  </Item>
  <Item Name="QuadratDPIRVBRUPrepHL7TcpOut" Category="DPI,RDV,Quadrat" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des rendez-vous QPlanner H.U.D.E.R.F. vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\QuadratRV\out\DPI\BRU</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">G:\dataPROD\QuadratRV\out\DPI\BRU</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.26</Setting>
    <Setting Target="Adapter" Name="Port">91911</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="MVDPIBRUPrepHL7TcpOut" Category="DPI,Mv" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="ENvoi des références des documents scannés vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">10.20.8.26</Setting>
    <Setting Target="Adapter" Name="Port">91941</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPREP\MV\out\DPI\BRU</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPREP\MV\out\DPI\BRU</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
  </Item>
  <Item Name="GlimsBRUDPIHL7TcpOutPreProd" Category="Glims, DPI" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoie des résultats laboratoire vers l&apos;environnement de test du DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\dataPREP\GLIMS\out\DPI\BRU</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPREP\GLIMS\out\DPI\BRU</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.26</Setting>
    <Setting Target="Adapter" Name="Port">91931</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="DiamicDPIBRUPreProdFileOut" Category="DPI,Medical,Quadrat" ClassName="CHUBXL.BO.SendDocToDPI" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des rapport d&apos;anatomie-pathologique (Diamic) vers MediWeb HUDERF de test" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">DIAMIC</Setting>
    <Setting Target="Host" Name="SystemDestination">DPI_HUD</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath"></Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\10.20.8.26\f$\Integrations-br\Diamic\</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\dataPREP\DIAMIC\out\DPI_BRU</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\dataPREP\DIAMIC\out\DPI_BRU</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\10.20.8.26\f$\Integrations-br\Diamic\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\10.20.8.26\f$\Integrations-br\Diamic\</Setting>
  </Item>
  <Item Name="MVDPIBRUHL7TcpOut" Category="DPI,Mv" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des références des documents scannés Brugmann vers le DPI (BDoc)" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">10.20.8.127</Setting>
    <Setting Target="Adapter" Name="Port">91991</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\MV\out\DPI\BRU</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\MV\out\DPI\BRU</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
  </Item>
  <Item Name="InfohosBDocMedicTcpOut" Category="Infohos" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">\\CHARON\dataProd\InfohosBDocMedic\out\HUD</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">\\CHARON\dataProd\InfohosBDocMedic\out\HUD</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.127</Setting>
    <Setting Target="Adapter" Name="Port">91952</Setting>
    <Setting Target="Host" Name="AddToMetric">0</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
  </Item>
  <Item Name="InfohosBDocMedicFileRouting" Category="Infohos" ClassName="CHUBXL.BP.InfohosBDocMedicRouting" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="InfohosBDocMedicFileIn" Category="Infohos" ClassName="CHUBXL.BS.InfohosBDocMedicFile" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">\\CHARON\dataProd\InfohosBDocMedic\archive</Setting>
    <Setting Target="Host" Name="TargetConfigNames">InfohosBDocMedicFileRouting</Setting>
    <Setting Target="Adapter" Name="ArchivePath">\\CHARON\dataProd\InfohosBDocMedic\archive</Setting>
    <Setting Target="Adapter" Name="FilePath">\\BRAPOEINT01\FromAPOToEveryone.MFN</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">2.6</Setting>
  </Item>
  <Item Name="WishMedDPIAdmTcpOut" Category="Wish,DPI" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers le DPI (BDoc)" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">91721</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.10.13</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\out\DPI\HUD</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\Wish\out\DPI\HUD</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="WishDPIBRUAdmTcpOut" Category="Wish,DPI,Medecin,REFMED" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers le DPI (BDoc)" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">91951</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.127</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\out\DPI\BRU</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\Wish\out\DPI\BRU</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="QuadratDPIRVBRUHL7TcpOut" Category="DPI,RDV,Quadrat" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des rendez-vous QPlanner H.U.D.E.R.F. vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\QuadratRV\out\DPI\HUD</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">G:\dataPROD\QuadratRV\out\DPI\HUD</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.127</Setting>
    <Setting Target="Adapter" Name="Port">91961</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="QuadratDPIORMBRUHL7TcpOut" Category="DPI,Quadrat" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des références d&apos;imagerie d&apos;Agfa vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">10.20.8.127</Setting>
    <Setting Target="Adapter" Name="Port">91971</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\QUADRATORM\out\DPI\BRU</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\QUADRATORM\out\DPI\BRU</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="QuadratORMBRUTcpIn" Category="DPI,Quadrat" ClassName="CHUBXL.BS.QuadratORMHUDTcpIn" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des informations pour l&apos;imagerie d&apos;Agfa vers BDoc" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">91922</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="UseStream">1</Setting>
    <Setting Target="Adapter" Name="ConnectionName">QuadratORMTcpIn</Setting>
    <Setting Target="Adapter" Name="SourceName">AgfaImagerie</Setting>
    <Setting Target="Adapter" Name="MaxMessagesPerIteration">5</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\QUADRATORM\archive\BRU</Setting>
  </Item>
  <Item Name="QuadratORUBRUTcpIn" Category="Quadrat,DPI" ClassName="CHUBXL.BS.QuadratORUTcpIn" PoolSize="1" Enabled="false" Foreground="false" Comment="Résultats Quadrat-Agfa vers DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">91873</Setting>
    <Setting Target="Adapter" Name="ConnectionName">Quadrat-Agfa</Setting>
    <Setting Target="Adapter" Name="MaxMessagesPerIteration">5</Setting>
    <Setting Target="Adapter" Name="SourceName">Résultats</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\QUADRATORU\archive\BRU</Setting>
    <Setting Target="Adapter" Name="UseStream">1</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="QuadratDPIBRUORUHL7FileOut" Category="Quadrat,DPI" ClassName="CHUBXL.BO.SendDocToDPI" PoolSize="1" Enabled="false" Foreground="false" Comment="Résultats HUDERF Quadrat vers DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="SystemDestination">DPI</Setting>
    <Setting Target="Host" Name="SystemSource">Quadrat-Agfa</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\dataPROD\QUADRATORU\out\DPI\BRU</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\dataPROD\QUADRATORU\out\DPI\BRU</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\10.20.8.127\a$\Integrations-Br\Documents\</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\10.20.8.127\a$\Integrations-Br\Documents\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\10.20.8.127\a$\Integrations-Br\Documents\</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
  </Item>
  <Item Name="QuadratDPIBRUORUPrepHL7FileOut" Category="Quadrat,DPI" ClassName="CHUBXL.BO.SendDocToDPI" PoolSize="1" Enabled="false" Foreground="false" Comment="Résultats HUDERF Quadrat vers DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="SystemDestination">DPI</Setting>
    <Setting Target="Host" Name="SystemSource">Quadrat-Agfa</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\dataPREP\QUADRATORU\out\DPI\BRU</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\dataPREP\QUADRATORU\out\DPI\BRU</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\10.20.8.26\f$\Integrations-Br\Documents\</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\10.20.8.26\f$\Integrations-Br\Documents\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\10.20.8.26\f$\Integrations-Br\Documents\</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
  </Item>
  <Item Name="GlimsBRUDPIHL7TcpOut" Category="Glims, DPI" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoie des résultats laboratoire vers l&apos;environnement de test du DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\dataPREP\GLIMS\out\DPI\BRU</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPREP\GLIMS\out\DPI\BRU</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.127</Setting>
    <Setting Target="Adapter" Name="Port">91981</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="DiamicDPIBRUFileOut" Category="DPI,Medical,Quadrat" ClassName="CHUBXL.BO.SendDocToDPI" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des rapport d&apos;anatomie-pathologique (Diamic) vers MediWeb HUDERF de test" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">DIAMIC</Setting>
    <Setting Target="Host" Name="SystemDestination">DPI_BRU</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath"></Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\10.20.8.127\a$\Integrations-br\Diamic\</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\dataPROD\DIAMIC\out\DPI_BRU</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\dataPROD\DIAMIC\out\DPI_BRU</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\10.20.8.127\a$\Integrations-br\Diamic\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\10.20.8.127\a$\Integrations-br\Diamic\</Setting>
  </Item>
  <Item Name="QuadratDPIORMBRUPrepHL7TcpOut" Category="DPI,Quadrat" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des références d&apos;imagerie d&apos;Agfa vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">10.20.8.26</Setting>
    <Setting Target="Adapter" Name="Port">91921</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\QUADRATORM\out\DPI\BRU</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\QUADRATORM\out\DPI\BRU</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="ActivityChecker" Category="Alert" ClassName="Ciges.BS.ActivityChecker" PoolSize="1" Enabled="false" Foreground="false" Comment="Service de vérification de l&apos;état des connecteurs afin de voir s&apos;ils sont actifs" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="ActivityCheckerAlertRegulator" Category="Alert" ClassName="Ciges.BP.AlertRegulator" PoolSize="1" Enabled="false" Foreground="false" Comment="Régulation des alertes envoyées par l&apos;ActivityChecker pour ne pas envoyer trop de mails" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="target">ActivityCheckerAlert</Setting>
    <Setting Target="Host" Name="sendInterval">60</Setting>
    <Setting Target="Host" Name="activityCheckerConfigName">Ens.Alert</Setting>
  </Item>
  <Item Name="ActivityCheckerAlert" Category="Alert" ClassName="Ciges.BO.AlertSender" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="From">ProductionEnsemble@Brugmann.be</Setting>
    <Setting Target="Adapter" Name="Recipient">dulio.ambrogetti@chu-brugmann.be;
youssef.elhathout@chu-brugmann.be</Setting>
    <Setting Target="Adapter" Name="SMTPPort">25</Setting>
    <Setting Target="Adapter" Name="SMTPServer">smtp.chu-brugmann.be</Setting>
  </Item>
  <Item Name="EcareDPIBruFileOut" Category="Ecare,Medical,Quadrat" ClassName="CHUBXL.BO.SendDocToDPI" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoie résultat Ecare vers MediWeb Brugmann" LogTraceEvents="false" Schedule="">
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
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\Ecare\out\DPI\BRU</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\10.20.8.127\a$\Integrations-Br\Documents\</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\10.20.8.127\a$\Integrations-Br\Documents\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\10.20.8.127\a$\Integrations-Br\Documents\</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\dataPROD\Ecare\out\DPI\BRU</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\dataPROD\Ecare\out\DPI\BRU</Setting>
  </Item>
  <Item Name="GlimsHUDDPIHL7TcpOutTest" Category="Glims, DPI" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoie des résultats laboratoire vers l&apos;environnement de test du DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\dataPREP\GLIMS\out\DPI\HUDTest</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPREP\GLIMS\out\DPI\HUDTest</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.10.13</Setting>
    <Setting Target="Adapter" Name="Port">91801</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="BDocHUDFileIn" Category="BDoc,MV" ClassName="CHUBXL.BS.BDocFile" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Reception des rapports de BDoc HUDERF" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\BDoc\archive\HUD</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\triton\b$\Export\MedicalViewer</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.ACK</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\BDoc\archive\HUD</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Binary</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="BDocBRUFileIn" Category="BDoc,MV" ClassName="CHUBXL.BS.BDocFile" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Reception des rapports de BDoc BRU" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\BDoc\archive\BRU</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\triton\a$\Export\MedicalViewer</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.ACK</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\BDoc\archive\BRU</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Binary</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="BDocMvFileOut" Category="BDoc,MV" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des rapports de BDoc) vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">BDoc</Setting>
    <Setting Target="Host" Name="SystemDestination">MV</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\BDoc\out\HUD\MV</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\dataProd\BDoc\out\HUD\MV</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7">\\oberon\xml$\BDoc\Hude</Setting>
    <Setting Target="Host" Name="RPFileHL7">\\oberon\xml$\BDoc\Hude</Setting>
  </Item>
  <Item Name="BDocRouting" Category="BDoc,Mv" ClassName="CHUBXL.BP.BDocRouting" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Routage des rapports de BDoc" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="InfohosBDocBruMedicTcpOut" Category="Infohos" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">\\CHARON\dataProd\InfohosBDocMedic\out\BRU</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">\\CHARON\dataProd\InfohosBDocMedic\out\BRU</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.127</Setting>
    <Setting Target="Adapter" Name="Port">91962</Setting>
    <Setting Target="Host" Name="AddToMetric">0</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
  </Item>
  <Item Name="InfohosBDocBruMedicPreTcpOut" Category="Infohos" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">\\CHARON\dataProd\InfohosBDocMedic\out\BRU</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">\\CHARON\dataProd\InfohosBDocMedic\out\BRU</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.26</Setting>
    <Setting Target="Adapter" Name="Port">91972</Setting>
    <Setting Target="Host" Name="AddToMetric">0</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="GlimsAdmCyberlabTcpOut" Category="Wish,Glims" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoie des données administratives de Wish Brugmann vers Glims CyberLab" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">91631</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\out\Glims\CyberLab</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\Wish\out\Glims\CyberLab</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.10.8.43</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="DialyseAdmTcpOutTest" Category="Wish,Admin" ClassName="CHUBXL.BO.ParsedTcpOut" PoolSize="1" Enabled="false" Foreground="true" DisableErrorTraps="false" Comment="Transmission des données Administratives vers le logiciel de dialyses (hemadial)" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">SIBELMED</Setting>
    <Setting Target="Host" Name="SystemDestination">DIALYSE</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\out\DIALYSE</Setting>
    <Setting Target="Host" Name="STX">11</Setting>
    <Setting Target="Host" Name="ETX">13</Setting>
    <Setting Target="Host" Name="EOT">10</Setting>
    <Setting Target="Host" Name="ACK">6</Setting>
    <Setting Target="Host" Name="NACK">15</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
    <Setting Target="Adapter" Name="IPAddress">brHema01Test</Setting>
    <Setting Target="Adapter" Name="Port">91122</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">15</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">5</Setting>
    <Setting Target="Adapter" Name="ReconnectRetry">5</Setting>
    <Setting Target="Adapter" Name="GetReply">1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">60</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="CacheMFNFileOut" Category="Wish,Cache,Medecin" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers Datameal" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="NoFailWhileDisconnected">0</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\Wish\out\WishMFN</Setting>
    <Setting Target="Host" Name="SystemDestination">Cache</Setting>
    <Setting Target="Host" Name="SystemSource">Wish</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">G:\dataPROD\Wish\out\Cache</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7">\\brdevtask01\FTPincoming$\WishMFN</Setting>
    <Setting Target="Host" Name="RPFileHL7"></Setting>
  </Item>
  <Item Name="WishBrainRtHL7TcpOut" Category="Wish,BrainRt" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Adt Wish vers Brainrt (labo sommeil Huderf)" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">huBrainRT</Setting>
    <Setting Target="Adapter" Name="Port">91121</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\out\BrainRT</Setting>
  </Item>
  <Item Name="WishBruMedTcpIn" Category="Wish,Medecin" ClassName="CHUBXL.BS.HL7TcpIn" PoolSize="1" Enabled="false" Foreground="false" Comment="Réception des messages de données médecins Wish Brugmann." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">MedecinRouting</Setting>
    <Setting Target="Adapter" Name="Port">91131</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Medecin\Wish\archive\BRU</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\Medecin\Wish\archive\BRU</Setting>
    <Setting Target="Host" Name="IgnoreInboundAck">0</Setting>
    <Setting Target="Host" Name="UseAckCommitCodes">0</Setting>
    <Setting Target="Host" Name="LocalFacilityApplication">Wish_MED_BRU</Setting>
    <Setting Target="Host" Name="SearchTableClass">EnsLib.HL7.SearchTable</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="SaveReplies">IndexNotOKs</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">2.5</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
  </Item>
  <Item Name="WishHudMedTcpIn" Category="Wish,Medecin" ClassName="CHUBXL.BS.HL7TcpIn" PoolSize="1" Enabled="false" Foreground="false" Comment="Réception des messages de données médecins Wish H.U.D.E.R.F." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="MessageSchemaCategory">2.5</Setting>
    <Setting Target="Host" Name="TargetConfigNames">MedecinRouting</Setting>
    <Setting Target="Adapter" Name="Port">91141</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Medecin\Wish\archive\HUD</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\Medecin\Wish\archive\HUD</Setting>
    <Setting Target="Host" Name="LocalFacilityApplication">Wish_MED_HUD</Setting>
    <Setting Target="Host" Name="IgnoreInboundAck">0</Setting>
    <Setting Target="Host" Name="UseAckCommitCodes">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="SaveReplies">IndexNotOKs</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
  </Item>
  <Item Name="MedecinWishFMCFileOut" Category="Wish, Medecin" ClassName="CHUBXL.BO.Hl7MessageFileOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Transmission des données médecins Wish vers FMC" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\MEDECIN\Wish\out\FMC</Setting>
    <Setting Target="Host" Name="SystemDestination">FMC</Setting>
    <Setting Target="Host" Name="SystemSource">MedecinWish</Setting>
    <Setting Target="Host" Name="FilePathLocalHL7">\\brdevtask01\FTP\Wish\in\Médecin</Setting>
    <Setting Target="Host" Name="FilePathRemoteHL7"></Setting>
    <Setting Target="Host" Name="RPFileHL7"></Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="Opera2AdmTcpOut" Category="Wish,Opera" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des données adminsitratives patient de Wish vers Opera" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">BROPERAINT01</Setting>
    <Setting Target="Adapter" Name="Port">91591</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\out\opera</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\Wish\out\opera</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="InfohosBDocBruMedicTestTcpOut" Category="Infohos,BDoc" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des signalétique médicaments d&apos;Infohos vers BDoc Brugmann de test" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">\\CHARON\dataProd\InfohosBDocMedic\out\BRUTest</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">\\CHARON\dataProd\InfohosBDocMedic\out\BRUTest</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.10.13</Setting>
    <Setting Target="Adapter" Name="Port">91851</Setting>
    <Setting Target="Host" Name="AddToMetric">0</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="InfohosBDocMedicPreTcpOut" Category="Infohos" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath"></Setting>
    <Setting Target="Host" Name="FileErrorArchivePath"></Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.8.26</Setting>
    <Setting Target="Adapter" Name="Port">91952</Setting>
    <Setting Target="Host" Name="AddToMetric">0</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="InfohosMultiFile" Category="HealthConnect,Infohos,PROD" ClassName="CHUBXL.BS.InfohosMultiFile" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPREP\Infohos\archive</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\brape01\Timestamping</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.xml</Setting>
    <Setting Target="Adapter" Name="ArchivePath"></Setting>
    <Setting Target="Adapter" Name="WorkPath">G:\dataPREP\Infohos\archive</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">60</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="InfohosHealthConnectOut" Category="HealthConnect,Infohos,PROD" ClassName="CHUBXL.BO.HealthConnect.JournalEntryServiceSoap" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
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
  <Item Name="InfohosTSRouting" Category="HealthConnect,Infohos,PROD" ClassName="CHUBXL.BP.InfohosTSRouting" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">15</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="QuadratAdmBRUNewTcpOut" Category="Wish,Quadrat" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoie des données administratives patients de Wish vers Agfa-Quadrat Brugmann" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">brRisIN01</Setting>
    <Setting Target="Adapter" Name="Port">91651</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\out\Quadrat\BRU</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\Wish\out\Quadrat\BRU</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
  </Item>
  <Item Name="BDocMBRouting" Category="BDoc,MB,Medical" ClassName="CHUBXL.BP.BDocMBRouting" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Routage des résultats Bdoc vers MediBridge" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="BDocHudMBHealthoneFileIn" Category="BDoc,Medical,MB" ClassName="CHUBXL.BS.BDocMBFile" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Fichiers BDoc pour Medibridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\MEDIBRIDGE\archive\HUD</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\triton\b$\Export\Medibridge\HEALTHONE</Setting>
    <Setting Target="Adapter" Name="FileSpec">HEA*.*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\MEDIBRIDGE\archive\HUD</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="BDocHudMBMedidocFileIn" Category="BDoc,Medical,MB" ClassName="CHUBXL.BS.BDocMBFile" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Fichiers BDoc  pour Medibridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\MEDIBRIDGE\archive\HUD</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\triton\b$\Export\Medibridge\MEDIDOC</Setting>
    <Setting Target="Adapter" Name="FileSpec">DOC*.*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\MEDIBRIDGE\archive\HUD</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="BDocHudMBMedimailFileIn" Category="BDoc,Medical,MB" ClassName="CHUBXL.BS.BDocMBFile" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Fichiers BDoc  pour Medibridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\MEDIBRIDGE\archive\HUD</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\triton\b$\Export\Medibridge\MEDIMAIL</Setting>
    <Setting Target="Adapter" Name="FileSpec">MM*.*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\MEDIBRIDGE\archive\HUD</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="BDocHudMBSocrateFileIn" Category="BDoc,Medical,MB" ClassName="CHUBXL.BS.BDocMBFile" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Fichiers BDoc  pour Medibridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\MEDIBRIDGE\archive\HUD</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\triton\b$\Export\Medibridge\SOCRATE</Setting>
    <Setting Target="Adapter" Name="FileSpec">SO*.*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\MEDIBRIDGE\archive\HUD</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="BDocHudMBTexteFileIn" Category="BDoc,Medical,MB" ClassName="CHUBXL.BS.BDocMBFile" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Fichiers BDoc  pour Medibridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\MEDIBRIDGE\archive\HUD</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\triton\b$\Export\Medibridge\TEXTE</Setting>
    <Setting Target="Adapter" Name="FileSpec">TXT*.*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\MEDIBRIDGE\archive\HUD</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="BDocBruMBHealthoneFileIn" Category="BDoc,Medical,MB" ClassName="CHUBXL.BS.BDocMBFile" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Fichiers BDoc pour Medibridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\MEDIBRIDGE\archive\BRU</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\triton\a$\Export\Medibridge\HEALTHONE</Setting>
    <Setting Target="Adapter" Name="FileSpec">HEA*.*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\MEDIBRIDGE\archive\BRU</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="BDocBruMBMedidocFileIn" Category="BDoc,Medical,MB" ClassName="CHUBXL.BS.BDocMBFile" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Fichiers BDoc  pour Medibridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\MEDIBRIDGE\archive\BRU</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\triton\a$\Export\Medibridge\MEDIDOC</Setting>
    <Setting Target="Adapter" Name="FileSpec">DOC*.*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\MEDIBRIDGE\archive\BRU</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="BDocBruMBMedimailFileIn" Category="BDoc,Medical,MB" ClassName="CHUBXL.BS.BDocMBFile" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Fichiers BDoc  pour Medibridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\MEDIBRIDGE\archive\BRU</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\triton\a$\Export\Medibridge\MEDIMAIL</Setting>
    <Setting Target="Adapter" Name="FileSpec">MM*.*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\MEDIBRIDGE\archive\BRU</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="BDocBruMBSocrateFileIn" Category="BDoc,Medical,MB" ClassName="CHUBXL.BS.BDocMBFile" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Fichiers BDoc  pour Medibridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\MEDIBRIDGE\archive\BRU</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\triton\a$\Export\Medibridge\SOCRATE</Setting>
    <Setting Target="Adapter" Name="FileSpec">SO*.*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\MEDIBRIDGE\archive\BRU</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="BDocBruMBTexteFileIn" Category="BDoc,Medical,MB" ClassName="CHUBXL.BS.BDocMBFile" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Fichiers BDoc  pour Medibridge" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\MEDIBRIDGE\archive\BRU</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\triton\a$\Export\Medibridge\TEXTE</Setting>
    <Setting Target="Adapter" Name="FileSpec">TXT*.*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\MEDIBRIDGE\archive\BRU</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="BDocMBHealthoneFileOut" Category="MB,BDoc,Medical" ClassName="CHUBXL.BO.MBFileOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de Bdoc vers MediBridge format hone" LogTraceEvents="true" Schedule="">
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
  <Item Name="BDocMBMedidocFileOut" Category="MB,BDoc,Medical" ClassName="CHUBXL.BO.MBFileOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de Bdoc vers MediBridge format BJP" LogTraceEvents="true" Schedule="">
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
  <Item Name="BDocMBMedimailFileOut" Category="MB,BDoc,Medical" ClassName="CHUBXL.BO.MBFileOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de Bdoc vers MediBridge format Medar" LogTraceEvents="true" Schedule="">
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
  <Item Name="BDocMBSocrateFileOut" Category="MB,BDoc,Medical" ClassName="CHUBXL.BO.MBFileOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de Bdoc vers MediBridge format Medidoc" LogTraceEvents="true" Schedule="">
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
  <Item Name="BDocMBTexteFileOut" Category="MB,BDoc,Medical" ClassName="CHUBXL.BO.MBFileOut" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Transmission des résultats de Bdoc vers MediBridge format Medigest" LogTraceEvents="false" Schedule="">
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
  <Item Name="InfohosBDocMedicTestNoteTcpOut" Category="Infohos" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath"></Setting>
    <Setting Target="Host" Name="FileErrorArchivePath"></Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.9.84</Setting>
    <Setting Target="Adapter" Name="Port">91953</Setting>
    <Setting Target="Host" Name="AddToMetric">0</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="InfohosBDocMedicTestHUDNoteTcpOut" Category="Infohos" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">\\CHARON\dataProd\InfohosBDocMedic\out\HUD</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">\\CHARON\dataProd\InfohosBDocMedic\out\HUD</Setting>
    <Setting Target="Adapter" Name="IPAddress">10.20.9.85</Setting>
    <Setting Target="Adapter" Name="Port">91952</Setting>
    <Setting Target="Host" Name="AddToMetric">0</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?R=W,:?E=W</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="AlphaQDoc" Category="Alpha,Quadrat" ClassName="CHUBXL.BP.AlphaQDoc" PoolSize="1" Enabled="false" Foreground="false" Comment="Dossiers archives de l&apos;application CIGES à Medical Viewer" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="AlphaQDocFileIn" Category="Alpha,Quadrat" ClassName="CHUBXL.BS.ReadFileIn" PoolSize="1" Enabled="false" Foreground="false" Comment="Dossiers archives de l&apos;application CIGES à Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Astraia\archive</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\ALPHA\archive</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="FilePath">\\holmium\d$\dataTest\Alpha\Archive</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.txt</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="PLUSFileIn" Category="BDoc,MV" ClassName="CHUBXL.BS.PLUSFile" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Reception des rapports de BDoc HUDERF" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataProd\PLUS\archive</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataProd\PLUS\in</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.xml</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataProd\PLUS\archive</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Binary</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="PLUSRouting" Category="MV, PLUS" ClassName="CHUBXL.BP.PLUSRouting" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Routage des rapports de BDoc" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="PLUSMvFileOut" Category="Mv,Quadrat" ClassName="CHUBXL.BO.SendDocToMv" PoolSize="1" Enabled="false" Foreground="false" Comment="Test suppresion documents Agfa vers MV" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ExtentionBLOB">pdf</Setting>
    <Setting Target="Host" Name="FilePathBLOB"></Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\dataProd\PLUS\out\MV</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\dataProd\PLUS\out\MV</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\oberon\xml$\PDF1\PLUS</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\oberon\xml$\PDF1\PLUS</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="SystemDestination">MV</Setting>
    <Setting Target="Host" Name="SystemSource">PLUS</Setting>
  </Item>
  <Item Name="EndoBaseHUDFileIn" Category="BDoc,EndoBase" ClassName="CHUBXL.BS.EndoBaseFile" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Reception des rapports du logiciel EndoBase HUDERF" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataProd\EndoBase\archive</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\huEndobase\EB3_FILE\HL7_Queue\LegacyFile\EXPORT</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.HL7</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataProd\EndoBase\archive</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Binary</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
    <Setting Target="Host" Name="FileProdPath">\\10.20.8.127\f$\Integrations\Documents\</Setting>
  </Item>
  <Item Name="EndoBaseDPIHUDFileOut" Category="EndoBase,DPI" ClassName="CHUBXL.BO.SendDocToDPI" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des rapports du logiciel EndoBase HUDERF vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ExtentionBLOB">PDF</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\triton\b$\Integrations\Documents\</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\dataProd\EndoBase\out\DPI\HUD</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\dataProd\EndoBase\out\DPI\HUD</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\triton\b$\Integrations\Documents\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\triton\b$\Integrations\Documents\</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="SystemDestination">DPI</Setting>
    <Setting Target="Host" Name="SystemSource">EndoBase</Setting>
  </Item>
  <Item Name="EndoBaseRouting" Category="BDoc,Mv" ClassName="CHUBXL.BP.BDocRouting" PoolSize="1" Enabled="false" Foreground="false" DisableErrorTraps="false" Comment="Routage des rapports de BDoc" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="EndoBaseMvFileOut" Category="EndoBas,MV" ClassName="CHUBXL.BO.SendDocToMv" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des rapports EndoBase vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FilePathLocalTXT">G:\dataProd\EndoBase\out\MV\HUD</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\dataProd\EndoBase\out\MV\HUD</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\oberon\xml$\PDF1\EndoBase\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\oberon\xml$\PDF1\EndoBase\</Setting>
    <Setting Target="Host" Name="SystemDestination">Medical Viewer</Setting>
    <Setting Target="Host" Name="SystemSource">EndoBase</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataProd\EndoBase\out\MV\</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
    <Setting Target="Host" Name="ExtentionBLOB">PDF</Setting>
    <Setting Target="Host" Name="FailureTimeout">1</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\oberon\xml$\PDF1\EndoBase\</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="OperaRVTcpIn" Category="Opera,DPI" ClassName="CHUBXL.BS.HL7TcpIn" PoolSize="1" Enabled="false" Foreground="false" Comment="Transfert des rendez-vous Opera vers BDoc" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\dataProd\OperaRV\archive</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataProd\OperaRV\archive</Setting>
    <Setting Target="Adapter" Name="Port">91181</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">2.3.1</Setting>
    <Setting Target="Host" Name="TargetConfigNames">OperaRVHL7Routing</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AddNackERR">0</Setting>
    <Setting Target="Host" Name="UseAckCommitCodes">0</Setting>
    <Setting Target="Host" Name="AckMode">Immed</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="IgnoreInboundAck">0</Setting>
  </Item>
  <Item Name="OperaRVHL7Routing" Category="DPI,RDV,Quadrat" ClassName="CHUBXL.BP.OperaHL7Routing" PoolSize="1" Enabled="false" Foreground="false" Comment="Rendez-vous QPlanner vers DPI" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="GlimsAbruHUDFileIn" Category="Glims,DPI" ClassName="CHUBXL.BS.GlimsFile" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoie des résultats labo vers Abrumet" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">\\chubxl.be\data\glims-partage\bDOC\HUDERF</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.PDF</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataProd\GLIMSABRU\archive\HUD</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="GlimsAbruBRUFileIn" Category="Glims,DPI" ClassName="CHUBXL.BS.GlimsFile" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoie des résultats labo vers Abrumet" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">\\chubxl.be\data\glims-partage\bDOC\HBR</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.PDF</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataProd\GLIMSABRU\archive\BRU</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="GlimsAbruMvFileOut" Category="Glims,DPI" ClassName="CHUBXL.BO.SendDocToMv" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoie des iReport Glims vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ExtentionBLOB">pdf</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\oberon\xml$\PDF1\GLIMS\</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\dataProd\GLIMSABRU\out\MV</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\dataProd\GLIMSABRU\out\MV</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\oberon\xml$\PDF1\GLIMS\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\oberon\xml$\PDF1\GLIMS\</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="SystemDestination">MV</Setting>
    <Setting Target="Host" Name="SystemSource">GLIMS</Setting>
  </Item>
  <Item Name="GlimsAbruBRUDPIFileOut" Category="Glims,DPI" ClassName="CHUBXL.BO.SendDocToDPI" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoie résultat Ecare vers MediWeb Brugmann" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">GLIMSABRU</Setting>
    <Setting Target="Host" Name="SystemDestination">DPI_BRU</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataProd\GLIMSABRU\out\DPI\BRU</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\10.20.8.127\a$\Integrations-Br\DocumentsLABO\</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\10.20.8.127\a$\Integrations-Br\DocumentsLABO\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\10.20.8.127\a$\Integrations-Br\DocumentsLABO\</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\dataProd\GLIMSABRU\out\DPI\BRU</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\dataProd\GLIMSABRU\out\DPI\BRU</Setting>
  </Item>
  <Item Name="GlimsAbruHUDDPIFileOut" Category="Glims,DPI" ClassName="CHUBXL.BO.SendDocToDPI" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoie résultat Ecare vers MediWeb Brugmann" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">GLIMSABRU</Setting>
    <Setting Target="Host" Name="SystemDestination">DPI_BRU</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\GLIMSABRU\out\DPI\HUD</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\10.20.8.127\b$\Integrations\DocumentsLABO\</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\10.20.8.127\b$\Integrations\DocumentsLABO\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\10.20.8.127\b$\Integrations\DocumentsLABO\</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\dataPROD\GLIMSABRU\out\DPI\HUD</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\dataPROD\GLIMSABRU\out\DPI\HUD</Setting>
  </Item>
  <Item Name="KineFileIn" Category="Kine,DPI,MV" ClassName="CHUBXL.BS.KineFile" PoolSize="1" Enabled="false" Foreground="false" Comment="Reception des rapports de Kine (Oxygen)" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Kine\archive</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\broxy01\hl7$\rapports</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\Kine\archive</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="KineRouting" Category="Astraia,MV,Medical" ClassName="CHUBXL.BP.KineRouting" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des résultats d&apos;Astraia (Gyné) vers Medical Viewer" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="KineMvFileOut" Category="Kine,Medical,MV" ClassName="CHUBXL.BO.SendDocToMv" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des rapports Kine (Oxygen) vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FilePathLocalTXT">G:\dataPROD\Kine\out\MV</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\dataPROD\Kine\out\MV</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\oberon\xml$\PDF1\KINE\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\oberon\xml$\PDF1\KINE\</Setting>
    <Setting Target="Host" Name="SystemDestination">Medcial Viewer</Setting>
    <Setting Target="Host" Name="SystemSource">Kine</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataPROD\Kine\out\MV</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
    <Setting Target="Host" Name="ExtentionBLOB">PDF</Setting>
    <Setting Target="Host" Name="FailureTimeout">1</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\oberon\xml$\PDF1\KINE\</Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="KineDPIHUDFileOut" Category="EndoBase,DPI" ClassName="CHUBXL.BO.SendDocToDPI" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des rapports du logiciel EndoBase HUDERF vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ExtentionBLOB">PDF</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\triton\b$\Integrations\Documents\</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\dataProd\Kine\out\DPI\HUD</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\dataProd\Kine\out\DPI\HUD</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\triton\b$\Integrations\Documents\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\triton\b$\Integrations\Documents\</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="SystemDestination">DPI</Setting>
    <Setting Target="Host" Name="SystemSource">Kine</Setting>
  </Item>
  <Item Name="KineDPIBRUFileOut" Category="EndoBase,DPI" ClassName="CHUBXL.BO.SendDocToDPI" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des rapports du logiciel EndoBase HUDERF vers le DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ExtentionBLOB">PDF</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\10.20.8.127\a$\Integrations-Br\Documents\</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\dataProd\Kine\out\DPI\BRU</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\dataProd\Kine\out\DPI\BRU</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\10.20.8.127\a$\Integrations-Br\Documents\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\10.20.8.127\a$\Integrations-Br\Documents\</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="SystemDestination">DPI</Setting>
    <Setting Target="Host" Name="SystemSource">Kine</Setting>
  </Item>
  <Item Name="GlimsAbruBRUDPIFileOutPreProd" Category="Glims,DPI" ClassName="CHUBXL.BO.SendDocToDPI" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoie résultat Ecare vers MediWeb Brugmann" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="SystemSource">GLIMSABRU</Setting>
    <Setting Target="Host" Name="SystemDestination">DPI_BRU</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">60</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataProd\GLIMSABRU\out\DPI\BRU</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\10.20.8.26\f$\Integrations-Br\DocumentsLabo\</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\10.20.8.26\f$\Integrations-Br\DocumentsLabo\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\10.20.8.26\f$\Integrations-Br\DocumentsLabo\</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\dataPREP\GLIMSABRU\out\DPI\BRU</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\dataPREP\GLIMSABRU\out\DPI\BRU</Setting>
  </Item>
  <Item Name="KineFacIn" Category="Diamic,Wish" ClassName="CHUBXL.BS.InfohosFileIn" PoolSize="1" Enabled="false" Foreground="false" Comment="Fichier facturation Kine Oxygen" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FileSpec">ki*.tf</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\Kine\fact\archive</Setting>
    <Setting Target="Adapter" Name="FilePath">\\broxy01\c$\Facturation</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Kine\fact\archive</Setting>
    <Setting Target="Adapter" Name="Charset">Native</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="KineWishBRUFacFtpOut" Category="Diamic,Wish" ClassName="CHUBXL.BO.BatchFtpWishOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Facturation Kine Oxygen vers Wish" LogTraceEvents="false" Schedule="">
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
  <Item Name="MVSLAdmTcpOut" Category="Wish,MV" ClassName="CHUBXL.BO.HL7TcpOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoi des données administratives des patients de Wish vers Medical Viewer SilverLight" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\Wish\out\MVSL</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\Wish\out\MVSL</Setting>
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
    <Setting Target="Adapter" Name="IPAddress">sharatan</Setting>
    <Setting Target="Adapter" Name="Port">91561</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">5</Setting>
    <Setting Target="Adapter" Name="ReconnectRetry">5</Setting>
    <Setting Target="Adapter" Name="GetReply">1</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="MVSLHL7TcpIn" Category="MV,DPI" ClassName="CHUBXL.BS.HL7TcpIn" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoie des documents archivés vers DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\MVSL\archive</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataPROD\MVSL\archive</Setting>
    <Setting Target="Adapter" Name="Port">91385</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">2.3</Setting>
    <Setting Target="Host" Name="TargetConfigNames">MVHL7Routing</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AddNackERR">0</Setting>
    <Setting Target="Host" Name="UseAckCommitCodes">0</Setting>
    <Setting Target="Host" Name="AckMode">Immed</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="IgnoreInboundAck">0</Setting>
  </Item>
  <Item Name="GlimsAbruMvSLFileOut" Category="Glims,DPI" ClassName="CHUBXL.BO.SendDocToMv" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoie des iReport Glims vers Medical Viewer" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ExtentionBLOB">pdf</Setting>
    <Setting Target="Host" Name="FilePathBLOB">\\SHARATAN\ACScanImport$\PDF1\GLIMS\</Setting>
    <Setting Target="Host" Name="FilePathLocalTXT">G:\dataProd\GLIMSABRU\out\MVSL</Setting>
    <Setting Target="Host" Name="FilePathLocalXML">G:\dataProd\GLIMSABRU\out\MVSL</Setting>
    <Setting Target="Host" Name="FilePathRemoteTXT">\\SHARATAN\ACScanImport$\PDF1\GLIMS\</Setting>
    <Setting Target="Host" Name="FilePathRemoteXML">\\SHARATAN\ACScanImport$\PDF1\GLIMS\</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="SystemDestination">MV</Setting>
    <Setting Target="Host" Name="SystemSource">GLIMS</Setting>
  </Item>
  <Item Name="RsbEventBDocBRUOut" Category="Infohos, intranet" ClassName="CHUBXL.BO.MBFileOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoie fichier Abrumet RsbEvent vers BDoc Brugmann" LogTraceEvents="false" Schedule="">
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
  <Item Name="RsbEventBDocHUDOut" Category="Infohos, intranet" ClassName="CHUBXL.BO.MBFileOut" PoolSize="1" Enabled="false" Foreground="false" Comment="Envoie fichier Abrumet RsbEvent vers BDoc Brugmann" LogTraceEvents="false" Schedule="">
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
  <Item Name="RsbEventBDocIn" Category="Infohos, intranet" ClassName="CHUBXL.BS.InfohosFile" PoolSize="1" Enabled="false" Foreground="false" Comment="Réception fichiers Abrumet RsbEvent" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataProd\BDocRsbEvent\archive</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">G:\dataProd\BDocRsbEvent\in</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.*xml</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataProd\BDocRsbEvent\archive</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp"></Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="QuadratORMEIBRUTcpIn" Category="Quadrat,DPI" ClassName="CHUBXL.BS.HL7TcpIn" PoolSize="1" Enabled="false" Foreground="false" Comment="Messages ORM EI Quadrat-Agfa vers DPI" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">91932</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataProd\QUADRATORM\archive\BRUEI</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="JobPerConnection">1</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">2.3</Setting>
    <Setting Target="Host" Name="TargetConfigNames">QuadratORMHL7Routing</Setting>
  </Item>
  <Item Name="MedecinOneKeyTcpIn" Category="Médecin" ClassName="CHUBXL.BS.HL7TcpIn" PoolSize="1" Enabled="false" Foreground="false" Comment="Réception des données médecins OneKey" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FileArchivePath">G:\dataProd\Medecin\archive</Setting>
    <Setting Target="Host" Name="FileErrorArchivePath">G:\dataProd\Medecin\archive</Setting>
    <Setting Target="Adapter" Name="Port">91661</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">2.3</Setting>
    <Setting Target="Host" Name="TargetConfigNames">WishDPIHUDAdmTcpOut,WishDPIBRUAdmTcpOut</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="AddNackERR">0</Setting>
    <Setting Target="Host" Name="UseAckCommitCodes">0</Setting>
    <Setting Target="Host" Name="AckMode">Immed</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="IgnoreInboundAck">0</Setting>
  </Item>
  <Item Name="MedecinOneKeyFileIn" Category="Medecin,REFMED" ClassName="CHUBXL.BS.MedecinMultiFile" PoolSize="1" Enabled="false" Foreground="false" Comment="Données Médecins" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="FileArchivePath">G:\dataPROD\MEDECIN\archive</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="FilePath">\\brens01test\D$\EnsembleData\PROD\REFMED\out\All</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Adapter" Name="ArchivePath">G:\dataPROD\MEDECIN\archive</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="FileAccessTimeout">10</Setting>
    <Setting Target="Adapter" Name="AppendTimestamp"></Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="MedecinOneKeyRouting" Category="Medecin,REFMED" ClassName="CHUBXL.BP.MedecinOneKeyRouting" PoolSize="1" Enabled="false" Foreground="false" Comment="Routage des messages médecins vers périphériques" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AddToMetric">1</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">15</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
</Production>
}

}
