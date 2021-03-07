Class CHUBXL.BP.NEW.HCUMRouting Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BP BDOC HC

VERSION
-------
CWY	03/11/2020	Initial Version


REQUEST
-------
	CHUBXL.DATA.RawMessageStream

SOURCE
------
	BDOC
	    BRUGMANN
		    OpthHCUMMedidocFcpIn


DESTINATION
-----------
	HC
	
MESSAGES
--------
	CHUBXL.DATA.RawMessageStream

PROCESS
-------
    BRUGMANN
	    OpthHCUMMedidocFcpIn => OpthHCUMMedidocFcpOut

OPTIMISATION
------------



--------------------------------------------------------------------------------------------------------------------------------
*/
/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As CHUBXL.DATA.RawMessageStream, Output pResponse As Ens.Response) As %Status
{
    
    Set $ZTrap = "ErrorTrap", tSC=$$$OK 

    $$$TRACE("Start BP HCUMRouting")

    s tClassName = pRequest.%ClassName(1)
    s tSourceConfigName = ..%PrimaryRequestHeader.SourceConfigName
    s tTargetConfigName = ..%PrimaryRequestHeader.TargetConfigName
    
    $$$TRACE("ClassName : "_tClassName)
    $$$TRACE("SourceConfigName"_tSourceConfigName)
    $$$TRACE("TargetConfigName"_tTargetConfigName)

    // Brugmann
    If (tSourceConfigName = "OphtBruHCUMMedidocFcpIn" ) {
        s tSC=..SendRequestAsync("OphtBruHCUMMedidocFcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
    }

                    
Exit    
    Quit tSC

ErrorTrap
 
    Set $ZTrap = ""
    Write $ZError,!
    $$$TRACE("Error BP - OphtHCUM : "_$ZError)
    Set tSC=$$$EnsSystemError Goto Exit
}

Method OnResponse(request As Ens.Request, ByRef response As Ens.Response, callrequest As Ens.Request, callresponse As Ens.Response, pCompletionKey As %String) As %Status
{
    $$$TRACE("Dummy Asynchronous request returned")
    Set response=callresponse
    Quit $$$OK
}

Storage Default
{
<Data name="HCUMRoutingDefaultData">
<Subscript>"HCUMRouting"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>HCUMRoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
