/// Statistiques sur évolution taille des databases
Class Ciges.StatNameSpaceHistory Extends %Persistent
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

Index DBIDX On (DatabaseName, dCreation);

/// renvoie les stats sur la périodicité choisie 
/// 		- d : daily
/// 		- w : weekly
/// 		- m : monthly
/// 		- q : quarterly
/// 		- Y : yearly 
/// Pour les données choisies :
/// 		- dbsize -> dbsize / free -> Free space
ClassMethod getStatsResultSet(statType As %String, dataType As %String, dStart As %TimeStamp = "", dEnd As %TimeStamp = "") As %ResultSet
{
	/// 
	s statType=$zcvt(statType,"L")
	s dataType=$zcvt(dataType,"L")
	s:(dStart="") dStart=$zdate(0,3)
	s:(dEnd="") dEnd=$zdate($h,3)
	s rs=##class(%ResultSet).%New("%DynamicQuery:SQL")
	if (dataType="dbsize") {
		s statZone="ROUND(avg(Size),0)"
	}
	elseif (dataType="free") {
		s statZone="ROUND(avg(Free),0)"
	}
	if (statType="d") {
		s groupingChoice= "String(DATEPART('YY',dCreation),  TO_CHAR(DATEPART('dy',dCreation),'000')) "
		if ($system.SQL.DATEDIFF("dd",dStart,dEnd)>60) {
			s dStart=$system.SQL.DATEADD("dd", -31,dEnd)
		}
	}
	elseif (statType="w") {
		s groupingChoice= "String(DATEPART('YY',dCreation),  TO_CHAR(DATEPART('ww',dCreation),'00')) "
	}
	elseif (statType="m") {
		s groupingChoice= "String(DATEPART('YY',dCreation),  TO_CHAR(DATEPART('mm',dCreation),'00')) "
	}

	elseif (statType="q") {
		s groupingChoice= "String(DATEPART('YY',dCreation),  TO_CHAR(DATEPART('qq',dCreation),'00')) "
	}
	elseif ( statType="y") {
		s groupingChoice= " DATEPART('YY',dCreation) "
	}
	
	s sql="select DatabaseName," _groupingChoice _" as groupperiod, "_statZone_" as Size from Ciges.StatNameSpaceHistory "
	s sql=sql_"  where dCreation between  '"_dStart _ "' and '"_dEnd_"'  "
	s sql=sql_" group by DatabaseName, "_groupingChoice 
	;w sql
	d rs.Prepare(sql)
	d rs.Execute()
	q rs
}

/// 
/// sample json return :
/// {
///    "type": "d",
///    "dEnd": "2013-01-28",
///    "dStart": "2013-01-25",
///    "databases": [
///        {
///            "database": "DB1",
///            "sizes": [
///                {
///                    "period": "2013 025",
///                    "size": "1713"
///                },
///                {
///                    "period": "2013 026",
///                    "size": "1717"
///                },
///                {
///                    "period": "2013 027",
///                    "size": "1716"
///                }
///            ]
///        },
///        {
///            "database": "DB2",
///            "sizes": [
///                {
///                    "period": "2013 025",
///                    "size": "6674"
///                },
///                {
///                    "period": "2013 026",
///                    "size": "6697"
///                },
///                {
///                    "period": "2013 027",
///                    "size": "6617"
///                }
///            ]
///        }
///    ]
/// }
ClassMethod writeStatsAsJSON(statType As %String, dataType As %String, dStart As %TimeStamp = "", dEnd As %TimeStamp = "")
{
	///
	s statType=$zcvt(statType,"L")
	s dataType=$zcvt(dataType,"L")
	s:(dStart="") dStart=$zdate(0,3)
	s:(dEnd="") dEnd=$zdate($h,3)
	w "{"
	w ..QuoteJSON("type")_" : " _..QuoteJSON(statType)_","
	w ..QuoteJSON("dStart") _" : "_..QuoteJSON(dStart)_","
	w ..QuoteJSON("dEnd")_" : " _..QuoteJSON(dEnd)_","
	w ..QuoteJSON("databases") _" : ["
	try {
		s rs=..getStatsResultSet(statType ,dataType,dStart , dEnd ) 
		s oldDatabaseName="",firstSizeLine=0
		s hasRecords=0
		while rs.Next() {
			s:hasRecords=0 hasRecords=1
			if (rs.Data("DatabaseName")'=oldDatabaseName) {
				w:(oldDatabaseName'="") " ] }" // 
				w:(oldDatabaseName'="") "," // 
				w "{ "_..QuoteJSON("database")_" : "_..QuoteJSON(rs.Data("DatabaseName"))_", "
				w ..QuoteJSON("sizes")_" : ["
				s oldDatabaseName=rs.Data("DatabaseName")
				s firstSizeLine=1
			}
			w:('firstSizeLine) ","
			w "{ "_..QuoteJSON("period")_" : "_..QuoteJSON(rs.Data("groupperiod"))_", "
			w " "_..QuoteJSON("size")_" : "_..QuoteJSON(rs.Data("Size"))_" } "
			s firstSizeLine=0
		}
		if (hasRecords) {
			w "]" // fin array "sizes"
			w "}" // dernier block "database"
		}
		w "]" // fin array "databases"
	}
	catch (e) {
		d $system.Status.DisplayError(e.AsStatus())
	}

	w "}"
}

ClassMethod QuoteJSON(text As %String = "") As %String
{
	Set str = """"_##class(%TSQL.Impl).REPLACE($zcvt(text,"O","JS"),"\'","'")_""""
	Quit str
}

Storage Default
{
<Data name="StatNameSpaceHistoryDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>DatabaseName</Value>
</Value>
<Value name="3">
<Value>Directory</Value>
</Value>
<Value name="4">
<Value>MaxSize</Value>
</Value>
<Value name="5">
<Value>Size</Value>
</Value>
<Value name="6">
<Value>ExpansionSize</Value>
</Value>
<Value name="7">
<Value>Available</Value>
</Value>
<Value name="8">
<Value>Free</Value>
</Value>
<Value name="9">
<Value>DiskFreeSpace</Value>
</Value>
<Value name="10">
<Value>Status</Value>
</Value>
<Value name="11">
<Value>dCreation</Value>
</Value>
</Data>
<DataLocation>^Ciges.StatNameSpaceHistoryD</DataLocation>
<DefaultData>StatNameSpaceHistoryDefaultData</DefaultData>
<ExtentSize>100000</ExtentSize>
<IdLocation>^Ciges.StatNameSpaceHistoryD</IdLocation>
<IndexLocation>^Ciges.StatNameSpaceHistoryI</IndexLocation>
<StreamLocation>^Ciges.StatNameSpaceHistoryS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
