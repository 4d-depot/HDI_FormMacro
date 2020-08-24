Class constructor($macroDescription : Object)
	
	// Retrieve the color parameter from the JSON macro File
	This:C1470.color:=$macroDescription.color
	
Function onInvoke($editor : Object)->$result : Object
	var $name : Text
	
	If ($editor.editor.currentSelection.length>0)
		
		// Set stroke to the defined color for each selected objects
		For each ($name; $editor.editor.currentSelection)
			$editor.editor.currentPage.objects[$name].stroke:=This:C1470.color  // use the color parameter
		End for each 
		
	Else 
		ALERT:C41("Please, select a form object.")
	End if 
	
	// Notify to 4D the modification
	$result:=New object:C1471("currentPage"; $editor.editor.currentPage)