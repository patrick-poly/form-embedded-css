
If (Form event code:C388=On Delete Action:K2:56)
	
	var $ind : Integer
	$ind:=Size of array:C274(listBoxSel)
	
	While ($ind>0)
		If (listBoxSel{$ind}=True:C214)
			If (path{$ind}.emptyForAdd=False:C215)
				DELETE FROM ARRAY:C228(listBoxSel; $ind)
				DELETE FROM ARRAY:C228(path; $ind)
				DELETE FROM ARRAY:C228(media; $ind)
			End if 
		End if 
		$ind:=$ind-1
	End while 
	
End if 

If (Form event code:C388=On Double Clicked:K2:5)
	var $x; $y; $col; $row : Integer
	LISTBOX GET CELL POSITION:C971(*; "listBoxSel"; $x; $y; $col; $row)
	If ($row=0)
		$newRow:=Size of array:C274(listBoxSel)+1
		LISTBOX INSERT ROWS:C913(*; "listbox"; $newRow)
		path{$newRow}:=New object:C1471("valueType"; "text"; "value"; ""; "alternateButton"; True:C214)
		media{$newRow}:="none"
		
		EDIT ITEM:C870(path; $newRow)
		
	End if 
End if 

If (Form event code:C388=On Begin Drag Over:K2:44)
	If (path{FORM Event:C1606.row}.emptyForAdd)
		$0:=-1
	Else 
		$0:=0
	End if 
End if 

If (Form event code:C388=On Row Moved:K2:32)
	var $ind : Integer
	$ind:=Size of array:C274(path)
	If (path{$ind}.emptyForAdd=False:C215)
		
		While ($ind>0)
			If (path{$ind}.emptyForAdd=True:C214)
				DELETE FROM ARRAY:C228(listBoxSel; $ind)
				DELETE FROM ARRAY:C228(path; $ind)
				DELETE FROM ARRAY:C228(media; $ind)
				$ind:=0
			End if 
			$ind:=$ind-1
		End while 
		_AddEmptyRow
	End if 
End if 