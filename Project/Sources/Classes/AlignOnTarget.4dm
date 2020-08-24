Class constructor($macroDescription : Object)
	
	// Retrieve the alignement type parameter from the JSON macro File
	This:C1470.type:=$macroDescription.type
	
Function onInvoke($editor : Object)->$return : Object
	var $objectName : Text
	var $width; $height : Integer
	
	If (($editor.editor.target#Null:C1517) & ($editor.editor.currentSelection.length>0))
		
		Case of 
				
				// Align to Left on Target Object macro
			: (This:C1470.type="left")
				
				For each ($objectName; $editor.editor.currentSelection)
					If ($editor.editor.target#$objectName)
						$width:=This:C1470.getWidth($editor.editor.currentPage.objects[$objectName])
						$editor.editor.currentPage.objects[$objectName].left:=$editor.editor.currentPage.objects[$editor.editor.target].left
						If ($editor.editor.currentPage.objects[$objectName].right#Null:C1517)
							$editor.editor.currentPage.objects[$objectName].right:=$editor.editor.currentPage.objects[$objectName].left+$width
						End if 
					End if 
				End for each 
				
				// Align to Right on Target Object macro
			: (This:C1470.type="right")
				
				For each ($objectName; $editor.editor.currentSelection)
					If ($editor.editor.target#$objectName)
						$width:=This:C1470.getWidth($editor.editor.currentPage.objects[$objectName])
						$editor.editor.currentPage.objects[$objectName].left:=$editor.editor.currentPage.objects[$editor.editor.target].left+This:C1470.getWidth($editor.editor.currentPage.objects[$editor.editor.target])-$width
						If ($editor.editor.currentPage.objects[$objectName].right#Null:C1517)
							$editor.editor.currentPage.objects[$objectName].right:=$editor.editor.currentPage.objects[$objectName].left+$width
						End if 
					End if 
				End for each 
				
				// Align to Top on Target Object macro
			: (This:C1470.type="top")
				
				For each ($objectName; $editor.editor.currentSelection)
					If ($editor.editor.target#$objectName)
						$height:=This:C1470.getHeight($editor.editor.currentPage.objects[$objectName])
						$editor.editor.currentPage.objects[$objectName].top:=$editor.editor.currentPage.objects[$editor.editor.target].top
						If ($editor.editor.currentPage.objects[$objectName].bottom#Null:C1517)
							$editor.editor.currentPage.objects[$objectName].bottom:=$editor.editor.currentPage.objects[$objectName].top+$height
						End if 
					End if 
				End for each 
				
				// Align to Down on Target Object macro
			: (This:C1470.type="down")
				
				For each ($objectName; $editor.editor.currentSelection)
					If ($editor.editor.target#$objectName)
						$height:=This:C1470.getHeight($editor.editor.currentPage.objects[$objectName])
						$editor.editor.currentPage.objects[$objectName].top:=$editor.editor.currentPage.objects[$editor.editor.target].top+This:C1470.getHeight($editor.editor.currentPage.objects[$editor.editor.target])-$height
						If ($editor.editor.currentPage.objects[$objectName].bottom#Null:C1517)
							$editor.editor.currentPage.objects[$objectName].bottom:=$editor.editor.currentPage.objects[$objectName].top+$height
						End if 
					End if 
				End for each 
				
			Else 
				ALERT:C41("Type attribute is invalid.")
				
		End case 
		
		// Notify to 4D the modification
		$return:=New object:C1471("currentPage"; $editor.editor.currentPage)
		
	Else 
		
		$return:=Null:C1517
		
	End if 
	
	
	
Function getWidth($o : Object)->$width : Integer
	If ($o.width=Null:C1517)
		$width:=$o.right-$o.left
	Else 
		$width:=$o.width
	End if 
	
Function getHeight($o : Object)->$height : Integer
	If ($o.height=Null:C1517)
		$height:=$o.bottom-$o.top
	Else 
		$height:=$o.height
	End if 