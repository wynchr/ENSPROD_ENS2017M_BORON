Class CHUBXL.BP.NEW.BdocHcRouting Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BP BDOC HC

VERSION
-------
CWY	24/07/2018	Initial Version
CWY	31/07/2018	Add comment

REQUEST
-------
	CHUBXL.DATA.RawMessageStream

SOURCE
------
	BDOC
	    BRUGMANN
		    BdocBruHcHealthoneFcpIn
		    BdocBruHcMedidocFcpIn
		    BdocBruHcMedimailFcpIn
		    BdocBruHcSocrateFcpIn
		    BdocBruHcTexteFcpIn	
	    HUDERF
		    BdocHudHcHealthoneFcpIn
		    BdocHudHcMedidocFcpIn	
		    BdocHudHcMedimailFcpIn
		    BdocHudHcSocrateFcpIn
		    BdocHudHcTexteFcpIn	

DESTINATION
-----------
	HC
	
MESSAGES
--------
	CHUBXL.DATA.RawMessageStream

PROCESS
-------
    BRUGMANN
	    BdocBruHcHealthoneFcpIn => BdocAllHcHealthoneFcpOut
	    BdocBruHcMedidocFcpIn	=> BdocAllHcMedidocFcpOut
	    BdocBruHcMedimailFcpIn	=> BdocAllHcMedimailFcpOut
	    BdocBruHcSocrateFcpIn	=> BdocAllHcSocrateFcpOut
	    BdocBruHcTexteFcpIn		=> BdocAllHcTexteFcpOut

    HUDERF
	    BdocHudHcHealthoneFcpIn	=> BdocAllHcHealthoneFcpOut
	    BdocHudHcMedidocFcpIn	=> BdocAllHcMedidocFcpOut
	    BdocHudHcMedimailFcpIn	=> BdocAllHcMedimailFcpOut
	    BdocHudHcSocrateFcpIn	=> BdocAllHcSocrateFcpOut
	    BdocHudHcTexteFcpIn		=> BdocAllHcTexteFcpOut

OPTIMISATION
------------


SOURCE
------
CHUBXL.BP.BDocMBRouting

--------------------------------------------------------------------------------------------------------------------------------
*/
/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As CHUBXL.DATA.RawMessageStream, Output pResponse As Ens.Response) As %Status
{
    
    Set $ZTrap = "ErrorTrap", tSC=$$$OK 

    $$$TRACE("Start BP MediBridgeRouting")

    s tClassName = pRequest.%ClassName(1)
    s tSourceConfigName = ..%PrimaryRequestHeader.SourceConfigName
    s tTargetConfigName = ..%PrimaryRequestHeader.TargetConfigName
    
    $$$TRACE("ClassName : "_tClassName)
    $$$TRACE("SourceConfigName"_tSourceConfigName)
    $$$TRACE("TargetConfigName"_tTargetConfigName)

    // Brugmann
    If (tSourceConfigName = "BdocBruHcHealthoneFcpIn" ) {
        s tSC=..SendRequestAsync("BdocAllHcHealthoneFcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
    }
    elseif (tSourceConfigName = "BdocBruHcMedidocFcpIn" ){
        s tSC=..SendRequestAsync("BdocAllHcMedidocFcpOut",pRequest)   Quit:$$$ISERR(tSC) tSC
    }   
    elseif (tSourceConfigName = "BdocBruHcMedimailFcpIn" ){
        s tSC=..SendRequestAsync("BdocAllHcMedimailFcpOut",pRequest) Quit:$$$ISERR(tSC) tSC
    }
    elseif (tSourceConfigName = "BdocBruHcSocrateFcpIn" ){
        s tSC=..SendRequestAsync("BdocAllHcSocrateFcpOut",pRequest)   Quit:$$$ISERR(tSC) tSC
    }
    elseif (tSourceConfigName = "BdocBruHcTexteFcpIn" ){
        s tSC=..SendRequestAsync("BdocAllHcTexteFcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
    }
    // Huderf
    elseif (tSourceConfigName = "BdocHudHcHealthoneFcpIn" ) {
        s tSC=..SendRequestAsync("BdocAllHcHealthoneFcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
    }
    elseif (tSourceConfigName = "BdocHudHcMedidocFcpIn" ){
        s tSC=..SendRequestAsync("BdocAllHcMedidocFcpOut",pRequest)   Quit:$$$ISERR(tSC) tSC
    }   
    elseif (tSourceConfigName = "BdocHudHcMedimailFcpIn" ){
        s tSC=..SendRequestAsync("BdocAllHcMedimailFcpOut",pRequest) Quit:$$$ISERR(tSC) tSC
    }
    elseif (tSourceConfigName = "BdocHudHcSocrateFcpIn" ){
        s tSC=..SendRequestAsync("BdocAllHcSocrateFcpOut",pRequest)   Quit:$$$ISERR(tSC) tSC
    }
    elseif (tSourceConfigName = "BdocHudHcTexteFcpIn" ){
        s tSC=..SendRequestAsync("BdocAllHcTexteFcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
    }
    Else {
        $$$LOGWARNING("Unsupported message received :"_tSourceConfigName)
    }
                    
Exit    
    Quit tSC

ErrorTrap
 
    Set $ZTrap = ""
    Write $ZError,!
    $$$TRACE("Error BP - BdocMB : "_$ZError)
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
<Data name="BdocHcRoutingDefaultData">
<Subscript>"BdocHcRouting"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>BdocHcRoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
