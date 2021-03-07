Class CHUBXL.DT.ResultGlimsToQuadratSave20190211 Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message ]
{

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='2.4:OUL_R21' targetDocType='2.4:OUL_R21' create='new' language='objectscript' >
<assign value='source.{MSH}' property='target.{MSH}' action='set' />
<assign value='"ISO-8859-1"' property='target.{MSH:CharacterSet}' action='set' />
<assign value='source.{NTE}' property='target.{NTE}' action='set' />
<assign value='source.{PIDgrp}' property='target.{PIDgrp}' action='set' />
<assign value='source.{PV1grp}' property='target.{PV1grp}' action='set' />
<assign value='source.{SACgrpgrp()}' property='target.{SACgrpgrp()}' action='set' />
<assign value='source.{DSC}' property='target.{DSC}' action='set' />
</transform>
}

}
