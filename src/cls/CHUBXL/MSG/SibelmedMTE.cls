Class CHUBXL.MSG.SibelmedMTE Extends CHUBXL.MSG.SibelmedFtransHeader [ ClassType = persistent, Not ProcedureBlock ]
{

Property CEITP As %String;

Property CFRAIS As %String;

Property CODEMVT2 As %String;

Property COMMENT As %String;

/// Generated timestamp
Property DGDATE As %TimeStamp [ InitialExpression = {$zdatetime($h,3)} ];

Property DPASSAGE As %String;

Property ENVIRONNEMENT As %String;

Property HPASSAGE As %String;

Property LOC As %String;

Property NARC As %String;

Property NHOP As %String;

Property NMED As %String;

Property SQPOLPAS As %String;

Property SQREG As %String;

Storage Default
{
<Data name="SibelmedMTEDefaultData">
<Subscript>"SibelmedMTE"</Subscript>
<Value name="1">
<Value>CEITP</Value>
</Value>
<Value name="2">
<Value>CFRAIS</Value>
</Value>
<Value name="3">
<Value>CODEMVT2</Value>
</Value>
<Value name="4">
<Value>COMMENT</Value>
</Value>
<Value name="5">
<Value>DGDATE</Value>
</Value>
<Value name="6">
<Value>DPASSAGE</Value>
</Value>
<Value name="7">
<Value>ENVIRONNEMENT</Value>
</Value>
<Value name="8">
<Value>HPASSAGE</Value>
</Value>
<Value name="9">
<Value>LOC</Value>
</Value>
<Value name="10">
<Value>NARC</Value>
</Value>
<Value name="11">
<Value>NHOP</Value>
</Value>
<Value name="12">
<Value>NMED</Value>
</Value>
<Value name="13">
<Value>SQPOLPAS</Value>
</Value>
<Value name="14">
<Value>SQREG</Value>
</Value>
</Data>
<DefaultData>SibelmedMTEDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
