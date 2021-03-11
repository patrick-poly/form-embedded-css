Class constructor
	var $1 : Object
	
Function onInvoke
	var $1; $0; $formData : Object
	var $css : Collection
	var $type; $w : Integer
	
	$type:=OB Get type:C1230($1.editor.formProperties; "css")
	
	Case of 
		: ($type=Is text:K8:3)
			$css:=New collection:C1472
			If ($1.editor.formProperties.css#"")
				$css.push(New object:C1471("path"; $1.editor.formProperties.css))
			End if 
		: ($type=Is collection:K8:32)
			$css:=$1.editor.formProperties.css.copy()
		Else 
			$css:=New collection:C1472
	End case 
	
	$formData:=New object:C1471
	$formData.result:=True:C214
	$formData.embedded_css:=$css
	$formdata.formFile:=File:C1566($1.editor.file.platformPath; fk platform path:K87:2; *)
	
	$w:=Open form window:C675("edit_css"; Movable form dialog box:K39:8)
	DIALOG:C40("edit_css"; $formData)
	CLOSE WINDOW:C154($w)
	
	$0:=New object:C1471
	If ($formData.result=True:C214)
		$0.formProperties:=$1.editor.formProperties
		If ($formData.embedded_css=Null:C1517)
			OB REMOVE:C1226($0.formProperties; "css")
		Else 
			$0.formProperties.css:=$formData.embedded_css
		End if 
	End if 
	
Function onError
	
	var $1; $2 : Object
	var $3 : Collection
	