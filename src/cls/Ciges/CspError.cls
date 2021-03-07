Class Ciges.CspError Extends (Ciges.CspUtils, %CSP.Error) [ ClassType = "", ProcedureBlock ]
{

Parameter PAGENOTFOUNDERRORPAGE = 1;

ClassMethod OnPage() As %Status
{
 s sc=$$$OK
 s isJSON=($FIND($ZCVT(%request.CgiEnvs("HTTP_ACCEPT"),"l"),"application/json")>0)
 if isJSON{
  s errorcode=%request.Get("Error:ErrorNumber")
  if ((errorcode=$$$ERRORCODE($$$CSPSessionTimeout))||(errorcode=$$$ERRORCODE($$$InvalidDecrypt))){
 &html<
 {
  "status":"time_out",
  "data":"Session timeout"
 }> 
  }
  elseif errorcode=5001{
   d $SYSTEM.Status.DecomposeStatus(%request.Get("Error:ErrorCode"),.err)
 &html<
 {
  "status":"error",
  "data":[>
   s idx=$O(err("")) 
   while idx'=""{
	w ##class(Ciges.CspUtils).QuoteJSON($P(err(idx),errorcode_": ",2))
	s idx=$O(err(idx))
	w:idx'="" ","    
   } 
 &html<
         ]
 }> 	  
  }
  else{
   s errId=..doLogError() 
 &html<
 {
  "status":"crash",
  "data":"#((errId))#"
 }> 
  }
 }
 else{
  s errorcode=%request.Get("Error:ErrorNumber")
  //Tentative d'ouvrir une page PRIVATE en tapant l'URL dans le browser
  if errorcode=$$$ERRORCODE($$$CSPIllegalRequest){
 &html<	  
   <script language="javascript">
   top.location.replace("logon.csp");
   </script>>
  }
  elseif errorcode=5001{
   d $SYSTEM.Status.DecomposeStatus(%request.Get("Error:ErrorCode"),.err)
   w "<script language=""javascript"">"
 &html<
   var data={
    "status":"error",
    "data":[>
   s idx=$O(err("")) 
   while idx'=""{
	w ##class(Ciges.CspUtils).QuoteJSON($P(err(idx),errorcode_": ",2))
	s idx=$O(err(idx))
	w:idx'="" ","    
   } 
 &html<
           ]
   };
   top.displayStatus(data);>
   w "</script>"	  
  }
  //Timeout de session
  // Appel de la fonction de gestion des erreurs de session de bDoc.csp
  elseif ((errorcode=$$$ERRORCODE($$$CSPSessionTimeout))||(errorcode=$$$ERRORCODE($$$InvalidDecrypt))){
 &html<
  <script language="javascript">
  top.cspRunServerMethodError();
  </script>>	 
  }
  else{
   s errId=..doLogError()
 &html<
   <script language="javascript">
   if (window.top===window.self){
    var msg=#(..QuoteJS($$$Text("Une erreur est survenue")))#+'.';
    msg+='\r\n';
    msg+=#(..QuoteJS($$$FormatText($$$Text("Elle porte le n° %1"),errId)))#+'.';
    msg+='\r\n';
    msg+=#(..QuoteJS($$$Text("Merci de communiquer ce n° au helpdesk")))#+'.';
    alert(msg);
   }
   else{
    top.displayCSPError(#(..QuoteJS(errId))#);
    top.hideWait();	  
   }
  </script>>
  }
 }	
 q sc
}

ClassMethod HyperEventError()
{
 q 1
}

