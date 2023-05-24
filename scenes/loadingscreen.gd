extends Control

@onready var gamedata=Loadingqazzz.game_data
var image1 = Image
var image2 = Image

func _ready():
	#Background set
	if gamedata.GameStage==0:
		gamedata.GameStageBack="res://!!media/actualgame/backgrounds/background.png"
	elif gamedata.GameStage==1:
		gamedata.GameStageBack="res://!!media/actualgame/backgrounds/progress1.png"
	elif gamedata.GameStage==2:
		gamedata.GameStageBack="res://!!media/actualgame/backgrounds/progress2.png"
	elif gamedata.GameStage==3:
		gamedata.GameStageBack="res://!!media/actualgame/backgrounds/progress3.png"
	if gamedata.GameEnding=="social":
		gamedata.GameEndingBack="res://!!media/actualgame/backgrounds/cityv1.png"
	elif gamedata.GameEnding=="skill":
		gamedata.GameEndingBack="res://!!media/actualgame/backgrounds/cityv2.png"
	elif gamedata.GameEnding=="work":
		gamedata.GameEndingBack="res://!!media/actualgame/backgrounds/cityv3.png"
	Loadingqazzz.save_data()
	print(gamedata.GameStage)
	print(gamedata.GameStageBack)
	
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
	
	image1 = load(gamedata.GameStageBack)
	image2 = load(gamedata.GameEndingBack)
	
func backgroundhandler(bgstatus,bgending):
	bgstatus.texture=image1
	bgending.texture=image2
