Class CHUBXL.DT.ResultQuadratToMv Extends Ens.DataTransformDTL [ ClassType = "", DependsOn = (CHUBXL.MSG.ResultQuadrat, CHUBXL.MSG.ResultMv), ProcedureBlock ]
{

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='CHUBXL.MSG.ResultQuadrat' targetClass='CHUBXL.MSG.ResultMv' create='new' language='objectscript' >
<assign value='source.MSH.NHOP' property='target.HospitalFid' action='set' />
<assign value='source.PID.PCODE' property='target.PatientCode' action='set' />
<if condition='$L(source.PV1.PHOSPITALNR) &lt; 2' >
<true>
<assign value='""' property='target.PassageNr' action='set' />
</true>
<false>
<assign value='$P(source.PV1.PHOSPITALNR,"/",1)' property='target.PassageNr' action='set' />
</false>
</if>
<if condition='$L(source.PV1.PADMISSIONNR) &lt; 2' >
<true>
<assign value='""' property='target.NumeroAdm' action='set' />
</true>
<false>
<assign value='$P(source.PV1.PADMISSIONNR,"/",1)' property='target.NumeroAdm' action='set' />
</false>
</if>
<assign value='source.OBR.REQUESTNUMBER' property='target.NumeroDemande' action='set' />
<assign value='$E(source.OBR.RESULTDATE,7,8)_"/"_$E(source.OBR.RESULTDATE,5,6)_"/"_$E(source.OBR.RESULTDATE,1,4)' property='target.DocDate' action='set' />
<assign value='$E(source.OBR.OBSERVDATE,7,8)_"/"_$E(source.OBR.OBSERVDATE,5,6)_"/"_$E(source.OBR.OBSERVDATE,1,4)' property='target.PrestationDate' action='set' />
<assign value='source.OBR.PRESCDRIZIV' property='target.MedecinPresc' action='set' />
<assign value='source.OBR.PRESCRSERVID' property='target.ServPresc' action='set' />
<assign value='source.OBR.INTERPRETERDRIZIV' property='target.MedecinPresta' action='set' />
<assign value='source.OBR.SCODE' property='target.ServPresta' action='set' />
<assign value='""' property='target.CigesNumber' action='set' />
<assign value='""' property='target.Ciges' action='set' />
<assign value='source.MSH.SENDFACILITY' property='target.SystemeSource' action='set' />
<assign value='source.MSH.TIMESTAMP' property='target.DocUniqueId' action='set' />
<assign value='"IFQUADRATENS"' property='target.Batch' action='set' />
<assign value='source.OBR.RTEMPLATE' property='target.DocTemplate' action='set' />
<if condition='source.MSH.SENDFACILITY = "QDOC"' >
<true>
<assign value='source.OBR.REQUESTEXAM' property='target.TreeFid' action='set' />
<assign value='"AGFA-"_source.OBR.REQUESTNUMBER' property='target.DocUniqueId' action='set' />
</true>
<false>
<assign value='$Case(source.MSH.NHOP,"26":"QDOC1","27":"QDOC2",:"QDOC?")_"."_source.OBR.SCODE_"."_source.OBR.RTEMPLATE' property='target.TreeFid' action='set' />
</false>
</if>
<assign value='source.OBX.PROTMV' property='target.Blob' action='set' />
<assign value='source.OBR.RESULTSTATUS' property='target.ObservationStatus' action='set' />
</transform>
}

}
