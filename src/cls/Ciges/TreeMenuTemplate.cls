Class Ciges.TreeMenuTemplate Extends Ciges.TreeLevel
{

Property libel As %String;

Property url As %String(MAXLEN = 3000);

/// Autre cible pour un point de menu que l'iframe passée à la méthode html.
/// Ex : _blank : nouvel onglet
Property target As %String;

/// Icone qui sera visible à coté du point de menu
Property icon As %String(MAXLEN = "");

Index urlIDX On url;

/// Effectue le rendu du treeview
/// <ul>
/// <li>targetId : ID de l'iframe où ouvrir l'URL
/// <li>admin : Permet de savoir si on ce trouve dans le paramétrage du menu : 1/""
/// </ul>
Method html(targetId As %String, admin As %String = "") As %Status
{
 s idHtml=##class(Ciges.Utils).replaceString(..%Id(),"||","-")
 s:(admin'="") idHtml=idHtml_"_admin"
 s:..target="" ..target=targetId
 s hasSubNodes=$ISOBJECT(..nodes.GetNext(""))
 if ..isTop      //C'est le premier noeud --> on parcourt les branches et on écrit le JS
 {
 &html<
 <DIV id="cigesMenu-#(idHtml)#"> 
  <UL id="topMenu-#(idHtml)#" class="ciges-topMenu">>
  s kSub=""
  s subN=..nodes.GetNext(.kSub)
  while kSub'=""
  {
 &html<
   <LI>>  
   s sc=subN.html(targetId,$s(admin'="":1,1:""))
   s subN=..nodes.GetNext(.kSub)   
 &html<
   </LI>> 
  } 
 &html<
  </UL>
 </DIV>> 
  w "<script language=""javascript"">"
 if 'admin{
 &html<
 $j(#(##class(%CSP.Page).QuoteJS("#cigesMenu-"_idHtml_" SPAN.ciges-subMenuLibel"))#).click(
  function(event){
   var data=$j(this).metadata();
   $j(data.subNodeId).toggle();   
  });
 >
 }
 &html<
 $j(#(##class(%CSP.Page).QuoteJS("#cigesMenu-"_idHtml_" SPAN.ciges-menuItem"))#).mouseenter(
  function(event){
   if (!$j(this).hasClass('ciges-menuItemSelected')){
    $j(this).addClass('ui-state-hover');
   }   
  })
                          .mouseleave(
  function(event){
   $j(this).removeClass('ui-state-hover');	  
  })                        
                          .click(
  function(event){
   $j(#(##class(%CSP.Page).QuoteJS("#cigesMenu-"_idHtml_" SPAN.ciges-menuItem"))#).removeClass('ciges-menuItemSelected'); 
   $j(this).addClass('ciges-menuItemSelected').removeClass('ui-state-hover');
   var data=$j(this).metadata();
   var target=data.target;
   if ((target!='_blank')&&(target!='_top')){
	target=$j(target);  
   }
   top.openPage(data.url,target); 
   top.hideWait(); 
  });>
  w "</scr"_"ipt>"
 }
 else
 {
  if 'hasSubNodes //Dernier noeud
  {
 &html<
 <SPAN id="node-#(idHtml)#" class="ciges-menuItem texte1 pointer {url:#(##class(%CSP.Page).QuoteJS($s(admin'="":"",1:..url)))#,target:#(##class(%CSP.Page).QuoteJS($s(admin'="":"",1:..target)))#,subNodeId:#(##class(%CSP.Page).QuoteJS("#subNode-"_idHtml))#}">
  #(..libel)#
 </SPAN>>
  }
  else           //Il y a des sous branches
  {
 &html<
 <SPAN id="node-#(idHtml)#" class="ciges-subMenuLibel ui-state-default texte1b pointer {subNodeId:#(##class(%CSP.Page).QuoteJS("#subNode-"_idHtml))#}">
 #(..libel)#
 </SPAN> 
  <UL id="subNode-#(idHtml)#">>	  
   s kSub=""
   s subN=..nodes.GetNext(.kSub)
   while kSub'=""
   {
  &html<
   <LI>> 	
  	s sc=subN.html(targetId,$s(admin'="":1,1:""))
	s subN=..nodes.GetNext(.kSub)   
  &html<
   </LI>>  
   }  
 &html<
  </UL>>  
  }  	 
 }
 q $$$OK
}

Query qryAll() As %SQLQuery(CONTAINID = 1)
{
SELECT ID,libel FROM Ciges.TreeMenuTemplate WHERE topNode IS NULL ORDER BY libel
}

ClassMethod hasChildren(id As %String) As %Boolean
{
	&sql(SELECT count(*) into :cpt from Ciges.TreeMenuTemplate where topNode =:id)
	q:((SQLCODE=0)&&(cpt>0)) 1
	q 0
}

ClassMethod getTopLevel(id As %String) As %String
{
	&sql(SELECT TOP 1 topNode into :topNode from Ciges.TreeMenuTemplate where ID =:id)
	q:(SQLCODE=0) topNode
	q ""
}

ClassMethod openByUrl(url As %String) As Ciges.TreeMenuTemplate
{
	&sql(SELECT TOP 1 ID into :theId from Ciges.TreeMenuTemplate where url =:url)
	q:(SQLCODE=0) ..%OpenId(theId)
	q ""
}

ClassMethod getMainMenu() As Ciges.TreeMenuTemplate
{
	s obj=""
	&sql(SELECT TOP 1 ID into :theId from Ciges.TreeMenuTemplate where isTop =1)
	s:(SQLCODE=0) obj=..%OpenId(theId)
	if '$ISOBJECT(obj){
		s obj=..%New()
		s obj.libel="Menu Global"
		s obj.libel="MenuG"
		d obj.%Save()
	}
	q obj
}

ClassMethod getFullName(treeId As %String) As %String [ SqlProc ]
{
	s tree=##class(Ciges.TreeMenuTemplate).%OpenId(treeId)
	s libel=""
	if $ISOBJECT(tree.topNode){
		s libel2=..getFullName(tree.topNode.%Id())
		s:libel2'="" libel=libel2_" - "
		s libel=libel_tree.libel
	}
	q libel
}

Storage Default
{
<Data name="TreeMenuTemplateDefaultData">
<Subscript>"TreeMenuTemplate"</Subscript>
<Value name="1">
<Value>libel</Value>
</Value>
<Value name="2">
<Value>url</Value>
</Value>
<Value name="3">
<Value>target</Value>
</Value>
<Value name="4">
<Value>icon</Value>
</Value>
</Data>
<DefaultData>TreeMenuTemplateDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
