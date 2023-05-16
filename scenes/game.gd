extends Control
		
@onready var save_file = Loadingqazzz.game_data


# Called when the node enters the scene tree for the first time.
func _ready():
	if save_file.Artstyle=="AI generated":
		Dialogic.start("res://timelines/fullgame.dtl")
		print("Started Ai world")
	elif save_file.Artstyle=="Hand art":
		Dialogic.start("res://timelines/timeline(handart).dtl")
		print("Started Art world")
	Dialogic.connect("timeline_ended", _dialog_ended)

# Called every frame. 'delta' is the elapsed time since the previous frame.
	
func _dialog_ended():
	get_tree().change_scene_to_file("res://scenes/gamewon.tscn")
