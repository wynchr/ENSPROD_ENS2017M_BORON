/// 
Class Ciges.StatGlobalsHistory Extends %Persistent
{

Property NameSpace As %String;

Property GlobalName As %String(MAXLEN = 150);

/// Allocated space (MB)
Property Allocated As %Float;

/// Used space (MB)
Property Used As %Float;

Property dCreation As %TimeStamp [ InitialExpression = {$ZDATETIME($H,3,1)} ];

Index IUnique On (NameSpace, GlobalName As Exact, dCreation);

/// renvoie les stats sur la périodicité choisie 
/// 		- d : daily
/// 		- w : weekly
/// 		- m : monthly
/// 		- q : quarterly
/// 		- Y : yearly 
/// sizeLimit permet d'exclure les globales dont la taille a peu d'importance.	
ClassMethod getStatsResultSet(nameSpace As %String, statType As %String, sizeLimit As %Integer, dStart As %TimeStamp = "", dEnd As %TimeStamp = "", sizeMax As %Integer = "") As %ResultSet
{
	/// 
	s statType=$zcvt(statType,"L")
	s:(dStart="") dStart=$zdate(0,3)
	s:(dEnd="") dEnd=$zdate($h,3)
	s rs=##class(%ResultSet).%New("%DynamicQuery:SQL")
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
	
	s sql="select GlobalName," _groupingChoice _" as groupperiod,  ROUND(avg(Used),0) as Used from Ciges.StatGlobalsHistory "
	s sql=sql_" where Used > "_$G(sizeLimit,0) _ " and NameSpace='"_nameSpace_"' "
	s sql=sql_"  and dCreation between  '"_dStart _ "' and '"_dEnd_"'  "
	s:($G(sizeMax)'="") sql=sql_" and Used <= "_sizeMax 
	s sql=sql_" group by GlobalName, "_groupingChoice 
	; w sql,!
	d rs.Prepare(sql)
	d rs.Execute()
	q rs
}

/// sample json return :
/// {
///    "type": "d",
///    "dEnd": "2013-01-28",
///    "dStart": "2013-01-25",
///    "limit": "1005",
///    "globals": [
///        {
///            "globalName": "Di.StayD",
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
///            "globalName": "BDOC.SpecNoteS",
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
ClassMethod writeStatsAsJSON(nameSpace As %String, statType As %String, sizeLimit As %Integer = 0, dStart As %TimeStamp = "", dEnd As %TimeStamp = "", sizeMax As %Integer = "")
{
	///
	s statType=$zcvt(statType,"L")
	s:(dStart="") dStart=$zdate(0,3)
	s:(dEnd="") dEnd=$zdate($h,3)
	w "{"
	w ..QuoteJSON("type")_" : " _..QuoteJSON(statType)_","
	w ..QuoteJSON("dStart") _" : "_..QuoteJSON(dStart)_","
	w ..QuoteJSON("dEnd")_" : " _..QuoteJSON(dEnd)_","	
	w ..QuoteJSON("limit") _" : "_..QuoteJSON(sizeLimit)_","
	w ..QuoteJSON("globals") _" : ["
	try {
		s rs=..getStatsResultSet(nameSpace, statType , sizeLimit ,dStart , dEnd ,sizeMax) 
		s oldGlobalName="",firstSizeLine=0
		s hasRecords=0
		while rs.Next() {
			s:hasRecords=0 hasRecords=1
			if (rs.Data("GlobalName")'=oldGlobalName) {
				w:(oldGlobalName'="") " ] }" // 
				w:(oldGlobalName'="") "," // 
				w "{ "_..QuoteJSON("globalName")_" : "_..QuoteJSON(rs.Data("GlobalName"))_", "
				w ..QuoteJSON("sizes")_" : ["
				s oldGlobalName=rs.Data("GlobalName")
				s firstSizeLine=1
			}
			w:('firstSizeLine) ","
			w "{ "_..QuoteJSON("period")_" : "_..QuoteJSON(rs.Data("groupperiod"))_", "
			w " "_..QuoteJSON("size")_" : "_..QuoteJSON(rs.Data("Used"))_" } "
			s firstSizeLine=0
		}
		if (hasRecords) {
			w "]" // fin array "sizes"
			w "}" // dernier block "globalName"
		}
		w "]" // fin array "globals"
			
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
<Data name="StatGlobalsHistoryDefaultData">
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
<DataLocation>^Ciges.StatGlobalsHistoryD</DataLocation>
<DefaultData>StatGlobalsHistoryDefaultData</DefaultData>
<ExtentSize>100000</ExtentSize>
<IdLocation>^Ciges.StatGlobalsHistoryD</IdLocation>
<IndexLocation>^Ciges.StatGlobalsHistoryI</IndexLocation>
<Property name="%%CLASSNAME"/>
<Property name="Allocated"/>
<Property name="GlobalName"/>
<Property name="NameSpace"/>
<Property name="Used"/>
<Property name="dCreation"/>
<StreamLocation>^Ciges.StatGlobalsHistoryS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
