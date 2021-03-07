Class Ciges.TreeMenu Extends Ciges.TreeLevel
{

Property name As %String(MAXLEN = "");

Property libel As %String(MAXLEN = "");

Property url As %String(MAXLEN = "");

/// Autre cible pour un point de menu que l'iframe passée à la méthode html.
/// Ex : _blank : nouvel onglet
Property target As %String(MAXLEN = "");

/// permet de spécifier un autre targetType que iframe (par defaut)
/// ex : div
Property targetType As %String(MAXLEN = "");

/// Icone qui sera visible à coté du point de menu
Property icon As %String(MAXLEN = "");

/// permet de customiser le style d'un node
Property style As %String(MAXLEN = "");

/// permet de lancer du javascript lors du click
Property onclick As %String(MAXLEN = "");

Index nameIdx On name [ Unique ];

ClassMethod getIdByName(name As %String = "") As %String
{
	&sql(SELECT TOP 1 ID into :id FROM Ciges.TreeMenu WHERE name =:name)
	q:(SQLCODE=0) id
	q ""
}

ClassMethod openByName(name As %String) As Ciges.TreeMenu
{
 &sql(SELECT TOP 1 ID into :id FROM Ciges.TreeMenu WHERE name =:name)
 q:(SQLCODE=0) ..%OpenId(id)
 q ""
}

/// Effectue le rendu du treeview
/// <ul>
/// <li>targetId : ID de l'iframe où ouvrir l'URL
/// <li>admin : Permet de savoir si on ce trouve dans le paramétrage du menu : 1/""
/// </ul>
Method html(targetId As %String = "", admin As %String = "", targetType As %String = "iframe") As %Status
{
	s idHtml=$REPLACE(..%Id(),"||","-")
	s:(admin'="") idHtml=idHtml_"_admin"
	s:..target="" ..target=targetId
	s:..targetType="" ..targetType=targetType
	s hasSubNodes=$ISOBJECT(..nodes.GetNext(""))
	if (..isTop) {
		&html<
		<ul id="topMenu-#(idHtml)#" class="nav navbar-nav topNode">>
		 s kSub=""
		 s subN=..nodes.GetNext(.kSub)
		 while (kSub'="") {
			 &html<
			 <li>>  
			  s sc=subN.html(targetId,$s(admin'="":1,1:""),targetType)
			  s subN=..nodes.GetNext(.kSub)   
			 &html<
			 </li>> 
		 } 
		&html<
		</ul>> 
	} else {
		if ('hasSubNodes) { // Dernier noeud
			&html<
			<a href="#" id="node-#(idHtml)#" data-url="#(..url)#" class="nodeLink">#(..libel)#</a>>
		} else  { // Il y a des sous branches
			&html<
			<label class="tree-toggler nav-header">
			 <i class="fa fa-fw #(..icon)#"></i>
			 #(..libel)#
			 <i class="chevron fa fa-fw fa-chevron-left" style="float:right;padding-top:5px;"></i>
			</label>
			<ul id="subNode-#(idHtml)#" class="nav navbar-nav tree subNode" style="display:none;">>	  
			 s kSub=""
			 s subN=..nodes.GetNext(.kSub)
			 while (kSub'="") {
				 &html<
				 <li style="width:100%;">>	
				  s sc=subN.html(targetId,$s(admin'="":1,1:""),targetType)
				  s subN=..nodes.GetNext(.kSub)   
				 &html<
				 </li>>  
			 }  
			&html<
			</ul>>  
		}  	 
	}
	q $$$OK
}

Query qryAll() As %SQLQuery(CONTAINID = 1)
{
SELECT ID,libel FROM Ciges.TreeMenu WHERE topNode IS NULL ORDER BY libel
}

ClassMethod hasChildren(id As %String) As %Boolean
{
	&sql(SELECT count(*) into :cpt from Ciges.TreeMenu where topNode =:id)
	q:((SQLCODE=0)&&(cpt>0)) 1
	q 0
}

ClassMethod getTopLevel(id As %String) As %String
{
	&sql(SELECT TOP 1 topNode into :topNode from Ciges.TreeMenu where ID =:id)
	q:(SQLCODE=0) topNode
	q ""
}

Method getNodeIdByLibel(libel As %String) As %String
{
	s theId=""
	s k=""
	s sub=..nodes.GetNext(.k)
	while ((k'="")&&(theId="")){
		if ..getFullName(sub.%Id())=libel{
		//if sub.libel=libel{
			s theId=sub.%Id()
		}
		if theId=""{
			s theId=sub.getNodeIdByLibel(libel)
		}
		s sub=..nodes.GetNext(.k)
	}
	q theId
}

ClassMethod getFullName(treeId As %String) As %String [ SqlProc ]
{
	s tree=##class(Ciges.TreeMenu).%OpenId(treeId)
	s libel=""
	if $ISOBJECT(tree.topNode){
		s libel2=..getFullName(tree.topNode.%Id())
		s:libel2'="" libel=libel2_" - "
		s libel=libel_tree.libel
	}
	q libel
}

ClassMethod removeLink(theId As %String) As %Status
{
 s sc=1
 s treeMenu = ##class(Ciges.TreeMenu).%OpenId(theId)
 if ($ISOBJECT(treeMenu)){
	 s idTree=treeMenu.%Id()	 
	 if ##class(Ciges.TreeMenu).hasChildren(idTree){
		s k=""
		s node=treeMenu.nodes.GetNext(.k)
		while k'=""{
			s sc= ..removeLink(node.%Id())
			s node=treeMenu.nodes.GetNext(.k)
		}
	 }
	 if 'treeMenu.isTop{
		 s sc= ..%DeleteId(idTree)
	 }
	 
 }
 q sc
}

Method getTopLevelId() As %String
{
	s theId=""
	if ..isTop{
		s theId=..%Id()	
	}else{
		s theId=..topNode.getTopLevelId()
	}
	q theId
}

Storage Default
{
<Data name="TreeMenuDefaultData">
<Subscript>"TreeMenu"</Subscript>
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
<Value>name</Value>
</Value>
<Value name="5">
<Value>targetType</Value>
</Value>
<Value name="6">
<Value>icon</Value>
</Value>
<Value name="7">
<Value>style</Value>
</Value>
<Value name="8">
<Value>onclick</Value>
</Value>
</Data>
<DefaultData>TreeMenuDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
