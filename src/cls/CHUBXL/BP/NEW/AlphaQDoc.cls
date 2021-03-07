Class CHUBXL.BP.NEW.AlphaQDoc Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BP AlphaQdoc

VERSION
-------
CWY	24/07/2018	Initial Version

OPTIMISATION
------------
- A réécrire

SOURCE
------
CHUBXL.BP.AlphaQDoc

--------------------------------------------------------------------------------------------------------------------------------
*/
/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

ClassMethod Test(Ndosm, TypeDos, db) As %Status
{
    s %qDB = "delete chubxl_db_QDOC"_db_".mvciges where ndosm="_Ndosm_" and typedos like '%"_TypeDos_"%'"
    s %qDB = %qDB_""

	s %rsDB = ##class(%Library.ResultSet).%New()

    s status=%rsDB.Prepare(%qDB)
    s status=%rsDB.Execute()
    i 'status $$$TRACE("Statut : "_status_" : "_%qDB)
    s ^CHUBXL.dulio($h,Ndosm)=TypeDos_"~"_db
    
    //While (%rsDB.Next()) {
	//	w %rsDB.Data("NDOSM"),!
	//	w %rsDB.Data("SERVICE"),!
	//	w %rsDB.Data("TYPEDOS"),!
	//	
    //}
    q $$$OK
}

Method OnRequest(pRequest As CHUBXL.DATA.RawMessageStream, Output pResponse As Ens.Response) As %Status
{

	s tsc=$$$OK
	while ('pRequest.payLoad.AtEnd) {
		s msgLine=pRequest.payLoad.ReadLine()
		//i $tr($p(msgLine,"~",1)," ")'="" s ^dulio(pRequest.fileName)=msgLine
		//$$$TRACE("***"_msgLine_"***")
		;i $tr($p(msgLine,"~",1)," ")="" s bl=$g(bl)+1		
		i msgLine["Insert" {
			i $e($p(msgLine,"~",1),1)=8 s st=##class(CHUBXL.DB.QDOC2.MVCIGES).%New()
			i $e($p(msgLine,"~",1),1)'=8 s st=##class(CHUBXL.DB.QDOC1.MVCIGES).%New()
			s st.NDOSM=$p(msgLine,"~",1) $$$TRACE("NDOSM "_$p(msgLine,"~",1))
			s st.NOM=$p(msgLine,"~",2) $$$TRACE("NOM "_$p(msgLine,"~",2))
			s st.PRENOM=$p(msgLine,"~",3) $$$TRACE("PRENOM "_$p(msgLine,"~",3))
			s st.DNAIS=$p(msgLine,"~",4) $$$TRACE("DNAIS "_$p(msgLine,"~",4))
			s st.SEXE=$p(msgLine,"~",5) $$$TRACE("SEXE "_$p(msgLine,"~",5))
			s st.SERVICE=$p(msgLine,"~",6) $$$TRACE("SERVICE "_$p(msgLine,"~",6))
			s st.TYPEDOS=$p(msgLine,"~",7) $$$TRACE("TYPEDOS "_$p(msgLine,"~",7))
			s st1=st.%Save()
			s in=$g(in)+1
			$$$TRACE("Insert "_st1)
		}
		i msgLine["Update" {

			i $l(msgLine,"~")<5 q
			i $tr($p(msgLine,"~",1)," ")="" q			
			i $e($p(msgLine,"~",1),1)'=8 s st=##class(CHUBXL.DB.QDOC1.MVCIGES).%OpenId($p(msgLine,"~",1)_"||"_$p(msgLine,"~",6))
			i $e($p(msgLine,"~",1),1)=8 s st=##class(CHUBXL.DB.QDOC2.MVCIGES).%OpenId($p(msgLine,"~",1)_"||"_$p(msgLine,"~",6))
			//s ^dulio(pRequest.fileName,$p(msgLine,"~",1)_"||"_$p(msgLine,"~",6))=msgLine
			s upl=$g(upl)+1
			i $g(st) { 
			  s st.TYPEDOS=$p(msgLine,"~",7)
			  s st1=st.%Save(),up=$g(up)+1
			  //k ^dulio(pRequest.fileName,$p(msgLine,"~",1)_"||"_$p(msgLine,"~",6))
			  //$$$TRACE("Update "_msgLine)
			}
		}
		i msgLine["Delete" {
			i $e($p(msgLine,"~",1),1)=8 s db=2
			i $e($p(msgLine,"~",1),1)'=8 s db=1
			s NDOSM=$p(msgLine,"~",1)
			s TYPEDOS=$p(msgLine,"~",7)
			s x=..Test(NDOSM, TYPEDOS, db),del=$g(del)+1
			$$$TRACE("Delete "_x)
		}
	}
	s to=$g(in)+$g(up)+$g(bl)+$g(del)
	$$$TRACE(pRequest.source_" Insert : "_+$g(in)_" Update : "_+$g(up)_"/"_+$g(upl)_" Delete : "_+$g(del)_" Blank : "_+$g(bl)_" Total : "_+$g(to))
	Quit tsc
}

Storage Default
{
<Data name="AlphaQDocDefaultData">
<Subscript>"AlphaQDoc"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>AlphaQDocDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
