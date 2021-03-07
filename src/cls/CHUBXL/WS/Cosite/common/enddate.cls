/// Created from: http://10.29.15.250/2.0/Kmehr1/Services/production/1.0/Main.asmx?WSDL
Class CHUBXL.WS.Cosite.common.enddate Extends (%Persistent, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://tempuri.org";

Parameter XMLNAME = "enddate";

Parameter XMLSEQUENCE = 1;

Property date As %Date(XMLNAME = "date") [ SqlFieldName = _date ];

Property time As %Time(XMLNAME = "time") [ SqlFieldName = _time ];

Storage Default
{
<Data name="enddateDefaultData">
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
<DataLocation>^CHUBXL.WS.Cosite.c54B2.enddateD</DataLocation>
<DefaultData>enddateDefaultData</DefaultData>
<IdLocation>^CHUBXL.WS.Cosite.c54B2.enddateD</IdLocation>
<IndexLocation>^CHUBXL.WS.Cosite.c54B2.enddateI</IndexLocation>
<StreamLocation>^CHUBXL.WS.Cosite.c54B2.enddateS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
