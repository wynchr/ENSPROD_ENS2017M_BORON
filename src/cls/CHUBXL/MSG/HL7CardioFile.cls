Class CHUBXL.MSG.HL7CardioFile Extends Ens.Request [ ClassType = persistent, ProcedureBlock ]
{

Property HL7 As EnsLib.HL7.Message;

Property File As %GlobalCharacterStream;

ClassMethod Import() As %Status
{
	// Import HL7 File
	
	s HL7File=##class(CHUBXL.MSG.HL7CardioFile).%New()
	s HL7File.HL7 = ##class(EnsLib.HL7.Message).ImportFromFile("G:\PROD\Cardio\in\0080098_637043.hl7")
	
	;d HL7File.HL7.DocTypeSet("2.3:ORU_R01")
	d HL7File.HL7.DocTypeSet(HL7File.HL7.TypeVersion_":"_HL7File.HL7.Name)
	;s HL7File.HL7.Separators = "|^~\&"
	;w "HL7 BuildMap Status : "_HL7File.HL7.BuildMap(),!
	
	w "HL7 Name : "_HL7File.HL7.Name,!
	w "HL7 Identifier : "_HL7File.HL7.Identifier,!
	w "HL7 TypeVersion : "_HL7File.HL7.TypeVersion,!
	w "HL7 Separators : "_HL7File.HL7.Separators,!
	w "HL7 MessageTypeCategory : "_HL7File.HL7.MessageTypeCategory,!
	w "HL7 Envelope : "_HL7File.HL7.Envelope,!
	w "HL7 DocTypeName : "_HL7File.HL7.DocTypeName,!
	w "HL7 DocTypeCategory : "_HL7File.HL7.DocTypeCategory,!
	
	// Get MSH fields
	
	w "HL7 MSH:9.1 : "_HL7File.HL7.GetValueAt("MSH:9.1",,.tSC)_" tSC:"_tSC,!
	w "HL7 MSH:9.2 : "_HL7File.HL7.GetValueAt("MSH:9.2",,.tSC)_" tSC:"_tSC,!
	
	w "HL7 EncodingCharacters : "_HL7File.HL7.GetValueAt("MSH:EncodingCharacters",,.tSC)_" tSC:"_tSC,!
	w "HL7 ControlID : "_HL7File.HL7.GetValueAt("MSH:MessageControlID",,.tSC)_" tSC:"_tSC,!
    
    // Get PID fields
    
    w "HL7 PatientIDInternalID : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PID:PatientIDInternalID",,.tSC)," tSC:"_tSC,!
	
	// Get OBX fields
	
	w "HL7 ObservationValue : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(3).OBX:ObservationValue",,.tSC),!
	w "tSC:"_tSC,!
	w "HL7 ObservResultStatus : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(3).OBX:ObservResultStatus",,.tSC),!
	w "tSC:"_tSC,!
		
    // Dump RawContent		
		
	w "HL7 RawContent : "_HL7File.HL7.RawContent,!
	
	// Import RTF File
	
	Set stream=##class(%FileCharacterStream).%New()
	Set stream.Filename="G:\PROD\Cardio\in\0080098_637043.RTF"
	
	d HL7File.File.CopyFrom(stream)

	d HL7File.%Save()
	
	w "ID:",HL7File.%Id(),!
}

ClassMethod ListAllMessage()
{
	set rs=##class(%Library.ResultSet).%New()
	set SQL="Select * from CHUBXL_MSG.HL7CardioFile"
	Set st=rs.Prepare(SQL)
	
	Do rs.Execute()
	
	s i=0	
	while (rs.Next() '= 0) {
		s i=i+1
		Write "* "_i_" (HL7CardioFile) ***************************",!
		
		s pID=$get(rs.Data("ID"))
		s msg=##class(CHUBXL.MSG.HL7CardioFile).%OpenId(pID)
 		;w msg.%Id(),!
		w "--- Start of Text ---",!
		While ('msg.File.AtEnd) {
			Set line=msg.File.ReadLine()
			w line,!
		}
		w "--- End of Text ---",!
		
		w !!!,msg.HL7.RawContent,!
			
	}
	
	Do rs.Close()
	Kill rs
	
	quit $$$OK
}

ClassMethod DeleteAllMessage()
{
	set rs=##class(%Library.ResultSet).%New()
	set SQL="delete from CHUBXL_MSG.HL7CardioFile"
	Set st=rs.Prepare(SQL)
	
	Do rs.Execute()

	Do rs.Close()
	Kill rs
	
	quit $$$OK
}

Storage Default
{
<Data name="HL7CardioFileDefaultData">
<Subscript>"HL7CardioFile"</Subscript>
<Value name="1">
<Value>HL7</Value>
</Value>
<Value name="2">
<Value>File</Value>
</Value>
</Data>
<DefaultData>HL7CardioFileDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
