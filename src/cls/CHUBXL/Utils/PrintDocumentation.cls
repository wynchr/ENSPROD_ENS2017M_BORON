Class CHUBXL.Utils.PrintDocumentation Extends %SYS.Task.Definition
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
UTILITIES : Print Documentation

VERSION
-------
CWY 08/01/2018  Initial version

d ##class(IRIS.Utils.PrintDocumentation).PROD()
--------------------------------------------------------------------------------------------------------------------------------
*/
/// This method is responsible for executing the task.<br>
/// At the scheduled time, the Task Manager creates an instance of this object,
/// sets any property values using the stored "settings" for the task, and then
/// invokes this method to execute the task.<br>
/// In order to execute a real task, override this method in a subclass.
Method OnTask() As %Status
{
	s sc=$$$OK
    d ##class(CHUBXL.Utils.PrintDocumentation).PROD()
    q sc
}

ClassMethod FTP() As %Status
{

	Set status=##class(Ens.Config.Production).CreateDocumentPDF("IRIS.ProductionFTP",1,"T:\EXPORT\FTP\ProductionFTP.pdf",.Log)
	
	Set status=##class(Ens.Config.Production).CreateDocumentHTML("IRIS.ProductionFTP",1,.URL,.ErrLog)
	
	w URL,!
	
	Quit $$$OK
}

ClassMethod PROD() As %Status
{

	Set status=##class(Ens.Config.Production).CreateDocumentPDF("CHUBXL.ProductionPROD",1,"T:\EXPORT\PROD\ProductionPROD.pdf",.Log)
	
	Set status=##class(Ens.Config.Production).CreateDocumentHTML("CHUBXL.ProductionPROD",1,.URL,.ErrLog)
	
	w URL,!
	
	Quit $$$OK
}

ClassMethod PREP() As %Status
{

	Set status=##class(Ens.Config.Production).CreateDocumentPDF("CHUBXL.ProductionPREP",1,"T:\EXPORT\PREP\ProductionPREP.pdf",.Log)
	
	Set status=##class(Ens.Config.Production).CreateDocumentHTML("CHUBXL.ProductionPREP",1,.URL,.ErrLog)
	
	w URL,!
	
	Quit $$$OK
}

ClassMethod TEST() As %Status
{

	Set status=##class(Ens.Config.Production).CreateDocumentPDF("IRIS.ProductionTEST",1,"T:\EXPORT\TEST\ProductionTEST.pdf",.Log)
	
	Set status=##class(Ens.Config.Production).CreateDocumentHTML("IRIS.ProductionTEST",1,.URL,.ErrLog)
	
	w URL,!
	
	Quit $$$OK
}

}
