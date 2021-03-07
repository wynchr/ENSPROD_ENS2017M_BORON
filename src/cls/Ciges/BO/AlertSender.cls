/// Opération chargé d'envoyer les mails d'alertes lorsque le délais d'inactivité d'un connecteur est dépassé
Class Ciges.BO.AlertSender Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.EMail.OutboundAdapter";

Property Adapter As EnsLib.EMail.OutboundAdapter;

Property defaultRecipient As %String(MAXLEN = "");

Parameter INVOCATION = "Queue";

Method OnMessage(pRequest As Ciges.Message.Alert, Output pResponse As Ens.Response) As %Status
{
	s sc=$$$OK
	try {
		s instanceName=##class(%SYS.System).GetInstanceName()
		s productName=##class(Ciges.Utils).getProductName()
		s mailMessage = ##class(%Net.MailMessage).%New()
		s mailMessage.Subject="Alerte production "_productName_" de "_instanceName_" : "_pRequest.alertRequest.SourceConfigName
		s mailMessage.Charset="iso-8859-1"
		if (pRequest.recipients'="") {
			s ..Adapter.Recipient=..Adapter.Recipient_";"_pRequest.recipients
		}
		$$$TOE(sc,mailMessage.TextData.Write(pRequest.alertRequest.AlertText))
		$$$TOE(sc,..Adapter.SendMail(mailMessage))
		s ..Adapter.Recipient=..defaultRecipient
	} catch (ex) {
		s sc=ex.AsStatus()
	}
	q sc
}

Method OnInit() As %Status
{
	s ..defaultRecipient=..Adapter.Recipient
	q $$$OK
}

}
