Function onInvoke($editor : Object)->$result : Object
	var $objectName : Text
	var $hWnd : Integer
	var $obj : Object
	
	$obj:=New object:C1471(\
		"currentSelection"; $editor.editor.currentSelection; \
		"objects"; $editor.editor.currentPage.objects; \
		"listObjects"; New collection:C1472)
	
	//Retrieve the list of object in the current page
	For each ($objectName; $editor.editor.currentPage.objects)
		$obj.listObjects.push($objectName)
	End for each 
	
	// Open a dialog to select object in the list
	$hWnd:=Open form window:C675("dialObjectInfo"; Movable form dialog box:K39:8; *)
	DIALOG:C40("dialObjectInfo"; $obj)
	CLOSE WINDOW:C154
	
	// Select the form object 
	$editor.editor.currentSelection.clear()
	If ($obj.currentSelection#Null:C1517)
		For each ($objectName; $obj.currentSelection)
			$editor.editor.currentSelection.push($objectName)
		End for each 
	End if 
	
	// Notify to 4D the modification
	$result:=New object:C1471("currentSelection"; $editor.editor.currentSelection)