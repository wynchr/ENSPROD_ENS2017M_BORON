Class CHUBXL.MSG.ResultQuadrat.PV1 Extends (%SerialObject, %XML.Adaptor) [ ClassType = serial, Inheritance = right, ProcedureBlock ]
{

Parameter XMLNAME = "PV1";

Parameter XMLSEQUENCE = 1;

Property PTYPE As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "P_TYPE") [ Required ];

Property PHOSPITALNR As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "P_HOSPITAL_NR") [ Required ];

Property PADMISSIONNR As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "P_ADMISSION_NR") [ Required ];

Property PPASSAGENR As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "P_PASSAGE_NR") [ Required ];

Storage Default
{
<Data name="PV1State">
<Value name="1">
<Value>PTYPE</Value>
</Value>
<Value name="2">
<Value>PHOSPITALNR</Value>
</Value>
<Value name="3">
<Value>PADMISSIONNR</Value>
</Value>
<Value name="4">
<Value>PPASSAGENR</Value>
</Value>
</Data>
<State>PV1State</State>
<StreamLocation>^CHUBXL.MSG.ResultQuadrat.PV1S</StreamLocation>
<Type>%Library.CacheSerialState</Type>
}

}
