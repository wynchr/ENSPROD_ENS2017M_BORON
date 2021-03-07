Class CHUBXL.MSG.ResultQuadrat.OBX Extends (%SerialObject, %XML.Adaptor) [ ClassType = serial, Inheritance = right, ProcedureBlock ]
{

Parameter XMLNAME = "OBX";

Parameter XMLSEQUENCE = 1;

Property RBDFORMAT As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "RBD_FORMAT");

Property LKEY As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "L_KEY");

Property LSERVICE As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "L_SERVICE");

Property LVALIDATED As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "L_VALIDATED");

Property LTEMPLATE As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "L_TEMPLATE");

Property PRESTATIEGROEP As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "PRESTATIEGROEP");

Property OBSERVSID As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "OBSERV_ID");

Property OBSERVSTATUS As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "OBSERV_STATUS");

Property OBSERVDATE As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "OBSERV_DATE");

Property AUTHORDID As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "AUTHOR_D_ID");

Property AUTHORDRIZIV As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "AUTHOR_D_RIZIV");

Property AUTHORDLNAME As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "AUTHOR_D_LNAME");

Property AUTHORDFNAME As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "AUTHOR_D_FNAME");

Property CONCLUSION As %String(MAXLEN = 1000, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "CONCLUSION");

Property REMARK As %String(MAXLEN = 1000, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "REMARK");

Property PROTALPHA As %String(MAXLEN = 1000, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "PROTALPHA");

Property PROTMV As %GlobalCharacterStream(XMLELEMENTREF = 1, XMLNAME = "PROTMV");

Storage Default
{
<Data name="OBXState">
<Value name="1">
<Value>RBDFORMAT</Value>
</Value>
<Value name="2">
<Value>LKEY</Value>
</Value>
<Value name="3">
<Value>LSERVICE</Value>
</Value>
<Value name="4">
<Value>LVALIDATED</Value>
</Value>
<Value name="5">
<Value>LTEMPLATE</Value>
</Value>
<Value name="6">
<Value>PRESTATIEGROEP</Value>
</Value>
<Value name="7">
<Value>OBSERVSID</Value>
</Value>
<Value name="8">
<Value>OBSERVSTATUS</Value>
</Value>
<Value name="9">
<Value>OBSERVDATE</Value>
</Value>
<Value name="10">
<Value>AUTHORDID</Value>
</Value>
<Value name="11">
<Value>AUTHORDRIZIV</Value>
</Value>
<Value name="12">
<Value>AUTHORDLNAME</Value>
</Value>
<Value name="13">
<Value>AUTHORDFNAME</Value>
</Value>
<Value name="14">
<Value>CONCLUSION</Value>
</Value>
<Value name="15">
<Value>REMARK</Value>
</Value>
<Value name="16">
<Value>PROTALPHA</Value>
</Value>
<Value name="17">
<Value>PROTMV</Value>
</Value>
</Data>
<State>OBXState</State>
<StreamLocation>^CHUBXL.MSG.ResultQuadrat.OBXS</StreamLocation>
<Type>%Library.CacheSerialState</Type>
}

}
