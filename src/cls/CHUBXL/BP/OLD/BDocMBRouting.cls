Class CHUBXL.BP.OLD.BDocMBRouting Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

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

    // Huderd
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
    // Brugmann
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
<Data name="BDocMBRoutingDefaultData">
<Subscript>"BDocMBRouting"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>BDocMBRoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
