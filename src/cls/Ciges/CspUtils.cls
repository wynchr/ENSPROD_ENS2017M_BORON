Class Ciges.CspUtils Extends %CSP.Page
{

Parameter AUTHENTICATED As BOOLEAN = 0;

Parameter ENCODED As BOOLEAN = 1;

Parameter PRIVATE As BOOLEAN = 1;

Parameter WEBAPP As STRING;

Parameter DOMAIN As STRING = "ciges";

ClassMethod QuoteJSON(text As %String = "") As %String
{
    Set str = """"_$REPLACE($ZCVT(text,"O","JS"),"\'","'")_""""
    Quit $REPLACE(str,"\x2F","/") //Caché 2012.2.3 traduit le "/" en "\x2F" dans le convert JS
}

/// Alimente le %session avec les données du browser
///  - %session.Data("browser",browser)=version~detail
/// <ul>
///  <li>browser : Nom du browser
///   <ul>
///    <li>ie</li>
///    <li>firefox</li>
///    <li>webkit</li>
///   </ul>
///  </li>
///  <li>version : version du browser</li>
///  <li>detail : détails supplémentaires sur le browser.
///   <ul>
///    <li>Si browser=webkit : chrome ou safari</li>
///   </ul>
///  </li>
/// </ul>
ClassMethod setBrowser() As %Status
{
    q:$G(%session)="" $$$ERROR(5001,"%session object is mandatory")
    q:($D(%session.Data("browser"))'=0) $$$OK
    s browser="not_supported"
    s browserVersion=""
    s browserDetail=""
    s userAgent=$ZCONVERT($G(%request.CgiEnvs("HTTP_USER_AGENT"),"ie"),"U")
    s browserMobile=""
    s listMobile=$LB("ANDROID","TABLET OS","WEBOS","IPHONE","IPAD","IPOD","BLACKBERRY","IEMOBILE","OPERA MINI")
    s p=0
    while ($LISTNEXT(listMobile,p,mobile)) {
        if ($FIND(userAgent,mobile)>0) {
            s browserMobile=mobile
            q  
        }    
    }
    //TRIDENT for IE11
    s ie=$FIND(userAgent,"MSIE")
    if (ie>0) {
        s browser="ie"
        s version=$FIND(userAgent,";",ie)
        s browserVersion=$E(userAgent,ie+1,version-2)   
    } elseif( $FIND(userAgent,"BOIE")>0) { //IE11
        s browser="ie"
        s version=$FIND(userAgent,"RV:",ie)
        s browserVersion=$E(userAgent,version,version+3)         
    } elseif ($FIND(userAgent,"TRIDENT")>0) { //IE11
        s browser="ie"
        s version=$FIND(userAgent,"RV:",ie)
        s browserVersion=$E(userAgent,version,version+3)         
    } else {
        s firefox=$FIND(userAgent,"FIREFOX")
        if (firefox>0) {
            s browserVersion=$E(userAgent,firefox+1,$LENGTH(userAgent))  
            s browser="firefox"
        } else {
            s webkit=$FIND(userAgent,"APPLEWEBKIT")
            if (webkit>0) {
                s browser="webkit"
                s chrome=$FIND(userAgent,"CHROME")
                s safari=$FIND(userAgent,"SAFARI")
                if (chrome>0) { 
                    s browserVersion=$E(userAgent,chrome+1,safari-7)
                    s browserDetail="chrome"        
                } else {
                    s version=$FIND(userAgent,"VERSION")
                    s browserVersion=$E(userAgent,version+1,safari-7)
                    s browserDetail="safari"   
                }
            } else {
                s opera=$FIND(userAgent,"OPERA")
                if (opera>0) {
                    s browser="opera"  
                    s version=$FIND(userAgent,"VERSION")
                    s browserVersion=$E(userAgent,version+1,$LENGTH(userAgent))
                }
            }
        }
    }
    s %session.Data("browser",browser)=browserVersion_"~"_browserDetail_$S(browserMobile'="":"~"_browserMobile,1:"")
    q $$$OK
}

/// Vérification du browser et de sa version
/// Exemple de tests sur la version :
/// <ul>
///  <li>29.0 : uniquement pour la version 29.0</li>
///  <li>29.0+ : version 29.0 et supérieures</li>
/// </ul>
ClassMethod checkBrowser(browser As %String, version As %String = "") As %Boolean
{
    q:$G(%session)="" 0
    d:($D(%session.Data("browser"))=0) ..setBrowser()
    s browser=$ZCVT(browser,"l")
    s browserName=$ZCVT($O(%session.Data("browser","")),"l")
    if (version="") {
        q:(browser=browserName) 1    
    } else {
        s browserVersion=$P(%session.Data("browser",browserName),"~",1)
        if ($FIND(version,"+")) {
            q:((browserName=browser)&&(+browserVersion>=+version)) 1      
        } else {
            q:((browserName=browser)&&(browserVersion=version)) 1    
        }
    }
    q 0
}

/// Initialise les propriétés "génériques" du displayP et le bloc utilisé par les appels Ajax
ClassMethod writeCSPHeader(ByRef displayP As %ArrayOfDataTypes = {##class(%ArrayOfDataTypes).%New()}) As %Boolean
{
    s ^zCWY("..#CSPURL") = ..#CSPURL
    d displayP.SetAt(##class(%File).GetFilename(..#CSPURL),"pageURL")
    d displayP.SetAt(..%ClassName(1),"pageClass")
    d $CLASSMETHOD(displayP.GetAt("pageClass"),"loadCSPHeader",.displayP)
    if ($G(%request.Data("action",1))'="") {
        TRY {
            s sc=$ZOBJCLASSMETHOD(..%ClassName(1),%request.Data("action",1))     
        } CATCH(ex) {
        if ($TLEVEL>0) {
            TROLLBACK
        }
        THROW ex
        }
        q 0
    }
    q 1
}

/// Méthode à redéfinir dans les pages enfants (csp) pour charger des infos spécifiques dans le displayP
ClassMethod loadCSPHeader(ByRef displayP As %ArrayOfDataTypes = {##class(%ArrayOfDataTypes).%New()}) As %Status
{
    q $$$OK
}

}
