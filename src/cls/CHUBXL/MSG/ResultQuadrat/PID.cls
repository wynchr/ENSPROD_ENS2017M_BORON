Class CHUBXL.MSG.ResultQuadrat.PID Extends (%SerialObject, %XML.Adaptor) [ ClassType = serial, Inheritance = right, ProcedureBlock ]
{

Parameter XMLNAME = "PID";

Parameter XMLSEQUENCE = 1;

Property PCODE As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "P_CODE") [ Required ];

Property PNATNUMBER As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "P_NATNUMBER") [ Required ];

Property PEXTRACODE As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "P_EXTRACODE") [ Required ];

Property PNAME As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "P_NAME") [ Required ];

Property PFNAME As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "P_FNAME") [ Required ];

Property PBORN As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "P_BORN") [ Required ];

Property PSEX As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "P_SEX") [ Required ];

Property PSTREET As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "P_STREET") [ Required ];

Property PTOWN As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "P_TOWN") [ Required ];

Property PZIP As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "P_ZIP") [ Required ];

Property PCOUNTRY As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "P_COUNTRY") [ Required ];

Property PPHONE As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "P_PHONE") [ Required ];

Property PSECONDPHONE As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "P_SECONDPHONE") [ Required ];

Property PLANGUAGE As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "P_LANGUAGE") [ Required ];

Property PMARITALSTATUS As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "P_MARITALSTATUS") [ Required ];

Property PBIRTHPLACE As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "P_BIRTHPLACE") [ Required ];

Property PNATIONALITY As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "P_NATIONALITY") [ Required ];

Property PPERSONEL As %String(MAXLEN = 250, TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "P_PERSONEL") [ Required ];

Property PSISCODE As %String(TRUNCATE = 1, XMLELEMENTREF = 1, XMLNAME = "P_SISCODE") [ Required ];

Storage Default
{
<Data name="PIDState">
<Value name="1">
<Value>PCODE</Value>
</Value>
<Value name="2">
<Value>PNATNUMBER</Value>
</Value>
<Value name="3">
<Value>PEXTRACODE</Value>
</Value>
<Value name="4">
<Value>PNAME</Value>
</Value>
<Value name="5">
<Value>PFNAME</Value>
</Value>
<Value name="6">
<Value>PBORN</Value>
</Value>
<Value name="7">
<Value>PSEX</Value>
</Value>
<Value name="8">
<Value>PSTREET</Value>
</Value>
<Value name="9">
<Value>PTOWN</Value>
</Value>
<Value name="10">
<Value>PZIP</Value>
</Value>
<Value name="11">
<Value>PCOUNTRY</Value>
</Value>
<Value name="12">
<Value>PPHONE</Value>
</Value>
<Value name="13">
<Value>PSECONDPHONE</Value>
</Value>
<Value name="14">
<Value>PLANGUAGE</Value>
</Value>
<Value name="15">
<Value>PMARITALSTATUS</Value>
</Value>
<Value name="16">
<Value>PBIRTHPLACE</Value>
</Value>
<Value name="17">
<Value>PNATIONALITY</Value>
</Value>
<Value name="18">
<Value>PPERSONEL</Value>
</Value>
<Value name="19">
<Value>PSISCODE</Value>
</Value>
</Data>
<State>PIDState</State>
<StreamLocation>^CHUBXL.MSG.ResultQuadrat.PIDS</StreamLocation>
<Type>%Library.CacheSerialState</Type>
}

}
