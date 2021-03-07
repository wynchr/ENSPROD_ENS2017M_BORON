Class CHUBXL.DT.ResultDentAdminToHL7FILE Extends Ens.DataTransformDTL [ ClassType = "", ProcedureBlock ]
{

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<?xml version="1.0" ?>
<transform targetClass='EnsLib.HL7.Message' targetDocType='2.3:ORU_R01' sourceClass='EnsLib.HL7.Message' sourceDocType='2.3:ORU_R01' create='new' language='objectscript'>
<assign property='target.{MSH}' value='source.{MSH}' action='set'/>
<assign property='target.{PIDgrpgrp()}' value='source.{PIDgrpgrp()}' action='set'/>
<assign property='target.{DSC}' value='source.{DSC}' action='set'/>
<assign property='target.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ValueType}' value='"RP"' action='set'/>
<assign property='target.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservResultStatus}' value='source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservResultStatus}' action='set'/>
<assign property='target.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:DateLastObsNormalValues}' value='source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:DateLastObsNormalValues}' action='set'/>
<assign property='target.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:UserDefinedAccessChecks}' value='source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:UserDefinedAccessChecks}' action='set'/>
<if condition='source.{PIDgrpgrp(1).ORCgrp(1).OBR:ResultCopiesTo(1).IDnumberST} &apos;= ""'>
<true>
<assign property='target.{PIDgrpgrp(1).ORCgrp(1).OBR:ResultCopiesTo(1).IDnumberST}' value='$E(source.{PIDgrpgrp(1).ORCgrp(1).OBR:ResultCopiesTo(1).IDnumberST},1,6)_"01"' action='set'/>
</true>
</if>
<if condition='source.{PIDgrpgrp(1).ORCgrp(1).OBR:OrderingProvider(1).IDnumberST} &apos;= ""'>
<true>
<assign property='target.{PIDgrpgrp(1).ORCgrp(1).OBR:OrderingProvider(1).IDnumberST}' value='$E(source.{PIDgrpgrp(1).ORCgrp(1).OBR:OrderingProvider(1).IDnumberST},1,6)_"01"' action='set'/>
</true>
</if>
<if condition='source.{PIDgrpgrp(1).ORCgrp(1).OBR:PrincipalResultInterpreter.name.IDnumberST} &apos;= ""'>
<true>
<assign property='target.{PIDgrpgrp(1).ORCgrp(1).OBR:PrincipalResultInterpreter.name.IDnumberST}' value='$E(source.{PIDgrpgrp(1).ORCgrp(1).OBR:PrincipalResultInterpreter.name.IDnumberST},1,6)_"01"' action='set'/>
</true>
</if>
<if condition='source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST} &apos;= ""'>
<true>
<assign property='target.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST}' value='$E(source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST},1,6)_"01"' action='set'/>
</true>
</if>
<if condition='source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationIdentifier.alternateidentifier} = "0"'>
<true>
<assign property='target.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationIdentifier.alternateidentifier}' value='""' action='set'/>
</true>
</if>
<if condition='source.{PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus} = "I"'>
<true>
</true>
<false>
</false>
</if>
<if condition='source.{PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus} = "X"'>
<true>
</true>
<false>
</false>
</if>
<trace value='"DT Trace1 : "_source.{PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus}'/>
<if condition='source.{PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus} = "P"'>
<true>
<if condition='source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST} &apos;= ""'>
<true>
<assign property='target.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST}' value='$E(source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST},1,6)_"01"' action='set'/>
<assign property='target.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(2).OBX:ResponsibleObserver.IDnumberST}' value='$E(source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(2).OBX:ResponsibleObserver.IDnumberST},1,6)_"01"' action='set'/>
<assign property='target.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(3).OBX:ResponsibleObserver.IDnumberST}' value='$E(source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(3).OBX:ResponsibleObserver.IDnumberST},1,6)_"01"' action='set'/>
</true>
</if>
</true>
</if>
<if condition='source.{PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus} = "F"'>
<true>
<if condition='source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST} &apos;= ""'>
<true>
<assign property='target.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST}' value='$E(source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST},1,6)_"01"' action='set'/>
<assign property='target.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(2).OBX:ResponsibleObserver.IDnumberST}' value='$E(source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(2).OBX:ResponsibleObserver.IDnumberST},1,6)_"01"' action='set'/>
<assign property='target.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(3).OBX:ResponsibleObserver.IDnumberST}' value='$E(source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(3).OBX:ResponsibleObserver.IDnumberST},1,6)_"01"' action='set'/>
</true>
</if>
</true>
</if>
<trace value='"DT Trace2 : "_source.{PIDgrpgrp(1).ORCgrp(2).OBR:ResultStatus}'/>
<if condition='source.{PIDgrpgrp(1).ORCgrp(2).OBR:ResultStatus} = "P"'>
<true>
<assign property='target.{PIDgrpgrp(1).ORCgrp(2).OBR:FillerOrderNumber.namespaceID}' value='51700' action='set'/>
<if condition='source.{PIDgrpgrp(1).ORCgrp(2).OBR:ResultCopiesTo(1).IDnumberST} &apos;= ""'>
<true>
<assign property='target.{PIDgrpgrp(1).ORCgrp(2).OBR:ResultCopiesTo(1).IDnumberST}' value='$E(source.{PIDgrpgrp(1).ORCgrp(2).OBR:ResultCopiesTo(1).IDnumberST},1,6)_"01"' action='set'/>
</true>
</if>
<if condition='source.{PIDgrpgrp(1).ORCgrp(2).OBR:OrderingProvider(1).IDnumberST} &apos;= ""'>
<true>
<assign property='target.{PIDgrpgrp(1).ORCgrp(2).OBR:OrderingProvider(1).IDnumberST}' value='$E(source.{PIDgrpgrp(1).ORCgrp(2).OBR:OrderingProvider(1).IDnumberST},1,6)_"01"' action='set'/>
</true>
</if>
<if condition='source.{PIDgrpgrp(1).ORCgrp(2).OBR:PrincipalResultInterpreter.name.IDnumberST} &apos;= ""'>
<true>
<assign property='target.{PIDgrpgrp(1).ORCgrp(2).OBR:PrincipalResultInterpreter.name.IDnumberST}' value='$E(source.{PIDgrpgrp(1).ORCgrp(2).OBR:PrincipalResultInterpreter.name.IDnumberST},1,6)_"01"' action='set'/>
</true>
</if>
<if condition='source.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST} &apos;= ""'>
<true>
<assign property='target.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST}' value='$E(source.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST},1,6)_"01"' action='set'/>
<assign property='target.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(2).OBX:ResponsibleObserver.IDnumberST}' value='$E(source.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(2).OBX:ResponsibleObserver.IDnumberST},1,6)_"01"' action='set'/>
<assign property='target.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(3).OBX:ResponsibleObserver.IDnumberST}' value='$E(source.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(3).OBX:ResponsibleObserver.IDnumberST},1,6)_"01"' action='set'/>
</true>
</if>
</true>
</if>
<if condition='source.{PIDgrpgrp(1).ORCgrp(2).OBR:ResultStatus} = "F"'>
<true>
<assign property='target.{PIDgrpgrp(1).ORCgrp(2).OBR:FillerOrderNumber.namespaceID}' value='51700' action='set'/>
<if condition='source.{PIDgrpgrp(1).ORCgrp(2).OBR:ResultCopiesTo(1).IDnumberST} &apos;= ""'>
<true>
<assign property='target.{PIDgrpgrp(1).ORCgrp(2).OBR:ResultCopiesTo(1).IDnumberST}' value='$E(source.{PIDgrpgrp(1).ORCgrp(2).OBR:ResultCopiesTo(1).IDnumberST},1,6)_"01"' action='set'/>
</true>
</if>
<if condition='source.{PIDgrpgrp(1).ORCgrp(2).OBR:OrderingProvider(1).IDnumberST} &apos;= ""'>
<true>
<assign property='target.{PIDgrpgrp(1).ORCgrp(2).OBR:OrderingProvider(1).IDnumberST}' value='$E(source.{PIDgrpgrp(1).ORCgrp(2).OBR:OrderingProvider(1).IDnumberST},1,6)_"01"' action='set'/>
</true>
</if>
<if condition='source.{PIDgrpgrp(1).ORCgrp(2).OBR:PrincipalResultInterpreter.name.IDnumberST} &apos;= ""'>
<true>
<assign property='target.{PIDgrpgrp(1).ORCgrp(2).OBR:PrincipalResultInterpreter.name.IDnumberST}' value='$E(source.{PIDgrpgrp(1).ORCgrp(2).OBR:PrincipalResultInterpreter.name.IDnumberST},1,6)_"01"' action='set'/>
</true>
</if>
<if condition='source.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST} &apos;= ""'>
<true>
<assign property='target.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST}' value='$E(source.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST},1,6)_"01"' action='set'/>
<assign property='target.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(2).OBX:ResponsibleObserver.IDnumberST}' value='$E(source.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(2).OBX:ResponsibleObserver.IDnumberST},1,6)_"01"' action='set'/>
<assign property='target.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(3).OBX:ResponsibleObserver.IDnumberST}' value='$E(source.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(3).OBX:ResponsibleObserver.IDnumberST},1,6)_"01"' action='set'/>
</true>
</if>
</true>
</if>
</transform>
}

}
