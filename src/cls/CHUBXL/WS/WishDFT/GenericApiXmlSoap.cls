Class CHUBXL.WS.WishDFT.GenericApiXmlSoap Extends %SOAP.WebClient [ ProcedureBlock ]
{

/// This is the URL used to access the web service.
Parameter LOCATION = "http://br400prd:30700/CPOWebProject/services/APIWS";

/// This is the namespace used by the Service
Parameter NAMESPACE = "http://services.webservice.cpo.be.ibm.com";

/// Use xsi:type attribute for literal types.
Parameter OUTPUTTYPEATTRIBUTE = 1;

/// This is the name of the Service
Parameter SERVICENAME = "genericApiXml";

/// This is the SOAP version supported by the service.
Parameter SOAPVERSION = 1.1;

Method genericApiXml(UserId As %String, Password As %String, XmlParam As %String) As %String [ Final, ProcedureBlock = 1, SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 Quit ..WebMethod("genericApiXml","genericApiXml").Invoke(##this,"genericApiXml",.UserId,.Password,.XmlParam)
}

}
