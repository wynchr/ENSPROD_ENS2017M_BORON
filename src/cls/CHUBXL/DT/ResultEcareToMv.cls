Class CHUBXL.DT.ResultEcareToMv Extends Ens.DataTransformDTL [ ClassType = "", DependsOn = (EnsLib.HL7.Message, CHUBXL.MSG.ResultMv), ProcedureBlock ]
{

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='CHUBXL.MSG.ResultMv' sourceDocType='2.3:ORU_R01' create='new' language='objectscript' >
<assign value='source.{PIDgrpgrp(1).PIDgrp.PV1grp.PV1:ServicingFacility}' property='target.HospitalFid' action='set' />
<assign value='source.{PIDgrpgrp(1).PIDgrp.PID:PatientIDInternalID()}' property='target.PatientCode' action='set' />
<if condition='$l(source.{PIDgrpgrp(1).PIDgrp.PV1grp.PV1:VisitNumber.ID})=9' >
<true>
<assign value='source.{PIDgrpgrp(1).PIDgrp.PV1grp.PV1:VisitNumber.ID}' property='target.NumeroAdm' action='set' />
</true>
<false>
<assign value='source.{PIDgrpgrp(1).PIDgrp.PV1grp.PV1:VisitNumber.ID}' property='target.PassageNr' action='set' />
</false>
</if>
<assign value='source.{MSH:MessageControlID}' property='target.NumeroDemande' action='set' />
<assign value='""' property='target.MedecinPresc' action='set' />
<assign value='""' property='target.ServPresc' action='set' />
<assign value='""' property='target.MedecinPresta' action='set' />
<assign value='""' property='target.ServPresta' action='set' />
<assign value='""' property='target.CigesNumber' action='set' />
<assign value='""' property='target.Ciges' action='set' />
<assign value='source.{MSH:SendingFacility}' property='target.SystemeSource' action='set' />
<assign value='source.{MSH:DateTimeofMessage}' property='target.DocUniqueId' action='set' />
<assign value='"IFECAREENS"' property='target.Batch' action='set' />
<assign value='"E."_$p(source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationIdentifier.identifier}_"^"_source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationIdentifier.text},"^",1)' property='target.TreeFid' action='set' />
<assign value='""' property='target.Blob' action='set' />
<if condition='source.{PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus} = "F"' >
<true>
<assign value='$E(source.{PIDgrpgrp(1).ORCgrp(1).OBR:ObservationDateTime},7,8)_"/"_$E(source.{PIDgrpgrp(1).ORCgrp(1).OBR:ObservationDateTime},5,6)_"/"_$E(source.{PIDgrpgrp(1).ORCgrp(1).OBR:ObservationDateTime},1,4)' property='target.DocDate' action='set' />
<assign value='$E(source.{PIDgrpgrp(1).ORCgrp(1).OBR:ObservationDateTime},7,8)_"/"_$E(source.{PIDgrpgrp(1).ORCgrp(1).OBR:ObservationDateTime},5,6)_"/"_$E(source.{PIDgrpgrp(1).ORCgrp(1).OBR:ObservationDateTime},1,4)' property='target.PrestationDate' action='set' />
<assign value='source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationIdentifier.identifier}_"^"_source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationIdentifier.text}' property='target.DocTemplate' action='set' />
<assign value='source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservResultStatus}' property='target.ObservationStatus' action='set' />
</true>
</if>
<if condition='source.{PIDgrpgrp(1).ORCgrp(2).OBR:ResultStatus} = "F"' >
<true>
<assign value='$E(source.{PIDgrpgrp(1).ORCgrp(2).OBR:ObservationDateTime},7,8)_"/"_$E(source.{PIDgrpgrp(1).ORCgrp(2).OBR:ObservationDateTime},5,6)_"/"_$E(source.{PIDgrpgrp(1).ORCgrp(2).OBR:ObservationDateTime},1,4)' property='target.DocDate' action='set' />
<assign value='$E(source.{PIDgrpgrp(1).ORCgrp(2).OBR:ObservationDateTime},7,8)_"/"_$E(source.{PIDgrpgrp(1).ORCgrp(2).OBR:ObservationDateTime},5,6)_"/"_$E(source.{PIDgrpgrp(1).ORCgrp(2).OBR:ObservationDateTime},1,4)' property='target.PrestationDate' action='set' />
<assign value='source.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(1).OBX:ObservationIdentifier.identifier}_"^"_source.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(1).OBX:ObservationIdentifier.text}' property='target.DocTemplate' action='set' />
<assign value='source.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(1).OBX:ObservResultStatus}' property='target.ObservationStatus' action='set' />
</true>
</if>
</transform>
}

}
