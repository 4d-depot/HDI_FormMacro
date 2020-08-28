Function onInvoke($editor : Object)
	var $pages : Object
	var $objectName : Text
	var $attribute : Text
	var $errorMessage : Text
	$errorMessage:=""
	
	//Loop on pages
	For each ($pages; $editor.editor.form.pages)
		
		//Loop on objects in page
		For each ($objectName; $pages.objects)
			If (Not:C34(This:C1470.checkMethodPath($pages.objects[$objectName]; $editor.editor.file.parent.path)))
				$errorMessage:=$errorMessage+$objectName+" - "+$pages.objects[$objectName]["method"]+"\n"
			End if 
		End for each 
		
	End for each 
	
	// Display error and push on the clipborad
	If ($errorMessage#"")
		SET TEXT TO PASTEBOARD:C523($errorMessage)
		ALERT:C41("Invalid path for:\n"+$errorMessage; "Paste to clipboard")
	End if 
	
	
	
Function checkMethodPath($object : Object; $formPath : Text)->$isCorrect : Boolean
	$isCorrect:=False:C215
	
	If ($object["method"]#Null:C1517))
		
		If (Position:C15("4dm"; $object["method"])#0)
			
			If ($object["method"][[1]]="/")
				// custom method file path
				$isCorrect:=This:C1470.checkPath($object; $attribute)
			Else 
				// standard object method file path
				$isCorrect:=File:C1566($formPath+$object["method"]; fk posix path:K87:1; *).exists
			End if 
			
		Else   //project method
			$isCorrect:=File:C1566("/SOURCES/Methods/"+$object["method"]+".4dm"; fk posix path:K87:1; *).exists
			
		End if 
		
	Else 
		
		// if null property
		$isCorrect:=True:C214
		
	End if 