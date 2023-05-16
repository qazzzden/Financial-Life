extends Node

#const  SAVE_FILE = "user://save_file.save"
const SAVE_FILE = "res://save_file.save"
const IMG_FILE="res://savingpictures/mansavepic1.png"
var game_data={}
@onready var scener:String
@onready var loads="2"

# Called when the node enters the scene tree for the first time.
func _ready():
	load_data()
	
func save_data():
	var file = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
	file.store_var(game_data)

func load_data():
	print(SAVE_FILE)
	if FileAccess.file_exists(IMG_FILE):
		pass
	else:
		DirAccess.make_dir_absolute("res://savingpictures")
		var img1 = Image.create(2440,1440,false,Image.FORMAT_RGBA8)
		img1.fill(Color.DIM_GRAY)
		img1.save_png("res://savingpictures/savepictemp.png")
		img1.save_png("res://savingpictures/mansavepic1.png")
		img1.save_png("res://savingpictures/mansavepic2.png")
		img1.save_png("res://savingpictures/mansavepic3.png")
		img1.save_png("res://savingpictures/mansavepic4.png")
		img1.save_png("res://savingpictures/mansavepic5.png")
	if FileAccess.file_exists(SAVE_FILE):
		var file = FileAccess.open(SAVE_FILE, FileAccess.READ)
		game_data=file.get_var()
	else:
		DirAccess.make_dir_absolute("res://dialsaves")
		var window_size = DisplayServer.window_get_size()
		var screen=DisplayServer.WINDOW_MODE_FULLSCREEN
		var vsyncc=DisplayServer.window_get_vsync_mode()
		var xdirect=window_size.x/2
		var ydirect=window_size.y/2
		var positiongood=Vector2i(xdirect-(xdirect/2),ydirect-(ydirect/2))
		var mastersound=50
		var musicsound=50
		var artstyle ="AI generated"
		var language="en"
		game_data={
			"ScreenRes":screen,
			"WindowSize":window_size,
			"ConstFullscreenSize":window_size,
			"Vsync":vsyncc,
			"MasterSound":mastersound,
			"MusicSound":musicsound,
			"ConstCenterOfScreen":positiongood,
			"CenterOfScreen":positiongood,
			"Artstyle":artstyle,
			"Language":language,
		}
		save_data()
		
		print(positiongood)
		DisplayServer.window_set_mode(screen)
		DisplayServer.window_set_size(window_size)
		DisplayServer.window_set_vsync_mode(vsyncc)
		
