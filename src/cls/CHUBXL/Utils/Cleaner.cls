Class CHUBXL.Utils.Cleaner Extends %SYS.Task.Definition
{

/// Clean archive directories
/// Nettoyage des fichiers de plus de X jours
ClassMethod cleanDirectory(daysOld As %Integer, directory As %String) As %Status
{
	s now=$P($h,",",1)
	s directory=$ZCVT(directory,"U")
	s dirToClean=directory_"\"
	w "Directory to clean : "_dirToClean,!
	s dirFiles=##class(%ResultSet).%New("%Library.File:FileSet")
	;s fileMask=directory_"*.*"
	s fileMask="*.*"
	d dirFiles.Execute(dirToClean,fileMask,"",1)
	s fileError=""
	while dirFiles.Next() {
		w "Directory Name : "_dirFiles.Data("Name")_" ("_dirFiles.Data("DateModified")_")",!
		s dtMod=$P($ZDATETIMEH(dirFiles.Data("DateModified"),3,1),",",1)
		if ((now-daysOld)>dtMod) {
			if (dirFiles.Data("Type")="D") {
				w "Delete Directory : "_dirFiles.Data("Name"),!
				if ('..deleteDirectory(dirFiles.Data("Name"))) {
					s fileError=dirFiles.Data("Name")
					q 
				}
			}
			if (dirFiles.Data("Type")="F") {
				w "Delete File : "_dirFiles.Data("Name"),!
				if ('##class(%Library.File).Delete(dirFiles.Data("Name"))) {
					s fileError=dirFiles.Data("Name")
					q 
				}
			}
		}
	}
	d dirFiles.Close()
	if (fileError'="") {
		q $SYSTEM.Status.Error(4444,"ErrorDelete:"_fileError)
	}
	q $$$OK
}

ClassMethod copyDirectory(fromDir As %String, toDir As %String) As %Status
{
	s fromDir=##class(%File).NormalizeDirectory(fromDir)
	s status=1
	s toDir=##class(%File).NormalizeDirectory(toDir)
	if ('##class(%File).Exists(toDir)) {
		d ##class(%File).CreateDirectoryChain(toDir)
	}
	s dirFile=##class(%ResultSet).%New("%Library.File:FileSet")
	s fileMask="*.*"
	d dirFile.Execute(fromDir,fileMask,"",1)
	while dirFile.Next() {
		if dirFile.Data("Type")="F" {
			s status=##class(%File).CopyFile(dirFile.Data("Name"),toDir_##class(%File).GetFilename(dirFile.Data("Name")))
			q:('status)
		}
		if dirFile.Data("Type")="D" {
			s status=..copyDirectory(dirFile.Data("Name"),toDir_$P(dirFile.Data("Name"),fromDir,2))
			q:('status)
		}
	}
	d dirFile.Close()
	q:('$G(status,1)) status
	q $$$OK
}

ClassMethod deleteDirectory(dirName As %String) As %Status
{
	s dirName=##class(%File).NormalizeDirectory(dirName)
	s dirFile=##class(%ResultSet).%New("%Library.File:FileSet")
	s fileMask="*.*"
	d dirFile.Execute(dirName,fileMask,"",1)
	while dirFile.Next() {
		if dirFile.Data("Type")="F" {
			w "Delete File : "_dirFile.Data("Name"),!
			s status=##class(%File).Delete(dirFile.Data("Name"))
			q:('status)
		}
		if dirFile.Data("Type")="D" {
			w "Delete Directory : "_dirFile.Data("Name"),!
			s status=..deleteDirectory(dirFile.Data("Name"))
			q:('status)
		}
	}
	d dirFile.Close()
	
	q:('$G(status,1)) status
	if (##class(%File).RemoveDirectory(dirName)) {
		q $$$OK
	}
	else {
		q -1
	}
}

}
