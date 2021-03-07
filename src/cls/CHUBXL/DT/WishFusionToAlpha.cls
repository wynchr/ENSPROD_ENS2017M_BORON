Class CHUBXL.DT.WishFusionToAlpha Extends Ens.DataTransformDTL [ ClassType = "", DependsOn = (EnsLib.HL7.Message, CHUBXL.MSG.SibelmedMTG), ProcedureBlock ]
{

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='CHUBXL.MSG.SibelmedMTG' sourceDocType='2.5:ADT_A39' create='new' language='objectscript' >
<assign value='$e(source.{EVN:EventOccurred},1,4)_"-"_$e(source.{EVN:EventOccurred},5,6)_"-"_$e(source.{EVN:EventOccurred},7,8)_" "_$e(source.{EVN:EventOccurred},9,10)_":"_$e(source.{EVN:EventOccurred},11,12)_":"_$e(source.{EVN:EventOccurred},13,14)' property='target.HEADDATE' action='set' />
<assign value='"WISH/CPO"' property='target.HEADFROM' action='set' />
<assign value='"ADM-G"' property='target.HEADMSGID' action='set' />
<assign value='"000000000"' property='target.HEADSEQ' action='set' />
<assign value='source.{EVN:OperatorID()}' property='target.HEADUSERID' action='set' />
<assign value='source.{PID:PrimaryLanguage}' property='target.LANG' action='set' />
<assign value='source.{PID:BirthPlace}' property='target.LNAIS' action='set' />
<assign value='""' property='target.NARC' action='set' />
<assign value='source.{PID:Nationality}' property='target.NAT' action='set' />
<assign value='source.{PID:PatientIdentifierList()}' property='target.NDOSM2' action='set' />
<assign value='source.{PID:SSNNumberPatient}' property='target.NIDENT' action='set' />
<assign value='source.{PD1:PatientPrimaryCareProviderNa().IDNumber}' property='target.NMED' action='set' />
<assign value='source.{PID:SSNNumberPatient}' property='target.NNAT' action='set' />
<assign value='source.{PID:PatientName().FamilyName}_","_source.{PID:PatientName().GivenName}' property='target.NOM' action='set' />
<assign value='""' property='target.NOMPC' action='set' />
<assign value='""' property='target.PARPC' action='set' />
<assign value='source.{PID:PatientAddress().Country}' property='target.PAYS' action='set' />
<assign value='"R"' property='target.CODEMVT' action='set' />
<assign value='##class(CHUBXL.DT.Utils).getCodeMvt(source.{MSH:MessageType})' property='target.CODEMVT2' action='set' />
<assign value='source.{PID:PatientDeathIndicator}' property='target.DECEDE' action='set' />
<assign value='source.{PID:PatientDeathDateandTime.Time}' property='target.DDECES' action='set' />
<assign value='source.{PID:DateTimeofBirth}' property='target.DNAIS' action='set' />
<assign value='source.{PID:MaritalStatus}' property='target.ETCIV' action='set' />
<assign value='##class(CHUBXL.DT.Utils).getWishNHOP(source.{PID:PatientIdentifierList().IDNumber})' property='target.NHOP' action='set' />
<assign value='"G"' property='target.TYPERECORD' action='set' />
<assign value='source.{PID:PhoneNumberHome().TelephoneNumber}' property='target.TEL' action='set' />
<assign value='""' property='target.TDOSM2' action='set' />
<assign value='$s(source.{PID:AdministrativeSex}="M":1,source.{PID:AdministrativeSex}="F":2,1:0)' property='target.SEXE' action='set' />
<assign value='source.{PD1:ProtectionIndicator}' property='target.PERS' action='set' />
<assign value='source.{PID:PatientName().ProfessionalSuffix}' property='target.PROF' action='set' />
<assign value='source.{PID:PatientAddress().ZiporPostalCode}_" "_source.{PID:PatientAddress().City}' property='target.LOC' action='set' />
<assign value='source.{PID:PatientAddress().StreetAddress}' property='target.ADR1' action='set' />
</transform>
}

}
