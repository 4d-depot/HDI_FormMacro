Function onInvoke($editor : Object)->$result : Object
	var $name : Text
	
	If ($editor.editor.currentSelection.length>0)
		
		// Set stroke to red for each selected objects
		For each ($name; $editor.editor.currentSelection)
			$editor.editor.currentPage.objects[$name].stroke:="red"  // use red string
		End for each 
		
	Else 
		ALERT:C41("Please, select a form object.")
	End if 
	
	// Notify to 4D the modification
	$result:=New object:C1471("currentPage"; $editor.editor.currentPage)