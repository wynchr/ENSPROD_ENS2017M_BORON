Class CHUBXL.MSG.SibelmedMTH Extends CHUBXL.MSG.SibelmedFtransHeader [ ClassType = persistent, Not ProcedureBlock ]
{

Property CFRAIS As %String(TRUNCATE = 1);

Property CHAMB As %String(TRUNCATE = 1);

Property CODEMVT2 As %String(TRUNCATE = 1);

Property DADM As %String(TRUNCATE = 1);

Property DCREATION As %String(TRUNCATE = 1);

Property DERNMVT As %String(TRUNCATE = 1);

Property DEST As %String(TRUNCATE = 1);

/// Generated timestamp
Property DGDATE As %TimeStamp [ InitialExpression = {$zdatetime($h,3)} ];

Property DMVT As %String(TRUNCATE = 1);

Property DMVTMOD As %String(TRUNCATE = 1);

Property DSOR As %String(TRUNCATE = 1);

Property ENVIRONNEMENT As %String(TRUNCATE = 1);

Property HADM As %String(TRUNCATE = 1);

Property HADU As %String(TRUNCATE = 1);

Property HMVT As %String(TRUNCATE = 1);

Property HMVTMOD As %String(TRUNCATE = 1);

Property HSOR As %String(TRUNCATE = 1);

Property LIT As %String(TRUNCATE = 1);

Property LRAIS As %String(TRUNCATE = 1);

Property NADM As %String(TRUNCATE = 1);

Property NADMMERE As %String(TRUNCATE = 1);

Property NARC As %String(TRUNCATE = 1);

Property NHOP As %String(TRUNCATE = 1);

Property NMED As %String(TRUNCATE = 1);

Property NOMPREN As %String(TRUNCATE = 1);

Property RADM As %String(TRUNCATE = 1);

Property RADR As %String(TRUNCATE = 1);

Property RSORH As %String(TRUNCATE = 1);

Property TYPMVT As %String(TRUNCATE = 1);

Property US As %String(TRUNCATE = 1);

Storage Default
{
<Data name="SibelmedMTHDefaultData">
<Subscript>"SibelmedMTH"</Subscript>
<Value name="1">
<Value>CFRAIS</Value>
</Value>
<Value name="2">
<Value>CHAMB</Value>
</Value>
<Value name="3">
<Value>CODEMVT2</Value>
</Value>
<Value name="4">
<Value>DADM</Value>
</Value>
<Value name="5">
<Value>DCREATION</Value>
</Value>
<Value name="6">
<Value>DERNMVT</Value>
</Value>
<Value name="7">
<Value>DEST</Value>
</Value>
<Value name="8">
<Value>DGDATE</Value>
</Value>
<Value name="9">
<Value>DMVT</Value>
</Value>
<Value name="10">
<Value>DMVTMOD</Value>
</Value>
<Value name="11">
<Value>DSOR</Value>
</Value>
<Value name="12">
<Value>ENVIRONNEMENT</Value>
</Value>
<Value name="13">
<Value>HADM</Value>
</Value>
<Value name="14">
<Value>HADU</Value>
</Value>
<Value name="15">
<Value>HMVT</Value>
</Value>
<Value name="16">
<Value>HMVTMOD</Value>
</Value>
<Value name="17">
<Value>HSOR</Value>
</Value>
<Value name="18">
<Value>LIT</Value>
</Value>
<Value name="19">
<Value>LRAIS</Value>
</Value>
<Value name="20">
<Value>NADM</Value>
</Value>
<Value name="21">
<Value>NADMMERE</Value>
</Value>
<Value name="22">
<Value>NARC</Value>
</Value>
<Value name="23">
<Value>NHOP</Value>
</Value>
<Value name="24">
<Value>NMED</Value>
</Value>
<Value name="25">
<Value>NOMPREN</Value>
</Value>
<Value name="26">
<Value>RADM</Value>
</Value>
<Value name="27">
<Value>RADR</Value>
</Value>
<Value name="28">
<Value>RSORH</Value>
</Value>
<Value name="29">
<Value>TYPMVT</Value>
</Value>
<Value name="30">
<Value>US</Value>
</Value>
</Data>
<DefaultData>SibelmedMTHDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