ClassMethod doLogError() As %String
{
 s logId=""
 TRY{
  s log=##class(Ciges.CspErrorLog).%New()
  do ..DecomposeError(%request.Get("Error:ErrorCode"),.ErrorInfo)
  //Parcourt de l'objet l'erreur
  for i=1:1:ErrorInfo{
   if ErrorInfo(i,"ErrorNo")=$$$ERRORCODE($$$FailedToCreateClass){
	d log.log("Compile Errors : ")
	s j=$O(ErrorInfo(i,"Error",""))
	while j'=""{
	 s desc=$O(ErrorInfo(i,"Error",j,""))
	 while desc'=""{
	  d log.log(desc,ErrorInfo(i,"Error",j,desc))
	  s desc=$O(ErrorInfo(i,"Error",j,desc))	 
	 }
	 s j=$O(ErrorInfo(i,"Error",j))	
	}
   }
   s desc=$O(ErrorInfo(i,""))
   while desc'=""{
    d log.log(desc,ErrorInfo(i,desc))
	s desc=$O(ErrorInfo(i,desc))  
   }
  }
  
  //Informations générales sur l'installation
  d log.log("----------------------------------------")
  d log.log("Installation")
  d log.log("----------------------------------------")
  d log.log("Running on",$ZV)
  d log.log("Namespace",$znspace)
  d log.log("Process ID",$J)
  d log.log("User",$select($LG(%session.SecurityContext)="":"UnknownUser",1:$LIST(%session.SecurityContext)))
  d log.log("Roles",$S($LG(%session.SecurityContext)="":"UnknownUser",1:$LIST(%session.SecurityContext))_" - "_$LG(%session.SecurityContext,3))
  d log.log("Time (UTC)",$zdt($ztimestamp))
  
  //Contenu du %request
  d log.log("----------------------------------------")
  d log.log("Queries")
  d log.log("----------------------------------------")
  s name=$O(%request.Data(""))
  if name=""  {
   d log.log("Empty")	  
  }
  else{
   s name=$O(%request.Data(""))
   while name'=""{
	s index=$O(%request.Data(name,""))
	while index'=""{
	 s value=%request.Data(name,index)
	 if name="Error:ErrorCode"{
	  s value=$SYSTEM.Status.GetErrorText(value) 
	 }
	 d log.log(name,value)
	 s index=$O(%request.Data(name,index))	
	}
	s name=$O(%request.Data(name))   
   }   
  }
  d ..dumpObject(%request,.log,"%request Properties")
  d ..dumpSet(%request,"CgiEnv",.log,"CGI Variables")
  d ..dumpSet(%request,"Cookie",.log,"Cookies")
  d ..dumpStream(%request,.log,"Streams")
  d ..dumpObject(%session,.log,"%session Properties")
  d ..dumpMultidimentional("%session.Data",.log,"Session Data")
  d ..dumpObject(%response,.log,"%response Properties")
  s sc=log.%Save()	
  s:$$$ISOK(sc) logId=log.%Id()
  //d ##class(Ciges.CspSuper).debug("Exception~"_logId,,0,$G(%request.Data("Error:PageName",1)))
 }
 CATCH(ex){
  w $SYSTEM.Status.GetErrorText(ex.AsStatus())
 }
 q logId
}

ClassMethod dumpObject(oref As %String, ByRef log As Ciges.CspErrorLog, title As %String = "")
{
 d log.log("----------------------------------------")
 d log.log(title)
 d log.log("----------------------------------------")
 s class=##class(%CompiledClass).%OpenId($ZOBJCLASS(oref))
 s kProp=""
 s prop=class.Properties.GetNext(.kProp)
 while kProp'=""{
  if '((prop.Private)||(prop.MultiDimensional)||(prop.Name="Key"&&($zobjclass(oref)="%CSP.Session"))){
   d log.log(prop.Name,$ZOBJPROPERTY(oref,prop.Name))
  }
  s prop=class.Properties.GetNext(.kProp) 
 }
}

ClassMethod dumpMultidimentional(key As %String, ByRef log As Ciges.CspErrorLog, title As %String = "")
{
 d log.log("----------------------------------------")
 d log.log(title)
 d log.log("----------------------------------------")
 s ref=key
 if $D(@ref)=0 {
  d log.log("Empty")
 }
 elseif $D(@ref)#10{
  d log.log(ref,@ref)
 }
 s ref=$Q(@ref)
 while ref'=""{
  d log.log(key_"("_$P(ref,"(",3,$$$MaxStringLength)_")",@ref)
  s ref=$Query(@ref)
 }
}

ClassMethod dumpStream(oref As %String, ByRef log As Ciges.CspErrorLog, title As %String = "")
{
 d log.log("----------------------------------------")
 d log.log(title)
 d log.log("----------------------------------------")
 s key=$method(oref,"Next","")
 if key=""{
  d log.log("Empty")	 
 }
 else{
  set key=$method(oref,"NextMimeData","") 
  while key'=""{
   s stream=$method(oref,"GetMimeData",key)
   d log.log(key_" : Size",stream.Size)
   d log.log(key_" : ContentType",stream.ContentType)
   d log.log(key_" : Section",stream.MimeSection)
   d log.log(key_" : Class",$classname(stream))
   set key=$method(oref,"NextMimeData",key)  
  }	 
 }
}

ClassMethod dumpSet(oref As %String, suffix As %String, ByRef log As Ciges.CspErrorLog, title As %String = "")
{
 d log.log("----------------------------------------")
 d log.log(title)
 d log.log("----------------------------------------")
 s key=$method(oref,"Next"_suffix,"")
 if key=""{
  d log.log("Empty")	 
 }
 else{
  set key=$method(oref,"Next"_suffix,"") 
  while key'=""{
   d log.log(key,$method(oref,"Get"_suffix,key))
   set key=$method(oref,"Next"_suffix,key)  
  }
 }
}

}
