Class CHUBXL.AD.TCPInboundDelimitedAdaper Extends EnsLib.TCP.InboundAdapter [ ClassType = "", ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
Production ENSPROD

VERSION
-------
CWY	25/07/2018	Initial Version

REMARQUES
---------
Adaptateur utilisé avec les anciennes enveloppes
A ne plus utilisé lorsque tout sera passé en MMLP
--------------------------------------------------------------------------------------------------------------------------------
*/
/// If non-zero, stay connected to the remote system between handling Requests until idle for this number of seconds. A value of -1 means never disconnect.
Property StayConnected As %Numeric(MINVAL = -1) [ InitialExpression = -1 ];

/// Determine how many out of sequence starter bytes (that is, received before a
/// terminator byte) are allowed before the read is interrupted
Property AllowedOutOfSequenceStarters As %Integer(MINVAL = 0) [ InitialExpression = 1 ];

/// Start of message character (numeric code!)
Property Starter As %Integer(MAXVAL = 255, MINVAL = 0) [ InitialExpression = 11 ];

/// EndOfText character (numeric code!)
Property EndOfText As %Integer(MAXVAL = 255, MINVAL = 0) [ InitialExpression = 4 ];

/// Terminator character (numeric code!)
Property Terminator As %Integer(MAXVAL = 255, MINVAL = 0) [ InitialExpression = 10 ];

/// Positive acknoledgement
Property Ack As %Integer [ InitialExpression = 6 ];

/// Negative acknoledgement
Property Nack As %Integer [ InitialExpression = 15 ];

/// Name of the Connection ( used in monitoring and control )
Property ConnectionName As %String(TRUNCATE = 1) [ InitialExpression = "SibelmedTcpIn" ];

/// Name of the source ( used to identify RawMessageString and RawMessageStream records )
Property SourceName As %String(TRUNCATE = 1) [ Required ];

/// Use of a stream to store the message ?
Property UseStream As %Boolean [ InitialExpression = 0, Required ];

/// How many messages maximum to receive for each iteration.
/// This is a <b>performance setting</b> to get the most of each call interval.
/// If set to 1, at most one message per second will be treated.
/// If set to a very high value, it may take a long time to stop 
/// the production if there are many messages on the line.
/// As a rule of thumb, keep slightly above the average number of messages received per
/// callinterval -- this will ensure that the system shows no latency.
Property MaxMessagesPerIteration As %Integer(MAXVAL = 99999, MINVAL = 1) [ InitialExpression = 9999 ];

Parameter SETTINGS = "Starter,EndOfText,Terminator,MaxMessagesPerIteration,AllowedOutOfSequenceStarters,Ack,Nack,ConnectionName,SourceName,UseStream";

/// This method will wait for a starter character, read a message to a terminator character,
/// and send it to the business host. At each invokation of this method (as configured at the
/// business host), it will retrieve maximum <em>MaxMessagesPerIteration</em> messages from the line.
/// An iteration of this method will end under the following conditions:
/// <li>No starter is received and no character waits on the line</li>
/// <li>Connection goes down at any time</li>
/// <li><em>MaxMessagesPerIteration</em> messages have been processed</li>
/// <li>Less than <em>MaxMessagesPerIteration</em> were received, but no characters wait on the line</li>
/// Conversely, the method will not return if the connection stays up and no terminator
/// nor starter is received on the line (including if no character is ever reveived). 
/// <b>In this case Ensemble won't stop gracefully</b>; however, this is an <u>exceptional case</u>
/// because it means that <b>the data stream is totally incorrect</b> (a starter is received, but no 
/// terminator nor any other starter is ever received afterwards). In this case, it is necessary to 
/// cut the TCP connection from the source to let Ensemble stop.
Method OnConnected() As %Status
{
	$$$TRACE("Enter OnConnected() Method")
	;s ..StayConnected=-1
	s $zt="exception", stat=$$$OK, c=-1, messagesReceived=0
	// mise à jout de l'état de la connexion
	s tConnectionName=..ConnectionName
	s endOfTextFound=0
	s:tConnectionName="" tConnectionName="undef"
	s ^CHUBXL.TCPConnection(tConnectionName)=1
	;$$$TRACE("Connected")
	while (messagesReceived<..MaxMessagesPerIteration)
	{
		s outOfSeqStart=0
		// Consume all characters in the buffers until a starter is reached.
		// The end of buffer is detected when a timeout happens.
		for  
		{ 
			r *c:..ReadTimeout 
			g:'$test end	// NOT $test means timeout -- wait for next iteration of adapter
			q:(c=..Starter)
		}
		// From this point, we assume that a full message will be received (that is,
		// up to a terminator). We have 2 securities against endless loops: regularly
		// check whether the connection is up, and check for out of sequence starters.
		// Timeouts are assumed to be due to a slow line and are hence retried indefinitely.
		if (..UseStream) {
			s msg=##class(%GlobalBinaryStream).%New()
		}
		else {
			s msg=""
		}
		while (1)
		{
			s endOfTextFound=($G(c)=..EndOfText)
			if (endOfTextFound) {
				$$$TRACE("endoftext found")
			}
			r *c:..ReadTimeout
			s timeout='$test
			continue:(timeout)&&(..Connected)	// Timeout and connection up: continue
			// Timeout and connection down: no character to process!
			// In case of connection down, return status must be "OK".
			i (timeout) { $$$LOGWARNING("Connection down -- discarding incomplete message!") s stat=$$$OK  g end} 
			// No timeout
			// Is this End of text ?
			
			q:((c=..Terminator)&&(endOfTextFound))	// Terminator found: process message even if connection is down
			// Check for out of sequence start characters
			i (c=..Starter) {
				$$$LOGWARNING("Out of sequence start character encountered on stream!")
				s outOfSeqStart=outOfSeqStart+1
				i (outOfSeqStart>..AllowedOutOfSequenceStarters) {
					s stat=$$$EnsError("More than "_..AllowedOutOfSequenceStarters_" out of sequence starters received!")  g end
				} 
				else { 
					if (..UseStream) {
						s msg=##class(%GlobalBinaryStream).%New()
					}
					else {
						s msg=""
					} 
					continue
				}
			} else {
				if (..UseStream) {
					d msg.Write($c(c))
				}
				else {
					s msg=msg_$c(c)
				}				
				
			}
			// Connection down before terminator is received: stop and discard incomplete message
			i ('..Connected) { $$$LOGWARNING("Connection down -- discarding incomplete message!") s stat=$$$OK  g end} 
		}
		// Sauvegarde du message entrant
		if (..UseStream) {
			// skip du caractère EndOfText
			s msg=##class(CHUBXL.Utils.ClassHelper).removeCharFromStream(msg,1)
			s stat=##class(CHUBXL.DATA.RawMessageStream).saveMessage(msg,..SourceName,.objMsg)
			$$$TRACE("sauvegarde du message ("_msg.Size_" length)")
			}
		else {
			// skip du caractère EndOfText
			s msg=$E(msg,1,$L(msg)-1)
			s stat=##class(CHUBXL.DATA.RawMessageString).saveMessage(msg,..SourceName,"TCPIN",.objMsg)
			$$$TRACE("sauvegarde du message ("_$l(msg)_" length)")
		}
		q:('stat) 
		
		// envoi du msg au business service
		s stat=..BusinessHost.ProcessInput(objMsg, .out)  g:$$$ISERR(stat) end

		// envoi de l'ack
 		$$$TRACE("Sending Ack "_..Starter_..Ack_..EndOfText_..Terminator)
		u ..Device w $char(..Starter)_$c(..Ack)_$char(..EndOfText)_$char(..Terminator),!

		s messagesReceived=messagesReceived+1
	} // End of main while loop

end
	s $zt=""
	q stat
exception
	s tZE=$ze
	// Read error means connection dropped. No error is needed as the ancestor class 
	// will cleanly cut the connection and report!the disconnection in the log.
	i ($g(tZE)["<READ>") { s stat=$$$OK  g end} 
	s stat=$$$EnsError("General Error: "_tZE)
	g end
}

Method OnTearDown() As %Status
{
	$$$TRACE("Enter OnTearDown() Method")
	Quit:""=..Device $$$OK
	Do ..Disconnect()
	Set $ZT="Trap"
	Use ..OldIO
	Close ..Device
Exit
	// mise à jout de l'état de la connexion
	s tConnectionName=..ConnectionName
	s:tConnectionName="" tConnectionName="undef"
	s ^CHUBXL.TCPConnection(tConnectionName)=0
	Quit $$$OK
Trap
	Set $ZT="",tSC=$$$EnsSystemError
	Goto Exit
}

Method Disconnect()
{
	$$$TRACE("Enter Disconnect() Method")
	Set $ZT="Trap",tSC=$$$OK
	
	If ..Connected {
		Set tTxt="Disconnecting from "_..IOAddr
		If ..%logConnections { $$$LOGINFO(tTxt) } Else { $$$sysTRACE(tTxt) }
	}
	If ""=..%outIPAddr&&(""'=..Device) {
		#; go ahead and try to disconnect even if we think we're already disconnected - we'll just trap out or fail if we already are
		Use ..Device Write *-2
	}
Exit
	Set ..IOAddr="", ..Connected=0
	Use:$IO=..Device ..OldIO
	#; If connected outbound or spawned we should close the socket right now; non-empty $zu(53) means it's a tcp spawned child worker job
	#; If using /CLOSELISTEN, we must close and reopen in order to be able to listen again
	Set tSpawned=(..JobPerConnection&&(""'=$ZU(53)))
	If ""'=..Device && ((""'=..%outIPAddr)||(..QSize<=0)||tSpawned) Close ..Device  Set ..Device=""
	Set:tSpawned ..BusinessHost.%QuitTask=1
	// CHUBXL CUSTOM CODE STARTS HERE
	// mise à jout de l'état de la connexion
	s tConnectionName=..ConnectionName
	s:tConnectionName="" tConnectionName="undef"
	s ^CHUBXL.TCPConnection(tConnectionName)=0	
	// CHUBXL CUSTOM CODE ENDS HERE
	Quit
Trap
 	Set $ZT="",tSC=$$$SystemError
	Goto Exit
}

}
