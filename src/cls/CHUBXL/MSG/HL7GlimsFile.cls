Class CHUBXL.MSG.HL7GlimsFile Extends Ens.Request [ ClassType = persistent, ProcedureBlock ]
{

Property HL7 As EnsLib.HL7.Message;

Property File As %GlobalCharacterStream;

Property Msg As %xsd.base64Binary;

ClassMethod Import() As %Status
{
	// Import HL7 File
	
	s HL7File=##class(CHUBXL.MSG.HL7EcareFile).%New()
	s HL7File.HL7 = ##class(EnsLib.HL7.Message).ImportFromFile("D:\dataTest\QUADRATORU\in\QuadratORUBRUTcpIn_0636279.HL7")
	
	d HL7File.HL7.DocTypeSet("2.4:ORU_R01")
	d HL7File.HL7.DocTypeSet(HL7File.HL7.TypeVersion_":"_HL7File.HL7.Name)
	;s HL7File.HL7.Separators = "|^~\&"
	w "HL7 BuildMap Status : "_HL7File.HL7.BuildMap(),!
	
	w "HL7 Name : "_HL7File.HL7.Name,!
	w "HL7 Identifier : "_HL7File.HL7.Identifier,!
	w "HL7 TypeVersion : "_HL7File.HL7.TypeVersion,!
	w "HL7 Separators : "_HL7File.HL7.Separators,!
	w "HL7 MessageTypeCategory : "_HL7File.HL7.MessageTypeCategory,!
	w "HL7 Envelope : "_HL7File.HL7.Envelope,!
	w "HL7 DocTypeName : "_HL7File.HL7.DocTypeName,!
	w "HL7 DocTypeCategory : "_HL7File.HL7.DocTypeCategory,!
	w "HL7 Segment : "_HL7File.HL7.SegCount,!
	
	// Get MSH fields
	
	s seg=HL7File.HL7.FindSegment("MSH",.index,.sc)
	$$$TRACE("HL7 Segment MSH : "_seg.OutputToString())
	k seg s seg=HL7File.HL7.FindSegment("PID",.index,.sc)
    $$$TRACE("HL7 Segment PID : "_index_"*"_sc)
	k seg s seg=HL7File.HL7.FindSegment("OBR",.index,.sc)
	$$$TRACE("HL7 Segment OBR : "_seg.OutputToString())
	k seg s seg=HL7File.HL7.FindSegment("OBX",.index,.sc)
	$$$TRACE("HL7 Segment OBX : "_seg.OutputToString())
	
	w !!!!,"HL7 MSH:9.1 : "_HL7File.HL7.GetValueAt("MSH:9.1",,.tSC)_" tSC:"_tSC,!
	w "HL7 MSH:9.2 : "_HL7File.HL7.GetValueAt("MSH:9.2",,.tSC)_" tSC:"_tSC,!
	
	w "HL7 MSH:1 : "_HL7File.HL7.GetValueAt("MSH:1",,.tSC)_" tSC:"_tSC,!
	w "HL7 MSH:2 : "_HL7File.HL7.GetValueAt("MSH:2",,.tSC)_" tSC:"_tSC,!
	w "HL7 MSH:3 : "_HL7File.HL7.GetValueAt("MSH:3",,.tSC)_" tSC:"_tSC,!
	w "HL7 MSH:4 : "_HL7File.HL7.GetValueAt("MSH:4",,.tSC)_" tSC:"_tSC,!
	w "HL7 MSH:5 : "_HL7File.HL7.GetValueAt("MSH:5",,.tSC)_" tSC:"_tSC,!
	w "HL7 MSH:6 : "_HL7File.HL7.GetValueAt("MSH:6",,.tSC)_" tSC:"_tSC,!
	w "HL7 MSH:7 : "_HL7File.HL7.GetValueAt("MSH:7",,.tSC)_" tSC:"_tSC,!
	w "HL7 MSH:8 : "_HL7File.HL7.GetValueAt("MSH:8",,.tSC)_" tSC:"_tSC,!
	w "HL7 MSH:9.1 : "_HL7File.HL7.GetValueAt("MSH:9.1",,.tSC)_" tSC:"_tSC,!
	w "HL7 MSH:9.2 : "_HL7File.HL7.GetValueAt("MSH:9.2",,.tSC)_" tSC:"_tSC,!
	w "HL7 MSH:10 : "_HL7File.HL7.GetValueAt("MSH:10",,.tSC)_" tSC:"_tSC,!
	w "HL7 MSH:11 : "_HL7File.HL7.GetValueAt("MSH:11",,.tSC)_" tSC:"_tSC,!
	w "HL7 MSH:12 : "_HL7File.HL7.GetValueAt("MSH:12",,.tSC)_" tSC:"_tSC,!
	w "HL7 MSH:13 : "_HL7File.HL7.GetValueAt("MSH:13",,.tSC)_" tSC:"_tSC,!

	w "HL7 PID:5 : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PID:5",,.tSC)_" tSC:"_tSC,!
	
	w "HL7 EncodingCharacters : "_HL7File.HL7.GetValueAt("MSH:EncodingCharacters",,.tSC)_" tSC:"_tSC,!
	w "HL7 ControlID : "_HL7File.HL7.GetValueAt("MSH:MessageControlID",,.tSC)_" tSC:"_tSC,!
    w "HL7 MSH : "_HL7File.HL7.GetValueAt("MSH",,.tSC)_" tSC:"_tSC,!
    w "HL7 PID : "_HL7File.HL7.GetValueAt("PID",,.tSC)_" tSC:"_tSC,!
    w "HL7 PV1 : "_HL7File.HL7.GetValueAt("PV1",,.tSC)_" tSC:"_tSC,!
    w "HL7 OBR : "_HL7File.HL7.GetValueAt("OBR",,.tSC)_" tSC:"_tSC,!
    w "HL7 OBX : "_HL7File.HL7.GetValueAt("OBX",,.tSC)_" tSC:"_tSC,!
    w "HL7 OBX : "_HL7File.HL7.FindSegment("OBX"),!
    s OBX=HL7File.HL7.FindSegmentValues("OBX")
    w OBX,"  *** ",$l(HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:5",,.tSC)),!
    // Get PID fields
    
    w "HL7 PatientIDInternalID : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PID:3",,.tSC)," tSC:"_tSC,!
	
	// Get OBX fields

	w "HL7 OBX 1 : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:1",,.tSC)," ** ","tSC:"_tSC,!
	w "HL7 OBX 2 : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:2",,.tSC)," ** ","tSC:"_tSC,!
	w "HL7 OBX 3 : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:3",,.tSC)," ** ","tSC:"_tSC,!
	w "HL7 OBX 4 : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:4",,.tSC)," ** ","tSC:"_tSC,!
	w "HL7 OBX 5 : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:5",,.tSC)," ** ","tSC:"_tSC,"  *** ",$l(HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:5",,.tSC)),!
	w "HL7 OBX 6 : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:6",,.tSC)," ** ","tSC:"_tSC,!
	w "HL7 OBX 7 : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:7",,.tSC)," ** ","tSC:"_tSC,!
	w "HL7 OBX 8 : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:8",,.tSC)," ** ","tSC:"_tSC,!
	w "HL7 OBX 9 : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:9",,.tSC)," ** ","tSC:"_tSC,!
	w "HL7 OBX 10 : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:10",,.tSC)," ** ","tSC:"_tSC,!
	w "HL7 OBX 11 : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:11",,.tSC)," ** ","tSC:"_tSC,!
	w "HL7 OBX 12 : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:12",,.tSC)," ** ","tSC:"_tSC,!
	w "HL7 OBX 13 : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:13",,.tSC)," ** ","tSC:"_tSC,!
	w "HL7 OBX 14 : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:14",,.tSC)," ** ","tSC:"_tSC,!
	w "HL7 OBX 15 : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:15",,.tSC)," ** ","tSC:"_tSC,!
	w "HL7 OBX 16 : "_HL7File.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:16",,.tSC)," ** ","tSC:"_tSC,!

    ;w "%%%%%%%%%%%%%%%%%%%%"_HL7File.HL7.RawContent,!,$l(HL7File.HL7.RawContent,"OBX"),!
	
    // Dump RawContent		
		
	//w "HL7 RawContent : "_HL7File.HL7.RawContent,!
	
	// Import RTF File
	
	//Set stream=##class(%FileCharacterStream).%New()
	//Set stream.Filename="D:\DATA\ENS\Test\DIAMIC\in\0080098_637043.RTF"
	
	//s HL7File.File=HL7File.HL7.ObservationValue ;.CopyFrom(stream)

	d HL7File.%Save()
	
	w "ID:",HL7File.%Id(),!
}

ClassMethod ListAllMessage()
{
	set rs=##class(%Library.ResultSet).%New()
	set SQL="Select * from CHUBXL_MSG.HL7EcareFile"
	Set st=rs.Prepare(SQL)
	
	Do rs.Execute()
	
	s i=0	
	while (rs.Next() '= 0) {
		s i=i+1
		Write "* "_i_" (HL7EcareFile) ***************************",!
		
		s pID=$get(rs.Data("ID"))
		s msg=##class(CHUBXL.MSG.HL7EcareFile).%OpenId(pID)
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
	set SQL="delete from CHUBXL_MSG.HL7EcareFile"
	Set st=rs.Prepare(SQL)
	
	Do rs.Execute()

	Do rs.Close()
	Kill rs
	
	quit $$$OK
}

Storage Default
{
<Data name="HL7GlimsFileDefaultData">
<Subscript>"HL7GlimsFile"</Subscript>
<Value name="1">
<Value>HL7</Value>
</Value>
<Value name="2">
<Value>File</Value>
</Value>
<Value name="3">
<Value>Msg</Value>
</Value>
</Data>
<DefaultData>HL7GlimsFileDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
