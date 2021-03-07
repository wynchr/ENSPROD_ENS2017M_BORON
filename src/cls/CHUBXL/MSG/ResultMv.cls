Class CHUBXL.MSG.ResultMv Extends CHUBXL.MSG.ResultHeader [ ClassType = persistent, ProcedureBlock ]
{

Property HospitalFid As %String(TRUNCATE = 1);

Property PatientCode As %String(TRUNCATE = 1);

Property PassageNr As %String(TRUNCATE = 1);

Property NumeroAdm As %String(TRUNCATE = 1);

Property NumeroDemande As %String(TRUNCATE = 1);

Property ObservationStatus As %String(TRUNCATE = 1);

Property DocDate As %String(TRUNCATE = 1);

Property PrestationDate As %String(TRUNCATE = 1);

Property MedecinPresc As %String(TRUNCATE = 1);

Property ServPresc As %String(TRUNCATE = 1);

Property MedecinPresta As %String(TRUNCATE = 1);

Property ServPresta As %String(TRUNCATE = 1);

Property CigesNumber As %String(TRUNCATE = 1);

Property Ciges As %String(TRUNCATE = 1);

Property SystemeSource As %String(TRUNCATE = 1);

Property DocUniqueId As %String(TRUNCATE = 1);

Property Batch As %String(TRUNCATE = 1);

Property DocTemplate As %String(TRUNCATE = 1);

Property TreeFid As %String(TRUNCATE = 1);

Property Blob As %GlobalCharacterStream;

Method LoadMessage()
{
	set ..HospitalFid="26"
	set ..PatientCode="200036223"
	set ..PassageNr="29980491"
	set ..NumeroAdm=""
	set ..NumeroDemande="20013301"
	set ..DocDate=""
	set ..PrestationDate="20/02/2006"
	set ..MedecinPresc="12818549580"
	set ..ServPresc=""
	set ..MedecinPresta="12818549580"
	set ..ServPresta=""
	set ..CigesNumber=""
	set ..Ciges=""
	set ..SystemeSource="GLIMS LABO"
	set ..DocUniqueId=""
	set ..Batch="GLIMS"
	set ..DocTemplate=""	
	set ..TreeFid="Laboratoire"
	do ..Blob.WriteLine("1.Chris")
	do ..Blob.WriteLine("2.Dulio")
	do ..Blob.WriteLine("3.Olivier")
	do ..Blob.WriteLine("4.Patrick")
	do ..Blob.WriteLine("5.Rudy")

	quit $$$OK
}

ClassMethod ListAllMessage()
{
	set rs=##class(%Library.ResultSet).%New()
	set SQL="Select * from CHUBXL_MSG.ResultMv"
	Set st=rs.Prepare(SQL)
	
	Do rs.Execute()
	
	s i=0	
	while (rs.Next() '= 0) {
		s i=i+1
		Write "* "_i_" (ResultMv) ***************************",!
		Write "ID : ",$get(rs.Data("ID")), " PatientCode : ", $get(rs.Data("PatientCode")), !
		;Write $get(rs.Data("Blob")), !
		
		s pID=$get(rs.Data("ID"))
		s msg=##class(CHUBXL.MSG.ResultMv).%OpenId(pID)
 		;w msg.%Id(),!
 		;w msg.PatientCode,!
		w "--- Start of Text ---",!
		While ('msg.Blob.AtEnd) {
			Set line=msg.Blob.ReadLine()
			if line '= "" {
				w line,!
			}
		}
		w "--- End of Text ---",!
		
	}
	
	Do rs.Close()
	Kill rs
	
	quit $$$OK
}

ClassMethod DeleteAllMessage()
{
	set rs=##class(%Library.ResultSet).%New()
	set SQL="delete from CHUBXL_MSG.ResultMv"
	Set st=rs.Prepare(SQL)
	
	Do rs.Execute()

	Do rs.Close()
	Kill rs
	
	quit $$$OK
}

Method ExportToXML()
{
		Write "<?xml version=""1.0"" ?>",! 
        Set status = ..XMLExport()
        If ($system.Status.IsError(status)) {
            Do $system.OBJ.DisplayError(status)
            Quit status
            }
        Quit $$$OK
}

