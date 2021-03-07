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

    If (tSourceConfigName = "BdocHudConsmedHl7FcpIn" ) {
	    $$$TRACE("payLoad : "_pRequest.payLoad)
	    s NewMsgHL7=##class(EnsLib.HL7.Message).ImportFromLibraryStream(pRequest.payLoad)
	    $$$TRACE("DocType : "_NewMsgHL7.DocType)
	    $$$TRACE("Name : "_NewMsgHL7.Name)
		;s NewMsgHL7=##class(EnsLib.HL7.Message).%New()
		d NewMsgHL7.DocTypeSet(NewMsgHL7.DocType_":"_NewMsgHL7.Name)
		s NewMsgHL7=NewMsgHL7
		$$$TRACE("Message : "_NewMsgHL7.RawContent)
		s StringMess=NewMsgHL7.RawContent
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
    elseif (tSourceConfigName = "BdocHudMultidosHl7FcpIn" ){
	    s NewMsgHL7=##class(EnsLib.HL7.Message).ImportFromLibraryStream(pRequest.payLoad)
	    $$$TRACE("DocType : "_NewMsgHL7.DocType)
	    $$$TRACE("Name : "_NewMsgHL7.Name)
		;s NewMsgHL7=##class(EnsLib.HL7.Message).%New()
		d NewMsgHL7.DocTypeSet(NewMsgHL7.DocType_":"_NewMsgHL7.Name)
		s NewMsgHL7=NewMsgHL7
		$$$TRACE("Message : "_NewMsgHL7.RawContent)
		s StringMess=NewMsgHL7.RawContent
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
    elseif (tSourceConfigName = "BdocHudRetmedHl7FcpIn" ){
	    s NewMsgHL7=##class(EnsLib.HL7.Message).ImportFromLibraryStream(pRequest.payLoad)
        s tSC=..SendRequestAsync("BdocInfohosAllRetmedHl7FcpOut",NewMsgHL7) Quit:$$$ISERR(tSC) tSC
    }
    elseif (tSourceConfigName = "BdocHudStomedHl7FcpIn" ){
	    s NewMsgHL7=##class(EnsLib.HL7.Message).ImportFromLibraryStream(pRequest.payLoad)
        s tSC=..SendRequestAsync("BdocInfohosAllStomedHl7FcpOut",NewMsgHL7) Quit:$$$ISERR(tSC) tSC
    }
    elseif (tSourceConfigName = "InfohosAllStomedHl7FcpIn" ){
	    s NewMsgHL7=##class(EnsLib.HL7.Message).ImportFromLibraryStream(pRequest.payLoad)
	    s Nadm=NewMsgHL7.FindSegmentValues("ZIM:5")
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
