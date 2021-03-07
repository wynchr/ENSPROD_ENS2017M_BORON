Class CHUBXL.MSG.ResultPLUS Extends Ens.Request [ ClassType = persistent, ProcedureBlock ]
{

Property XML As %GlobalCharacterStream;

Property Blob As %GlobalCharacterStream;

Property FileName As %String(TRUNCATE = 1);

ClassMethod Import() As %Status
{
	
	Set XMLFile=##class(CHUBXL.MSG.ResultPLUS).%New()
	
	// Import XML File
	
	Set stream=##class(%FileCharacterStream).%New()
	Set stream.Filename="D:\dataTest\PLUS\in\PIN2374625211.xml"
	
	d XMLFile.File.CopyFrom(stream)

	d XMLFile.%Save()
	
	
	// Import PDF File
	
	Set stream=##class(%FileCharacterStream).%New()
	Set stream.Filename="D:\dataTest\PLUS\in\PIN2374625211.PDF"
	
	d XMLFile.File.CopyFrom(stream)

	d XMLFile.%Save()
	
	w "ID:",XMLFile.%Id(),!
	
	quit $$$OK
}

ClassMethod ListAllMessage()
{
	set rs=##class(%Library.ResultSet).%New()
	set SQL="Select * from CHUBXL.MSG.ResultPLUS"
	Set st=rs.Prepare(SQL)
	
	Do rs.Execute()
	
	s i=0	
	while (rs.Next() '= 0) {
		s i=i+1
		Write "* "_i_" (PLUS) ***************************",!
		
		s pID=$get(rs.Data("ID"))
		s msg=##class(CHUBXL.MSG.ResultPLUS).%OpenId(pID)
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
	set SQL="delete from CHUBXL.MSG.ResultPLUS"
	Set st=rs.Prepare(SQL)
	
	Do rs.Execute()

	Do rs.Close()
	Kill rs
	
	quit $$$OK
}

Storage Default
{
<Data name="ResultPLUSDefaultData">
<Subscript>"ResultPLUS"</Subscript>
<Value name="1">
<Value>XML</Value>
</Value>
<Value name="2">
<Value>Blob</Value>
</Value>
<Value name="3">
<Value>FileName</Value>
</Value>
</Data>
<DefaultData>ResultPLUSDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
