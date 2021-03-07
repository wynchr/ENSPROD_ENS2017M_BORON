Class CHUBXL.Utils.doPurgeProduction Extends %SYS.Task.Definition
{

/// This method is responsible for executing the task.<br>
/// At the scheduled time, the Task Manager creates an instance of this object,
/// sets any property values using the stored "settings" for the task, and then
/// invokes this method to execute the task.<br>
/// In order to execute a real task, override this method in a subclass.
Method OnTask() As %Status
{
	
	s st=##class(CHUBXL.Utils.ClassHelper).purgeProduction(..daysToKeep,.detailDeleted)
	s k=$O(detailDeleted(""))
	while (k'="") {
		w k,"=",detailDeleted(k),!
		s k=$O(detailDeleted(k))
	}
	q st
}

/// Messages older than daysToKeep will be deleted
Property daysToKeep As %Integer [ InitialExpression = "7" ];

}