///              Format pour le MvParser de MEDICAL VIEWER
///       <?xml version='1.0' encoding='ISO-8859-1'?>
///       <!DOCTYPE GENERAL [
///       <!ELEMENT GENERAL (GENERAL_INFO+)>
///       <!ELEMENT GENERAL_INFO (
///       HOSPITAL_FID,
///       PATIENT_CODE,
///       PASSAGE_NR,
///       NUMERO_ADM,
///       NUMERO_DEMANDE,
///       DOC_DATE,
///       PRESTATION_DATE,
///       MEDECIN_PRESCR,
///       SERV_PRESCR,
///       MEDECIN_PRESTA,
///       SERV_PRESTA,
///       CIGES_NUMBER,
///       CIGES,
///       SYSTEME_SOURCE,
///       DOC_UNIQUE_ID,
///       BATCH,
///       DOC_TEMPLATE,
///       TREE_FID,
///       BLOB*)>
///       <!ELEMENT HOSPITAL_FID (#PCDATA)>
///       <!ELEMENT PATIENT_CODE (#PCDATA)>
///       <!ELEMENT PASSAGE_NR (#PCDATA)>
///       <!ELEMENT NUMERO_ADM (#PCDATA)>
///       <!ELEMENT NUMERO_DEMANDE (#PCDATA)>
///       <!ELEMENT DOC_DATE (#PCDATA)>
///       <!ELEMENT PRESTATION_DATE (#PCDATA)>
///       <!ELEMENT MEDECIN_PRESCR (#PCDATA)>
///       <!ELEMENT SERV_PRESCR (#PCDATA)>
///       <!ELEMENT MEDECIN_PRESTA (#PCDATA)>
///       <!ELEMENT SERV_PRESTA (#PCDATA)>
///       <!ELEMENT CIGES_NUMBER (#PCDATA)>
///       <!ELEMENT CIGES (#PCDATA)>
///       <!ELEMENT SYSTEME_SOURCE (#PCDATA)>
///       <!ELEMENT DOC_UNIQUE_ID (#PCDATA)>
///       <!ELEMENT BATCH (#PCDATA)>
///       <!ELEMENT DOC_TEMPLATE (#PCDATA)>
///       <!ELEMENT TREE_FID (#PCDATA)>
///       <!ELEMENT BLOB (#PCDATA)>
///       ]>
///       <GENERAL>
///       <GENERAL_INFO>
///       <HOSPITAL_FID>26</HOSPITAL_FID>
///       <PATIENT_CODE>200329436</PATIENT_CODE>
///       <PASSAGE_NR>2207982</PASSAGE_NR>
///       <NUMERO_ADM>2207982</NUMERO_ADM>
///       <NUMERO_DEMANDE>140723</NUMERO_DEMANDE>
///       <DOC_DATE>19/06/2006</DOC_DATE>
///       <PRESTATION_DATE>19/06/2006</PRESTATION_DATE>
///       <MEDECIN_PRESCR>18995073009</MEDECIN_PRESCR>
///       <SERV_PRESCR></SERV_PRESCR>
///       <MEDECIN_PRESTA></MEDECIN_PRESTA>
///       <SERV_PRESTA></SERV_PRESTA>
///       <CIGES_NUMBER></CIGES_NUMBER>
///       <CIGES></CIGES>
///       <SYSTEME_SOURCE>Mline</SYSTEME_SOURCE>
///       <DOC_UNIQUE_ID>2006062108144506</DOC_UNIQUE_ID>
///       <BATCH>IFRXISO</BATCH>
///       <DOC_TEMPLATE>RXISOMODELE</DOC_TEMPLATE>
///       <TREE_FID>RXISO</TREE_FID>
///       <BLOB>E:\Medical Viewer\AcArchive\XML\ParserRXISO\TXT\RXISO_00012652_0001.RTF</BLOB>
///       </GENERAL_INFO>
///       </GENERAL>

Storage Default
{
<Data name="ResultMvDefaultData">
<Subscript>"ResultMv"</Subscript>
<Value name="1">
<Value>HospitalFid</Value>
</Value>
<Value name="2">
<Value>PatientCode</Value>
</Value>
<Value name="3">
<Value>PassageNr</Value>
</Value>
<Value name="4">
<Value>NumeroAdm</Value>
</Value>
<Value name="5">
<Value>NumeroDemande</Value>
</Value>
<Value name="6">
<Value>ObservationStatus</Value>
</Value>
<Value name="7">
<Value>DocDate</Value>
</Value>
<Value name="8">
<Value>PrestationDate</Value>
</Value>
<Value name="9">
<Value>MedecinPresc</Value>
</Value>
<Value name="10">
<Value>ServPresc</Value>
</Value>
<Value name="11">
<Value>MedecinPresta</Value>
</Value>
<Value name="12">
<Value>ServPresta</Value>
</Value>
<Value name="13">
<Value>CigesNumber</Value>
</Value>
<Value name="14">
<Value>Ciges</Value>
</Value>
<Value name="15">
<Value>SystemeSource</Value>
</Value>
<Value name="16">
<Value>DocUniqueId</Value>
</Value>
<Value name="17">
<Value>Batch</Value>
</Value>
<Value name="18">
<Value>DocTemplate</Value>
</Value>
<Value name="19">
<Value>TreeFid</Value>
</Value>
<Value name="20">
<Value>Blob</Value>
</Value>
</Data>
<DefaultData>ResultMvDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
