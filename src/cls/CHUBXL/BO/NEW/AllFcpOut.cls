Class CHUBXL.BO.NEW.AllFcpOut Extends Ens.BusinessOperation [ ClassType = "", ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BO All Fcp

VERSION
-------
CWY	24/07/2018	Initial Version
CWY	30/07/2018	Add comment

ADAPTER
-------
	EnsLib.File.OutboundAdapter

MESSAGES
--------
	pRequest

MAP
---
	CHUBXL.DATA.RawMessageStream => writeFileMessageStream


DESTINATION
-----------
    Infohos
    Medecin
    RsbEvent
    bdocMB
    glimsMB
    OpthHCUM
    OTHER .....


OPTIMISATION
------------
- Create Generic filename for destination

SOURCE
------
CHUBXL.BO.MBFileOut

--------------------------------------------------------------------------------------------------------------------------------
*/
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Parameter ADAPTER = "EnsLib.File.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method writeFileMessageStream(pRequest As %RegisteredObject, Output pResponse As Ens.Response) As %Status
{
	//------------------------------
	// Trace Origin
	//------------------------------
	
    s tClassName = pRequest.source
    $$$TRACE("**ClassName : "_tClassName)
    $$$TRACE("Read file from "_pRequest.payLoad.Attributes("Filename")) 


	//------------------------------
	// Adjust Filename
	//------------------------------
	
    s fileName=$p(pRequest.payLoad.Attributes("Filename"),"\",9)
    if tClassName = "Infohos" s fileName=$p(pRequest.payLoad.Attributes("Filename"),"\",6)
    if tClassName = "Medecin" s fileName=$p(pRequest.payLoad.Attributes("Filename"),"\",5)
    if tClassName = "RsbEvent" s fileName=$p(pRequest.payLoad.Attributes("Filename"),"\",2)
    if tClassName = "bdocMB" s fileName=$p(pRequest.payLoad.Attributes("Filename"),"\",8)
    if tClassName = "OphtHCUM" s fileName=$p(pRequest.payLoad.Attributes("Filename"),"\",5)
    if tClassName = "glimsMB" s fileName=$p(pRequest.payLoad.Attributes("Filename"),"\",10)
    $$$TRACE("FileName = "_fileName)

	//------------------------------
	// Send to Adapter
	//------------------------------
    
    Set tSC=..Adapter.PutStream(fileName, pRequest.payLoad)
    
	//------------------------------
	// Trap Routing Error
	//------------------------------
    
    if ('tSC) {
        s message="FileCopy : ERROR - Put to "_..%ConfigName_"("_pInput.Attributes("Filename")_" at "_$zdt($h)_")"
        d ..SendAlert(##class(Ens.AlertRequest).%New($LB(..%ConfigName_" : "_pInput.Attributes("Filename")_" at "_$zdt($h)_")",message)))   
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
