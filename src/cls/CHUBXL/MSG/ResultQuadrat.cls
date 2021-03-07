Class CHUBXL.MSG.ResultQuadrat Extends CHUBXL.MSG.ResultHeader [ ClassType = persistent, ProcedureBlock ]
{

Parameter XMLNAME = "RECORD";

Parameter XMLSEQUENCE = 1;

Property MSH As CHUBXL.MSG.ResultQuadrat.MSH(XMLELEMENTREF = 1, XMLNAME = "MSH") [ Required ];

Property PID As CHUBXL.MSG.ResultQuadrat.PID(XMLELEMENTREF = 1, XMLNAME = "PID") [ Required ];

Property PV1 As CHUBXL.MSG.ResultQuadrat.PV1(XMLELEMENTREF = 1, XMLNAME = "PV1") [ Required ];

Property OBR As CHUBXL.MSG.ResultQuadrat.OBR(XMLELEMENTREF = 1, XMLNAME = "OBR") [ Required ];

Property OBX As CHUBXL.MSG.ResultQuadrat.OBX(XMLELEMENTREF = 1, XMLNAME = "OBX") [ Required ];

Storage Default
{
<Data name="ResultQuadratDefaultData">
<Subscript>"ResultQuadrat"</Subscript>
<Value name="1">
<Value>MSH</Value>
</Value>
<Value name="2">
<Value>PID</Value>
</Value>
<Value name="3">
<Value>PV1</Value>
</Value>
<Value name="4">
<Value>OBR</Value>
</Value>
<Value name="5">
<Value>OBX</Value>
</Value>
</Data>
<DefaultData>ResultQuadratDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
