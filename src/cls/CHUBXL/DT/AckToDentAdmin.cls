Class CHUBXL.DT.AckToDentAdmin Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='2.5:ACK' targetDocType='2.5:ADR_A19' create='new' language='objectscript' >
<assign value='source.{MSH}' property='target.{MSH}' action='set' />
<assign value='source.{SFT()}' property='target.{SFT()}' action='set' />
<assign value='source.{MSA}' property='target.{MSA}' action='set' />
<assign value='source.{ERR()}' property='target.{ERR}' action='set' />
<assign value='"ADR^A19"' property='target.{MSH:MessageType}' action='set' />
</transform>
}

}
