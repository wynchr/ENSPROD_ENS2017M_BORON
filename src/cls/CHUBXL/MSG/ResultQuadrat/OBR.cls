Class CHUBXL.MSG.ResultQuadrat.OBR Extends (%SerialObject, %XML.Adaptor) [ ClassType = serial, Inheritance = right, ProcedureBlock ]
{

Parameter XMLNAME = "OBR";

Parameter XMLSEQUENCE = 1;

Property REQUESTNUMBER As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "REQUEST_NUMBER");

Property REQUESTEXAM As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "REQUEST_EXAM");

Property REQUESTDATE As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "REQUEST_DATE");

Property RTEMPLATE As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "R_TEMPLATE");

Property OBSERVDATE As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "OBSERV_DATE");

Property CLINICINFO As %String(MAXLEN = 1000, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "CLINIC_INFO");

Property PRESCDID As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "PRESC_D_ID");

Property PRESCDRIZIV As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "PRESC_D_RIZIV");

Property PRESCDLNAME As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "PRESC_D_LNAME");

Property PRESCDFNAME As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "PRESC_D_FNAME");

Property PRESCRSERVID As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "PRESCR_SERV_ID");

Property PRESCRSERVNAME As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "PRESCR_SERV_NAME");

Property RESULTDATE As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "RESULT_DATE");

Property SCODE As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "S_CODE");

Property SNAME As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "S_NAME");

Property SHOSPITALKEY As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "S_HOSPITALKEY");

Property SKEY As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "S_KEY");

Property RESULTSTATUS As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "RESULT_STATUS");

Property PMOBILITY As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "P_MOBILITY");

Property INTERPRETERDID As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "INTERPRETER_D_ID");

Property INTERPRETERDRIZIV As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "INTERPRETER_D_RIZIV");

Property INTERPRETERDLNAME As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "INTERPRETER_D_LNAME");

Property INTERPRETERDFNAME As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "INTERPRETER_D_FNAME");

Property TECHNICIANTENAME As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "TECHNICIAN_TE_NAME");

Property TECHNICIANSTART As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "TECHNICIAN_START");

Property TECHNICIANDONE As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "TECHNICIAN_DONE");

Property ENCODEUR As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "ENCODEUR");

Storage Default
{
<Data name="OBRState">
<Value name="1">
<Value>REQUESTNUMBER</Value>
</Value>
<Value name="2">
<Value>REQUESTEXAM</Value>
</Value>
<Value name="3">
<Value>REQUESTDATE</Value>
</Value>
<Value name="4">
<Value>RTEMPLATE</Value>
</Value>
<Value name="5">
<Value>OBSERVDATE</Value>
</Value>
<Value name="6">
<Value>CLINICINFO</Value>
</Value>
<Value name="7">
<Value>PRESCDID</Value>
</Value>
<Value name="8">
<Value>PRESCDRIZIV</Value>
</Value>
<Value name="9">
<Value>PRESCDLNAME</Value>
</Value>
<Value name="10">
<Value>PRESCDFNAME</Value>
</Value>
<Value name="11">
<Value>PRESCRSERVID</Value>
</Value>
<Value name="12">
<Value>PRESCRSERVNAME</Value>
</Value>
<Value name="13">
<Value>RESULTDATE</Value>
</Value>
<Value name="14">
<Value>SCODE</Value>
</Value>
<Value name="15">
<Value>SNAME</Value>
</Value>
<Value name="16">
<Value>SHOSPITALKEY</Value>
</Value>
<Value name="17">
<Value>SKEY</Value>
</Value>
<Value name="18">
<Value>RESULTSTATUS</Value>
</Value>
<Value name="19">
<Value>PMOBILITY</Value>
</Value>
<Value name="20">
<Value>INTERPRETERDID</Value>
</Value>
<Value name="21">
<Value>INTERPRETERDRIZIV</Value>
</Value>
<Value name="22">
<Value>INTERPRETERDLNAME</Value>
</Value>
<Value name="23">
<Value>INTERPRETERDFNAME</Value>
</Value>
<Value name="24">
<Value>TECHNICIANTENAME</Value>
</Value>
<Value name="25">
<Value>TECHNICIANSTART</Value>
</Value>
<Value name="26">
<Value>TECHNICIANDONE</Value>
</Value>
<Value name="27">
<Value>ENCODEUR</Value>
</Value>
</Data>
<State>OBRState</State>
<StreamLocation>^CHUBXL.MSG.ResultQuadrat.OBRS</StreamLocation>
<Type>%Library.CacheSerialState</Type>
}

}
