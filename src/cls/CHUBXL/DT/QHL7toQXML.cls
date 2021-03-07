Class CHUBXL.DT.QHL7toQXML Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.HL7.Message, CHUBXL.MSG.ResultMv) ]
{

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='CHUBXL.MSG.ResultMv' sourceDocType='2.4:ORU_R01' create='new' language='objectscript' >
<assign value='"Résultat"' property='target.rawMsg.source' action='set' />
<assign value='source.{PIDgrpgrp(1).ORCgrp(1).OBR:UniversalServiceIdentifier.text}' property='target.TreeFid' action='set' />
<assign value='$p(source.{PIDgrpgrp(1).ORCgrp(1).OBR:UniversalServiceIdentifier.text},".",$l(source.{PIDgrpgrp().ORCgrp().OBR:UniversalServiceIdentifier.text},"."))' property='target.DocTemplate' action='set' />
<assign value='source.{PIDgrpgrp(1).ORCgrp(1).OBR:FillerOrderNumber.entityidentifier}' property='target.NumeroDemande' action='set' />
<assign value='source.{PIDgrpgrp(1).PIDgrp.PV1grp.PV1:VisitNumber.ID}' property='target.PassageNr' action='set' />
<assign value='source.{PIDgrpgrp(1).ORCgrp(1).OBR:PrincipalResultInterpreter.name.IDnumberST}' property='target.MedecinPresta' action='set' />
<assign value='source.{PIDgrpgrp(1).ORCgrp(1).OBR:DiagnosticServSectID}' property='target.ServPresta' action='set' />
<assign value='source.{PIDgrpgrp(1).ORCgrp(1).OBR:OrderingProvider(1).IDnumberST}' property='target.MedecinPresc' action='set' />
<assign value='source.{PIDgrpgrp(1).ORCgrp(1).OBR:RequestedDateTime}' property='target.DocDate' action='set' />
<assign value='source.{PIDgrpgrp(1).ORCgrp(1).OBR:ObservationDateTime}' property='target.PrestationDate' action='set' />
<assign value='##class(CHUBXL.DT.Utils).getNHop(source.{PIDgrpgrp(1).PIDgrp.PID:PatientID.ID})' property='target.HospitalFid' action='set' />
<assign value='"IFQUADRATENS"' property='target.Batch' action='set' />
<assign value='"QDOC"' property='target.SystemeSource' action='set' />
<assign value='source.{PIDgrpgrp(1).PIDgrp.PID:PatientID.ID}' property='target.PatientCode' action='set' />
<assign value='source.{PIDgrpgrp(1).PIDgrp.PV1grp.PV1:AssignedPatientLocation}' property='target.ServPresc' action='set' />
</transform>
}

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

}
