Class CHUBXL.DT.WishHospToDiaH Extends Ens.DataTransformDTL [ ClassType = "", DependsOn = (EnsLib.HL7.Message, CHUBXL.MSG.SibelmedDiaH), ProcedureBlock ]
{

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='CHUBXL.MSG.SibelmedDiaH' sourceDocType='2.5:ADT_A01' create='new' language='objectscript' >
<assign value='"DIA"' property='target.DEST' action='set' />
<assign value='$zdatetime($h,3)' property='target.TIMESTAMP' action='set' />
<assign value='source.{PV1:VisitNumber}' property='target.NADM' action='set' />
<assign value='source.{PID:PatientName().FamilyName}' property='target.NOM' action='set' />
<assign value='source.{PID:PatientName().GivenName}' property='target.PRENOM' action='set' />
<assign value='source.{PID:AdministrativeSex}' property='target.SEXE' action='set' />
<assign value='source.{PID:DateTimeofBirth}' property='target.DNAIS' action='set' />
<assign value='source.{PID:PrimaryLanguage}' property='target.LANG' action='set' />
<assign value='source.{PID:PatientAddress().StreetAddress}' property='target.RUE' action='set' />
<assign value='source.{PID:PatientAddress().ZiporPostalCode}' property='target.CP' action='set' />
<assign value='source.{PID:PatientAddress().City}' property='target.COM' action='set' />
<assign value='source.{PID:PatientAddress().Country}' property='target.PAYS' action='set' />
<assign value='source.{PID:MaritalStatus}' property='target.ETCIV' action='set' />
<assign value='source.{PID:BirthPlace}' property='target.LNAIS' action='set' />
<assign value='source.{PID:Nationality}' property='target.NAT' action='set' />
<assign value='source.{PID:PhoneNumberHome(1).TelephoneNumber}' property='target.TEL' action='set' />
<assign value='""' property='target.FILLER' action='set' />
<assign value='source.{PID:PatientIdentifierList().IDNumber}' property='target.NDOSM' action='set' />
</transform>
}

}
