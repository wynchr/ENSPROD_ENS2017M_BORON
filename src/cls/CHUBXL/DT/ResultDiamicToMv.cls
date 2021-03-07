Class CHUBXL.DT.ResultDiamicToMv Extends Ens.DataTransformDTL [ ClassType = "", ProcedureBlock ]
{

XData DTL
{
<?xml version="1.0" ?>
<transform targetClass='CHUBXL.MSG.ResultMv' sourceClass='EnsLib.HL7.Message' sourceDocType='2.3:ORU_R01' create='new' language='objectscript'>
<assign property='target.HospitalFid' value='source.{PIDgrpgrp(1).PIDgrp.PV1grp.PV1:HospitalService}' action='set'/>
<assign property='target.PatientCode' value='source.{PIDgrpgrp(1).PIDgrp.PID:PatientIDInternalID()}' action='set'/>
<assign property='target.PassageNr' value='""' action='set'/>
<assign property='target.NumeroAdm' value='""' action='set'/>
<assign property='target.NumeroDemande' value='source.{MSH:MessageControlID}' action='set'/>
<assign property='target.MedecinPresc' value='""' action='set'/>
<assign property='target.ServPresc' value='""' action='set'/>
<assign property='target.MedecinPresta' value='""' action='set'/>
<assign property='target.ServPresta' value='""' action='set'/>
<assign property='target.CigesNumber' value='""' action='set'/>
<assign property='target.Ciges' value='""' action='set'/>
<assign property='target.SystemeSource' value='source.{MSH:SendingFacility}' action='set'/>
<assign property='target.DocUniqueId' value='source.{MSH:DateTimeofMessage}' action='set'/>
<assign property='target.Batch' value='"IFDIAMICENS"' action='set'/>
<assign property='target.TreeFid' value='"DIAMIC"' action='set'/>
<assign property='target.Blob' value='""' action='set'/>
<if condition='source.{PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus} = "F"'>
<true>
<assign property='target.DocDate' value='$E(source.{PIDgrpgrp(1).ORCgrp(1).OBR:ObservationDateTime},7,8)_"/"_$E(source.{PIDgrpgrp(1).ORCgrp(1).OBR:ObservationDateTime},5,6)_"/"_$E(source.{PIDgrpgrp(1).ORCgrp(1).OBR:ObservationDateTime},1,4)' action='set'/>
<assign property='target.PrestationDate' value='$E(source.{PIDgrpgrp(1).ORCgrp(1).OBR:ObservationDateTime},7,8)_"/"_$E(source.{PIDgrpgrp(1).ORCgrp(1).OBR:ObservationDateTime},5,6)_"/"_$E(source.{PIDgrpgrp(1).ORCgrp(1).OBR:ObservationDateTime},1,4)' action='set'/>
<assign property='target.DocTemplate' value='source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationIdentifier.identifier}_"^"_source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationIdentifier.text}' action='set'/>
<assign property='target.ObservationStatus' value='source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservResultStatus}' action='set'/>
</true>
</if>
<if condition='source.{PIDgrpgrp(1).ORCgrp(2).OBR:ResultStatus} = "F"'>
<true>
<assign property='target.DocDate' value='$E(source.{PIDgrpgrp(1).ORCgrp(2).OBR:ObservationDateTime},7,8)_"/"_$E(source.{PIDgrpgrp(1).ORCgrp(2).OBR:ObservationDateTime},5,6)_"/"_$E(source.{PIDgrpgrp(1).ORCgrp(2).OBR:ObservationDateTime},1,4)' action='set'/>
<assign property='target.PrestationDate' value='$E(source.{PIDgrpgrp(1).ORCgrp(2).OBR:ObservationDateTime},7,8)_"/"_$E(source.{PIDgrpgrp(1).ORCgrp(2).OBR:ObservationDateTime},5,6)_"/"_$E(source.{PIDgrpgrp(1).ORCgrp(2).OBR:ObservationDateTime},1,4)' action='set'/>
<assign property='target.DocTemplate' value='source.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(1).OBX:ObservationIdentifier.identifier}_"^"_source.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(1).OBX:ObservationIdentifier.text}' action='set'/>
<assign property='target.ObservationStatus' value='source.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(1).OBX:ObservResultStatus}' action='set'/>
</true>
</if>

</transform>
}

}
