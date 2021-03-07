Class Ciges.Utils Extends %RegisteredObject
{

/// Vérifie qu'une classe existe
ClassMethod classExists(class As %String = "") As %Boolean
{
	q ##class(%Dictionary.ClassDefinition).%ExistsId(class)
}

/// Vérifie qu'une méthode existe pour une classe donnée
ClassMethod methodExists(class As %String = "", method As %String = "") As %Boolean
{
	 q ##class(%Dictionary.CompiledMethod).%ExistsId(class_"||"_method)
}

/// Vérifie qu'une propriété existe pour une classe donnée
ClassMethod propertyExists(class As %String = "", property As %String = "") As %Boolean
{
	 q ##class(%Dictionary.CompiledProperty).%ExistsId(class_"||"_property)
}

ClassMethod getClassNameForSQL(className As %String) As %String
{
	s classNameSQL=""
	s list=$lfs(className,".")
	for cmpti=1:1:$ll(list)-1{
		s:classNameSQL'="" classNameSQL=classNameSQL_"_"
		s classNameSQL=classNameSQL_$lg(list,cmpti)
	}
	s classNameSQL=classNameSQL_"."_$lg(list,$ll(list))
	q classNameSQL
}

/// Justifie une chaine de caractère et la suffixe par un caractère<br/>
/// Arguments :
/// <ul>
///  <li>string : chaine de caractère à modifier</li>
///  <li>width : longueur du justify</li>
///  <li>replaceString : caractère de remplacement</li>
/// </ul>
ClassMethod justify(string As %String = "", width As %Integer = 0, replaceString As %String = " ") As %String
{
	q:(string="") ""
	q $REPLACE($J(string,width)," ",replaceString)
}

/// Retourne le nom du produit InterSystems Installé
ClassMethod getProductName() As %String
{
	s productName="Cach&eacute;"
	if (##class(%Library.EnsembleMgr).IsHealthShareInstalled()) {
		s productName="HealthShare"
	} elseif (##class(%Library.EnsembleMgr).IsEnsembleInstalled()) {
		s productName="Ensemble"
	}
	q productName
}

/// Renvoi les données renseignées dans les property d'objet de classe (displayList et valueList)
/// retournera sous cette forme : $lb($lb("libelle 1",1),$lb("libelle 2",2))
ClassMethod getDisplayAndValueListProperty(className As %String, property As %String, ByRef displayAndValueList As %List)
{
	s displayAndValueList=""
	s prop=##class(%Dictionary.CompiledProperty).%OpenId(className_"||"_property)
	if ($ISOBJECT(prop)){
		s displayList=$lfs(prop.Parameters.GetAt("DISPLAYLIST"),",")
		s valueList=$lfs(prop.Parameters.GetAt("VALUELIST"),",")		
		for i=1:1:$ll(displayList){
			s displayAndValueList=displayAndValueList_$lb($lb($lg(displayList,i),$lg(valueList,i)))
		}		
	}
}

/// Récupérer la liste des propriétés d'une classe avec ses définitions
ClassMethod getAllPropertiesWithInfo(className As %String, Output propertyArr As %RegisteredObject)
{
	k propertyArr
	s rs=##class(%ResultSet).%New("%Dictionary.PropertyDefinitionQuery:Summary")
	d rs.Execute(className)
	while (rs.Next()){
		s properyName=rs.GetData(1)
		s prop=##class(%Dictionary.PropertyDefinition).%OpenId(className_"||"_properyName)
		s commentaire=""
		s commentaire=prop.Description	 
		s typeProp=prop.Type	   	
		s propertyArr(properyName,typeProp)=commentaire  
	}
	d rs.Close()
}

/// Purge un répertoire de ses fichiers<br/>
/// directory : Répertoire à purger<br/>
/// extension : extension des fichiers à supprimer, si nécessaire<br/>
/// purgeType :
/// <ul>
///  <li>1 : ne garder que X jours de fichiers dans le répertoire</li>
///  <li>2 : ne garder que X fichiers dans le répertoire</li>
/// </ul>
/// purgeValue : valeur associée au type de purge
ClassMethod purgeDirectory(directory As %String = "", extension As %String = "", purgeType As %Integer = 1, purgeValue As %Integer = 0) As %Status
{
	s sc=$$$OK
	q:('##class(%File).DirectoryExists(directory)) $$$ERROR(5001,"Le répertoire n'existe pas")
	q:((purgeType'=1) && (purgeType'=2)) $$$ERROR(5001,"Le type de purge n'est pas reconnu")
	q:(purgeValue<0) $$$ERROR(5001,"La valeur du type de purge doit être >=0")
	s beforeDate=$ZDT($H-0_",0",3)
	s:(purgeType=1) beforeDate=$ZDT($H-purgeValue_",0",3)
	s:(extension'="") extension="*."_extension
	s rs=##class(%Library.File).FileSetFunc(directory,"*"_extension,"DateCreated",0)
	while (rs.%Next()) {
		// Si on ne garde qu'un nombre de jour, il est inutile de continuer à boucler si on a dépassé la date limite
		q:((purgeType=1) && ($SYSTEM.SQL.DATEDIFF("mi",beforeDate,rs.%Get("DateCreated"))>0))
		s fileToDel($i(fileToDel))=rs.%Get("Name")
	}
	s kFile=$O(fileToDel(""),-1)
	// Si on ne garde qu'un nombre de fichier, on boucle dans le tableau autant de fois que nécessaire 
	// pour ne pas que les fichiers soient supprimés
	if ((purgeType=2) && (purgeValue>0)) {
		for cptDel=1:1:purgeValue {
			q:(kFile="")
			s kFile=$O(fileToDel(kFile),-1)
		}
	}
	while ((kFile'="") && ($$$ISOK(sc))) {
		s sc=##class(%File).Delete(fileToDel(kFile))
		s kFile=$O(fileToDel(kFile),-1)
	}
	q $$$OK
}

/// Purge les messages, log, ... de la production
ClassMethod purgeProduction(daysToKeep As %Integer = 0) As %Status
{
	q:(daysToKeep<0) $$$ERROR(5001,"Le nombre de jour à garder doit être >=0")
	s sc=$$$OK
	do DISABLE^%NOJRN
    s sc=##class(Ens.Purge).PurgeAll(,daysToKeep,0,1)
    do ENABLE^%NOJRN
    q sc
}

}
