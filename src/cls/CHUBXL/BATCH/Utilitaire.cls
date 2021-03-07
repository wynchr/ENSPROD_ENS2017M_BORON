Class CHUBXL.BATCH.Utilitaire Extends %Persistent
{

ClassMethod DeleteEnsHL7(Id) As %Status
{
	s CntRec=0,CntDel=0,CntDel0=0
	For index=1:1:$o(^EnsHL7.Segment(Id,""),-1) {
		Set segid=$g(^EnsHL7.Segment(Id,index))
		If $tr(segid," ")'="" { 
		   s CntRec=CntRec+1
		   s idx=""
		   s %IdSize=%IdSize+$l($g(^EnsHL7.Segment(Id,index)))
		   if '$d(^EnsHL7.Segment(Id,index,0)) s CntDel0=CntDel0+1 k ^EnsHL7.Segment(Id,index)
		   f  s idx=$o(^EnsHL7.Segment(Id,index,0,idx)) q:idx=""  d
		     . i '$d(^EnsLib.H.MessageD(idx)) s CntDel=CntDel+1 Kill ^EnsHL7.Segment(Id,index) ;w Id," - ",idx," - ",^EnsHL7.Segment(Id,index),! 
	    }
	}
	w "Nombre de records "_$j(Id,7)_" : "_CntRec,!
	w "Nombre de delete  "_$j(Id,7)_"  : "_CntDel_" - "_$g(CntDel0)," - ",CntDel+$g(CntDel0),!
	Quit $$$OK
}

ClassMethod NettEnsHL7() As %Status
{
	s Id="",%AllSize=0,%IdSize=0
	For  s Id=$o(^EnsHL7.Segment(Id)) q:Id=""  d ..DeleteEnsHL7(Id) s %AllSize=%AllSize+%IdSize,%IdSize=0
	w "Nombre de taille totale : "_%AllSize,!	
	Quit $$$OK
}

ClassMethod Utils() As %Status
{
	;s i="",n=0 f  s i=$o(^dulio1(i)) q:i=""  s rec=^dulio1(i) i +$p(rec,"~",1) 
	;w "insert into mv_treefid_desc (TREE_DESC,TREE_FID,TYPE,SERVICE,DESCRIPTION,NHOP,CHANGEDATE,CHANGEDBY) values 
	;('PLUS"_$p(rec,"~",2),"',",$p(rec,"~",1),",'PLUS','PLUS','",$p(rec,"~",3),"','BRU',TO_DATE('08/05/2016','MM/DD/YYYY'),'AMBDUL');",!! ;
	;s n=n+1
	Quit $$$OK
}

Storage Default
{
<Data name="UtilitaireDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<DataLocation>^CHUBXL.BATCH.UtilitaireD</DataLocation>
<DefaultData>UtilitaireDefaultData</DefaultData>
<IdLocation>^CHUBXL.BATCH.UtilitaireD</IdLocation>
<IndexLocation>^CHUBXL.BATCH.UtilitaireI</IndexLocation>
<StreamLocation>^CHUBXL.BATCH.UtilitaireS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
