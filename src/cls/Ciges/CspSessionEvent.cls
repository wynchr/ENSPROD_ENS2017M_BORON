Class Ciges.CspSessionEvent Extends %CSP.SessionEvents
{

ClassMethod OnStartSession()
{
	d $SYSTEM.License.PublicWebAppUser() 
	Quit $$$OK
}

ClassMethod OnEndSession()
{
	Do ##class(Application.LockingData).unlockBySessionId(%session.SessionId)
	Quit
}

ClassMethod OnTimeout()
{
	Do ##class(Application.LockingData).unlockBySessionId(%session.SessionId)
	Quit
}

}
