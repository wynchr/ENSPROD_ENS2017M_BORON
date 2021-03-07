Class CHUBXL.DT.WishMedInami8 Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='2.5:MFN_M02' targetDocType='2.5:MFN_M02' create='new' language='objectscript' >
<assign value='source.{MSH}' property='target.{MSH}' action='set' />
<assign value='source.{SFT()}' property='target.{SFT()}' action='set' />
<assign value='source.{MFI}' property='target.{MFI}' action='set' />
<assign value='source.{MFEgrp()}' property='target.{MFEgrp()}' action='set' />
</transform>
}

}
