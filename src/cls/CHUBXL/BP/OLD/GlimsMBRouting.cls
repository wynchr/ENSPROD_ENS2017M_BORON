Class CHUBXL.BP.OLD.GlimsMBRouting Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
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

    If (tSourceConfigName = "GlimsAllHchoneFcpIn" ) {
        s tSC=..SendRequestAsync("GlimsAllHchoneFcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
    }
    elseif (tSourceConfigName = "GlimsAllHcBJPFcpIn" ){
        s tSC=..SendRequestAsync("GlimsAllHcBJPFcpOut",pRequest)   Quit:$$$ISERR(tSC) tSC
    }   
    elseif (tSourceConfigName = "GlimsAllHcMedarFcpIn" ){
        s tSC=..SendRequestAsync("GlimsAllHcMedarFcpOut",pRequest) Quit:$$$ISERR(tSC) tSC
    }
    elseif (tSourceConfigName = "GlimsAllHcMedidocFcpIn" ){
        s tSC=..SendRequestAsync("GlimsAllHcMedidocFcpOut",pRequest)   Quit:$$$ISERR(tSC) tSC
    }
    elseif (tSourceConfigName = "GlimsAllHcMedigestFcpIn" ){
        s tSC=..SendRequestAsync("GlimsAllHcMedigestFcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
    }
    elseif (tSourceConfigName = "GlimsAllHcSocrateFcpIn" ){
        s tSC=..SendRequestAsync("GlimsAllHcSocrateFcpOut",pRequest)   Quit:$$$ISERR(tSC) tSC
    }
    Else {
        $$$LOGWARNING("Unsupported message received :"_tSourceConfigName)
    }
                    
Exit    
    Quit tSC

ErrorTrap
 
    Set $ZTrap = ""
    Write $ZError,!
    $$$TRACE("Error BP - GlimsMB : "_$ZError)
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
<Data name="GlimsMBRoutingDefaultData">
<Subscript>"GlimsMBRouting"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>GlimsMBRoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
