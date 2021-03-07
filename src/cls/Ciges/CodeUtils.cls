Include %sySystem

Class Ciges.CodeUtils Extends %RegisteredObject
{

ClassMethod find(String As %String, ByRef listFound As %Binary) As %Boolean
{
	q ..findInFiles(String,"*.cls,*.mac,*.rul",0,0,1,,,.listFound)
}

/// Find a particular string inside a list of files.
/// <br><var>String</var> is the string to search for.
/// The <var>PatternList</var> is the list of items to search. Typically this will
/// be '*.*' but you can specify just MAC and INC files with '*.mac,*.inc' or a
/// list of individual files with 'abc.mac,def.cls'. The acceptable extensions at this
/// time are int,mac,inc,bas,cls,csp,csr,prj,mvm,bam,mvb.
/// The list of matches is written to the screen. If <var>pSystem</var> is true then it also
/// searches system routines and classes (where the source is available) when searching the
/// entire namespace. If <var>WholeWords</var> is true then it will only find whole
/// words and not fragments, it defaults to false. If <var>CaseSensitive</var> is true (the default)
/// then the search is case sensitive, otherwise it is case insensitive.
/// The maximum number of matches it will find can be specified in <var>Max</var>
/// which defaults to 200. If <var>wild</var> is false then the <var>PatternList</var> does not contain
/// any wild cards and so should be treated as a string literal search even the pattern contains ?*\ characters.
ClassMethod findInFiles(String As %String, PatternList As %String, pSystem As %Boolean = 0, WholeWords As %Boolean = 0, CaseSensitive As %Boolean = 1, Filter As %String(MAXLEN=512) = "", wild As %Boolean = 1, ByRef listFound As %Binary) As %Boolean
{
	New %SourceControl,%Files
	Set found=0,%Files=0
	Set pattern=String,attrs=""
	k listFound
	s Max=9999999
	If WholeWords Set attrs=attrs_","_$$$GetSimpleMessage("%Compiler","SearchWholeWords")
	If pSystem Set attrs=attrs_","_$$$GetSimpleMessage("%Compiler","SearchSystem")
	If CaseSensitive Set attrs=attrs_","_$$$GetSimpleMessage("%Compiler","SearchCase")
	// Write !,$$$GetSimpleMessage("%Compiler","SearchFor")_"'"_String_"'"_$$$GetSimpleMessage("%Compiler","SearchIn")_"'"_PatternList_"'"_$select(attrs="":"",1:" ("_$extract(attrs,2,*)_")")
	Set pattern=$select(CaseSensitive:pattern,1:$zconvert(pattern,"l"))
	If wild,pattern["?"||(pattern["*")||(pattern["\")||(WholeWords) {
		Set pattern=##class(%Studio.Project).pattern(pattern,WholeWords,.wild)
	} Else {
		Set wild=0
	}
	Set sc=##class(%RoutineMgr).StudioOpenDialogExecute(.QHandle,PatternList,1,1,pSystem,1,,,Filter)
	If $$$ISERR(sc) Quit sc
	Set idx=$list(QHandle)
	Set item=$order(^||%RoutineList(idx,1,""),1,data)
	While item'=""&&(found<Max) {
		If ..searchItem(pattern,$list(data),.found,wild,CaseSensitive,Max,String,WholeWords,.listFound) Set %Files=%Files+1
		Set item=$order(^||%RoutineList(idx,1,item),1,data)
	}
	Kill ^||%RoutineList(idx)
	q (found>0)
}

/// Search this specific items for the string
ClassMethod searchItem(pattern As %String, Name As %String, ByRef Found As %Integer = 0, wild As %Boolean = 0, CaseSensitive As %Boolean = 1, Max As %Integer = 200, Pattern As %String, WholeWords As %Boolean = 0, ByRef listfound As %Binary) As %Boolean
{
#define check(%str,%pat,%case,%wild) $s(%wild:$s('%case:$zcvt(%str,"l"),1:%str)?@%pat,'%case:$zcvt(%str,"l")[%pat,1:%str[%pat)
	Set oldFound=Found
	Set name=$piece(Name,".",1,$length(Name,".")-1),type=$zconvert($piece(Name,".",$length(Name,".")),"U")
	If name="" Quit 0
	If Name["/"||(Name["\") {
		Set csp=##class(%CSP.Routine).%New(Name)
		If csp=$$$NULLOREF Quit 0
		If $$$check(name,pattern,CaseSensitive,wild) Set Found=Found+1 ;Write $char(13,10)_Name_": "_Name 
		Set trail=""
		For lineno=1:1 {
			If csp.AtEnd Quit
			Set eol=0,line=trail_csp.ReadLine(32000,,.eol),trail=""
			If $$$check(line,pattern,CaseSensitive,wild) Write $char(13,10)_Name_"("_lineno_"): "_$zstrip(line,"<W") Set Found=Found+1 If Found'<Max Quit
			If $$$check(line,pattern,CaseSensitive,wild) Set Found=Found+1 Quit
			If 'eol Set lineno=lineno-1,trail=$extract(line,*-700,*)
		}
	} ElseIf ##class(%RoutineMgr).UserType(Name,.cls) {
		Do $classmethod(cls,"Search",Name,Pattern,WholeWords,CaseSensitive,Max,.Found)
	} ElseIf type="CLS" {
		If '$data(^oddDEF(name)) Quit 0
		Do ..searchClassNode(Name,"^oddDEF("""_name_""")",$$$cROOTclass,name,pattern,.Found,"",CaseSensitive,Max,wild) 
	} ElseIf $$$rtnIsMAC(type) {
		If '$data(^rMAC(name,0)) Quit 0
		If $$$check(name,pattern,CaseSensitive,wild) Set Found=Found+1
		Set l=0 For lineno=1:1:$get(^rMAC(name,0,0)) If $data(^(lineno),line),$increment(l),$$$check(line,pattern,CaseSensitive,wild) Do  If Found Quit
		. Set Found=Found+1
	} ElseIf $$$rtnIsINT(type) {
		If '$data(^ROUTINE(name,0)) Quit 0
		If $$$check(name,pattern,CaseSensitive,wild) Set Found=Found+1
		Set l=0 For lineno=1:1:$get(^ROUTINE(name,0,0)) If $data(^(lineno),line),$increment(l),$$$check(line,pattern,CaseSensitive,wild) Do  If Found Quit
		. Set Found=Found+1
	} ElseIf $$$rtnIsINC(type) {
		If '$data(^rINC(name,0)) Quit 0
		If $$$check(name,pattern,CaseSensitive,wild) Set Found=Found+1
		Set l=0 For lineno=1:1:$get(^rINC(name,0,0)) If $data(^(lineno),line),$increment(l),$$$check(line,pattern,CaseSensitive,wild) Do  If Found Quit
		. Set Found=Found+1
	} ElseIf type="PRJ" {
		Set prj=##class(%Studio.Project).%OpenId(name)
		If prj'=$$$NULLOREF {
			If $$$check(name,pattern,CaseSensitive,wild) Set Found=Found+1
			Set item="",items=prj.Items
			#; Create list of items in this project.
			Set itemobj=items.GetNext(.item)
			While item'=""&&(Found<Max) {
				If $isobject(itemobj) {
					Set name=itemobj.Name,type=itemobj.Type
					If ..searchItem(Pattern,name_$select(type="CLS":".CLS",1:""),.Found,WholeWords,CaseSensitive,Max,.listFound) Set %Files=%Files+1
					Do items.%UnSwizzleAt(item)
				}
				Set itemobj=items.GetNext(.item)
			}
		}
	}
	if (oldFound'=Found)&&('$D(listfound(Name))) {
		s listfound=$i(listfound)
		s listfound(Name)=""
	}
	Quit (oldFound'=Found)
}

/// Search this class for the string
ClassMethod searchClassNode(Name As %String, ref As %String, type As %String, NewName As %String, pattern As %String, ByRef Found As %Integer, Tree As %String, CaseSensitive As %Boolean = 1, Max As %Integer = 200, Wild As %Boolean = 0) [ Private ]
{
#define check(%str,%pat,%case,%wild) $s(%wild:$s('%case:$zcvt(%str,"l"),1:%str)?@%pat,'%case:$zcvt(%str,"l")[%pat,1:%str[%pat)
	Set value="",data=$data(@ref,value)
	#;
	#; Check for 'value' nodes e.g property parameters 
	If 'data Quit
	Set line=$translate(Tree,","," ") If $$$check(line,pattern,CaseSensitive,Wild) Do outputMatch If Found'<Max Quit
	Set line=NewName If $$$check(line,pattern,CaseSensitive,Wild) Do outputMatch If Found'<Max Quit
	Set line=value If $$$check(line,pattern,CaseSensitive,Wild) Do outputMatch If Found'<Max Quit
	If data=1 Quit
	Set key="" For  Set key=$Order(@ref@(key),1,value) Quit:key=""  Do  Quit:Found'<Max
	  #; If this key isn't defined for this tnode type then don't output
	. Set external=$$$tableSubSubToExtGet(type,key) If external=""||(external="Name") Quit
	  #; If the keyword is of type "k", that is, its a keyword with a single value
	. If $extract($$$tableTypeGet(type,key))="k" Do
	    #; If this is the implementation we need to output all the subnodes
	. . If $$$tableMultiLineGet(type,key) Do  Quit
	. . . For lineno=1:1:value Do  Quit:Found'<Max
	. . . . Set line=@ref@(key,lineno)
	. . . . If $$$check(line,pattern,CaseSensitive,Wild) Do outputMatch
	. . If $$$check(external,pattern,CaseSensitive,Wild) Set line=value Do outputMatch Quit
	. . Set line=value
	. . If $$$check(line,pattern,CaseSensitive,Wild) Do
	. . . If $length(value,$char(13,10))=1 Do outputMatch Quit
	. . . For lineno=1:1:$length(value,$char(13,10)) Do  Quit:Found'<Max
	. . . . Set line=$piece(value,$char(13,10),lineno)
	. . . . If $$$check(line,pattern,CaseSensitive,Wild) Do outputMatch
	. Else  Do
	. . Set name="" For  Set name=$Order(@ref@(key,name)) Quit:name=""  Do ..searchClassNode(Name,$zreference,key,name,pattern,.Found,Tree_external_","_name_",",CaseSensitive,Max,Wild) Quit:Found'<Max
	Quit
outputMatch Set Found=Found+1,output=$char(13,10)_Name
	If $piece(Tree,",")'="Storage" {
		Set output=output_"("_$piece(Tree,",",2)
		If $get(external)="Implementation" {
			Set output=output_$select($get(lineno)>0:"+"_(lineno),1:"")_")"
		} ElseIf $get(external)="FormalSpec" {
			;Write output_"): "_$piece(Tree,",",2)_"(",$zstrip(line,"<W"),")" Quit
			q
		} ElseIf $piece(Tree,",",$length(Tree,",")-2)="Parameter" {
			Set output=output_")" If $length(Tree,",")>4 Set output=output_"["_$piece(Tree,",",$length(Tree,",")-1)_"]"
		} Else {
			Set output=output_")" If $get(external)'="" Set output=output_"["_external_$select($get(lineno)>0:"+"_lineno,1:"")_"]"
		}
	} Else {
		Set output=output_"(Storage)["_$piece(Tree,",",2,$$$MaxStringLength)_$get(external)_"]"
	}
	;Write output_": "_$zstrip(line,"<W")
	Quit
}

}
