/// Statistiques sur évolution taille des databases
Class Ciges.StatNameSpace Extends %Persistent
{

Property DatabaseName As %String;

Property Directory As %String;

Property MaxSize As %String;

Property Size As %String;

Property ExpansionSize As %String;

Property Available As %String;

Property Free As %String;

Property DiskFreeSpace As %String;

Property Status As %String;

Property dCreation As %TimeStamp [ InitialExpression = {$ZDATETIME($H,3,1)} ];

Index DBIDX On DatabaseName;

ClassMethod getStats() As %Boolean
{
	s sc=$$$OK
	s nsList=##class(%ResultSet).%New("%SYS.Namespace:List")
	s sc= nsList.Prepare()
	q:'sc sc
	s sc= nsList.Execute()
	q:'sc sc
	s lst=""
	while nsList.Next()
	{
		if '$D(^BDOC.Param("DBREPORT","IGNOREDB",nsList.Get("Nsp")))
		{
			s:lst'="" lst=lst_","
			s lst=lst_nsList.Get("Nsp")
		}
		q:'sc
	}
	d nsList.Close()
	s lstdb= $lfs(lst,",")
	s sc=  ..getStatsForDbList(lstdb)
	q:'sc sc
	s sc=  ..sendMail()
	q sc
}

ClassMethod getStatsForDbList(lstdb) As %Boolean
{
	s dirLst=""
	for cmpti=1:1:$ll(lstdb)
	{
		s db=$ZCVT($lg(lstdb,cmpti),"U")
		s dir=$P(##class(%SYS.Namespace).GetGlobalDest(db,"",""),"^",2)
		s:dirLst'="" dirLst=dirLst_","
		s dirLst=dirLst_dir
	}	
	s dirLst=$lfs(dirLst,",")
	tstart
	s sc=..saveCurrentStats()
	&sql(delete from Ciges.StatNameSpace)	
	s old=$znspace
	zn "%SYS"
	s rs=##class(%ResultSet).%New("SYS.Database:FreeSpace")
	d rs.Prepare()
	d rs.Execute(dirLst)
	k array
	s freeSqlTag=$select($system.Version.GetMajor()="2007":"% Free",1:"Free") ; sql difference between 2007 / 2012
	while rs.Next() {
		s array($i(array))=rs.Data("DatabaseName")_"~"_rs.Data("Directory")_"~"_rs.Data("MaxSize")_"~"_rs.Data("Size")_"~"_rs.Data("ExpansionSize")_"~"_rs.Data("Available")_"~"_rs.Data(freeSqlTag)_"~"_rs.Data("DiskFreeSpace")_"~"_rs.Data("Status")
	}
	s sc=rs.Close()
	q:'sc
	zn old
	s a=$o(array(""))
	while a'=""{
		s obj=..%New()
		s obj.DatabaseName=$p(array(a),"~",1)
		s obj.Directory=$p(array(a),"~",2)
		s obj.MaxSize=$p(array(a),"~",3)
		s obj.Size=$p(array(a),"~",4)
		s obj.ExpansionSize=$p(array(a),"~",5)
		s obj.Available=$p(array(a),"~",6)
		s obj.Free=$p(array(a),"~",7)
		s obj.DiskFreeSpace=$p(array(a),"~",8)
		s obj.Status=$p(array(a),"~",9)
		s sc=obj.%Save()
		q:'sc			
		s a=$o(array(a))
	}
	if ('sc){
		trollback
	}
	else {
		tcommit
	}
	q sc
}

ClassMethod sendMail() As %Boolean
{
	set sc=$$$OK
	q:$g(^BDOC.Param("DBREPORT","DEST"))="" sc
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
	set sc = a.Prepare("SELECT * FROM ciges.StatNameSpace where DATEDIFF('dd',dCreation,'"_$zdt($h,3)_"')=0 group by DatabaseName")
	q:'sc sc
	set sc = a.Execute()
	q:'sc sc
	while a.Next()
	{
		// ExpansionSize,Available,Free,DiskFreeSpace,Status,dCreation
		s sc= m.TextData.WriteLine(a.Get("DatabaseName")_$c(9,9)_"Directory :    "_a.Get("Directory")_$c(9,9)_"Size : "_a.Get("Size")_$c(9,9)_"Disk Free Space :   "_a.Get("DiskFreeSpace"))
		q:'sc
	}
	q:'sc sc
	set sc=s.Send(m)
	do a.Close()
	q sc
}

ClassMethod saveCurrentStats() As %Status
{
    s rs=##class(%ResultSet).%New("%DynamicQuery:SQL")
    d rs.Prepare("SELECT DatabaseName,Directory,""Size"" ,Available,DiskFreeSpace,Free,dCreation FROM Ciges.StatNameSpace ")
    s sc=rs.Execute()
    q:'sc sc
    while rs.Next() {
	    s size=..formatSize(rs.Data("Size")) ; on retire les GB/MB du résultat, sinon c'est inexploitable pour faire des stats...
	    s available=..formatSize(rs.Data("Available"))
	    s diskFreeSpace=..formatSize(rs.Data("DiskFreeSpace"))
        &sql(insert into Ciges.StatNameSpaceHistory (DatabaseName,Directory,Size,Available,DiskFreeSpace,Free,dCreation) 
        Values (:rs.Data("DatabaseName"),:rs.Data("Directory"),:size,
        	:available,:diskFreeSpace,:rs.Data("Free"),:rs.Data("dCreation"))  
        
        )
    }
    s sc=rs.Close()
    q sc
}

ClassMethod formatSize(size As %String) As %String
{
	s realSize=size
	if ($F(size,"MB")>0) {
		s realSize=$tr(realSize,"MB","")
	}
	elseif ($F(size,"GB")>0) {
		s realSize=(+($tr(realSize,"GB",""))*1000)
	}
	elseif ($F(size,"TB")>0) {
		s realSize=(+($tr(realSize,"GB",""))*1000*1000)
	}
	q realSize
}

Storage Default
{
<Data name="StatNameSpaceDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>freeBlocks</Value>
</Value>
<Value name="3">
<Value>freeDataBlocks</Value>
</Value>
<Value name="4">
<Value>pcentFreeBlocks</Value>
</Value>
<Value name="5">
<Value>pcentFreeDataBlocks</Value>
</Value>
<Value name="6">
<Value>totBlocks</Value>
</Value>
<Value name="7">
<Value>Available</Value>
</Value>
<Value name="8">
<Value>DatabaseName</Value>
</Value>
<Value name="9">
<Value>Directory</Value>
</Value>
<Value name="10">
<Value>DiskFreeSpace</Value>
</Value>
<Value name="11">
<Value>ExpansionSize</Value>
</Value>
<Value name="12">
<Value>Free</Value>
</Value>
<Value name="13">
<Value>MaxSize</Value>
</Value>
<Value name="14">
<Value>Size</Value>
</Value>
<Value name="15">
<Value>Status</Value>
</Value>
<Value name="16">
<Value>dCreation</Value>
</Value>
</Data>
<DataLocation>^Ciges.StatNameSpaceD</DataLocation>
<DefaultData>StatNameSpaceDefaultData</DefaultData>
<ExtentSize>100000</ExtentSize>
<IdLocation>^Ciges.StatNameSpaceD</IdLocation>
<IndexLocation>^Ciges.StatNameSpaceI</IndexLocation>
<StreamLocation>^Ciges.StatNameSpaceS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
