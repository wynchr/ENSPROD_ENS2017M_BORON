Class CHUBXL.DT.ResultCardioToHL7FILE Extends Ens.DataTransformDTL [ ClassType = "", DependsOn = EnsLib.HL7.Message, ProcedureBlock ]
{

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='2.3:ORU_R01' targetDocType='2.3:ORU_R01' create='new' language='objectscript' >
<assign value='source.{MSH}' property='target.{MSH}' action='set' />
<assign value='source.{PIDgrpgrp(1).PIDgrp.PID}' property='target.{PIDgrpgrp(1).PIDgrp.PID}' action='set' />
<assign value='source.{PIDgrpgrp(1).PIDgrp.PD1}' property='target.{PIDgrpgrp(1).PIDgrp.PD1}' action='set' />
<assign value='source.{PIDgrpgrp(1).PIDgrp.PV1grp.PV1}' property='target.{PIDgrpgrp(1).PIDgrp.PV1grp.PV1}' action='set' />
<assign value='source.{PIDgrpgrp(1).PIDgrp.PV1grp.PV2}' property='target.{PIDgrpgrp(1).PIDgrp.PV1grp.PV2}' action='set' />
<assign value='source.{DSC}' property='target.{DSC}' action='set' />
</transform>
}

}
