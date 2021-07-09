var $i : Integer
var $o : Object

Form:C1466.embedded_css:=Null:C1517

$i:=Size of array:C274(path)

While ($i>0)
	If ((path{$i}.emptyForAdd=True:C214) | (path{$i}.value=""))
		DELETE FROM ARRAY:C228(listBoxSel; $i)
		DELETE FROM ARRAY:C228(path; $i)
		DELETE FROM ARRAY:C228(media; $i)
	End if 
	$i:=$i-1
End while 
If (Size of array:C274(path)>0)
	If ((Size of array:C274(path)=1) & (media{1}="none"))
		Form:C1466.embedded_css:=path{1}.value
	Else 
		Form:C1466.embedded_css:=New collection:C1472
		For ($i; 1; Size of array:C274(path))
			$o:=New object:C1471("path"; path{$i}.value)
			If (media{$i}#"none")
				$o.media:=media{$i}
			End if 
			Form:C1466.embedded_css.push($o)
		End for 
	End if 
End if 
Form:C1466.result:=True:C214
CANCEL:C270