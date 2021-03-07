Class CHUBXL.DT.WishToAgfaei Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='2.5:ADT_A01' targetDocType='2.5:ADT_A01' create='new' language='objectscript' >
<assign value='source.{MSH}' property='target.{MSH}' action='set' />
<assign value='source.{EVN}' property='target.{EVN}' action='set' />
<assign value='source.{PID}' property='target.{PID}' action='set' />
<assign value='source.{PD1}' property='target.{PD1}' action='set' />
<assign value='source.{NK1()}' property='target.{NK1()}' action='set' />
<assign value='source.{OBX()}' property='target.{OBX()}' action='set' />
<assign value='source.{PV1}' property='target.{PV1}' action='set' />
<if condition='($g(^CHUBXL.Parameter("MedWish","Agfaei"))) &amp; ($l(source.{PD1:PatientPrimaryCareProviderNa(1).IDNumber})=6)' >
<true>
<assign value='source.{PD1:PatientPrimaryCareProviderNa(1).IDNumber}_$tr($j((97-(source.{PD1:PatientPrimaryCareProviderNa(1).IDNumber}#97)),2)," ","0")' property='target.{PD1:PatientPrimaryCareProviderNa(1).IDNumber}' action='set' />
<trace value='^CHUBXL.Parameter("MedWish","Agfaei")' />
</true>
</if>
</transform>
}

}
