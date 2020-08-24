Function onInvoke($editor : Object)->$result : Object
	
	var $btnHello : Object
	
	// Create a "Hello" button
	$btnHello:=New object:C1471("type"; "button"; \
		"text"; "Hello World!"; \
		"method"; New object:C1471("source"; "ALERT(\"coucou\")"); \
		"events"; New collection:C1472("onClick"); \
		"width"; 120; \
		"height"; 20; \
		"top"; 0; \
		"left"; 0)
	
	
	// Add button in the current page
	$editor.editor.currentPage.objects.btnHello:=$btnHello
	
	
	// Select the new button in the form editor
	$editor.editor.currentSelection.clear()
	$editor.editor.currentSelection.push("btnHello")
	
	
	// Notify to 4D the modification
	$result:=New object:C1471(\
		"currentSelection"; $editor.editor.currentSelection; \
		"currentPage"; $editor.editor.currentPage)
	