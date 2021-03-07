Class CHUBXL.BP.OLD.AlphaQDoc Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As CHUBXL.DATA.RawMessageStream, Output pResponse As Ens.Response) As %Status
{

	s tsc=$$$OK
	while ('pRequest.payLoad.AtEnd) {
		s msgLine=pRequest.payLoad.ReadLine()
		//i $tr($p(msgLine,"~",1)," ")'="" s ^dulio(pRequest.fileName)=msgLine
		$$$TRACE("***"_msgLine_"***")
		;i $tr($p(msgLine,"~",1)," ")="" s bl=$g(bl)+1		
		i msgLine["Insert" {
			i $e($p(msgLine,"~",1),1)=8 s st=##class(CHUBXL.DB.QDOC2.MVCIGES).%New()
			i $e($p(msgLine,"~",1),1)'=8 s st=##class(CHUBXL.DB.QDOC1.MVCIGES).%New()
			s st.NDOSM=$p(msgLine,"~",1)
			s st.NOM=$p(msgLine,"~",2)
			s st.PRENOM=$p(msgLine,"~",3)
			s st.DNAIS=$p(msgLine,"~",4)
			s st.SEXE=$p(msgLine,"~",5)
			s st.SERVICE=$p(msgLine,"~",6)
			s st.TYPEDOS=$p(msgLine,"~",7)
			s st1=st.%Save()
			s in=$g(in)+1
			//$$$TRACE("Insert "_msgLine)
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
	}
	s to=$g(in)+$g(up)+$g(bl)
	$$$TRACE(pRequest.source_" Insert : "_+$g(in)_" Update : "_+$g(up)_"/"_+$g(upl)_" Blank : "_+$g(bl)_" Total : "_+$g(to))
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
