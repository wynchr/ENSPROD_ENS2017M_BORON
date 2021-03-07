Class CHUBXL.Utils.WordConvert Extends %RegisteredObject
{

Parameter PROXYDLLLocation = "t:\SOFTWARE\WordConvert\WordAutomationProxy.dll";

Property gw As %Net.Remote.Gateway;

Method convert(fromWordFile As %String, toTextFile As %String) As %Status
{
	set st=$$$OK
	try {
       s scNet=##class(WordAutomationProxy.Utils).convert(..gw,fromWordFile,toTextFile)
       s:(scNet'="OK") st=$system.Status.Error(5001,"Error from .NET :"_scNet)
	} catch ex {
		s st=ex.AsStatus()
	}
	q st
}

/// Passer en paramètre le n° de port local du Gateway .NET
/// Si la classe n'arrive pas à se connecter, l'objet ne sera pas créé.
Method %OnNew(portNumber As %String) As %Status [ Private, ServerOnly = 1 ]
{
	Set classPath=##class(%ListOfDataTypes).%New()

	Do classPath.Insert(..#PROXYDLLLocation)
	set st=$$$OK
	try {
        s ..gw=##class(%Net.Remote.Gateway).%New()
        $$$TOE(st,..gw.%Connect("localhost",portNumber,$namespace,2,.classPath))
	} catch ex {
		s st=ex.AsStatus()
	}
	q st
	Quit $$$OK
}

/// Deconnecte le gateway lorsqu'on retire l'objet courant de la mémoire...
Method %OnClose() As %Status [ Private, ServerOnly = 1 ]
{
	try {
		if $ISOBJECT(..gw) {
			d ..gw.%Close()
		}
	} catch ex { // silent exception
	}
	Quit $$$OK
}

}
