Class Application.LockingData Extends (%Persistent, Ciges.CspUtils, Ciges.TStamp)
{

/// jobnumber ou sessionId en fonction de typeOfLock
Property keyOfLock As %String;

/// nom de la classe de l'objet verrouillé
Property lockedClassName As %String;

/// id de l'objet verrouillé
Property lockingObjectId As %String;

Property obj As %Persistent [ Transient ];

/// type de verrouillage ("CSP" ou "JOB")
Property typeOfLock As %String;

/// compteur (usage interne uniquement)
Property cpt As %Integer [ InitialExpression = 1 ];

Parameter TIMEWAITBETWEENATTEMPT = 0.5;

Index uniqueI On (lockedClassName, lockingObjectId) [ Unique ];

ClassMethod lock(className As %String, id As %String, keyOfLock As %String = "", typeOfLock As %String = "CSP", timeOut As %Integer = 10) As %Status
{
	Quit:$g(^BDOC.Param("LOCKING",className),1)=0 $$$OK 
	s obj = ..getObjByClassNameAndId(className,id)
	Quit:'$ISOBJECT(obj) $system.Status.Error(5001,$$$FormatText($$$Text("Objet non ouvert pour la classe %1 avec l'ID = %2"),className,id))
	s sc = $$$OK
	s i = 0
	if (typeOfLock'="CSP") {
		s cpt = (timeOut/..#TIMEWAITBETWEENATTEMPT)
		While (i<cpt) {
			if (..isLocked(className,id,.lockId)) {
				s sc = $system.Status.Error(5001,$$$FormatText($$$Text("Impossible de verrouiller, car cet enregistrement est déjà %1"),..getInfoLock(lockId)))				
				s i = $i(i)
				hang ..#TIMEWAITBETWEENATTEMPT
			}else{
				s sc=$$$OK
				s i = cpt+1
			}
		}
	}else{
		if (..isLocked(className,id,.lockId)) {
			s sc = $system.Status.Error(5001,$$$FormatText($$$Text("Impossible d'acquérir un accès exclusif, car cet enregistrement est déjà %1"),..getInfoLock(lockId)))
			
		}else{
			s sc=$$$OK
		}
	}
	
	if ($$$ISOK(sc)) {
		s lock = ..%New(obj, keyOfLock, typeOfLock)
		s sc = lock.%Save()
	}
	Quit sc
}

ClassMethod incrementLock(className As %String, id As %String) As %Status
{
	Quit:$g(^BDOC.Param("LOCKING",className),1)=0 $$$OK 
	s obj = ..getObjByClassNameAndId(className,id)
	Quit:'$ISOBJECT(obj) $system.Status.Error(5001,$$$FormatText($$$Text("Objet non ouvert className: %1 - id : %2"),className,id))
	s sc = $$$OK
	if (..isLocked(className,id,.lockId)) {
		#dim lock As Application.LockingData
		s lock = ..%OpenId(lockId,,.sc)
		if ($$$ISOK(sc)) {
			s lock.cpt = (lock.cpt+1)
			s sc = lock.%Save()
		}
	}else{
		s sc = $system.Status.Error(5001,$$$Text("Enregistrement non verrouillé."))
	}
	Quit sc
}

ClassMethod decrementLock(className As %String, id As %String) As %Status
{
	Quit:$g(^BDOC.Param("LOCKING",className),1)=0 $$$OK 
	s obj = ..getObjByClassNameAndId(className,id)
	Quit:'$ISOBJECT(obj) $system.Status.Error(5001,$$$FormatText($$$Text("Objet non ouvert className: %1 - id : %2"),className,id))
	s sc = $$$OK
	if (..isLocked(className,id,.lockId)) {
		#dim lock As Application.LockingData
		s lock = ..%OpenId(lockId,,.sc)
		if ($$$ISOK(sc)) {
			s lock.cpt = (lock.cpt-1)
			s sc = lock.%Save()
			if ($$$ISOK(sc)) {
				s:lock.cpt=0 sc = ..unlock(className,id)	//on unlock si compteur est à 0
			}
		}
	}
	Quit sc
}

ClassMethod unlock(className As %String, id As %String) As %Status
{
	Quit:$g(^BDOC.Param("LOCKING",className),1)=0 $$$OK 
	;s obj = ..getObjByClassNameAndId(className,id)
	;Quit:'$ISOBJECT(obj) $system.Status.Error(5002,$$$FormatText($$$Text("Objet non ouvert %1 className: %2","ciges",$$^GetLang()),className,id))
	s sc = $$$OK
	if (..isLocked(className,id,.lockId)) {
		s sc = ##class(Application.LockingData).%DeleteId(lockId)
	}
	Quit sc
}

ClassMethod isLocked(className As %String, id As %String, ByRef lockId As %Integer = "") As %Boolean
{
	Quit:$g(^BDOC.Param("LOCKING",className),1)=0 0
	;s obj = ..getObjByClassNameAndId(className,id)
	;Quit:'$ISOBJECT(obj) 0
	s lockId = $o(^BDOC.LockingDataI("uniqueI"," "_$zcvt(className,"U")," "_$zcvt(id,"U"),""))
	if (lockId'="") {
		#dim lock As Application.LockingData
		s lock = ..%OpenId(lockId,,.sc)
		if ($$$ISOK(sc)) {
			if (lock.typeOfLock="CSP") {
				if ('##class(%CSP.Session).%ExistsId(lock.keyOfLock)) {
					s sc = ##class(Application.LockingData).%DeleteId(lockId)
					s:($$$ISOK(sc)) lockId=""
				}
			}elseif(lock.typeOfLock="JOB") {
				// gérer par ^%ZSTOP
			}
		}
	}
	Quit (lockId'="")
}

ClassMethod getObjByClassNameAndId(className As %String, id As %String) As %Persistent
{
	try{
		s obj = $ZOBJCLASSMETHOD(className,"%OpenId",id)
	}catch(e) {
		s obj = ""
	}
	Quit obj
}

ClassMethod unlockBySessionId(sessionId As %String) As %Status
{
	&sql(DELETE Application.LockingData WHERE keyOfLock=:sessionId and typeOfLock='CSP')
	Quit ((SQLCODE=0)||(SQLCODE=100))
}

ClassMethod unlockByJobNumber(jobNumber As %String) As %Status
{
	&sql(DELETE Application.LockingData WHERE keyOfLock=:jobNumber and typeOfLock='JOB')
	Quit ((SQLCODE=0)||(SQLCODE=100))
}

ClassMethod unlockByUserId(userId As %Integer) As %Status
{
	&sql(DELETE Application.LockingData WHERE userCreation=:userId)
	Quit ((SQLCODE=0)||(SQLCODE=100))
}

ClassMethod getInfoLock(lockId As %Integer) As %String
{
	#dim lock As Application.LockingData
	s lock = ##class(Application.LockingData).%OpenId(lockId,,.sc)
	Quit:$$$ISERR(sc) ""
	s msg = $$$Text("En cours d'utilisation par")
	if (lock.typeOfLock="CSP") {
		s msg = msg_" "_lock.userCreation.LastName_" "_lock.userCreation.FirstName
	}elseif (lock.typeOfLock="JOB") {
		s msg = msg_" "_$$$FormatText($$$Text("le processus : %1"),lock.keyOfLock)
	}
	s msg = msg_" "_$$$FormatText($$$Text("depuis le %1"),$zdt($zdth(lock.dateCreation,3),4))
	Quit msg
}

ClassMethod isOwnerLockByUserId(className As %String, id As %String, userId As %String = {$s($d(%session):$g(%session.Data("USER","ID")),1:"")}) As %Boolean
{
	;s obj = ..getObjByClassNameAndId(className,id)
	;Quit:'$ISOBJECT(obj) 0
	if (..isLocked(className,id,.lockId)) {
		#dim lock As Application.LockingData
		s lock = ##class(Application.LockingData).%OpenId(lockId,,.sc)
		Quit:$$$ISERR(sc) 0
		Quit:userId="" 0
		Quit (lock.userCreation.%Id()=userId)
	}
	Quit 0
}

ClassMethod isOwnerLockBySessionId(className As %String, id As %String, sessionId As %String = {$s($d(%session):%session.SessionId,1:"")}) As %Boolean
{
	;s obj = ..getObjByClassNameAndId(className,id)
	;Quit:'$ISOBJECT(obj) 0
	if (..isLocked(className,id,.lockId)) {
		#dim lock As Application.LockingData
		s lock = ##class(Application.LockingData).%OpenId(lockId,,.sc)
		Quit:$$$ISERR(sc) 0
		Quit:lock.typeOfLock'="CSP" 0
		Quit:userId="" 0
		Quit (lock.keyOfLock=sessionId)
	}
	Quit 0
}

ClassMethod isOwnerLockByJobNumber(className As %String, id As %String, jobNumber As %String = "") As %Boolean
{
	;s obj = ..getObjByClassNameAndId(className,id)
	;Quit:'$ISOBJECT(obj) 0
	if (..isLocked(className,id,.lockId)) {
		#dim lock As Application.LockingData
		s lock = ##class(Application.LockingData).%OpenId(lockId,,.sc)
		Quit:$$$ISERR(sc) 0
		Quit:lock.typeOfLock'="JOB" 0
		Quit:userId="" 0
		Quit (lock.keyOfLock=jobNumber)
	}
	Quit 0
}

Method %OnAddToSaveSet(depth As %Integer = 3, insert As %Integer = 0, callcount As %Integer = 0) As %Status [ Private, ProcedureBlock = 1, ServerOnly = 1 ]
{
	s sc = $$$OK
	if (insert) {
		s ..lockedClassName = ..obj.%ClassName(1)
		s ..lockingObjectId = ..obj.%Id()
		if (..typeOfLock="CSP") {
			s ..keyOfLock = $s($g(%session)'="":%session.SessionId,1:"")
		}
		s ..cpt = 1
	}
	set ..obj=""
	Quit ##class(Ciges.TStamp)##this.%OnAddToSaveSet(depth,insert,callcount)
}

Method %OnNew(obj As %Persistent, keyOfLock As %String = "", typeOfLock As %String = "CSP") As %Status [ Private, ProcedureBlock = 1, ServerOnly = 1 ]
{
	s ..obj = obj
	s ..typeOfLock=typeOfLock
	if (..typeOfLock'="CSP") {
		s ..keyOfLock=keyOfLock
	}
	Quit $$$OK
}

Method %OnValidateObject() As %Status [ Private, ProcedureBlock = 1, ServerOnly = 1 ]
{
	s sc = $s(..keyOfLock'="":$$$OK,1:$system.Status.Error(5002,$$$Text("Key Of Lock is empty !")))
	Quit sc
}

Query qryListLock() As %SQLQuery(CONTAINID = 1)
{
SELECT %ID FROM LockingData
}

Storage Default
{
<Data name="LockingDataDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>dateModification</Value>
</Value>
<Value name="3">
<Value>dateCreation</Value>
</Value>
<Value name="4">
<Value>lockingObjectId</Value>
</Value>
<Value name="5">
<Value>userModification</Value>
</Value>
<Value name="6">
<Value>typeOfLock</Value>
</Value>
<Value name="7">
<Value>cpt</Value>
</Value>
<Value name="8">
<Value>keyOfLock</Value>
</Value>
<Value name="9">
<Value>lockedClassName</Value>
</Value>
<Value name="10">
<Value>userCreation</Value>
</Value>
</Data>
<DataLocation>^Application.LockingDataD</DataLocation>
<DefaultData>LockingDataDefaultData</DefaultData>
<ExtentSize>100000</ExtentSize>
<IdLocation>^Application.LockingDataD</IdLocation>
<IndexLocation>^Application.LockingDataI</IndexLocation>
<StreamLocation>^Application.LockingDataS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
