Class CHUBXL.BP.NEW.BdocAllMedicRouting Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BP BDOC MED

VERSION
-------
DAM	10/12/2018	Initial Version

REQUEST
-------
	CHUBXL.DATA.RawMessageStream

SOURCE
------
	BDOC

DESTINATION
-----------
	Infohos
	
MESSAGES
--------
	CHUBXL.DATA.RawMessageStream

PROCESS
-------

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

Method OnRequest(pRequest As CHUBXL.MSG.HL7DPIFile, Output pResponse As Ens.Response) As %Status
{
    
    Set $ZTrap = "ErrorTrap", tSC=$$$OK 

    $$$TRACE("Start BP MedicRouting")

    s tClassName = pRequest.%ClassName(1)
    s tSourceConfigName = ..%PrimaryRequestHeader.SourceConfigName
    s tTargetConfigName = ..%PrimaryRequestHeader.TargetConfigName
    
    $$$TRACE("ClassName : "_tClassName)
    $$$TRACE("SourceConfigName"_tSourceConfigName)
    $$$TRACE("TargetConfigName"_tTargetConfigName)

    If (tSourceConfigName = "BdocHudConsmedHl7FcpIn") {
	    $$$TRACE("payLoad Consmed ")
		$$$TRACE("Message : "_pRequest.HL7.RawContent)
		s StringMess=pRequest.HL7.RawContent
		$$$TRACE("StringMess : "_StringMess)
		f i=1:1 {
			s ORC=$p(StringMess,"ORC",i+1)
			q:ORC=""
			$$$TRACE("ORC("_i_") : *"_ORC_"*")
			s Unit=$p(ORC,"|",18)
			$$$TRACE("Unite : "_Unit)
			s NewUnit=$p($g(^CHUBXL.CONVERUNIT(Unit)),"~",1)
			$$$TRACE("Unite : "_NewUnit)
			s $p(ORC,"|",18)=NewUnit
			s $p(StringMess,"ORC",i+1)=ORC
			$$$TRACE("ORC("_i_") : *"_ORC_"*")
			$$$TRACE("StringMess : "_StringMess)
		}
		s NewMsgHL7=##class(EnsLib.HL7.Message).ImportFromString(StringMess)
        s tSC=..SendRequestAsync("BdocInfohosAllConsmedHl7FcpOut",NewMsgHL7)  Quit:$$$ISERR(tSC) tSC
    }
    elseif (tSourceConfigName = "BdocHudMultidosHl7FcpIn"){
	    $$$TRACE("DocType Multidoc")
		$$$TRACE("Message : "_pRequest.HL7.RawContent)
		s StringMess=pRequest.HL7.RawContent
		$$$TRACE("StringMess : "_StringMess)
		f i=1:1 {
			s RQD=$p(StringMess,"RQD",i+1)
			q:RQD=""
			$$$TRACE("RQD("_i_") : *"_RQD_"*")
			s ZoneUnit=$p(RQD,"|",10)
			s Unit=$p(ZoneUnit,"^",1)
			$$$TRACE("Unite : "_Unit)
			s NewUnit=$p($g(^CHUBXL.CONVERUNIT(Unit)),"~",1)
			$$$TRACE("Unite : "_NewUnit)
			s $p(ZoneUnit,"^",1)=NewUnit
			s $p(RQD,"|",10)=ZoneUnit
			s $p(StringMess,"RQD",i+1)=RQD
			$$$TRACE("RQD("_i_") : *"_RQD_"*")
			$$$TRACE("StringMess : "_StringMess)
		}
		s NewMsgHL7=##class(EnsLib.HL7.Message).ImportFromString(StringMess)
        s tSC=..SendRequestAsync("BdocInfohosAllMultidosHl7FcpOut",NewMsgHL7)   Quit:$$$ISERR(tSC) tSC
    }   
    elseif (tSourceConfigName = "BdocHudRetmedHl7FcpIn"){
	    $$$TRACE("Message retmed")
	    $$$TRACE("Message retmed : "_pRequest.HL7.RawContent)
	    s NewMsgHL7=##class(EnsLib.HL7.Message).ImportFromString(pRequest.HL7.RawContent)
        s tSC=..SendRequestAsync("BdocInfohosAllRetmedHl7FcpOut",NewMsgHL7) Quit:$$$ISERR(tSC) tSC
    }
    elseif (tSourceConfigName = "BdocHudStomedHl7FcpIn"){
	    $$$TRACE("Message stomed")
	    $$$TRACE("Message stomed : "_pRequest.HL7.RawContent)
		s StringMess=pRequest.HL7.RawContent
		$$$TRACE("StringMess : "_StringMess)
		f i=1:1 {
			s ZST=$p(StringMess,"ZST",i+1)
			q:ZST=""
			$$$TRACE("ZST("_i_") : *"_ZST_"*")
			s ZoneUnit=$p(ZST,"|",2)
			s Unit=$p(ZoneUnit," ",1)
			$$$TRACE("Unites : "_Unit)
			s Unit1=$p(Unit,"^",1),Unit2=$p(Unit,"^",2)
			$$$TRACE("Unite1 : "_Unit1)
			$$$TRACE("Unite2 : "_Unit2)
			s NewUnit=$p($g(^CHUBXL.CONVERUNIT(Unit1)),"~",1)
			s NewUnit1=$p($g(^CHUBXL.CONVERUNIT(Unit2)),"~",1)
			$$$TRACE("Unite : "_NewUnit)
			$$$TRACE("Unite1 : "_NewUnit1)

			s ZoneUnit=NewUnit_"^"_NewUnit1_" "_$p(ZoneUnit," ",2,99)

			s $p(ZST,"|",2)=ZoneUnit
			s $p(StringMess,"ZST",i+1)=ZST
			$$$TRACE("ZST("_i_") : *"_ZST_"*")
			$$$TRACE("StringMess : "_StringMess)
		}
	    s NewMsgHL7=##class(EnsLib.HL7.Message).ImportFromString(StringMess)
        s tSC=..SendRequestAsync("BdocInfohosAllStomedHl7FcpOut",NewMsgHL7) Quit:$$$ISERR(tSC) tSC
    }
    elseif (tSourceConfigName = "InfohosAllStomedHl7FcpIn"){
	    $$$TRACE("Message Infohos stomed")
	    $$$TRACE("Message Infohos stomed : "_pRequest.payLoad)
	    s NewMsgHL7=##class(EnsLib.HL7.Message).ImportFromLibraryStream(pRequest.payLoad)
	    s NewMsgHL7.DocType="2.6:MFN_M15"
	    $$$TRACE("Message in : "_NewMsgHL7.RawContent)
	    s Nadm=NewMsgHL7.FindSegmentValues("ZIM:5")
	    s NewUnit=$p(NewMsgHL7.GetValueAt("MFEgrp(1).IIM:InventoryLocation.Text",,.tSC)," ",1)
	    $$$TRACE("Unité old : "_NewUnit)
	    s Unit="",Unit=$o(^CHUBXL.CONVERUNIT(Unit)),OldCodeUnit=""
        While Unit'="" {
	        s CodeUnit=$p(^CHUBXL.CONVERUNIT(Unit),"~",1)
	        i CodeUnit=NewUnit $$$TRACE("Unité : "_CodeUnit_" ---> "_Unit) s OldCodeUnit=Unit
	        s Unit=$o(^CHUBXL.CONVERUNIT(Unit))
        }
	    
	    i $tr(OldCodeUnit," ")'="" {
		    s NewValue=OldCodeUnit_" "_$p(NewMsgHL7.GetValueAt("MFEgrp(1).IIM:InventoryLocation.Text",,.tSC)," ",2,99)
		    s status0=NewMsgHL7.SetValueAt(NewValue,"MFEgrp(1).IIM:InventoryLocation.Text")
	    }
	    $$$TRACE("Message out : "_NewMsgHL7.RawContent)
        i ($tr(Nadm," ")="") ! ($e(Nadm,1)=8) $$$TRACE("Nadm    : "_Nadm) s tSC=..SendRequestAsync("InfohosBdocHudPhaHl7TcpOut",NewMsgHL7) Quit:$$$ISERR(tSC) tSC
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
