Class CHUBXL.DT.WishMedToOphtalmo Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='2.5:MFN_M02' targetDocType='2.5:MFN_M02' create='new' language='objectscript' >
<assign value='source.{MSH}' property='target.{MSH}' action='set' />
<assign value='source.{SFT(1)}' property='target.{SFT(1)}' action='set' />
<assign value='source.{MFI}' property='target.{MFI}' action='set' />
<assign value='source.{MFI:MasterFileIdentifier}' property='target.{MFI:MasterFileIdentifier}' action='set' />
<assign value='source.{MFI:MasterFileApplicationIdentif}' property='target.{MFI:MasterFileApplicationIdentif}' action='set' />
<assign value='source.{MFI:FileLevelEventCode}' property='target.{MFI:FileLevelEventCode}' action='set' />
<assign value='source.{MFI:EnteredDateTime}' property='target.{MFI:EnteredDateTime}' action='set' />
<assign value='source.{MFI:EffectiveDateTime}' property='target.{MFI:EffectiveDateTime}' action='set' />
<assign value='source.{MFI:ResponseLevelCode}' property='target.{MFI:ResponseLevelCode}' action='set' />
<assign value='source.{MFEgrp(1)}' property='target.{MFEgrp(1)}' action='set' />
<assign value='source.{MFEgrp(1).MFE}' property='target.{MFEgrp(1).MFE}' action='set' />
<assign value='source.{MFEgrp(1).STF}' property='target.{MFEgrp(1).STF}' action='set' />
<assign value='source.{MFEgrp().MFE:RecordLevelEventCode}' property='target.{MFEgrp().MFE:RecordLevelEventCode}' action='set' />
<assign value='source.{MFEgrp().MFE:MFNControlID}' property='target.{MFEgrp().MFE:MFNControlID}' action='set' />
<assign value='source.{MFEgrp().MFE:EffectiveDateTime}' property='target.{MFEgrp().MFE:EffectiveDateTime}' action='set' />
<assign value='source.{MFEgrp().MFE:PrimaryKeyValueMFE()}' property='target.{MFEgrp().MFE:PrimaryKeyValueMFE()}' action='set' />
<assign value='source.{MFEgrp().MFE:EffectiveDateTime.Time}' property='target.{MFEgrp().MFE:EffectiveDateTime.Time}' action='set' />
<assign value='source.{MFEgrp().MFE:EffectiveDateTime.DegreeofPrecision}' property='target.{MFEgrp().MFE:EffectiveDateTime.DegreeofPrecision}' action='set' />
<assign value='source.{MFEgrp(1).MFE:PrimaryKeyValueType(1)}' property='target.{MFEgrp(1).MFE:PrimaryKeyValueType(1)}' action='set' />
<assign value='source.{MFEgrp(1).PRA(1)}' property='target.{MFEgrp(1).PRA(1)}' action='set' />
<assign value='source.{MFEgrp(1).ORG(1)}' property='target.{MFEgrp(1).ORG(1)}' action='set' />
<assign value='source.{MFEgrp(1).AFF(1)}' property='target.{MFEgrp(1).AFF(1)}' action='set' />
<assign value='source.{MFEgrp(1).LAN(1)}' property='target.{MFEgrp(1).LAN(1)}' action='set' />
<assign value='source.{MFEgrp(1).EDU(1)}' property='target.{MFEgrp(1).EDU(1)}' action='set' />
<assign value='source.{MFEgrp(1).CER(1)}' property='target.{MFEgrp(1).CER(1)}' action='set' />
<assign value='source.{MFEgrp(1).NTE(1)}' property='target.{MFEgrp(1).NTE(1)}' action='set' />
<if condition='source.{MFEgrp(1).STF:StaffType(1)}="A"' >
<true>
<assign value='"ON"' property='target.{MFEgrp(1).STF:StaffType(1)}' action='set' />
</true>
</if>
</transform>
}

}
