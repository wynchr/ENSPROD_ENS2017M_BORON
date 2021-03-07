Class CHUBXL.DATA.MsgParser Extends %RegisteredObject [ ClassType = "", ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
Production ENSPROD

VERSION
-------
DAM	13/04/2018	Initial Version
--------------------------------------------------------------------------------------------------------------------------------
*/
/// List of all the parsing definition available 
Property msgParsingDefinitions As list Of MsgParsingDefinition;

/// This callback method is invoked by the <METHOD>%New</METHOD> method to 
/// provide notification that a new instance of an object is being created.
/// 
/// <P>If this method returns an error then the object will not be created.
/// initvalue can contain an array list of the IDs of the  parsing definitions to load
/// if not initvalue is sent, all the available definitions whill be loaded
Method %OnNew(initvalue As %CacheString = "") As %Status [ Private, ProcedureBlock = 1 ]
{
	s rs=##class(%ResultSet).%New("CHUBXL.DATA.MsgParsingDefinition:Extent")
	d rs.Execute()
	while rs.Next() {
		if (($D(initvalue)<10)||($D(initvalue(rs.Data("ID"))))) {
			d ..msgParsingDefinitions.Insert(##class(CHUBXL.DATA.MsgParsingDefinition).%OpenId(rs.Data("ID")))
		}
	}
	d rs.Close()
	q $$$OK
}

Method parseMessage(message As %String) As %RegisteredObject
{
	s obj=""
	s found=0
	for i=1:1:..msgParsingDefinitions.Count() {
		s msgDef=..msgParsingDefinitions.GetAt(i)
		if (msgDef.identityString'="") {
			if (msgDef.delimited) {
				s found=($P(message,msgDef.delimiter,msgDef.identityPosition)=msgDef.identityString)
			}
			else {
				s found=($E(message,msgDef.identityPosition,(msgDef.identityPosition+$L(msgDef.identityString)-1))=msgDef.identityString)
			}
			if (found) {
				s obj=$ZOBJCLASSMETHOD(msgDef.destinationClass,"%New")
				for j=1:1:msgDef.msgParsingFields.Count() {
					s field=msgDef.msgParsingFields.GetAt(j)
					if (msgDef.delimited) {
						s $ZOBJPROPERTY(obj,field.name)=$P(message,msgDef.delimiter,field.fieldPosition)
					}
					else {
						s $ZOBJPROPERTY(obj,field.name)=$E(message,field.fieldPosition,(field.fieldPosition+field.fieldLength-1))
					}
					s:(field.trimTrail) $ZOBJPROPERTY(obj,field.name)=$ZSTRIP($ZOBJPROPERTY(obj,field.name),">W")
				}
				q
			}
		}
	}
	q obj
}

Method formatMessage(obj As %RegisteredObject, messageName As %String) As %String
{
	
	s message=""
	for i=1:1:..msgParsingDefinitions.Count() {
		s msgDef=..msgParsingDefinitions.GetAt(i)
		if (msgDef.name=messageName) {
			s message=""
			for j=1:1:msgDef.msgParsingFields.Count() {
				s field=msgDef.msgParsingFields.GetAt(j)
				if (msgDef.delimited) {
					;w field.name,!
					s $P(message,msgDef.delimiter,field.fieldPosition)=$ZOBJPROPERTY(obj,field.name)
				}
				else {
					s $E(message,field.fieldPosition,(field.fieldPosition+field.fieldLength-1))=$ZOBJPROPERTY(obj,field.name)
				}
			}
			q
		}
	}
	q message
}

}
