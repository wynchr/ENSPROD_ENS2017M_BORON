Class CHUBXL.DT.WishHospToAlpha Extends Ens.DataTransformDTL [ ClassType = "", DependsOn = (EnsLib.HL7.Message, CHUBXL.MSG.SibelmedMTH), ProcedureBlock ]
{

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='CHUBXL.MSG.SibelmedMTH' sourceDocType='2.5:ADT_A01' create='new' language='objectscript' >
<assign value='$e(source.{EVN:EventOccurred},1,4)_"-"_$e(source.{EVN:EventOccurred},5,6)_"-"_$e(source.{EVN:EventOccurred},7,8)_" "_$e(source.{EVN:EventOccurred},9,10)_":"_$e(source.{EVN:EventOccurred},11,12)_":"_$e(source.{EVN:EventOccurred},13,14)' property='target.HEADDATE' action='set' />
<assign value='"WISH/CPO"' property='target.HEADFROM' action='set' />
<assign value='"ADM-H"' property='target.HEADMSGID' action='set' />
<assign value='"000000000"' property='target.HEADSEQ' action='set' />
<assign value='source.{EVN:OperatorID()}' property='target.HEADUSERID' action='set' />
<assign value='source.{PID:PatientIdentifierList().IDNumber}' property='target.NDOSM' action='set' />
<assign value='$zdatetime($h,3)' property='target.DGDATE' action='set' />
<assign value='##class(CHUBXL.DT.Utils).getWishNHOP(source.{PV1:VisitNumber})' property='target.NHOP' action='set' />
<assign value='source.{PV1:VisitNumber}' property='target.NADM' action='set' />
<assign value='source.{PV1:HospitalService}' property='target.CFRAIS' action='set' />
<assign value='source.{PV1:AssignedPatientLocation.Room}' property='target.CHAMB' action='set' />
<assign value='""' property='target.NARC' action='set' />
<assign value='source.{PV1:AssignedPatientLocation.PointofCare}' property='target.US' action='set' />
<assign value='""' property='target.HADU' action='set' />
<assign value='""' property='target.DMVTMOD' action='set' />
<assign value='$e(source.{EVN:RecordedDateTime},1,8)' property='target.DMVT' action='set' />
<assign value='source.{PV1:AdmissionType}' property='target.RADM' action='set' />
<assign value='""' property='target.TYPERECORD' action='set' />
<assign value='##class(CHUBXL.DT.Utils).getCodeMvt(source.{MSH:MessageType})' property='target.CODEMVT' action='set' />
<assign value='""' property='target.RSORH' action='set' />
<assign value='$e(source.{PV1:AdmitDateTime},1,8)' property='target.DADM' action='set' />
<assign value='""' property='target.RADR' action='set' />
<assign value='""' property='target.NADMMERE' action='set' />
<assign value='source.{PD1:PatientPrimaryCareProviderNa().IDNumber}' property='target.NMED' action='set' />
<assign value='""' property='target.LRAIS' action='set' />
<assign value='source.{PV1:AssignedPatientLocation.Bed}' property='target.LIT' action='set' />
<assign value='$e(source.{EVN:RecordedDateTime},9,12)' property='target.HMVT' action='set' />
<assign value='##class(CHUBXL.DT.Utils).getTypMvt(source.{MSH:MessageType})' property='target.TYPMVT' action='set' />
<assign value='""' property='target.HMVTMOD' action='set' />
<assign value='$e(source.{PV1:DischargeDateTime()},9,12)' property='target.HSOR' action='set' />
<assign value='$e(source.{PV1:AdmitDateTime},9,12)' property='target.HADM' action='set' />
<assign value='$e(source.{PV1:DischargeDateTime()},1,8)' property='target.DSOR' action='set' />
<assign value='""' property='target.DEST' action='set' />
<assign value='""' property='target.DERNMVT' action='set' />
<assign value='source.{PID:PatientName().FamilyName}_","_source.{PID:PatientName().GivenName}' property='target.NOMPREN' action='set' />
</transform>
}

}
