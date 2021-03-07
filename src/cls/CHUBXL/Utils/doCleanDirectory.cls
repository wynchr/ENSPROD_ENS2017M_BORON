Class CHUBXL.Utils.doCleanDirectory Extends %SYS.Task.Definition
{

/// This method is responsible for executing the task.<br>
/// At the scheduled time, the Task Manager creates an instance of this object,
/// sets any property values using the stored "settings" for the task, and then
/// invokes this method to execute the task.<br>
/// In order to execute a real task, override this method in a subclass.
Method OnTask() As %Status
{
	// Delete old archive directories

	;d ##class(CHUBXL.Utils.Cleaner).cleanDirectory(30,"G:\PROD\Agfa\archive\All")
	
	Set tRS=##class(%ResultSet).%New("%Library.File:FileSet")
    Set tSC=tRS.Execute("G:\PROD","*.*")

    While tRS.Next() {
	    s DirLev1=tRS.Get("Name")_"\archive"
		Set tRS1=##class(%ResultSet).%New("%Library.File:FileSet")
    	Set tSC=tRS1.Execute(DirLev1,"*.*")
    	While tRS1.Next() {
	    	s DirLev2=tRS1.Get("Name")
	    	i $e(DirLev2,1)="G" d ##class(CHUBXL.Utils.Cleaner).cleanDirectory(30,DirLev2)
		}
		s DirLev1=tRS.Get("Name")_"\out"
		Set tRS1=##class(%ResultSet).%New("%Library.File:FileSet")
    	Set tSC=tRS1.Execute(DirLev1,"*.*")
    	While tRS1.Next() {
	    	s DirLev2=tRS1.Get("Name")
   			Set tRS2=##class(%ResultSet).%New("%Library.File:FileSet")
	    	Set tSC=tRS2.Execute(DirLev2,"*.*")
	    	While tRS2.Next() {
		    	s DirLev3=tRS2.Get("Name")
		    	i $e(DirLev3,1)="G" d ##class(CHUBXL.Utils.Cleaner).cleanDirectory(30,DirLev3)
			}
		}
	}
	quit 1
}

}
