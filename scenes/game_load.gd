extends Control

@onready var save_file = Loadingqazzz.game_data

func _ready():
	print(Loadingqazzz.loads)
	if Loadingqazzz.loads!="none":
		Dialogic.start("res://timelines/fullgame.dtl")
		Dialogic.Save.load(Loadingqazzz.loads)
		print("loaded save "+str(Loadingqazzz.loads))
	elif Loadingqazzz.loads=="none":	
		if save_file.Artstyle=="AI generated":
			Dialogic.start("res://timelines/fullgame.dtl")
			print("Started Ai world")
		elif save_file.Artstyle=="Hand art":
			Dialogic.start("res://timelines/timeline(handart).dtl")
			print("Started Art world")

	Dialogic.connect("timeline_ended", _dialog_ended)

func _dialog_ended():
	get_tree().change_scene_to_file("res://scenes/gamewon.tscn")
