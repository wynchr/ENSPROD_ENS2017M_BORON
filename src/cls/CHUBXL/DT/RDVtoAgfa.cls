Class CHUBXL.DT.RDVtoAgfa Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message ]
{

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='2.5.1:ADT_A01' targetDocType='2.5.1:SIU_S12' create='new' language='objectscript' >
<assign value='source.{MSH}' property='target.{MSH}' action='set' />
<assign value='source.{PD1}' property='target.{PIDgrp(1).PD1}' action='set' />
<assign value='"FINISHED"' property='target.{SCH:FillerStatusCode}' action='set' />
<assign value='source.{PV1}' property='target.{PIDgrp(1).PV1}' action='set' />
<assign value='source.{PV2}' property='target.{PIDgrp(1).PV2}' action='set' />
<assign value='source.{OBX(1)}' property='target.{PIDgrp(1).OBX(1)}' action='set' />
<assign value='source.{PID}' property='target.{PIDgrp(1).PID}' action='set' />
<assign value='""' property='target.{SCH:PlacerGroupNumber}' action='set' />
<assign value='source.{PV2:20.1}' property='target.{SCH:FillerAppointmentID}' action='set' />
<assign value='""' property='target.{SCH:EventReason}' action='set' />
<assign value='$p(source.{PV2:VisitDescription},"^",2)' property='target.{SCH:AppointmentTimingQuantity(1).StartDateTime}' action='set' />
<assign value='$p(source.{PV2:VisitDescription},"^",2)' property='target.{SCH:AppointmentTimingQuantity(1).EndDateTime}' action='set' />
<assign value='""' property='target.{SCH:EnteredbyPerson(1)}' action='set' />
<assign value='"1"' property='target.{RGSgrp(1).RGS:ResourceGroupID.identifier}' action='set' />
<assign value='"1"' property='target.{RGSgrp(1).RGS:SetIDRGS}' action='set' />
<assign value='"1"' property='target.{RGSgrp(1).AISgrp(1).AIS:SetIDAIS}' action='set' />
<assign value='source.{PV1:AdmitDateTime}' property='target.{RGSgrp(1).AIPgrp(1).AIP:StartDateTime}' action='set' />
<assign value='source.{PV2:VisitDescription}' property='target.{RGSgrp(1).AIPgrp(1).AIP:ResourceType}' action='set' />
<assign value='"15"' property='target.{RGSgrp(1).AISgrp(1).AIS:Duration}' action='set' />
<assign value='"1"' property='target.{RGSgrp(1).AILgrp(1).AIL:SetIDAIL}' action='set' />
<assign value='"D^DEPARTMENT"' property='target.{RGSgrp(1).AILgrp(1).AIL:LocationTypeAIL}' action='set' />
<assign value='"1"' property='target.{RGSgrp(1).AIPgrp(1).AIP:SetIDAIP}' action='set' />
<assign value='"SIU^S12"' property='target.{MSH:MessageType}' action='set' />
<assign value='source.{PV2:20.3}' property='target.{RGSgrp(1).AIPgrp(1).AIP:PersonnelResourceID(1).IDNumber}' action='set' />
<assign value='source.{PV2:20.5}_"^"_source.{PV2:20.6}' property='target.{RGSgrp(1).AISgrp(1).AIS:UniversalServiceIdentifier.Identifier}' action='set' />
</transform>
}

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

}
