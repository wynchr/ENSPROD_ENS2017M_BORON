/// Created from: http://10.29.15.250/2.0/Kmehr1/Services/production/1.0/Main.asmx?WSDL
Class CHUBXL.WS.Cosite.common.begindate Extends (%Persistent, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://tempuri.org";

Parameter XMLNAME = "begindate";

Parameter XMLSEQUENCE = 1;

Property date As %Date(XMLNAME = "date") [ SqlFieldName = _date ];

Property time As %Time(XMLNAME = "time") [ SqlFieldName = _time ];

Storage Default
{
<Data name="begindateDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>date</Value>
</Value>
<Value name="3">
<Value>time</Value>
</Value>
</Data>
<DataLocation>^CHUBXL.WS.Cosite54B2.begindateD</DataLocation>
<DefaultData>begindateDefaultData</DefaultData>
<IdLocation>^CHUBXL.WS.Cosite54B2.begindateD</IdLocation>
<IndexLocation>^CHUBXL.WS.Cosite54B2.begindateI</IndexLocation>
<StreamLocation>^CHUBXL.WS.Cosite54B2.begindateS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
