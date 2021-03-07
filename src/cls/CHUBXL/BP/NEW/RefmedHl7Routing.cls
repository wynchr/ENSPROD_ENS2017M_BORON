Class CHUBXL.BP.NEW.RefmedHl7Routing Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
Routing des messages Informations médecin provenant de REFMED

VERSION
-------
CWY	18/06/2018	Initial Version
CWY	01/08/2018	Add comment

REQUEST
-------
	CHUBXL.DATA.RawMessageStream

SOURCE
------
	REFMED (RefmedAllMedHl7FcpIn)

DESTINATION
-----------
	BDOC,KINE

MESSAGES
--------
	CHUBXL.DATA.RawMessageStream

PROCESS
-------	
    RefmedAllMedHl7FcpIn
	    Appli["BDocTest"
	    		=> MedecinDPIFileOut
        
        Appli["BDocProd"
        		=> WishBdocBruAdtHl7TcpOut
        		=> WishBdocHudAdtHl7TcpOut
        
        Appli="Prod"
        		=> WishOxygenBruAdtHl7TcpOut
        
OPTIMISATION
------------
- BDocTest => MedecinDPIFileOut ???

SOURCE
------
CHUBXL.BP.RefmedRouting

--------------------------------------------------------------------------------------------------------------------------------
*/
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As CHUBXL.DATA.RawMessageStream, Output pResponse As Ens.Response) As %Status
{
    Set $ZTrap = "ErrorTrap", tSC=$$$OK 

    $$$TRACE("Start BP RefmedHl7Routing")

    s tClassName = pRequest.%ClassName(1)
    s tSourceConfigName = ..%PrimaryRequestHeader.SourceConfigName
    s tTargetConfigName = ..%PrimaryRequestHeader.TargetConfigName
    
    $$$TRACE("ClassName : "_tClassName)
    $$$TRACE("SourceConfigName : "_tSourceConfigName)
    $$$TRACE("TargetConfigName : "_tTargetConfigName)
    $$$TRACE("TargetConfigName : "_pRequest.payLoad)
    ;s MsgHL7=##class(EnsLib.HL7.Message).ImportFromIOStream(pRequest.payLoad)
    s MsgHL7 = ##class(EnsLib.HL7.Message).ImportFromOldStream(pRequest.payLoad,.tSC)
    s MsgHL7.DocType=MsgHL7.TypeVersion_":"_MsgHL7.Name
    d pRequest.payLoad.Rewind()
    s MsgHL7Ophtal = ##class(EnsLib.HL7.Message).ImportFromOldStream(pRequest.payLoad,.tSC)
    s MsgHL7Ophtal.DocType=MsgHL7Ophtal.TypeVersion_":"_MsgHL7Ophtal.Name
    s NoMed=MsgHL7Ophtal.GetValueAt("MFEgrp(1).PRA:PRAPrimaryKeyValue",,.tSC)
    s tSC1=MsgHL7Ophtal.SetValueAt(NoMed,"MFEgrp(1).PRA:PractitionerIDNumbers(1).IDnumber")

	//------------------------------
	// Test Source
	//------------------------------

    If (tSourceConfigName = "RefmedAllMedHl7FcpIn" ) {
	    
	    s Appli=MsgHL7.GetValueAt("MSH:ReceivingApplication",,.tSC)
	    
        i Appli["BDocTest" s tSC = ..SendRequestAsync("MedecinDPIFileOut",pRequest)  Quit:$$$ISERR(tSC) tSC
        
        i Appli["BDocProd" {
	      s tSC = ..SendRequestAsync("WishBdocBruAdtHl7TcpOut",MsgHL7)  Quit:$$$ISERR(tSC) tSC
          s tSC = ..SendRequestAsync("WishBdocHudAdtHl7TcpOut",MsgHL7)  Quit:$$$ISERR(tSC) tSC
          s tSC = ..SendRequestAsync("WishOphtalmoBruAdtHl7TcpOut",MsgHL7Ophtal)  Quit:$$$ISERR(tSC) tSC
        }
        
        i Appli="Prod" s tSC = ..SendRequestAsync("WishOxygenBruAdtHl7TcpOut",MsgHL7)  Quit:$$$ISERR(tSC) tSC
        
        $$$TRACE("Msg sent")
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
<Data name="RefmedHl7RoutingDefaultData">
<Subscript>"RefmedHl7Routing"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>RefmedHl7RoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
