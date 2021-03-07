Class CHUBXL.BO.OLD.RawTcpOut Extends Ens.BusinessOperation [ ClassType = "", ProcedureBlock ]
{

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Property SystemSource As %String(TRUNCATE = 1) [ InitialExpression = "Source" ];

Property SystemDestination As %String(TRUNCATE = 1) [ InitialExpression = "Destination" ];

Property FileArchivePath As %String(TRUNCATE = 1);

/// Start of Text
Property STX As %Integer [ InitialExpression = 11 ];

Property ETX As %Integer [ InitialExpression = 4 ];

Property EOT As %Integer [ InitialExpression = 10 ];

Property ACK As %Integer [ InitialExpression = 6 ];

Property NACK As %Integer [ InitialExpression = 15 ];

Parameter ADAPTER = "EnsLib.TCP.OutboundAdapter";

Parameter INVOCATION = "Queue";

Parameter SETTINGS = "AddToMetric,SystemSource,SystemDestination,FileArchivePath,STX,ETX,EOT,ACK,NACK";

Method beginTcp() As %Status
{
	$$$TRACE("TcpOut - BeginTcp (Write STX) ...")
	s st=$$$OK
	$$$TRACE("TcpOut - BeginTcp - Test if adapter is connected at "_$zdatetime($h))
	if ('..Adapter.Connected) {
		$$$TRACE("TcpOut - BeginTcp - Adapter not connected - trying to reconnect...")
		if ('..Adapter.Connect(2)) {
			$$$TRACE("TcpOut - BeginTcp - Cannot connect Adapter")
			ztrap "CONN"
		}
	}
	Else {
		$$$TRACE("TcpOut - BeginTcp - Adapter is connected at "_$zdatetime($h))
	}		
	
	d ..Adapter.Socket.Write($C(..STX),0,.st)
	if (st) {
		$$$TRACE("TcpOut - BeginTcp - Write STX sucessufully at "_$zdatetime($h))
	}
	Else {
		$$$TRACE("TcpOut - BeginTcp - Write STX Failed at "_$zdatetime($h))
	}
	q st
}

Method endTcp() As %Status
{
	$$$TRACE("TcpOut - EndTcp (Write ETX,EOT and Read Acknowledge) ...")	
	s st=$$$OK
	$$$TRACE("TcpOut - EndTcp - Test if adapter is connected at "_$zdatetime($h))
	if ('..Adapter.Connected) {
		$$$TRACE("TcpOut - EndTcp - Adapter not connected - trying to reconnect...")
		if ('..Adapter.Connect(2)) {
			$$$TRACE("TcpOut - EndTcp - Cannot connect Adapter")
			ztrap "CONN"
		}
	}
	Else {
		$$$TRACE("TcpOut - EndTcp - Adapter is connected at "_$zdatetime($h))
	}
	d ..Adapter.Socket.Write($C(..ETX,..EOT),1,.st)
	if (st) {
		$$$TRACE("TcpOut - EndTcp - Write ETX,EOT sucessufully at "_$zdatetime($h))
	}
	Else {
		$$$TRACE("TcpOut - EndTcp - Write ETX,EOT Failed at "_$zdatetime($h))
	}
	q:('st) st
	s len=4
	;s timeOut=4
	s timeOut=..Adapter.ReadTimeout
	$$$TRACE("TcpOut - EndTcp - TestConnection at "_$zdatetime($h))
	d ..Adapter.TestConnection()
	
	$$$TRACE("TcpOut - EndTcp - Reading reply at "_$zdatetime($h))
	s resp=..Adapter.Socket.Read(.len,.timeOut,.st)
	if (st) {
		$$$TRACE("TcpOut - EndTcp - Read Acknowledge sucessufully at "_$zdatetime($h))
	}
	Else {
		$$$TRACE("TcpOut - EndTcp - Read Acknowledge Failed at "_$zdatetime($h))
	}
	q:('st) st

	$$$TRACE("TcpOut - EndTcp - Reply received at "_$zdatetime($h)_" with len "_len_" and timeout "_timeOut_" and len resp="_$l(resp))
	s ackLog=""
	f x=1:1:$l(resp) { s ackLog=ackLog_$a($e(resp,x,x))_" "}
	$$$TRACE("TcpOut - EndTcp - Response received - codes: <"_ackLog_">")
	s ackNack=$E(resp,2,2)
	;; Test ackNak = -1 for Medical Viewer & DIA
	if ((ackNack'=$c(..ACK)) & ($a(ackNack)'=-1) & (ackNack'=$c(..EOT))){
	;;if ((ackNack'=$c(..ACK))){		
		s ..Retry=1
		q $$$ERROR("TcpOut - EndTcp - nack OR timeout received ["_$a(ackNack)_"]")
	}

	q st
}

Method ArchiveMsg(msg As %String) As %Status
{
	$$$TRACE("TcpOut - Archive message ...")	
	s st=$$$OK
	
	s dir=..FileArchivePath
	If '##class(%Library.File).DirectoryExists(dir) Set tSC=##class(%Library.File).CreateDirectory(dir) If 'tSC Quit tSC
	s fileName=dir_"\"_..SystemSource_"_"_..SystemDestination_"_"_##class(Ens.Util.File).CreateTimestamp("","%Y%m%d")_".HL7"
	$$$TRACE("TcpOut - write to file "_fileName)
	$$$TRACE("TcpOut - msg : "_msg)
	s FileOut = ##class(%File).%New(fileName)
	d FileOut.Open("AWS")
	d FileOut.WriteLine(msg)
	d FileOut.%Save()
	d FileOut.Close()
	q st
}

/// Envoi du payload string en direct sur tcp (SIBELMED) => Not used in production !!!
Method writeRawTcpString(pRequest As CHUBXL.MSG.SibelmedFtransHeader, Output pResponse As Ens.Response) As %Status
{

	s $zt="exception", stat=$$$OK
	
	$$$TRACE("============== WriteTcp START ================")
	

	s stat=..beginTcp()
	if ('stat) {
		$$$TRACE($system.Status.GetOneErrorText(stat))
		ztrap "BTCP"
	}
	$$$TRACE("TcpOut - Write Message ...")
	d ..Adapter.Socket.Write(pRequest.rawMsg.payLoad,0,.st)
	if ('st) {
		$$$TRACE($system.Status.GetOneErrorText(st))
		ztrap "WTCP"
	}
	s stat=..endTcp()
	if ('stat) {
		$$$TRACE($system.Status.GetOneErrorText(stat))
		ztrap "ETCP"
	}
	d:(stat) ##class(Ens.BusinessMetric).SetMetric("ChubxlGeneralMetric","lastMessageReceived",$ZDT($h,3),..%ConfigName)	
	$$$TRACE("TCP raw message sent ["_pRequest.rawMsg.payLoad_"]")
end
	$$$TRACE("============== WriteTcp STOP ================")
	s $zt=""
	q stat
exception
	s tZE=$ze
	$$$LOGWARNING("EXCEPTION - Force Adapter to disconnect and Retry")
	d ..Adapter.Disconnect()
	s ..Retry=1
	// Read error means no ack/nack received
	i ($g(tZE)["<READ>") { s stat=$$$ISERR(tZE)  g end} 
	// No socket connected
	i ($g(tZE)["<ZCONN>") { s stat=$$$ISERR(tZE) $$$LOGWARNING("EXCEPTION - Error : outbound socket not connected ") g end} 
	// Error during STX write
	i ($g(tZE)["<ZBTCP>") { s stat=$$$ISERR(tZE) $$$LOGWARNING("EXCEPTION - Error during STX write") g end} 
	// Error during DATA write
	i ($g(tZE)["<ZWTCP>") { s stat=$$$ISERR(tZE) $$$LOGWARNING("EXCEPTION - Error during DATA write")  g end} 
	// Error during ETX write or ACK/NAK read
	i ($g(tZE)["<ZETCP>") { s stat=$$$ISERR(tZE)  $$$LOGWARNING("EXCEPTION - Error during ETX write or ACK/NAK read") g end} 
	s stat=$$$EnsError("EXCEPTION - General Error: "_tZE)
	g end
}

/// Envoi du payload stream en direct sur tcp (OMNIPRO) => Not used in production !!!
Method writeRawTcpStream(pRequest As %RegisteredObject, Output pResponse As Ens.Response) As %Status
{
	

	s $zt="exception", stat=$$$OK
	
	$$$TRACE("============== WriteTcp START ================")
	

	s stat=..beginTcp()
	if ('stat) {
		$$$TRACE($system.Status.GetOneErrorText(stat))
		ztrap "BTCP"
	}
	$$$TRACE("TcpOut - Write Message ...")
	$$$TRACE("TcpOut - "_outString)
	//d pRequest.rawMsg.payLoad.OutputToDevice()
	d pRequest.rawMsg.payLoad.Rewind()
	while ('pRequest.rawMsg.payLoad.AtEnd) {
		d ..Adapter.Socket.Write(pRequest.rawMsg.payLoad.Read(32000),0,.st)
		q:'st
	}
	if ('st) {
		$$$TRACE($system.Status.GetOneErrorText(st))
		ztrap "WTCP"
	}
	s stat=..endTcp()
	if ('stat) {
		$$$TRACE($system.Status.GetOneErrorText(stat))
		ztrap "ETCP"
	}
	d:(stat) ##class(Ens.BusinessMetric).SetMetric("ChubxlGeneralMetric","lastMessageReceived",$ZDT($h,3),..%ConfigName)		
	$$$TRACE("TcpOut - raw message sent ["_pRequest.rawMsg.payLoad.Read(256)_"]")

end
	$$$TRACE("============== WriteTcp STOP ================")
	s $zt=""
	q stat
exception
	s tZE=$ze
	$$$LOGWARNING("EXCEPTION - Force Adapter to disconnect and Retry")
	d ..Adapter.Disconnect()
	s ..Retry=1
	// Read error means no ack/nack received
	i ($g(tZE)["<READ>") { s stat=$$$ISERR(tZE)  g end} 
	// No socket connected
	i ($g(tZE)["<ZCONN>") { s stat=$$$ISERR(tZE) $$$LOGWARNING("EXCEPTION - Error : outbound socket not connected ") g end} 
	// Error during STX write
	i ($g(tZE)["<ZBTCP>") { s stat=$$$ISERR(tZE) $$$LOGWARNING("EXCEPTION - Error during STX write") g end} 
	// Error during DATA write
	i ($g(tZE)["<ZWTCP>") { s stat=$$$ISERR(tZE) $$$LOGWARNING("EXCEPTION - Error during DATA write")  g end} 
	// Error during ETX write or ACK/NAK read
	i ($g(tZE)["<ZETCP>") { s stat=$$$ISERR(tZE)  $$$LOGWARNING("EXCEPTION - Error during ETX write or ACK/NAK read") g end} 
	s stat=$$$EnsError("EXCEPTION - General Error: "_tZE)
	g end
}

/// Envoi du payload stream en direct sur tcp (HL7)
Method writeRawTcpHL7(pRequest As EnsLib.HL7.Message, Output pResponse As Ens.Response) As %Status
{
	s $zt="exception", stat=$$$OK
	
	$$$TRACE("============== WriteTcp START ================")
	
	// BeginTcp
	s stat=..beginTcp()
	if ('stat) {
		$$$TRACE($system.Status.GetOneErrorText(stat))
		ztrap "BTCP"
	}
	// Write Message
	$$$TRACE("TcpOut - Write Message ...")
	//	w pRequest.RawContent
	$$$TRACE("TcpOut - raw message to send ["_pRequest.RawContent_"]")
	s st=pRequest.OutputToIOStream(..Adapter.Socket)
	if ('st) {
		$$$TRACE($system.Status.GetOneErrorText(st))
		ztrap "WTCP"
	}
	// EndTcp
	s stat=..endTcp()
	if ('stat) {
		$$$TRACE($system.Status.GetOneErrorText(stat))
		ztrap "ETCP"
	}
	// ArchiveMsg
		if ..FileArchivePath '= "" {
			s stat=..ArchiveMsg(pRequest.RawContent)
			if ('stat) {
				$$$TRACE($system.Status.GetOneErrorText(stat))
				ztrap "EARC"
			}
		}
	// Adjust Metrics
	d:(stat) ##class(Ens.BusinessMetric).SetMetric("ChubxlGeneralMetric","lastMessageReceived",$ZDT($h,3),..%ConfigName)		
	$$$TRACE("TcpOut - raw ack message sent ["_pRequest.RawContent_"]")
	

end
	$$$TRACE("============== WriteTcp STOP ================")
	s $zt=""
	q stat
exception
	s tZE=$ze
	$$$LOGWARNING("EXCEPTION - Force Adapter to disconnect and Retry")
	d ..Adapter.Disconnect()
	s ..Retry=1
	// Read error means no ack/nack received
	i ($g(tZE)["<READ>") { s stat=$$$ISERR(tZE)  g end} 
	// No socket connected
	i ($g(tZE)["<ZCONN>") { s stat=$$$ISERR(tZE) $$$LOGWARNING("EXCEPTION - Error : outbound socket not connected ") g end} 
	// Error during STX write
	i ($g(tZE)["<ZBTCP>") { s stat=$$$ISERR(tZE) $$$LOGWARNING("EXCEPTION - Error during STX write") g end} 
	// Error during DATA write
	i ($g(tZE)["<ZWTCP>") { s stat=$$$ISERR(tZE) $$$LOGWARNING("EXCEPTION - Error during DATA write")  g end} 
	// Error during ETX write or ACK/NAK read
	i ($g(tZE)["<ZETCP>") { s stat=$$$ISERR(tZE)  $$$LOGWARNING("EXCEPTION - Error during ETX write or ACK/NAK read") g end} 
	s stat=$$$EnsError("EXCEPTION - General Error: "_tZE)
	g end
}

/// Envoi du payload string en direct sur tcp (DIALYSE)
Method writeRawTcpStringDIA(pRequest As CHUBXL.MSG.HL7Dialyse, Output pResponse As Ens.Response) As %Status
{

	s $zt="exception", stat=$$$OK
	
	$$$TRACE("============== WriteTcp START ================")
	
	// BeginTcp
	s stat=..beginTcp()
	if ('stat) {
		$$$TRACE($system.Status.GetOneErrorText(stat))
		ztrap "BTCP"
	}
	
	// Write Message
	$$$TRACE("TcpOut - Write Message ...")	
	d ..Adapter.Socket.Write(pRequest.Message,0,.st)
	if ('st) {
		$$$TRACE($system.Status.GetOneErrorText(st))
		ztrap "WTCP"
	}
	// EndTcp
	s stat=..endTcp()
	if ('stat) {
		$$$TRACE($system.Status.GetOneErrorText(stat))
		ztrap "ETCP"
	}
	
	// ArchiveMsg
		if ..FileArchivePath '= "" {
			s stat=..ArchiveMsg(pRequest.Message)
			if ('stat) {
				$$$TRACE($system.Status.GetOneErrorText(stat))
				ztrap "EARC"
			}
		}
	// Adjust Metrics
	d:(stat) ##class(Ens.BusinessMetric).SetMetric("ChubxlGeneralMetric","lastMessageReceived",$ZDT($h,3),..%ConfigName)	
	$$$TRACE("TcpOut - raw message sent ["_pRequest.Message_"]")
end
	$$$TRACE("============== WriteTcp STOP ================")
	s $zt=""
	q stat
exception
	s tZE=$ze
	$$$LOGWARNING("EXCEPTION - Force Adapter to disconnect and Retry")
	d ..Adapter.Disconnect()
	s ..Retry=1
	// Read error means no ack/nack received
	i ($g(tZE)["<READ>") { s stat=$$$ISERR(tZE)  g end} 
	// No socket connected
	i ($g(tZE)["<ZCONN>") { s stat=$$$ISERR(tZE) $$$LOGWARNING("EXCEPTION - Error : outbound socket not connected ") g end} 
	// Error during STX write
	i ($g(tZE)["<ZBTCP>") { s stat=$$$ISERR(tZE) $$$LOGWARNING("EXCEPTION - Error during STX write") g end} 
	// Error during DATA write
	i ($g(tZE)["<ZWTCP>") { s stat=$$$ISERR(tZE) $$$LOGWARNING("EXCEPTION - Error during DATA write")  g end} 
	// Error during ETX write or ACK/NAK read
	i ($g(tZE)["<ZETCP>") { s stat=$$$ISERR(tZE)  $$$LOGWARNING("EXCEPTION - Error during ETX write or ACK/NAK read") g end} 
	// Error during Archiving
	i ($g(tZE)["<ZEARC>") { s stat=$$$ISERR(tZE)  $$$LOGWARNING("EXCEPTION - Error during Archiving") g end} 
	s stat=$$$EnsError("EXCEPTION - General Error: "_tZE)
	g end
}

/// Envoi du payload string en direct sur tcp (DIALYSE)
Method writeRawTcpStringQuadrat(pRequest As CHUBXL.DATA.RawMessageStream, Output pResponse As Ens.Response) As %Status
{

	s $zt="exception", stat=$$$OK
	
	$$$TRACE("============== WriteTcp START ================")
	
	// BeginTcp
	s stat=..beginTcp()
	if ('stat) {
		$$$TRACE($system.Status.GetOneErrorText(stat))
		ztrap "BTCP"
	}
	d pRequest.payLoad.Rewind()
	s MsgOut=pRequest.payLoad.Read(3500000)
	$$$TRACE("Message ("_MsgOut_")")
	// Write Message
	$$$TRACE("TcpOut - Write Message ...")
	d ..Adapter.Socket.Write(MsgOut,0,.st)
	if ('st) {
		$$$TRACE($system.Status.GetOneErrorText(st))
		ztrap "WTCP"
	}
	// EndTcp
	s stat=..endTcp()
	if ('stat) {
		$$$TRACE($system.Status.GetOneErrorText(stat))
		ztrap "ETCP"
	}
	
	// ArchiveMsg
		if ..FileArchivePath '= "" {
			s stat=..ArchiveMsg(MsgOut)
			if ('stat) {
				$$$TRACE($system.Status.GetOneErrorText(stat))
				ztrap "EARC"
			}
		}
	// Adjust Metrics
	d:(stat) ##class(Ens.BusinessMetric).SetMetric("ChubxlGeneralMetric","lastMessageReceived",$ZDT($h,3),..%ConfigName)	
	$$$TRACE("TcpOut - raw message sent ["_MsgOut_"]")
end
	$$$TRACE("============== WriteTcp STOP ================")
	s $zt=""
	q stat
exception
	s tZE=$ze
	$$$LOGWARNING("EXCEPTION - Force Adapter to disconnect and Retry")
	d ..Adapter.Disconnect()
	s ..Retry=1
	// Read error means no ack/nack received
	i ($g(tZE)["<READ>") { s stat=$$$ISERR(tZE)  g end} 
	// No socket connected
	i ($g(tZE)["<ZCONN>") { s stat=$$$ISERR(tZE) $$$LOGWARNING("EXCEPTION - Error : outbound socket not connected ") g end} 
	// Error during STX write
	i ($g(tZE)["<ZBTCP>") { s stat=$$$ISERR(tZE) $$$LOGWARNING("EXCEPTION - Error during STX write") g end} 
	// Error during DATA write
	i ($g(tZE)["<ZWTCP>") { s stat=$$$ISERR(tZE) $$$LOGWARNING("EXCEPTION - Error during DATA write")  g end} 
	// Error during ETX write or ACK/NAK read
	i ($g(tZE)["<ZETCP>") { s stat=$$$ISERR(tZE)  $$$LOGWARNING("EXCEPTION - Error during ETX write or ACK/NAK read") g end} 
	// Error during Archiving
	i ($g(tZE)["<ZEARC>") { s stat=$$$ISERR(tZE)  $$$LOGWARNING("EXCEPTION - Error during Archiving") g end} 
	s stat=$$$EnsError("EXCEPTION - General Error: "_tZE)
	g end
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="CHUBXL.MSG.SibelmedFtransHeader"> 
		<Method>writeRawTcpString</Method>
	</MapItem>
	<MapItem MessageType="CHUBXL.MSG.Omnipro"> 
		<Method>writeRawTcpStream</Method>
	</MapItem>
	<MapItem MessageType="EnsLib.HL7.Message"> 
		<Method>writeRawTcpHL7</Method>
	</MapItem>
	<MapItem MessageType="CHUBXL.MSG.HL7Dialyse"> 
		<Method>writeRawTcpStringDIA</Method>
	</MapItem>
	<MapItem MessageType="CHUBXL.DATA.RawMessageStream"> 
		<Method>writeRawTcpStringQuadrat</Method>
	</MapItem>
</MapItems>
}

}
