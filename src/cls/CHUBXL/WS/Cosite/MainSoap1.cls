Class CHUBXL.WS.Cosite.MainSoap1 Extends %SOAP.WebClient [ ProcedureBlock ]
{

/// This is the URL used to access the web service.
Parameter LOCATION = "http://10.29.15.251/2.0/Kmehr1/Services/production/1.0/Main.asmx";

/// This is the namespace used by the Service
Parameter NAMESPACE = "http://health.fgov.be/telematics/rsw/cosite/2.0/";

/// Use xsi:type attribute for literal types.
Parameter OUTPUTTYPEATTRIBUTE = 1;

/// Determines handling of Security header.
Parameter SECURITYIN = "ALLOW";

/// This is the name of the Service
Parameter SERVICENAME = "CHUBXL.WS.Cosite";

/// This service supports both SOAP 1.1 and SOAP 1.2.
Parameter SOAPVERSION;

/// Obtenir les liens existants entre deux entités.
Method GetUserLink(Requete As CHUBXL.WS.Cosite.common.GetUserLinkRequest, TimeoutEnSecondes As %Integer(REQUIRED=1)) As CHUBXL.WS.Cosite.common.GetUserLinkResponse [ Final, ProcedureBlock = 1, SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 Quit ..WebMethod("GetUserLink").Invoke($this,"http://health.fgov.be/telematics/rsw/cosite/2.0/GetUserLink",.Requete,.TimeoutEnSecondes)
}

/// Obtenir les liens existants entre deux entités.
Method GetUserLink1(Requete As CHUBXL.WS.Cosite.common.GetUserLinkRequest, TimeoutEnSecondes As %Integer(REQUIRED=1)) As CHUBXL.WS.Cosite.common.GetUserLinkResponse [ Final, ProcedureBlock = 1, SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 Quit ..WebMethod("GetUserLink1","GetUserLink").Invoke($this,"http://health.fgov.be/telematics/rsw/cosite/2.0/GetUserLink",.Requete,.TimeoutEnSecondes)
}

}
