extends Control

@export var scene:String = "res://scenes/main_menu.tscn"
@onready var gamedata=Loadingqazzz.game_data

func _ready():
	
	#Language settings
	TranslationServer.set_locale(gamedata.Language)
	
	#Window Settings
	DisplayServer.window_set_size(gamedata.WindowSize)
	DisplayServer.window_set_mode(gamedata.ScreenRes)
	DisplayServer.window_set_vsync_mode(gamedata.Vsync)
	DisplayServer.window_set_position(gamedata.CenterOfScreen)
	
	#Audio Settings
	var valueM=gamedata.MusicSound
	if valueM==0:
		AudioServer.set_bus_mute(1,true)
	elif valueM==100:
		AudioServer.set_bus_mute(1,false)
		AudioServer.set_bus_volume_db(1,(valueM-50)/4)
	else:
		AudioServer.set_bus_mute(1,false)
		AudioServer.set_bus_volume_db(1,(valueM-50)/3)

	var valueA=gamedata.MasterSound
	if valueA==0:
		AudioServer.set_bus_mute(0,true)
	elif valueA==100:
		AudioServer.set_bus_mute(0,false)
		AudioServer.set_bus_volume_db(0,(valueA-50)/4)
	else:
		AudioServer.set_bus_mute(0,false)
		AudioServer.set_bus_volume_db(0,(valueA-50)/3)
