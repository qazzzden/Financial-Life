extends TextureRect

@onready var bgstate: TextureRect=find_child("Background")
@onready var gamedata=Loadingqazzz.game_data

func _ready():
	Loadingscreenqazzz.backgroundhandler(bgstate,self)

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
