

Function onInvoke($editor : Object)->$return : Object
	
	var $path : 4D:C1709.File
	$path:=File:C1566("/SOURCES/FormMacros.json")
	
	OPEN URL:C673($path.platformPath)
	
	$return:=Null:C1517