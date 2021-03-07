Class CHUBXL.BP.OLD.MedecinRouting Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/// CWY 03/05/2017 Envoi les MFN médecin vers OXYGEN pour la Kiné
/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As CHUBXL.DATA.RawMessageStream, Output pResponse As Ens.Response) As %Status
{
    
    Set $ZTrap = "ErrorTrap", tSC=$$$OK 

    $$$TRACE("Start BP MedecinRouting")

    s tClassName = pRequest.%ClassName(1)
    s tSourceConfigName = ..%PrimaryRequestHeader.SourceConfigName
    s tTargetConfigName = ..%PrimaryRequestHeader.TargetConfigName
    
    $$$TRACE("ClassName : "_tClassName)
    $$$TRACE("SourceConfigName : "_tSourceConfigName)
    $$$TRACE("TargetConfigName : "_tTargetConfigName)

    if ((tSourceConfigName = "WishBruMedHl7TcpIn") ! (tSourceConfigName = "WishHudMedHl7TcpIn")) {
        s tSC=##class(CHUBXL.DT.WishMedToInfohos).Transform(pRequest,.MedInfohos) Quit:$$$ISERR(tSC) tSC
        s tSC=..SendRequestAsync("WishInfohosAllAdtHl7TcpOut",MedInfohos) Quit:$$$ISERR(tSC) tSC
        
        ; on envoi les MFN médecin vers la cache dans un rep séparé
        s tSC = ..SendRequestAsync("WishCacheAllMedHl7FcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
        
        ; on envoi les MFN médecin vers OXYGEN pour la Kiné
        s NoMed=pRequest.FindSegmentValues("STF:1.1")
        $$$TRACE("N° médecin "_NoMed)
        
        i $e(NoMed,1)=5 {
          s tSC = ..SendRequestAsync("WishOxygenBruAdtHl7TcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
          $$$TRACE("Routing Msg to kine : "_NoMed_" "_tClassName)
        }
        $$$TRACE("Routing Msg "_tClassName)
    }
    Else {
        $$$LOGWARNING("Unsupported message received :"_tSourceConfigName)
    }
                    
Exit    
    Quit tSC

ErrorTrap
 
    Set $ZTrap = ""
    Write $ZError,!
    $$$TRACE("Error BP - medecin : "_$ZError)
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
<Data name="MedecinRoutingDefaultData">
<Subscript>"MedecinRouting"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>MedecinRoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
