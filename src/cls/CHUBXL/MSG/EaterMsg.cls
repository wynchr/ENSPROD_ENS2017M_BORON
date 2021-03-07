Class CHUBXL.MSG.EaterMsg Extends Ens.Request [ ClassType = persistent, ProcedureBlock ]
{

Property eatMe As %String(MAXLEN = 32000, TRUNCATE = 1);

Storage Default
{
<Data name="EaterMsgDefaultData">
<Subscript>"EaterMsg"</Subscript>
<Value name="1">
<Value>eatMe</Value>
</Value>
</Data>
<DefaultData>EaterMsgDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
