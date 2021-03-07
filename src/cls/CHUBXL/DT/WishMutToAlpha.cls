Class CHUBXL.DT.WishMutToAlpha Extends Ens.DataTransformDTL [ ClassType = "", DependsOn = (EnsLib.HL7.Message, CHUBXL.MSG.SibelmedMTM), ProcedureBlock ]
{

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='CHUBXL.MSG.SibelmedMTM' sourceDocType='2.5:ADT_A01' create='new' language='objectscript' >
<assign value='$e(source.{EVN:EventOccurred},1,4)_"-"_$e(source.{EVN:EventOccurred},5,6)_"-"_$e(source.{EVN:EventOccurred},7,8)_" "_$e(source.{EVN:EventOccurred},9,10)_":"_$e(source.{EVN:EventOccurred},11,12)_":"_$e(source.{EVN:EventOccurred},13,14)' property='target.HEADDATE' action='set' />
<assign value='"WISH/CPO"' property='target.HEADFROM' action='set' />
<assign value='"ADM-M"' property='target.HEADMSGID' action='set' />
<assign value='"000000000"' property='target.HEADSEQ' action='set' />
<assign value='source.{EVN:OperatorID()}' property='target.HEADUSERID' action='set' />
<assign value='source.{PID:PatientIdentifierList().IDNumber}' property='target.NDOSM' action='set' />
<assign value='$zdatetime($h,3)' property='target.DGDATE' action='set' />
<assign value='##class(CHUBXL.DT.Utils).getMTNHopFromNHop(##class(CHUBXL.DT.Utils).getWishNHOP(source.{PV1:VisitNumber}))' property='target.NHOP' action='set' />
<assign value='source.{IN1grp(1).IN1:PolicyNumber}' property='target.MATBEN' action='set' />
<assign value='source.{IN1grp(1).IN1:InsuranceCompanyID().IDNumber}' property='target.NOA' action='set' />
<assign value='source.{IN1grp(1).IN1:InsuredsIDNumber().IDNumber}' property='target.MATTIT' action='set' />
<assign value='source.{IN1grp(1).IN1:NameOfInsured().FamilyName}_","_source.{IN1grp().IN1:NameOfInsured().GivenName}' property='target.NOMTIT' action='set' />
<assign value='"1"' property='target.PRIO' action='set' />
<assign value='source.{IN1grp(1).IN1:InsuredsAddress().StreetAddress}' property='target.RUETIT' action='set' />
<assign value='source.{PV2:AccommodationCode.Identifier}' property='target.SQREGE' action='set' />
<assign value='source.{PV2:AccommodationCode.Identifier}' property='target.REG' action='set' />
<assign value='"M"' property='target.TYPERECORD' action='set' />
<assign value='source.{IN1grp(1).IN1:PlanEffectiveDate}' property='target.SQDDEB' action='set' />
<assign value='source.{IN1grp(1).IN1:PlanExpirationDate}' property='target.SQDFIN' action='set' />
<assign value='"R"' property='target.CODEMVT' action='set' />
</transform>
}

}
