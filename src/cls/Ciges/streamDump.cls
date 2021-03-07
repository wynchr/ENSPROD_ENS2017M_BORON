Class Ciges.streamDump Extends %GlobalBinaryStream [ ClassType = serial, ProcedureBlock ]
{

Method getStoreNode() As %String
{
	q i%StoreNode
}

Storage Default
{
<Data name="streamDumpState">
<Value name="1">
<Value>AtEnd</Value>
</Value>
<Value name="2">
<Value>Id</Value>
</Value>
<Value name="3">
<Value>%Location</Value>
</Value>
<Value name="4">
<Value>StoreRoot</Value>
</Value>
<Value name="5">
<Value>Mode</Value>
</Value>
<Value name="6">
<Value>StoreNode</Value>
</Value>
<Value name="7">
<Value>TempNode</Value>
</Value>
<Value name="8">
<Value>NodeNo</Value>
</Value>
<Value name="9">
<Value>Buffer</Value>
</Value>
<Value name="10">
<Value>Position</Value>
</Value>
<Value name="11">
<Value>IOSize</Value>
</Value>
<Value name="12">
<Value>LineTerminator</Value>
</Value>
</Data>
<State>streamDumpState</State>
<StreamLocation>^Ciges.streamDumpS</StreamLocation>
<Type>%Library.CacheSerialState</Type>
}

}
