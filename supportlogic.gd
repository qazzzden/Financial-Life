extends Node

@onready var save_file = Loadingqazzz.game_data
@onready var visiblerr=0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func fullscreenhandler():
	var xdirectconst=save_file.ConstFullscreenSize.x/2
	var ydirectconst=save_file.ConstFullscreenSize.y/2
	var xdirect=save_file.WindowSize.x/2
	var ydirect=save_file.WindowSize.y/2
	var xdirecttrue=xdirectconst-xdirect
	var ydirecttrue=ydirectconst-ydirect
	if save_file.WindowSize == save_file.ConstFullscreenSize:
		save_file.CenterOfScreen=Vector2i(0,0)
	elif save_file.WindowSize == Vector2i(3840,2160):
		save_file.CenterOfScreen=Vector2i(xdirectconst+(xdirectconst/2),ydirectconst+(ydirectconst/2))
	else:
		save_file.CenterOfScreen=Vector2i(xdirecttrue,ydirecttrue)

