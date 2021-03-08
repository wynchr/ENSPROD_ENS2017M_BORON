Class CHUBXL.Version Extends %RegisteredObject [ ClassType = "", ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
Version log

VERSION
-------
CWY 31/07/2018  Initial version
DAM
NOTES
-------
s x=##class(CHUBXL.Version).ENSPROD() w x
--------------------------------------------------------------------------------------------------------------------------------
*/
ClassMethod ENSPROD(version As %String = "", developper As %String = "") As %String
{
	/*
	----------------------------------------------------------------------------------------------------------------------------
CWY 31/07/2018  1.0		All			Initial version
CWY	01/08/2018	1.1		All			Add Comment
VWY	02/08/2018	1.2		All			New Classes in Production 
--------------------------------------------------------------------------------------------------------------------------------
	*/
	
	i version = "" 		s version 		= "1.2"
	i developper = "" 	s developper	= "CWY"
	
	i version '= ##class(Application.Parameter).getParameter("ENSPROD","INFO","VERSION") {
		s verdate = $ZDATETIME($H,3,1)
		d ##class(Application.Parameter).setParameter("ENSPROD","INFO","VERSIONDATE","Date de la version",verdate,0)	
	} else {
		s verdate = ##class(Application.Parameter).getParameter("ENSPROD","INFO","VERSIONDATE")			
	}	
	
	d ##class(Application.Parameter).setParameter("ENSPROD","INFO","VERSION","Version applicative",version,0)
	d ##class(Application.Parameter).setParameter("ENSPROD","INFO","VERSIONDEVELOPPER","Développeur de la version",developper,0)

	Quit version_"|"_developper_"|"_verdate
}

}
