//%attributes = {}
var $1; $2; $tmp; $fs; $destFolder : Text
var $0 : Boolean
var $3; $outRel : Pointer
var $folder : cs:C1710.Folder

If (Count parameters:C259=3)
	$outRel:=$3
	$outRel->:=""
Else 
	$outRel:=Null:C1517
End if 

$0:=False:C215

Case of 
	: ($2="/PACKAGE/")
		$fs:=$2
	: ($2="/RESOURCES/")
		$fs:=$2
	: ($2="/SOURCES/")
		$fs:=$2
	: ($2="/PROJECT/")
		$fs:=$2
	Else 
		$fs:=""
		$destFolder:=$2
End case 

If ($fs#"")
	$folder:=Folder:C1567(Folder:C1567($fs; fk posix path:K87:1; *).platformPath; fk platform path:K87:2)
	$destFolder:=$folder.path
End if 

If (Length:C16($1)>Length:C16($destFolder))
	$tmp:=Substring:C12($1; 1; Length:C16($destFolder))
	$0:=($tmp=$destFolder)
	If (($0=True:C214) & (Not:C34(Is nil pointer:C315($outRel))))
		$outRel->:=$fs
		$outRel->:=$outRel->+Substring:C12($1; Length:C16($destFolder)+1; Length:C16($1)-Length:C16($destFolder))
	End if 
End if 

