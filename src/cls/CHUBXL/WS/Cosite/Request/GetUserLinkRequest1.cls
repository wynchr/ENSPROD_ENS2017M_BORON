Class CHUBXL.WS.Cosite.Request.GetUserLinkRequest1 Extends Ens.Request [ ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "CHUBXL.WS.Cosite.Response.GetUserLinkResponse";

/// Use xsi:type attribute for literal types.
Parameter OUTPUTTYPEATTRIBUTE = 0;

Property Requete As CHUBXL.WS.Cosite.common.GetUserLinkRequest;

Property TimeoutEnSecondes As %Integer;

ClassMethod saveMessage(pMessage As %Stream, pSource As %String, pObj As CHUBXL.WS.Cosite.Request.GetUserLinkRequest) As %Status
{
	$$$TRACE("Message : "_pMessage)
	s pObj=..%New()
	
	s Hop=$e($p(pMessage,",",$p(pSource,"~",2)),1,10)
	s NoPat=$p(pMessage,",",1),NoAgre="",NomHop=""
	i Hop="LHUB-ULB_2" s NoAgre="71007760",NomHop="CHU Brugmann"
	i Hop="LHUB-ULB_8" s NoAgre="71015084",NomHop="HUDERF"
	
	s pObj1=##class(CHUBXL.WS.Cosite.common.GetUserLinkRequest).%New()
	s pObj2=##class(CHUBXL.WS.Cosite.common.kmehrrequest).%New()
	s pObj3=##class(CHUBXL.WS.Cosite.common.person).%New()
	s pObj4=##class(CHUBXL.WS.Cosite.common.id).%New()
	s pObj5=##class(CHUBXL.WS.Cosite.common.UserLink).%New()
	s pObj6=##class(CHUBXL.WS.Cosite.common.UserType).%New()
	s pObj7=##class(CHUBXL.WS.Cosite.common.cd).%New()
	s pObj8=##class(CHUBXL.WS.Cosite.common.hcparty).%New()
	s pObj9=##class(CHUBXL.WS.Cosite.common.id).%New()
	s pObj10=##class(CHUBXL.WS.Cosite.common.cd).%New()
	s pObj11=##class(CHUBXL.WS.Cosite.common.hcparty).%New()
	s pObj12=##class(CHUBXL.WS.Cosite.common.hcparty).%New()
	s pObj13=##class(CHUBXL.WS.Cosite.common.authorV2).%New()
	s pObj14=##class(CHUBXL.WS.Cosite.common.authorV2).%New()
	s pObj15=##class(CHUBXL.WS.Cosite.common.id).%New()
	s pObj16=##class(CHUBXL.WS.Cosite.common.cd).%New()
	s pObj17=##class(CHUBXL.WS.Cosite.common.id).%New()
	s pObj20=##class(CHUBXL.WS.Cosite.common.UserLink).%New()
	s pObj21=##class(CHUBXL.WS.Cosite.common.UserType).%New()
	s pObj22=##class(CHUBXL.WS.Cosite.common.UserType).%New()
	s pObj23=##class(CHUBXL.WS.Cosite.common.cd).%New()
	s pObj24=##class(CHUBXL.WS.Cosite.common.person).%New()
	s pObj25=##class(CHUBXL.WS.Cosite.common.cd).%New()
	s pObj26=##class(CHUBXL.WS.Cosite.common.hcparty).%New()
	s pObj27=##class(CHUBXL.WS.Cosite.common.id).%New()
	s pObj28=##class(CHUBXL.WS.Cosite.common.cd).%New()
	s pObj29=##class(CHUBXL.WS.Cosite.common.cd).%New()
	s pObj30=##class(CHUBXL.WS.Cosite.common.id).%New()
	
	s pObj9.SV="1.0"
	s pObj9.SL=""
	s pObj9.S="ID-HCPARTY"
	s pObj9.content=NoAgre
	
	s pObj10.SV="1.0"
	s pObj10.SL=""
	s pObj10.S="CD-HCPARTY"
	s pObj10.L=""
	s pObj10.DN=""
	s pObj10.content="orghospital"
		
	s pObj15.SV="1.0"
	s pObj15.SL=""
	s pObj15.S="ID-HCPARTY"
	s pObj15.content="18786128"
	
	s pObj16.SV="1.0"
	s pObj16.SL=""
	s pObj16.S="CD-HCPARTY"
	s pObj16.L=""
	s pObj16.DN=""
	s pObj16.content="persphysician"
	
	d pObj11.id.SetAt(pObj9,1)
	d pObj11.cd.SetAt(pObj10,1)
	s pObj11.name=NomHop
	
	d pObj12.id.SetAt(pObj15,1)
	d pObj12.cd.SetAt(pObj16,1)
	
	d pObj2.author.SetAt(pObj11,1)
	d pObj2.author.SetAt(pObj12,2)
	
	s pObj17.SV="1.0"
	s pObj17.SL=""
	s pObj17.S="ID-KMEHR"
	s pObj17.content="999003.1"

	s pObj2.id=pObj17
	s pObj2.time="01:13:58"
	s pObj2.date="2018-05-04"
	s pObj2.maxrows=0
	
	s pObj29.S="CD-USERLINK"
	s pObj29.SL=""
	s pObj29.SV="1.0"
	s pObj29.L=""
	s pObj29.DN=""
	s pObj29.content="patientassent"
	
	s pObj28.S="CD-HCPARTY"
	s pObj28.SL=""
	s pObj28.SV="1.0"
	s pObj28.L=""
	s pObj28.DN=""
	s pObj28.content="orgpublichealth"
	
	s pObj27.SV="1.0"
	s pObj27.SL=""
	s pObj27.S="ID-HCPARTY"
	s pObj27.content=NoAgre

	s pObj23.S="CD-USERTYPE"
	s pObj23.SL=""
	s pObj23.SV="1.0"
	s pObj23.L=""
	s pObj23.DN=""
	s pObj23.content="patient"

	s pObj25.S="CD-USERTYPE"
	s pObj25.SL=""
	s pObj25.SV="1.0"
	s pObj25.L=""
	s pObj25.DN=""
	s pObj25.content="site"
		
	s pObj30.SV="1.0"
	s pObj30.SL=""
	s pObj30.S="ID-PATIENT"
	s pObj30.content=NoPat

	d pObj24.id.SetAt(pObj30,1)

	s pObj21.cd=pObj23
	s pObj21.patient=pObj24

	d pObj26.id.SetAt(pObj27,1)
	d pObj26.cd.SetAt(pObj28,1)
	s pObj26.name=NomHop	
	
	s pObj22.cd=pObj25
	s pObj22.hcparty=pObj26
	
	s pObj20.user1=pObj21
	s pObj20.user2=pObj22
	s pObj20.type=pObj29

	s pObj1.request=pObj2
	s pObj1.userlink=pObj20
	s pObj.Requete=pObj1
	s pObj.TimeoutEnSecondes=30
	
	$$$TRACE("¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨")
	q $$$OK
}

Storage Default
{
<Data name="GetUserLinkRequest1DefaultData">
<Subscript>"GetUserLinkRequest1"</Subscript>
<Value name="1">
<Value>Requete</Value>
</Value>
<Value name="2">
<Value>TimeoutEnSecondes</Value>
</Value>
</Data>
<DefaultData>GetUserLinkRequest1DefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
