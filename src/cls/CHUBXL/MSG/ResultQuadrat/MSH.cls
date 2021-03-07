Class CHUBXL.MSG.ResultQuadrat.MSH Extends (%SerialObject, %XML.Adaptor) [ ClassType = serial, Inheritance = right, ProcedureBlock ]
{

Parameter XMLNAME = "MSH";

Parameter XMLSEQUENCE = 1;

Property SENDINGAPPL As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "SENDINGAPPL") [ Required ];

Property SENDFACILITY As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "SENDFACILITY") [ Required ];

Property RECEIVINGAPPL As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "RECEIVINGAPPL") [ Required ];

Property RECEIVINGFACILITY As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "RECEIVINGFACILITY") [ Required ];

Property TIMESTAMP As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "TIMESTAMP") [ Required, SqlFieldName = _TIMESTAMP ];

Property IDENTIFIER As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "IDENTIFIER") [ Required ];

Property NHOP As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "NHOP") [ Required ];

Storage Default
{
<Data name="MSHState">
<Value name="1">
<Value>SENDINGAPPL</Value>
</Value>
<Value name="2">
<Value>SENDFACILITY</Value>
</Value>
<Value name="3">
<Value>RECEIVINGAPPL</Value>
</Value>
<Value name="4">
<Value>RECEIVINGFACILITY</Value>
</Value>
<Value name="5">
<Value>TIMESTAMP</Value>
</Value>
<Value name="6">
<Value>IDENTIFIER</Value>
</Value>
<Value name="7">
<Value>NHOP</Value>
</Value>
</Data>
<State>MSHState</State>
<StreamLocation>^CHUBXL.MSG.ResultQuadrat.MSHS</StreamLocation>
<Type>%Library.CacheSerialState</Type>
}

}
