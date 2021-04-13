Class CHUBXL.WS.HealthConnect.JournalEntryServiceSoap Extends %SOAP.WebClient [ ProcedureBlock ]
{

/// This is the URL used to access the web service.
Parameter LOCATION = "http://10.20.8.156:8080/timestamping/services/JournalEntryService/";

/// This is the namespace used by the Service
Parameter NAMESPACE = "http://schemas.healthconnect.be/timestamping/1_0/";

/// Use xsi:type attribute for literal types.
Parameter OUTPUTTYPEATTRIBUTE = 1;

/// This is the name of the Service
Parameter SERVICENAME = "JournalEntryService";

/// This is the SOAP version supported by the service.
Parameter SOAPVERSION = 1.1;

/// This is the namespace used for types by the Service
Parameter TYPENAMESPACE = "urn:messages:1_0:ws:timestamping:healthconnect:be";

Method AddAttachedJournalEntry(RequestInfo As CHUBXL.WS.HealthConnect.common.RequestInfoType, AttachmentID As %xsd.base64Binary, JournalType As %String) As CHUBXL.WS.HealthConnect.common.ResponseInfoType [ Final, ProcedureBlock = 1, SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 Quit ..WebMethod("AddAttachedJournalEntry","AddAttachedJournalEntryRequest").Invoke(##this,"AddAttachedJournalEntry",.RequestInfo,.AttachmentID,.JournalType)
}

Method AddJournalEntry(RequestInfo As CHUBXL.WS.HealthConnect.common.RequestInfoType, Data As %xsd.base64Binary, JournalType As %String) As CHUBXL.WS.HealthConnect.common.ResponseInfoType [ Final, ProcedureBlock = 1, SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 Quit ..WebMethod("AddJournalEntry","AddJournalEntryRequest").Invoke(##this,"AddJournalEntry",.RequestInfo,.Data,.JournalType)
}

}
