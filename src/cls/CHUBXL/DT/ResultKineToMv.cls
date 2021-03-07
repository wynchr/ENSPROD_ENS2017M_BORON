Class CHUBXL.DT.ResultKineToMv Extends Ens.DataTransformDTL [ ClassType = "", DependsOn = (EnsLib.HL7.Message, CHUBXL.MSG.ResultMv), ProcedureBlock ]
{

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='CHUBXL.MSG.ResultMv' sourceDocType='2.3:ORU_R01' create='new' language='objectscript' >
<assign value='##class(CHUBXL.DT.Utils).getNHop(source.{PIDgrpgrp(1).PIDgrp.PID:PatientIDExternalID.ID})' property='target.HospitalFid' action='set' />
<assign value='source.{PIDgrpgrp(1).PIDgrp.PID:PatientIDExternalID.ID}' property='target.PatientCode' action='set' />
<if condition='$l(source.{PIDgrpgrp(1).PIDgrp.PV1grp.PV1:VisitNumber.ID})=9' >
<true>
<assign value='source.{PIDgrpgrp(1).PIDgrp.PV1grp.PV1:VisitNumber.ID}' property='target.NumeroAdm' action='set' />
</true>
<false>
<assign value='source.{PIDgrpgrp(1).PIDgrp.PV1grp.PV1:VisitNumber.ID}' property='target.PassageNr' action='set' />
</false>
</if>
<assign value='source.{PIDgrpgrp(1).ORCgrp(1).OBR:PlacerOrderNumber().entityidentifier}' property='target.NumeroDemande' action='set' />
<assign value='""' property='target.MedecinPresc' action='set' />
<assign value='""' property='target.ServPresc' action='set' />
<assign value='""' property='target.MedecinPresta' action='set' />
<assign value='""' property='target.ServPresta' action='set' />
<assign value='""' property='target.CigesNumber' action='set' />
<assign value='""' property='target.Ciges' action='set' />
<assign value='source.{MSH:SendingFacility}' property='target.SystemeSource' action='set' />
<assign value='source.{MSH:DateTimeofMessage}' property='target.DocUniqueId' action='set' />
<assign value='"IFKineENS"' property='target.Batch' action='set' />
<assign value='"KINE"' property='target.TreeFid' action='set' />
<assign value='""' property='target.Blob' action='set' />
<assign value='$E(source.{MSH:DateTimeofMessage.timeofanevent},7,8)_"/"_$E(source.{MSH:DateTimeofMessage.timeofanevent},5,6)_"/"_$E(source.{MSH:DateTimeofMessage.timeofanevent},1,4)' property='target.DocDate' action='set' />
<assign value='$E(source.{PIDgrpgrp(1).ORCgrp(1).OBR:ObservationDateTime},7,8)_"/"_$E(source.{PIDgrpgrp(1).ORCgrp(1).OBR:ObservationDateTime},5,6)_"/"_$E(source.{PIDgrpgrp(1).ORCgrp(1).OBR:ObservationDateTime},1,4)' property='target.PrestationDate' action='set' />
</transform>
}

}
