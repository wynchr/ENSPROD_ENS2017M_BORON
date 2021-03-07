/// Header commun message Ftrans
Class CHUBXL.MSG.ResultHeader Extends Ens.Request [ ClassType = persistent, ProcedureBlock ]
{

// Index ExtentI [ Extent ];

/// Id Message origine
Property rawMsg As CHUBXL.DATA.RawMessageString;

/// Some Universal info
Property HEADSEQ As %String(TRUNCATE = 1);

Property HEADMSGID As %String(TRUNCATE = 1);

Property HEADFROM As %String(TRUNCATE = 1);

Property HEADUSERID As %String(TRUNCATE = 1);

Property HEADDATE As %String(TRUNCATE = 1);

Property NPAT As %String(TRUNCATE = 1);

Storage Default
{
<Data name="ResultHeaderDefaultData">
<Subscript>"ResultHeader"</Subscript>
<Value name="1">
<Value>rawMsg</Value>
</Value>
<Value name="2">
<Value>HEADSEQ</Value>
</Value>
<Value name="3">
<Value>HEADMSGID</Value>
</Value>
<Value name="4">
<Value>HEADFROM</Value>
</Value>
<Value name="5">
<Value>HEADUSERID</Value>
</Value>
<Value name="6">
<Value>HEADDATE</Value>
</Value>
<Value name="7">
<Value>NPAT</Value>
</Value>
</Data>
<DefaultData>ResultHeaderDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
