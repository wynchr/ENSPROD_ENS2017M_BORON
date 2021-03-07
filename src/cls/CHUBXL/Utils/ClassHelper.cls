Class CHUBXL.Utils.ClassHelper Extends %RegisteredObject [ ClassType = "", ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
Production ENSPROD

VERSION
-------
DAM	13/04/2018	Initial Version
--------------------------------------------------------------------------------------------------------------------------------
*/
/// Retire les n derniers caractères d'un stream
ClassMethod removeCharFromStream(pStream As %Stream, pChar As %Integer) As %Stream
{
	s oStream=##class(%GlobalBinaryStream).%New()
	d pStream.Rewind()
	for i=1:1:pStream.Size-pChar {
		d oStream.Write(pStream.Read(1))
	}
	q oStream
}

/// Prend une valeur au format $zts et la transforme dans 
/// le time stamp du time zone actuel
/// les daylight savings sont pris en compte pour le moment présent
/// uniquement
/// Return format : $H
ClassMethod ztsToLocalTime(ts As %String) As %String
{
   /// Daylight Savings ?
   SET stamp=$ZTIMESTAMP,clock=$HOROLOG
   SET clocksecs=$EXTRACT(clock,7,11)
   SET stampsecs=$EXTRACT(stamp,7,11)-($ZTIMEZONE*60)
   IF (clocksecs=stampsecs) {
	   s daylight=0
   }
   ELSE {
	   	s daylight=(clocksecs-stampsecs)\3600
   }
   s inc=daylight+((-$ztz)\60)
   if ((inc>0)&&(($P(ts,",",2)+(inc*3600))>86400)) {
	   s return=$p(ts,",",1)+1_","_$TR($J(($P(ts,",",2)+(inc*3600)-86400),5,0)," ",0)
   }
   elseif ((inc<0)&&(($P(ts,",",2)+(inc*3600))<0)) {
	   s return=$p(ts,",",1)-1_","_$TR($J(($P(ts,",",2)+(inc*3600)+86400),5,0)," ",0)
   }
   else {
	   s return=$P(ts,",",1)_","_$TR($J(($P(ts,",",2)+(daylight*3600)+(-$ztz*60)),5,0)," ",0)
   }
   q return
}

ClassMethod purgeProduction(daysToKeep As %Integer, Output deletedDetails As %String) As %Status
{
	Set $ZT = "Trap"
	Set tSC = $$$OK
	k deletedDetails
	s tSC=##class(Ens.Purge).PurgeAll(.deletedDetails,daysToKeep,1,1)
	;s tSC=##class(Ens.Purge).PurgeAll(.deletedDetails,daysToKeep,0,1)
	ztrap:($$$ISERR(tSC)) "PURG"
	k count	
	s tSC=##class(EnsLib.HL7.Message).Purge(.count,daysToKeep,0)
	ztrap:($$$ISERR(tSC)) "PURG"
	s deletedDetails("HL7 Message")=count
	&sql(delete from CHUBXL_DATA.RawMessageString
	where datediff('dd',creationTS,CURRENT_TIMESTAMP)>=:daysToKeep
	)
	s deletedDetails("CHUBXL DATA.RawMessageString")=$G(%ROWCOUNT,0)
	&sql(delete from CHUBXL_DATA.RawMessageStream
	where datediff('dd',creationTS,CURRENT_TIMESTAMP)>=:daysToKeep
	)
	s deletedDetails("CHUBXL DATA.RawMessageStream")=$G(%ROWCOUNT,0)
Done
	Quit tSC
Trap
	Set $ZT=""	
	If ($$$ISERR(tSC)) {
		Do $system.Status.DisplayError(tSC)
	}
	Goto Done
}

/// Renvoie la source d'origine d'un message ensemble
/// Si la méthode est appelée dans le premier BP d'un flux, la valeur 
/// renvoyée est le nom du BS dans la production
ClassMethod getSourceConfigName(pReq As Ens.Request, initialSource As %Boolean = 0) As %String
{
	q:('pReq.%IsA("Ens.Request")) ""
	s id=pReq.%Id()
	&sql(select ID into :headerId from Ens.MessageHeader where messageBodyId=:id)
	q:(SQLCODE'=0) ""
	s header=##class(Ens.MessageHeader).%OpenId(headerId)
	if (initialSource) {
		while (header.SessionId'=header.%Id()) {
			s header=##class(Ens.MessageHeader).%OpenId(header.SessionId)
		}
	}
	q header.SourceConfigName
}

}
