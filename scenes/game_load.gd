extends Control

func _ready():
	Dialogic.start("res://timelines/fullgame.dtl")
	Dialogic.Save.load(Loadingqazzz.loads)
	print("loaded")
	Dialogic.connect("timeline_ended", _dialog_ended)

func _dialog_ended():
	get_tree().change_scene_to_file("res://scenes/gamewon.tscn")
