Class CHUBXL.BO.OLD.BatchFtpWishOut Extends Ens.BusinessOperation [ ProcedureBlock ]
{

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Property System As %String(TRUNCATE = 1) [ InitialExpression = "NT" ];

Property FileArchivePath As %String(TRUNCATE = 1) [ InitialExpression = "D:\DATA\ENS\FTP\Archive" ];

Property FileNameCase As %String(TRUNCATE = 1) [ InitialExpression = "NOTHING" ];

Parameter ADAPTER = "EnsLib.FTP.OutboundAdapter";

Parameter INVOCATION = "Queue";

Parameter SETTINGS = "AddToMetric,System,FileArchivePath,FileNameCase";

Method writeFtpMessage(pRequest As CHUBXL.DATA.RawMessageStream, Output pResponse As Ens.Response) As %Status
{
	s $zt="exception",tSC=$$$OK
	if ('..Adapter.Connected) {
		$$$TRACE("FTPout - Adapter not connected - trying to reconnect...")
		if ('..Adapter.Connect(2)) {
			$$$TRACE("FTPout - Cannot connect Adapter")
			ztrap "CONN"
		}
	}
	Else {
		$$$TRACE("FTPout - Adapter is connected at "_$zdatetime($h))
	}
	$$$TRACE("FTPout - ConfigName : "_..%ConfigName)
	i ..FileArchivePath '= "" {
		s dir = ..FileArchivePath
		$$$TRACE("directory : "_dir)
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		s dir = dir_"\"_..%ConfigName
		If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
		$$$TRACE("FTPout - Set Archive Path to : "_dir)
	} Else {
		s tSC=$$$EnsError("FTPout - Error - Archive Path not defined")
		$$$TRACE("FTPout - Error - Archive Path not defined")
		Quit tSC
	}
			
	// Get & Send DATA File
	
	s FileName = pRequest.source
	$$$TRACE("FTPout - Put "_FileName)
	Set pDataStream=##class(%FileCharacterStream).%New()
	Set pDataStream.Filename=FileName
	Set tSC=..Adapter.PutStream(FileName, pRequest.payLoad)
	
	if ('tSC) {
		s message="FTPout - Batch ERROR : "_..%ConfigName_" ("_FileName_" at "_$zdt($h)_")"
		d ..SendAlert(##class(Ens.AlertRequest).%New($LB(message,message)))
		$$$TRACE(message)
		$$$TRACE("FTPout - quit & retry processing ...")
		s ..Retry=1
		quit tSC
	}
	else {
		s message="FTPout - Batch OK : "_..%ConfigName_" ("_FileName_" at "_$zdt($h)_")"
		$$$TRACE(message)
	}
	$$$TRACE("FTPout - end of normal processing")
	
end
	$$$TRACE("FTPout ============== writeFtpMessage STOP ================")
	s $zt=""
	Quit tSC
exception
	s tZE=$ze
	$$$LOGWARNING("FTPout - EXCEPTION - Force Adapter to disconnect and Retry")
	d ..Adapter.Disconnect()
	s ..Retry=1
	
	// Read error means no ack/nack received
	i ($g(tZE)["<READ>") { s stat=$$$ISERR(tZE)  g end} 
	// No socket connected
	i ($g(tZE)["<ZCONN>") { s stat=$$$ISERR(tZE) $$$LOGWARNING("FTPout - EXCEPTION - Error : outbound socket not connected ") g end} 
	// Error during STX write
	i ($g(tZE)["<ZBTCP>") { s stat=$$$ISERR(tZE) $$$LOGWARNING("FTPout - EXCEPTION - Error during STX write") g end} 
	// Error during DATA write
	i ($g(tZE)["<ZWTCP>") { s stat=$$$ISERR(tZE) $$$LOGWARNING("FTPout - EXCEPTION - Error during DATA write")  g end} 
	// Error during ETX write or ACK/NAK read
	i ($g(tZE)["<ZETCP>") { s stat=$$$ISERR(tZE)  $$$LOGWARNING("FTPout - EXCEPTION - Error during ETX write or ACK/NAK read") g end} 

		
	s tSC=$$$EnsError("FTPout - EXCEPTION - General Error: "_tZE)
	g end
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="CHUBXL.DATA.RawMessageStream"> 
		<Method>writeFtpMessage</Method>
	</MapItem>
</MapItems>
}

}
