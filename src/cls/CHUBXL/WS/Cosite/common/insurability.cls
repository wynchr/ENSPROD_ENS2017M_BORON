/// Created from: http://10.29.15.250/2.0/Kmehr1/Services/production/1.0/Main.asmx?WSDL
Class CHUBXL.WS.Cosite.common.insurability Extends (%Persistent, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://tempuri.org";

Parameter XMLNAME = "insurability";

Parameter XMLSEQUENCE = 1;

Property cd As CHUBXL.WS.Cosite.common.cd(XMLNAME = "cd");

Property membership As %String(MAXLEN = "", XMLNAME = "membership");

Property begindate As %Date(XMLNAME = "begindate");

Property enddate As %Date(XMLNAME = "enddate");

Storage Default
{
<Data name="insurabilityDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>cd</Value>
</Value>
<Value name="3">
<Value>membership</Value>
</Value>
<Value name="4">
<Value>begindate</Value>
</Value>
<Value name="5">
<Value>enddate</Value>
</Value>
</Data>
<DataLocation>^CHUBXL.WS.Cos54B2.insurabilityD</DataLocation>
<DefaultData>insurabilityDefaultData</DefaultData>
<IdLocation>^CHUBXL.WS.Cos54B2.insurabilityD</IdLocation>
<IndexLocation>^CHUBXL.WS.Cos54B2.insurabilityI</IndexLocation>
<StreamLocation>^CHUBXL.WS.Cos54B2.insurabilityS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
