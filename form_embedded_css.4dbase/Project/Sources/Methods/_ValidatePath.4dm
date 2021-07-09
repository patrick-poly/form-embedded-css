//%attributes = {}
var $1; $2; $0; $path; $packagePath : Text
var $folder : cs:C1710.Folder

//$1 : path to test
//$2 : .4d form posix full path
//$0 : good path

$0:=""
$path:=""

If (_IsSubOf($1; $2; ->$path))
	// relative to form folder
	$0:=$path; 
Else 
	
	If (_IsSubOf($1; "/PACKAGE/"; ->$path))
		
		$packagePath:=$path
		$path:=""
		
		If (Not:C34(_IsSubOf($1; "/RESOURCES/"; ->$path)))
			If (Not:C34(_IsSubOf($1; "/SOURCES/"; ->$path)))
				If (Not:C34(_IsSubOf($1; "/PROJECT/"; ->$path)))
					
				End if 
			End if 
		End if 
		
		$0:=$path
		
		If ($0="")
			$0:=$packagePath
		End if 
	End if 
End if 


