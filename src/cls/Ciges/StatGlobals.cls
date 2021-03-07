/// Stat sur les globals size...
Class Ciges.StatGlobals Extends %Persistent
{

Property NameSpace As %String;

Property GlobalName As %String(MAXLEN = 150);

/// Allocated space (MB)
Property Allocated As %Float;

/// Used space (MB)
Property Used As %Float;

Property dCreation As %TimeStamp [ InitialExpression = {$ZDATETIME($H,3,1)} ];

Index IUnique On (NameSpace, GlobalName As EXACT);

ClassMethod getStatsForNameSpace(ns As %String, fastFlag As %Boolean = 1) As %Status
{
    s ns=$ZCVT(ns,"U")
    s dataDir=..getDataDirectory(ns)
    if (dataDir="") {
        q $system.Status.Error(5001,"cannot find directory for "_ns)
    }
    tstart
    s sc=..saveCurrentStats(ns)
    q:'sc sc
    &sql(delete from Ciges.StatGlobals where NameSpace=:ns)
    s rs=##class(%ResultSet).%New("%SYS.GlobalQuery:Size")
    d rs.Prepare()
    d rs.Execute(dataDir,,,,,fastFlag)
    while (rs.Next()) {
        s obj=..%New()
        s obj.NameSpace=ns
        s obj.GlobalName=rs.Data("Name")
        s obj.Allocated=rs.Data("Allocated MB")
        s obj.Used=rs.Data("Used MB") // Si fastFlag, retournera toujours 0
        s sc=obj.%Save()
        q:('sc)
    }
    if ('sc) {
        trollback
    } else {
        tcommit
    }
    q:'sc sc
    s sc=rs.Close()
    q sc
}

ClassMethod saveCurrentStats(ns As %String) As %Status
{
    s rs=##class(%ResultSet).%New("%DynamicQuery:SQL")
    d rs.Prepare("SELECT NameSpace,GlobalName,Used,dCreation FROM Ciges.StatGlobals WHERE NameSpace=?")
    s sc=rs.Execute(ns)
    q:'sc sc
    while (rs.Next()) {
        &sql(insert into Ciges.StatGlobalsHistory (NameSpace,GlobalName,Used,dCreation) 
        Values (:rs.Data("NameSpace"),:rs.Data("GlobalName"),:rs.Data("Used"),:rs.Data("dCreation")))
    }
    s sc=rs.Close()
    q sc
}

ClassMethod getStats() As %Status
{
    s sc=$$$OK
    s nsList=##class(%ResultSet).%New("%SYS.Namespace:List")
    s sc= nsList.Prepare()
    q:'sc sc
    s sc= nsList.Execute()
    q:'sc sc
    while (nsList.Next()) {
        if '$D(^BDOC.Param("DBREPORT","IGNOREDB",nsList.Get("Nsp")))
        {
            s sc=  ..getStatsForNameSpace(nsList.Get("Nsp"))
        }
        q:'sc
    }
    d nsList.Close()
    q:'sc sc
    
    
    
    
    q sc
}

ClassMethod sendMail() As %Boolean
{
    set sc=$$$OK
    q:$g(^BDOC.Param("DBREPORT","DEST"))=""
    set a=##class(%ResultSet).%New()
    set s=##class(%Net.SMTP).%New()
    set s.smtpserver=$g(^BDOC.ExecPar("MAIL","SMTPSERVER"))
    set s.timezone=$g(^BDOC.ExecPar("MAIL","TIMEZONE"))
    set m=##class(%Net.MailMessage).%New()
    set m.From=$g(^BDOC.ExecPar("MAIL","FROM"))
    s listOfDest=$lfs($g(^BDOC.Param("DBREPORT","DEST")),";")
    for cmpti=1:1:$ll(listOfDest)
    {
        do m.To.Insert($lg(listOfDest,cmpti))
    }
    set m.Subject=$g(^BDOC.Param("DBREPORT","SUBJECT"),"BDOC : DB SIZE REPORT")
    do m.TextData.WriteLine($zdate(+$h,4)_" "_$ztime($p($h,",",2))_" Message from BDOC"_$c(10,13))
    set sc = a.Prepare("SELECT namespace as ns,sum(allocated) as allocated,sum(used) as used FROM ciges.StatGlobals where DATEDIFF('dd',dCreation,'"_$zdt($h,3)_"')=0 group by namespace")
    q:'sc sc
    set sc = a.Execute()
    q:'sc sc
    while a.Next()
    {
        s sc= m.TextData.WriteLine(a.Get("ns")_$c(9,9)_"Allocated : "_a.Get("allocated")_" Mb"_$c(9,9)_"Used : "_a.Get("used")_" Mb")
        q:'sc
    }
    q:'sc sc
    set sc=s.Send(m)
    do a.Close()
    q sc
}

/// Renvoie le répertoire du cache.dat , supporte namespace ou database
ClassMethod getDataDirectory(ns As %String) As %String
{
	s dataDir=""
    if (##class(%SYS.Namespace).Exists(ns)) { // namespace... facile
        s dataDir=$P(##class(%SYS.Namespace).GetGlobalDest(ns,"",""),"^",2)
    }
    else {
	    s dataDir=..getDatabaseDirectory(ns)
    }
    q dataDir
}

ClassMethod getDatabaseDirectory(db As %String) As %String
{
	s dataDir=""
	s oldNs=$znspace
	zn "%sys"
	try {
	    if ($system.Version.GetMajor()="2007") {
	    	set res=##class(%ResultSet).%New("Config.Configuration:List")
			do res.Execute()
			while ((res.Next())&&(config="")){
				if ($f(res.GetData(1),"_Active_.cpf")'=0){
				   s config=##class(Config.Configuration).%OpenId(res.GetData(2))
				}
			}
			d res.Close()
			set dbList=config.Storage.Databases
			s j=1
			while(j'=""){
			   if ($f(dbList.GetAt(j).Directory,"/")||$f(dbList.GetAt(j).Directory,"\")){
				   if (dbList.GetAt(j).Name=db) {
					   s dataDir=dbList.GetAt(j).Directory
					   q 
				   }
			   }
			   s j=dbList.Next(j)
			}
	    }
	    else { // CACHE 2010
			set res=##class(%ResultSet).%New("Config.Databases:List")
			do res.Execute()
			while res.Next() {
				if ($f(res.Data("Directory"),"/")||$f(res.Data("Directory"),"\")){
					if (res.Data("Name")=db) {
						s dataDir=res.Data("Directory")
						q
			   		}
				}	  
			}
	    	d res.Close()
	    }
	}
	catch (e) {
	}
	zn oldNs
	q dataDir
}

/// Calcul du delai nécessaire (en minutes) pour avoir la taille de la globale.
ClassMethod calcDelay(id As %String) As %String [ SqlProc ]
{
	s obj=..%OpenId(id)
	s prevObj=..%OpenId((id-1))
	q:(prevObj="")||(obj="") "0"
	s diff=$system.SQL.DATEDIFF("mi",prevObj.dCreation,obj.dCreation)
	q diff
}

Storage Default
{
<Data name="StatGlobalsDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Allocated</Value>
</Value>
<Value name="3">
<Value>GlobalName</Value>
</Value>
<Value name="4">
<Value>NameSpace</Value>
</Value>
<Value name="5">
<Value>Used</Value>
</Value>
<Value name="6">
<Value>dCreation</Value>
</Value>
</Data>
<DataLocation>^Ciges.StatGlobalsD</DataLocation>
<DefaultData>StatGlobalsDefaultData</DefaultData>
<ExtentSize>100000</ExtentSize>
<IdLocation>^Ciges.StatGlobalsD</IdLocation>
<IndexLocation>^Ciges.StatGlobalsI</IndexLocation>
<StreamLocation>^Ciges.StatGlobalsS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
