Class CHUBXL.DT.WishToORMQuadrat Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message ]
{

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='2.5:ADT_A01' targetDocType='2.5.1:ORM_O01' create='new' language='objectscript' >
<assign value='source.{MSH}' property='target.{MSH}' action='set' />
<assign value='source.{PID}' property='target.{PIDgrp.PID}' action='set' />
<assign value='"NW"' property='target.{ORCgrp(1).ORC:OrderControl}' action='set' />
<assign value='source.{PV1:VisitNumber}' property='target.{ORCgrp(1).ORC:PlacerOrderNumber}' action='set' />
<assign value='source.{PV1:VisitNumber}' property='target.{ORCgrp(1).OBRuniongrp.OBRunion.OBR:PlacerOrderNumber}' action='set' />
<assign value='source.{PV1:AdmitDateTime.Time}' property='target.{ORCgrp(1).OBRuniongrp.OBRunion.OBR:RequestedDateTime}' action='set' />
<assign value='source.{PV1:VisitNumber}' property='target.{ORCgrp().ORC:PlacerGroupNumber}' action='set' />
<assign value='"1"' property='target.{ORCgrp(1).OBRuniongrp.OBRunion.OBR:SetIDOBR}' action='set' />
<assign value='source.{PV2:20.3}' property='target.{ORCgrp(1).OBRuniongrp.OBRunion.OBR:OrderingProvider(1)}' action='set' />
<assign value='"ORM"' property='target.{MSH:MessageType.MessageCode}' action='set' />
<assign value='"O01"' property='target.{MSH:MessageType.TriggerEvent}' action='set' />
<assign value='source.{PV1}' property='target.{PIDgrp.PV1grp.PV1}' action='set' />
<assign value='"ORM_O01"' property='target.{MSH:MessageType.MessageStructure}' action='set' />
<assign value='source.{PV1:FinancialClass(1)}' property='target.{MSH:SendingFacility.NamespaceID}' action='set' />
<assign value='source.{PV2}' property='target.{PIDgrp.PV1grp.PV2}' action='set' />
<if condition='(source.{PV1:PatientClass} = "O") &amp; (source.{PV1:7.1}="")' >
<true>
<assign value='$p(source.{PV2:VisitDescription},"^",3)' property='target.{PIDgrp.PV1grp.PV1:AttendingDoctor().IDNumber}' action='set' />
</true>
</if>
</transform>
}

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

}
