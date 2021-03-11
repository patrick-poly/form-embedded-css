var $css : Object
var $media : Text

If (Form event code:C388=On Load:K2:1)
	
	Form:C1466.result:=False:C215
	
	ARRAY OBJECT:C1221(path; 0)
	ARRAY TEXT:C222(media; 0)
	ARRAY BOOLEAN:C223(listBoxSel; 0)
	
	For each ($css; Form:C1466.embedded_css)
		APPEND TO ARRAY:C911(listBoxSel; False:C215)
		
		APPEND TO ARRAY:C911(path; New object:C1471("valueType"; "text"; "value"; $css.path; "alternateButton"; True:C214; "emptyForAdd"; False:C215))
		
		$media:=$css.media
		If (($media="mac") | ($media="windows"))
			APPEND TO ARRAY:C911(media; $css.media)
		Else 
			APPEND TO ARRAY:C911(media; "none")
		End if 
		
	End for each 
	
	_AddEmptyRow
	
End if 