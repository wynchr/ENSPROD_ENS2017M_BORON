Class CHUBXL.DT.ResultGlimsToQuadrat Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message ]
{

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='2.4:OUL_R21' targetDocType='2.4:OUL_R21' create='new' language='objectscript' >
<assign value='source.{MSH}' property='target.{MSH}' action='set' />
<assign value='"ISO-8859-1"' property='target.{MSH:CharacterSet}' action='set' />
<assign value='source.{NTE}' property='target.{NTE}' action='set' />
<assign value='source.{PIDgrp}' property='target.{PIDgrp}' action='set' />
<assign value='source.{PV1grp}' property='target.{PV1grp}' action='set' />
<foreach property='source.{SACgrpgrp()}' key='k1' >
<trace value='"**"_k1_"**"' />
<if condition='source.{SACgrpgrp(k1).OBXgrp(1).OBX:ValueType}&apos;="ED"' >
<true>
<assign value='source.{SACgrpgrp(k1).SACgrp.SAC}' property='target.{SACgrpgrp(k1).SACgrp.SAC}' action='set' />
<assign value='source.{SACgrpgrp(k1).ORC}' property='target.{SACgrpgrp(k1).ORC}' action='set' />
<assign value='source.{SACgrpgrp(k1).OBR}' property='target.{SACgrpgrp(k1).OBR}' action='set' />
<assign value='source.{SACgrpgrp(k1).NTE()}' property='target.{SACgrpgrp(k1).NTE()}' action='set' />
</true>
</if>
<foreach property='source.{SACgrpgrp(k1).OBXgrp()}' key='k2' >
<if condition='source.{SACgrpgrp(k1).OBXgrp(k2).OBX:ValueType}&apos;="ED"' >
<true>
<assign value='source.{SACgrpgrp(k1)}' property='target.{SACgrpgrp(k1)}' action='set' />
<assign value='source.{SACgrpgrp(k1).NTE(k2)}' property='target.{SACgrpgrp(k1).NTE(k2)}' action='set' />
<trace value='"1"_k1_" * "_k2_" * "_source.{SACgrpgrp(k1).OBXgrp(k2).OBX}' />
</true>
</if>
</foreach>
</foreach>
<assign value='source.{DSC}' property='target.{DSC}' action='set' />
</transform>
}

}
