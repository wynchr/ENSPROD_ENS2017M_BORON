Class CHUBXL.BO.OLD.MBFileOut Extends Ens.BusinessOperation [ ClassType = "", ProcedureBlock ]
{

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Parameter ADAPTER = "EnsLib.File.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method writeFileMessageStream(pRequest As %RegisteredObject, Output pResponse As Ens.Response) As %Status
{
    s tClassName = pRequest.source
    $$$TRACE("**ClassName : "_tClassName)
    $$$TRACE("write to fileA "_pRequest.payLoad.Attributes("Filename")) 

    s fileName=$p(pRequest.payLoad.Attributes("Filename"),"\",9)
    
    if tClassName = "Infohos" s fileName=$p(pRequest.payLoad.Attributes("Filename"),"\",6)
    if tClassName = "Medecin" s fileName=$p(pRequest.payLoad.Attributes("Filename"),"\",5)
    if tClassName = "RsbEvent" s fileName=$p(pRequest.payLoad.Attributes("Filename"),"\",2)
    if tClassName = "bdocMB" s fileName=$p(pRequest.payLoad.Attributes("Filename"),"\",8)
    if tClassName = "glimsMB" s fileName=$p(pRequest.payLoad.Attributes("Filename"),"\",10)
    
    $$$TRACE("write to fileB "_fileName)
    Set tSC=..Adapter.PutStream(fileName, pRequest.payLoad)
    
    
    if ('tSC) {
        s message="FileCopy Medibridge : ERROR - Put to MEDISERVE ("_fileName_" at "_$zdt($h)_")"
        d ..SendAlert(##class(Ens.AlertRequest).%New($LB("Medibridge : "_fileName_" at "_$zdt($h),message)))
    }
    else {
        ;**cw05112009*****s message="FileCopy Medibridge : Put to MEDISERVE ("_fileName_" at "_$zdt($h)_")"
        ;**cw05112009*****d ..SendAlert(##class(Ens.AlertRequest).%New($LB("Medibridge : "_fileName_" at "_$zdt($h),message)))
    }
        
    Quit tSC
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="CHUBXL.DATA.RawMessageStream"> 
        <Method>writeFileMessageStream</Method>
    </MapItem>
    </MapItems>
}

}
