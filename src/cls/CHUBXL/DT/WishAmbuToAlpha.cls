Class CHUBXL.DT.WishAmbuToAlpha Extends Ens.DataTransformDTL [ ClassType = "", DependsOn = (EnsLib.HL7.Message, CHUBXL.MSG.SibelmedMTE), ProcedureBlock ]
{

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='CHUBXL.MSG.SibelmedMTE' sourceDocType='2.5:ADT_A01' create='new' language='objectscript' >
<assign value='$e(source.{EVN:EventOccurred},1,4)_"-"_$e(source.{EVN:EventOccurred},5,6)_"-"_$e(source.{EVN:EventOccurred},7,8)_" "_$e(source.{EVN:EventOccurred},9,10)_":"_$e(source.{EVN:EventOccurred},11,12)_":"_$e(source.{EVN:EventOccurred},13,14)' property='target.HEADDATE' action='set' />
<assign value='"WISH/CPO"' property='target.HEADFROM' action='set' />
<assign value='"ADM-E"' property='target.HEADMSGID' action='set' />
<assign value='"000000000"' property='target.HEADSEQ' action='set' />
<assign value='source.{EVN:OperatorID()}' property='target.HEADUSERID' action='set' />
<assign value='$e(source.{PV1:AdmitDateTime},9,12)' property='target.HPASSAGE' action='set' />
<assign value='source.{PV1:FinancialClass().FinancialClassCode}' property='target.LOC' action='set' />
<assign value='""' property='target.NARC' action='set' />
<assign value='source.{PID:PatientIdentifierList().IDNumber}' property='target.NDOSM' action='set' />
<assign value='source.{PV1:ReferringDoctor().IDNumber}' property='target.NMED' action='set' />
<assign value='source.{PV1:VisitNumber}' property='target.SQPOLPAS' action='set' />
<assign value='source.{PV2:AccommodationCode.Identifier}' property='target.SQREG' action='set' />
<assign value='"E"' property='target.TYPERECORD' action='set' />
<assign value='$P(source.{PV2:VisitDescription},"^",4)' property='target.CFRAIS' action='set' />
<assign value='""' property='target.COMMENT' action='set' />
<assign value='$zdatetime($h,3)' property='target.DGDATE' action='set' />
<assign value='$e(source.{EVN:RecordedDateTime},1,8)' property='target.DPASSAGE' action='set' />
<assign value='##class(CHUBXL.DT.Utils).getWishNHOP(source.{PV1:VisitNumber})' property='target.NHOP' action='set' />
<assign value='##class(CHUBXL.DT.Utils).getCodeMvt(source.{MSH:MessageType})' property='target.CODEMVT2' action='set' />
<assign value='""' property='target.CEITP' action='set' />
</transform>
}

}
