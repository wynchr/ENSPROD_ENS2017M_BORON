Class CHUBXL.DT.GlimsToDBMotion Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message ]
{

Property MSHSendingFacilityString As %String;

Property MSHSendingFacilityNumber As %String;

Property PIDleft1 As %String;

Property PIDleft2 As %String;

Property PIDright1 As %String;

Property PIDright2 As %String;

Property PV1VisitNumber As %String;

Property DischargeDate As %Date;

Property NowDate As %Date;

Property WitchHospitalString As %String;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='2.4:OUL_R21' targetDocType='2.4:OUL_R21' create='copy' language='objectscript' >
<assign value='source.{MSH:SendingApplication}' property='target.{MSH:SendingApplication}' action='set' />
<assign value='source.{SACgrpgrp(1).ORC:EnteringOrganization}' property='WitchHospitalString' action='set' />
<assign value='$PIECE(WitchHospitalString,"_",2)' property='WitchHospitalString' action='set' />
<assign value='$PIECE(WitchHospitalString,"^",1)' property='WitchHospitalString' action='set' />
<assign value='source.{MSH:SendingFacility}' property='MSHSendingFacilityString' action='set' />
<assign value='$PIECE(MSHSendingFacilityString,"-",2)' property='MSHSendingFacilityString' action='set' />
<assign value='$case(WitchHospitalString,"BRU":"HBR","STP":"HSP","CDP":"HSP","HUD":"HUD","HIS":"HIS","BOR":"BOR",:"00000")' property='MSHSendingFacilityString' action='set' />
<assign value='$case(WitchHospitalString,"HBR":"00026","HSP":"00025","HUD":"00027","HIS":"00010","BOR":"00030",:"00000")' property='MSHSendingFacilityNumber' action='set' />
<assign value='$case(MSHSendingFacilityString,"BOR":"_ADT_IBM","HBR":"_ADT_MIPS",:"_ADT_SNI")' property='PIDAssigningauthorityString' action='set' />
<assign value='MSHSendingFacilityNumber' property='target.{MSH:SendingFacility}' action='set' />
<assign value='source.{PIDgrp.PID:PatientIdentifierList(1).ID}' property='PIDleft1' action='set' />
<assign value='source.{PIDgrp.PID:PatientIdentifierList(1).assigningauthority}' property='PIDright1' action='set' />
<assign value='source.{PIDgrp.PID:PatientIdentifierList(2).ID}' property='PIDleft2' action='set' />
<assign value='source.{PIDgrp.PID:PatientIdentifierList(2).assigningauthority}' property='PIDright2' action='set' />
<if condition='PIDleft1=""' >
<true>
<assign value='PIDleft2' property='PIDleft1' action='set' />
<assign value='PIDright2' property='PIDright1' action='set' />
<assign value='""' property='PIDleft2' action='set' />
<assign value='""' property='PIDright2' action='set' />
</true>
<false>
<if condition='PIDleft2=""' >
<false>
<assign value='""' property='PIDleft2' action='set' />
<assign value='""' property='PIDright2' action='set' />
</false>
</if>
</false>
</if>
<assign value='""' property='target.{PIDgrp.PID:PatientIdentifierList}' action='set' />
<assign value='PIDleft1' property='target.{PIDgrp.PID:PatientIdentifierList(1).ID}' action='set' />
<assign value='$case(PIDright1,"ID":"GLIMS","BRU":"HBR","STP":"HSP","HUD":"HUD","HIS":"HIS","BOR":"BOR",:PIDright1)' property='PIDright1' action='set' />
<assign value='$case(PIDright1,"HBR":"HBR"_"_ADT_SNI","HSP":"HSP"_"_ADT_SNI","HUD":"HUD"_"_ADT_SNI","HIS":"HIS"_"_ADT_SNI","BOR":"BOR"_"_ADT_IBM",:PIDright1)' property='PIDright1' action='set' />
<assign value='PIDright1' property='target.{PIDgrp.PID:PatientIdentifierList(1).assigningauthority}' action='set' />
<assign value='source.{PV1grp.PV1:VisitNumber}_"^^^"_MSHSendingFacilityString_PIDAssigningauthorityString' property='PV1VisitNumber' action='set' />
<assign value='PV1VisitNumber' property='target.{PV1grp.PV1:VisitNumber}' action='set' />
<assign value='$TR($zdt($h,3),"-: ")' property='NowDate' action='set' />
<assign value='source.{PV1grp.PV1:DischargeDateTime()}' property='DischargeDate' action='set' />
<if condition='DischargeDate&gt;NowDate' >
<true>
<assign value='""' property='target.{PV1grp.PV1:DischargeDateTime()}' action='clear' />
</true>
</if>
<assign value='"2.4"' property='target.{MSH:VersionID.versionID}' action='set' />
<assign value='source.{MSH:CharacterSet()}' property='target.{MSH:CharacterSet()}' action='set' />
</transform>
}

}
