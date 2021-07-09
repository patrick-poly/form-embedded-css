//%attributes = {}
var $1 : Text
var $0; $i : Integer
var $2 : Pointer

For ($i; 1; Size of array:C274($2->))
	If ($2->{$i}.value=$1)
		$0:=$0+1
	End if 
End for 
