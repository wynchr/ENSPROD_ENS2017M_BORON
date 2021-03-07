Class CHUBXL.BP.NEW.WishMedHl7Routing Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BP WISH MED HL7

VERSION
-------
CWY	24/07/2018	Initial Version
CWY	01/08/2018	Add comment
DAM	18/01/2019	Ajout des modification pour tenir compte du passsage du nuéro de médecin de 6 à 8 chiffres.
CWY	03/07/2019	Add Trace + Correction bug
DAM	26/01/2021	Ajout envoi vers Softalmo informations Brugmann.

REQUEST
-------
	CHUBXL.DATA.RawMessageStream

SOURCE
------
	WISH 
		WishBruMedHl7TcpIn, WishHudMedHl7TcpIn

DESTINATION
-----------
	INFOHOS, CACHE, OXYGEN

MESSAGES
--------
	CHUBXL.DATA.RawMessageStream

PROCESS
-------	
    WishBruMedHl7TcpIn ! WishHudMedHl7TcpIn
    		CHUBXL.DT.WishMedToInfohos	
			=> WishInfohosAllAdtHl7TcpOut
    		=> WishCacheAllMedHl7FcpOut
    		=> WishOxygenBruAdtHl7TcpOut
          
OPTIMISATION
------------

SOURCE
------
CHUBXL.BP.MedecinRouting

--------------------------------------------------------------------------------------------------------------------------------
*/
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As EnsLib.HL7.Message, Output pResponse As Ens.Response) As %Status
{
    
    Set $ZTrap = "ErrorTrap", tSC=$$$OK 

    $$$TRACE("Start BP WishMedHl7Routing")

    s tClassName = pRequest.%ClassName(1)
    s tSourceConfigName = ..%PrimaryRequestHeader.SourceConfigName
    s tTargetConfigName = ..%PrimaryRequestHeader.TargetConfigName
    
    $$$TRACE("ClassName : "_tClassName)
    $$$TRACE("SourceConfigName : "_tSourceConfigName)
    $$$TRACE("TargetConfigName : "_tTargetConfigName)

	//------------------------------
	// Test Source
	//------------------------------
	
    if ((tSourceConfigName = "WishBruMedHl7TcpIn") ! (tSourceConfigName = "WishHudMedHl7TcpIn")) {
        s NoMed=pRequest.GetValueAt("MFEgrp(1).PRA(1):PractitionerIDNumbers(1).IDNumber",,.tSC)
        $$$TRACE("N° médecin PRA : "_NoMed)
        // CWY Test if WISH = 8 and PRA = 11
        i ($g(^CHUBXL.Parameter("MedWish",8))),($l(NoMed)=11) {
	        s tSC=##class(CHUBXL.DT.WishMedInami8).Transform(pRequest,.NewpRequest) Quit:$$$ISERR(tSC) tSC
	        s NoMed=NewpRequest.GetValueAt("MFEgrp(1).PRA(1):PractitionerIDNumbers(1).IDNumber",,.tSC)
	        s NoMed8=$e(NoMed,1,8)
		    s tSC1=NewpRequest.SetValueAt(NoMed8,"MFEgrp(1).MFE:PrimaryKeyValueMFE(1)")
		    s tSC1=NewpRequest.SetValueAt(NoMed8,"MFEgrp(1).STF:PrimaryKeyValueSTF.Identifier")
		    s tSC1=NewpRequest.SetValueAt(NoMed8,"MFEgrp(1).STF:StaffIdentifierList(1).IDNumber")
		    s tSC1=NewpRequest.SetValueAt(NoMed8,"MFEgrp(1).PRA(1):PrimaryKeyValuePRA.Identifier")
		    // CWY Send new way INAMI8
		    $$$TRACE("New INAMI in 8 : "_NoMed8)
		    $$$TRACE("New Message INAMI in 8 : "_NewpRequest.RawContent)
		    s tSC=##class(CHUBXL.DT.WishMedToInfohos).Transform(NewpRequest,.MedInfohos) Quit:$$$ISERR(tSC) tSC
		    s tSC=##class(CHUBXL.DT.WishMedToOphtalmo).Transform(NewpRequest,.MedOphtalmo) Quit:$$$ISERR(tSC) tSC
			s tSC=..SendRequestAsync("WishInfohosAllAdtHl7TcpOut",MedInfohos) Quit:$$$ISERR(tSC) tSC
			s NoMed=MedOphtalmo.GetValueAt("MFEgrp(1).PRA(1):PrimaryKeyValuePRA.Identifier",,.tSC)
			s tSC1=MedOphtalmo.SetValueAt(NoMed,"MFEgrp(1).PRA(1):PractitionerIDNumbers(1).IDNumber")
			s tSC=..SendRequestAsync("WishOphtalmoBruAdtHl7TcpOut",MedOphtalmo) Quit:$$$ISERR(tSC) tSC
        } else {
	        // CWY Send old way
	        s NoMed=pRequest.GetValueAt("MFEgrp(1).STF:PrimaryKeyValueSTF.Identifier",,.tSC)
	        $$$TRACE("New INAMI in 6 : "_NoMed)
	        $$$TRACE("New Message INAMI in 6 : "_NewpRequest.RawContent)
        	s tSC=##class(CHUBXL.DT.WishMedToInfohos).Transform(pRequest,.MedInfohos) Quit:$$$ISERR(tSC) tSC
        	s tSC=##class(CHUBXL.DT.WishMedToOphtalmo).Transform(pRequest,.MedOphtalmo) Quit:$$$ISERR(tSC) tSC
        	s tSC=..SendRequestAsync("WishInfohosAllAdtHl7TcpOut",MedInfohos) Quit:$$$ISERR(tSC) tSC
			s NoMed=MedOphtalmo.GetValueAt("MFEgrp(1).PRA(1):PrimaryKeyValuePRA.Identifier",,.tSC)
			s tSC1=MedOphtalmo.SetValueAt(NoMed,"MFEgrp(1).PRA(1):PractitionerIDNumbers(1).IDNumber")
        	s tSC=..SendRequestAsync("WishOphtalmoBruAdtHl7TcpOut",MedOphtalmo) Quit:$$$ISERR(tSC) tSC
        }
        s tSC=..SendRequestAsync("WishCacheAllMedHl7FcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
      
        
        // Filter Kiné for OXYGEN
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
<Data name="WishMedHl7RoutingDefaultData">
<Subscript>"WishMedHl7Routing"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>WishMedHl7RoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
