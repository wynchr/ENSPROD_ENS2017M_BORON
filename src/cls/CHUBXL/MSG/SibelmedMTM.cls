Class CHUBXL.MSG.SibelmedMTM Extends CHUBXL.MSG.SibelmedFtransHeader [ ClassType = persistent, Not ProcedureBlock ]
{

Property RUEBEN As %String(TRUNCATE = 1);

Property RUEFAC As %String(TRUNCATE = 1);

Property RUETIT As %String(TRUNCATE = 1);

Property BENEF As %String(TRUNCATE = 1);

Property CPBENCOMBEN As %String(TRUNCATE = 1);

Property CPFACCOMFAC As %String(TRUNCATE = 1);

Property CPTITCOMTIT As %String(TRUNCATE = 1);

Property CT1 As %String(TRUNCATE = 1);

Property CT2 As %String(TRUNCATE = 1);

Property CODEMVT2 As %String(TRUNCATE = 1);

/// Generated timestamp
Property DGDATE As %TimeStamp [ InitialExpression = {$zdatetime($h,3)} ];

Property ENVIRONNEMENT As %String(TRUNCATE = 1);

Property MATBEN As %String(TRUNCATE = 1);

Property MATTIT As %String(TRUNCATE = 1);

Property NARC As %String(TRUNCATE = 1);

Property NHOP As %String(TRUNCATE = 1);

Property NOA As %String(TRUNCATE = 1);

Property NOCIM As %String(TRUNCATE = 1);

Property NOMBEN As %String(TRUNCATE = 1);

Property NOMFAC As %String(TRUNCATE = 1);

Property NOMTIT As %String(TRUNCATE = 1);

Property NOSIM As %String(TRUNCATE = 1);

Property PARENTE As %String(TRUNCATE = 1);

Property PRIO As %String(TRUNCATE = 1);

Property REG As %String(TRUNCATE = 1);

Property QTMUT As %String(TRUNCATE = 1);

Property REDP As %String(TRUNCATE = 1);

Property SQREGE As %String(TRUNCATE = 1);

Property SQDDEB As %String(TRUNCATE = 1);

Property SQDFIN As %String(TRUNCATE = 1);

Property TIMESTAMP As %String(TRUNCATE = 1) [ SqlFieldName = _TIMESTAMP ];

Property TOA As %String(TRUNCATE = 1);

Property blanc As %String(TRUNCATE = 1);

Storage Default
{
<Data name="SibelmedMTMDefaultData">
<Subscript>"SibelmedMTM"</Subscript>
<Value name="1">
<Value>RUEBEN</Value>
</Value>
<Value name="2">
<Value>RUEFAC</Value>
</Value>
<Value name="3">
<Value>RUETIT</Value>
</Value>
<Value name="4">
<Value>BENEF</Value>
</Value>
<Value name="5">
<Value>CPBENCOMBEN</Value>
</Value>
<Value name="6">
<Value>CPFACCOMFAC</Value>
</Value>
<Value name="7">
<Value>CPTITCOMTIT</Value>
</Value>
<Value name="8">
<Value>CT1</Value>
</Value>
<Value name="9">
<Value>CT2</Value>
</Value>
<Value name="10">
<Value>CODEMVT2</Value>
</Value>
<Value name="11">
<Value>DGDATE</Value>
</Value>
<Value name="12">
<Value>ENVIRONNEMENT</Value>
</Value>
<Value name="13">
<Value>MATBEN</Value>
</Value>
<Value name="14">
<Value>MATTIT</Value>
</Value>
<Value name="15">
<Value>NARC</Value>
</Value>
<Value name="16">
<Value>NHOP</Value>
</Value>
<Value name="17">
<Value>NOA</Value>
</Value>
<Value name="18">
<Value>NOCIM</Value>
</Value>
<Value name="19">
<Value>NOMBEN</Value>
</Value>
<Value name="20">
<Value>NOMFAC</Value>
</Value>
<Value name="21">
<Value>NOMTIT</Value>
</Value>
<Value name="22">
<Value>NOSIM</Value>
</Value>
<Value name="23">
<Value>PARENTE</Value>
</Value>
<Value name="24">
<Value>PRIO</Value>
</Value>
<Value name="25">
<Value>REG</Value>
</Value>
<Value name="26">
<Value>QTMUT</Value>
</Value>
<Value name="27">
<Value>REDP</Value>
</Value>
<Value name="28">
<Value>SQREGE</Value>
</Value>
<Value name="29">
<Value>SQDDEB</Value>
</Value>
<Value name="30">
<Value>SQDFIN</Value>
</Value>
<Value name="31">
<Value>TIMESTAMP</Value>
</Value>
<Value name="32">
<Value>TOA</Value>
</Value>
<Value name="33">
<Value>blanc</Value>
</Value>
</Data>
<DefaultData>SibelmedMTMDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
