Function onInvoke($editor : Object)
	var $pages : Object
	var $objectName : Text
	var $attribute : Text
	var $errorMessage : Text
	$errorMessage:=""
	
	// List of attribute with an image path
	var $imageAttribute : Collection
	$imageAttribute:=New collection:C1472("customBackgroundPicture"; "picture"; "icon")
	
	//Loop on pages
	For each ($pages; $editor.editor.form.pages)
		
		//Loop on objects in page
		For each ($objectName; $pages.objects)
			
			// Loop on image attribute
			For each ($attribute; $imageAttribute)
				If (Not:C34(This:C1470.checkPath($pages.objects[$objectName]; $attribute; $editor.editor.file.parent.path)))
					$errorMessage:=$errorMessage+$objectName+" - "+$attribute+" - "+$pages.objects[$objectName][$attribute]+"\n"
				End if 
			End for each 
			
		End for each 
		
	End for each 
	
	// Display error and push on the clipborad
	If ($errorMessage#"")
		SET TEXT TO PASTEBOARD:C523($errorMessage)
		ALERT:C41("Invalid path for:\n"+$errorMessage; "Paste to clipboard")
	End if 
	
	
Function checkPath($object : Object; $attribute : Text; $pathForm : Text)->$isCorrect : Boolean
	$isCorrect:=False:C215
	
	If ($object[$attribute]#Null:C1517)
		If ($object[$attribute][[1]]="/")
			// absolute path
			$isCorrect:=File:C1566($object[$attribute]; fk posix path:K87:1; *).exists
		Else 
			// relatif path to the form
			$isCorrect:=File:C1566($pathForm+$object[$attribute]; fk posix path:K87:1; *).exists
		End if 
	Else 
		// if null property
		$isCorrect:=True:C214
	End if 