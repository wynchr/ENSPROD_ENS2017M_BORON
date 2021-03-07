Class CHUBXL.DT.ResultDiamicToHL7FILE Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message ]
{

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='2.3:ORU_R01' targetDocType='2.3:ORU_R01' create='new' language='objectscript' >
<assign value='source.{MSH}' property='target.{MSH}' action='set' />
<assign value='source.{PIDgrpgrp()}' property='target.{PIDgrpgrp()}' action='set' />
<assign value='source.{DSC}' property='target.{DSC}' action='set' />
<assign value='51700' property='target.{PIDgrpgrp(1).ORCgrp(1).OBR:FillerOrderNumber.namespaceID}' action='set' />
<if condition='source.{PIDgrpgrp(1).ORCgrp(1).OBR:ResultCopiesTo(1).IDnumberST} &apos;= ""' >
<true>
<assign value='source.{PIDgrpgrp(1).ORCgrp(1).OBR:ResultCopiesTo(1).IDnumberST}' property='target.{PIDgrpgrp(1).ORCgrp(1).OBR:ResultCopiesTo(1).IDnumberST}' action='set' />
</true>
</if>
<if condition='source.{PIDgrpgrp(1).ORCgrp(1).OBR:OrderingProvider(1).IDnumberST} &apos;= ""' >
<true>
<assign value='$e(source.{PIDgrpgrp(1).ORCgrp(1).OBR:OrderingProvider(1).IDnumberST},1,8)' property='target.{PIDgrpgrp(1).ORCgrp(1).OBR:OrderingProvider(1).IDnumberST}' action='set' />
</true>
</if>
<if condition='source.{PIDgrpgrp(1).ORCgrp(1).OBR:PrincipalResultInterpreter.name.IDnumberST} &apos;= ""' >
<true>
<assign value='source.{PIDgrpgrp(1).ORCgrp(1).OBR:PrincipalResultInterpreter.name.IDnumberST}' property='target.{PIDgrpgrp(1).ORCgrp(1).OBR:PrincipalResultInterpreter.name.IDnumberST}' action='set' />
</true>
</if>
<if condition='source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST} &apos;= ""' >
<true>
<assign value='source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST}' property='target.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST}' action='set' />
</true>
</if>
<if condition='source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationIdentifier.alternateidentifier} = "0"' >
<true>
<assign value='""' property='target.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationIdentifier.alternateidentifier}' action='set' />
</true>
</if>
<if condition='source.{PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus} = "I"' >
<true/>
<false/>
</if>
<if condition='source.{PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus} = "X"' >
<true/>
<false/>
</if>
<trace value='"DT Trace1 : "_source.{PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus}' />
<if condition='source.{PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus} = "P"' >
<true>
<if condition='source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST} &apos;= ""' >
<true>
<assign value='source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST}' property='target.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST}' action='set' />
<assign value='source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(2).OBX:ResponsibleObserver.IDnumberST}' property='target.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(2).OBX:ResponsibleObserver.IDnumberST}' action='set' />
<assign value='source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(3).OBX:ResponsibleObserver.IDnumberST}' property='target.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(3).OBX:ResponsibleObserver.IDnumberST}' action='set' />
</true>
</if>
</true>
</if>
<if condition='source.{PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus} = "F"' >
<true>
<if condition='source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST} &apos;= ""' >
<true>
<assign value='source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST}' property='target.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST}' action='set' />
<assign value='source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(2).OBX:ResponsibleObserver.IDnumberST}' property='target.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(2).OBX:ResponsibleObserver.IDnumberST}' action='set' />
<assign value='source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(3).OBX:ResponsibleObserver.IDnumberST}' property='target.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(3).OBX:ResponsibleObserver.IDnumberST}' action='set' />
</true>
</if>
</true>
</if>
<trace value='"DT Trace2 : "_source.{PIDgrpgrp(1).ORCgrp(2).OBR:ResultStatus}' />
<if condition='source.{PIDgrpgrp(1).ORCgrp(2).OBR:ResultStatus} = "P"' >
<true>
<assign value='51700' property='target.{PIDgrpgrp(1).ORCgrp(2).OBR:FillerOrderNumber.namespaceID}' action='set' />
<if condition='source.{PIDgrpgrp(1).ORCgrp(2).OBR:ResultCopiesTo(1).IDnumberST} &apos;= ""' >
<true>
<assign value='source.{PIDgrpgrp(1).ORCgrp(2).OBR:ResultCopiesTo(1).IDnumberST}' property='target.{PIDgrpgrp(1).ORCgrp(2).OBR:ResultCopiesTo(1).IDnumberST}' action='set' />
</true>
</if>
<if condition='source.{PIDgrpgrp(1).ORCgrp(2).OBR:OrderingProvider(1).IDnumberST} &apos;= ""' >
<true>
<assign value='$e(source.{PIDgrpgrp(1).ORCgrp(2).OBR:OrderingProvider(1).IDnumberST},1,8)' property='target.{PIDgrpgrp(1).ORCgrp(2).OBR:OrderingProvider(1).IDnumberST}' action='set' />
</true>
</if>
<if condition='source.{PIDgrpgrp(1).ORCgrp(2).OBR:PrincipalResultInterpreter.name.IDnumberST} &apos;= ""' >
<true>
<assign value='source.{PIDgrpgrp(1).ORCgrp(2).OBR:PrincipalResultInterpreter.name.IDnumberST}' property='target.{PIDgrpgrp(1).ORCgrp(2).OBR:PrincipalResultInterpreter.name.IDnumberST}' action='set' />
</true>
</if>
<if condition='source.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST} &apos;= ""' >
<true>
<assign value='source.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST}' property='target.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST}' action='set' />
<assign value='Source.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(2).OBX:ResponsibleObserver.IDnumberST}' property='target.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(2).OBX:ResponsibleObserver.IDnumberST}' action='set' />
<assign value='source.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(3).OBX:ResponsibleObserver.IDnumberST}' property='target.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(3).OBX:ResponsibleObserver.IDnumberST}' action='set' />
</true>
</if>
</true>
</if>
<if condition='source.{PIDgrpgrp(1).ORCgrp(2).OBR:ResultStatus} = "F"' >
<true>
<assign value='51700' property='target.{PIDgrpgrp(1).ORCgrp(2).OBR:FillerOrderNumber.namespaceID}' action='set' />
<if condition='source.{PIDgrpgrp(1).ORCgrp(2).OBR:ResultCopiesTo(1).IDnumberST} &apos;= ""' >
<true>
<assign value='source.{PIDgrpgrp(1).ORCgrp(2).OBR:ResultCopiesTo(1).IDnumberST}' property='target.{PIDgrpgrp(1).ORCgrp(2).OBR:ResultCopiesTo(1).IDnumberST}' action='set' />
</true>
</if>
<if condition='source.{PIDgrpgrp(1).ORCgrp(2).OBR:OrderingProvider(1).IDnumberST} &apos;= ""' >
<true>
<assign value='$e(source.{PIDgrpgrp(1).ORCgrp(2).OBR:OrderingProvider(1).IDnumberST},1,8)' property='target.{PIDgrpgrp(1).ORCgrp(2).OBR:OrderingProvider(1).IDnumberST}' action='set' />
</true>
</if>
<if condition='source.{PIDgrpgrp(1).ORCgrp(2).OBR:PrincipalResultInterpreter.name.IDnumberST} &apos;= ""' >
<true>
<assign value='source.{PIDgrpgrp(1).ORCgrp(2).OBR:PrincipalResultInterpreter.name.IDnumberST}' property='target.{PIDgrpgrp(1).ORCgrp(2).OBR:PrincipalResultInterpreter.name.IDnumberST}' action='set' />
</true>
</if>
<if condition='source.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST} &apos;= ""' >
<true>
<assign value='source.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST}' property='target.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST}' action='set' />
<assign value='source.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(2).OBX:ResponsibleObserver.IDnumberST}' property='target.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(2).OBX:ResponsibleObserver.IDnumberST}' action='set' />
<assign value='source.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(3).OBX:ResponsibleObserver.IDnumberST}' property='target.{PIDgrpgrp(1).ORCgrp(2).OBXgrp(3).OBX:ResponsibleObserver.IDnumberST}' action='set' />
</true>
</if>
</true>
</if>
<assign value='+source.{PIDgrpgrp(1).PIDgrp.PV1grp.PV1:VisitNumber.ID}' property='target.{PIDgrpgrp(1).PIDgrp.PV1grp.PV1:VisitNumber.ID}' action='set' />
</transform>
}

}
