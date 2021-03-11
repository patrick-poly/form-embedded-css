
If (Form event code:C388=On Before Data Entry:K2:39)
	Form:C1466.oldValue:=path{FORM Event:C1606.row}.value
End if 


If (Form event code:C388=On Data Change:K2:15)
	If (path{FORM Event:C1606.row}.emptyForAdd)
		If (path{FORM Event:C1606.row}.value#"")
			If (_CountPath(path{FORM Event:C1606.row}.value; ->path)=1)
				path{FORM Event:C1606.row}.emptyForAdd:=False:C215
				_AddEmptyRow
			Else 
				ALERT:C41("This path is already registered")
			End if 
		End if 
	Else 
		If (path{FORM Event:C1606.row}.value="")
			path{FORM Event:C1606.row}.value:=Form:C1466.oldValue
		Else 
			If (_CountPath(path{FORM Event:C1606.row}.value; ->path)>1)
				path{FORM Event:C1606.row}.value:=Form:C1466.oldValue
				ALERT:C41("This path is already registered")
			End if 
		End if 
	End if 
End if 

//If (Form event code=On Losing Focus)
//If ((Form.oldValue="") & (path{FORM Event.row}.value=""))
//DELETE FROM ARRAY(listBoxSel; FORM Event.row)
//DELETE FROM ARRAY(path; FORM Event.row)
//DELETE FROM ARRAY(media; FORM Event.row)
//End if 
//End if 

If (Form event code:C388=On Alternative Click:K2:36)
	var $selectedFilePath; $path; $formFolderPath; $tmp; $sub : Text
	var $file; $selectedFile : cs:C1710.File
	var $folder : cs:C1710.Folder
	var $lenSelected : Integer
	
	ARRAY TEXT:C222(fileList; 0)
	
	$path:=path{FORM Event:C1606.row}.value
	$formFolderPath:=Form:C1466.formFile.parent.path
	
	If ($path="")
		$file:=File:C1566(Form:C1466.formFile.path; fk posix path:K87:1)
	Else 
		If (($path[[1]]="/") | (Is Windows:C1573 & ($path[[2]]=":") & (($path[[3]]="/"))))
			// a filesystem path or full path
			$file:=File:C1566(path{FORM Event:C1606.row}.value)
		Else 
			// pas de / chemin relatif au form
			$file:=File:C1566(Form:C1466.formFile.parent.path+path{FORM Event:C1606.row}.value; fk posix path:K87:1)
		End if 
	End if 
	
	$selectedFilePath:=Select document:C905($file.parent.platformPath; ".css"; "Select CSS File"; 16; fileList)
	
	If ($selectedFilePath#"")
		$selectedFile:=File:C1566(fileList{1}; fk platform path:K87:2)
		
		$path:=_ValidatePath($selectedFile.path; $formFolderPath)
		
		If ($path#"")
			If (_CountPath($path; ->path)=0)
				
				path{FORM Event:C1606.row}.value:=$path; 
				
				If (path{FORM Event:C1606.row}.emptyForAdd)
					path{FORM Event:C1606.row}.emptyForAdd:=False:C215
					_AddEmptyRow
				End if 
			Else 
				ALERT:C41("This path is already registered")
			End if 
		Else 
			If (Not:C34(_IsInsidePackage($selectedFile.path)))
				// outside of database package, not allowed
				ALERT:C41("CSS file must be inside the database folder")
			Else 
				ALERT:C41("Bad Path")
			End if 
		End if 
	End if 
End if 

