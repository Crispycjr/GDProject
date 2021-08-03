extends Node

onready var dict_Status = {
	
#		------ ++ Health Status ++
	"HP" : 95,
	"Regenthresh" : null,
	"Isalive" : null,

#		------ -> Action Status ->
	"Isrunning" : false,
	"Iscrawling" : false,
	"Isaiming" : false,
	"Isrolling" : false,
	"Isjumping" : false,
	"Issliding" : false,
	"Isflinching" : false,
	"Isdamaged" : false,
	"Iscqc" : false,

#		------ !! Detection Status !!
	"Detradius" : null,
	"Awareness" : null,
	"Lvlalert" : null,
	"Lvlhidden" : null,
	"Isalert" : false,
	"Ishidden" : false,

#		------ ?~ Status Effects ~?
	"Isbleeding" : false,
	"Iswetboots" : false,
	"Issnowyboots" : false,
	"Issleepy" : false,
	"Isonfire" : false,
	"Ispoisoned" : false,
	"Isfallen" : false,
	"IsKO" : false,
	
	}
