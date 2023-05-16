extends Control

@onready var save_file = Loadingqazzz.game_data

@onready var windowsize_label: Label=find_child("WindowsizeLabel")
@onready var fullscreen_label: Label=find_child("FullscreenLabel")
@onready var vsync_label: Label=find_child("VsyncLabel")

@onready var music_ctrl: HSlider=find_child("MusicCtrl")
@onready var sound_ctrl: HSlider=find_child("SoundCtrl")

@onready var artlabel:Label=find_child("ArtLabel")

@onready var langchoose:OptionButton=find_child("CheckBox")

@onready var id4=Vector2i(1280,720)
@onready var id3=Vector2i(1920,1080)
@onready var id2=Vector2i(2560,1440)
@onready var id1=Vector2i(3840,2160)

@onready var windowsizedictinary=[id1,id2,id3,id4]
@onready var langdict=["en","ru"]

@onready var currentsize=save_file.WindowSize
@onready var currentscreen=save_file.ScreenRes

func _ready():
	for i in langdict.size():
		langchoose.add_item(langdict[i].to_upper(),i)
		if langdict[i]==save_file.Language:
			langchoose.selected=i
			#langchoose._selected_int(i)
			print(langchoose.selected)
	
	windowsize_label.text = str(save_file.WindowSize.x) + " x " + str(save_file.WindowSize.y)
	
	if save_file.ScreenRes==DisplayServer.WINDOW_MODE_FULLSCREEN:
		fullscreen_label.text="KEY_FULLS"
	else:
		fullscreen_label.text="KEY_WINDOWED"
	
	if save_file.Vsync==DisplayServer.VSYNC_ENABLED:
		vsync_label.text="Vsync On"
	else:
		vsync_label.text="Vsync Off"
	
	music_ctrl.value=save_file.MusicSound
	sound_ctrl.value=save_file.MasterSound
	
	if save_file.Artstyle=="AI generated":
		artlabel.text="KEY_ARTSTYLE1"
	else:
		artlabel.text="KEY_ARTSTYLE2"
	
func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_apply_button_pressed():
	TranslationServer.set_locale(save_file.Language)
	
	var xdirectconst=save_file.ConstFullscreenSize.x/2
	var ydirectconst=save_file.ConstFullscreenSize.y/2
	var xdirect=save_file.WindowSize.x/2
	var ydirect=save_file.WindowSize.y/2
	var xdirecttrue=xdirectconst-xdirect
	var ydirecttrue=ydirectconst-ydirect
	
	if save_file.WindowSize == save_file.ConstFullscreenSize:
		save_file.CenterOfScreen=Vector2i(0,0)
	elif save_file.WindowSize == windowsizedictinary[0]:
		save_file.CenterOfScreen=Vector2i(xdirectconst+(xdirectconst/2),ydirectconst+(ydirectconst/2))
	else:
		save_file.CenterOfScreen=Vector2i(xdirecttrue,ydirecttrue)
	
	Loadingqazzz.save_data()
	
	print(save_file.ScreenRes)
	print(save_file.WindowSize)
	print(save_file.CenterOfScreen)
	
	DisplayServer.window_set_mode(save_file.ScreenRes)
	DisplayServer.window_set_size(save_file.WindowSize)
	DisplayServer.window_set_vsync_mode(save_file.Vsync)
	
	DisplayServer.window_set_position(save_file.CenterOfScreen)

func _on_resolution_down_button_pressed():
	var changedown=0
	for n in 4:
		if windowsizedictinary[n]==save_file.WindowSize:
			if n==3:
				changedown=windowsizedictinary[0]
			else:
				changedown=windowsizedictinary[n+1]
	save_file.WindowSize = changedown
	windowsize_label.text = str(save_file.WindowSize.x) + " x " + str(save_file.WindowSize.y)

func _on_resolution_up_button_pressed():
	var changeup=0
	for n in 4:
		if windowsizedictinary[n]==save_file.WindowSize:
			if n==0:
				changeup=windowsizedictinary[3]
			else:
				changeup=windowsizedictinary[n-1]
	save_file.WindowSize = changeup
	windowsize_label.text = str(save_file.WindowSize.x) + " x " + str(save_file.WindowSize.y)

func fullscreenhandler():
	if save_file.ScreenRes==DisplayServer.WINDOW_MODE_FULLSCREEN:
		save_file.ScreenRes=DisplayServer.WINDOW_MODE_WINDOWED
		fullscreen_label.text="KEY_WINDOWED"
	else:
		save_file.ScreenRes=DisplayServer.WINDOW_MODE_FULLSCREEN
		fullscreen_label.text="KEY_FULLS"

func _on_fullscreendown_pressed():
	fullscreenhandler()

func _on_fullscreenup_pressed():
	fullscreenhandler()

#Vscync settings

func vsynchandler():
	if save_file.Vsync==DisplayServer.VSYNC_DISABLED:
		save_file.Vsync=DisplayServer.VSYNC_ENABLED
		vsync_label.text="Vsync On"
	else:
		save_file.Vsync=DisplayServer.VSYNC_DISABLED
		vsync_label.text="Vsync Off"

func _on_vsyncdown_pressed():
	vsynchandler()

func _on_vsyncscreenup_pressed():
	vsynchandler()

#Sound settings

func soundstreamshandler(num,value):
	if value==0:
		AudioServer.set_bus_mute(num,true)
	elif value==100:
		AudioServer.set_bus_mute(num,false)
		AudioServer.set_bus_volume_db(num,(value-50)/4)
	else:
		AudioServer.set_bus_mute(num,false)
		AudioServer.set_bus_volume_db(num,(value-50)/3)
	save_file.MusicSound=value
	Loadingqazzz.save_data()

func _on_music_ctrl_value_changed(value):
	soundstreamshandler(1,value)

func _on_sound_ctrl_value_changed(value):
	soundstreamshandler(0,value)

#Art settings

func arthandler():
	if save_file.Artstyle=="AI generated":
		save_file.Artstyle="Hand art"
		artlabel.text="KEY_ARTSTYLE2"
	else:
		save_file.Artstyle="AI generated"
		artlabel.text="KEY_ARTSTYLE1"

func _on_art_down_button_pressed():
	arthandler()

func _on_art_up_button_pressed():
	arthandler()

#Language settings
func _on_check_box_item_selected(index):
	save_file.Language=langdict[index]
