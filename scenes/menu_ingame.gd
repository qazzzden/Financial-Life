extends ColorRect

@onready var save_file = Loadingqazzz.game_data
@onready var play_button: Button=find_child("ContinueButton")

@onready var menu_button: Button=find_child("MenuButton")
@onready var save_button: Button=find_child("SaveButton")
@onready var load_button: Button=find_child("LoadButton")
@onready var supportbutton: Button=find_child("AdditionalButton")

@onready var savescreen: VBoxContainer=find_child("Save")
@onready var loadscreen: VBoxContainer=find_child("Load")

@onready var manloadingbtn1: TextureButton=find_child("ManLoadBtn1")
@onready var manloadingbtn2: TextureButton=find_child("ManLoadBtn2")
@onready var manloadingbtn3: TextureButton=find_child("ManLoadBtn3")
@onready var manloadingbtn4: TextureButton=find_child("ManLoadBtn4")
@onready var manloadingbtn5: TextureButton=find_child("ManLoadBtn5")

@onready var mansavingbtn1: TextureButton=find_child("ManSaveBtn1")
@onready var mansavingbtn2: TextureButton=find_child("ManSaveBtn2")
@onready var mansavingbtn3: TextureButton=find_child("ManSaveBtn3")
@onready var mansavingbtn4: TextureButton=find_child("ManSaveBtn4")
@onready var mansavingbtn5: TextureButton=find_child("ManSaveBtn5")

@onready var menuanim: AnimationPlayer=find_child("Menu")
@onready var contentanim: AnimationPlayer=find_child("Content")

@onready var mansaving=[mansavingbtn1,mansavingbtn2,mansavingbtn3,mansavingbtn4,mansavingbtn5]
@onready var manloading=[manloadingbtn1,manloadingbtn2,manloadingbtn3,manloadingbtn4,manloadingbtn5]
@onready var tempimgdata=[]

@onready var unik=true
@onready var testingbuffer
@onready var tempimg

func _ready():
	var b=1
	var time_before = Time.get_ticks_msec()
	for i in 5:
		tempimg = load('res://savingpictures/mansavepic'+str(b)+'.png')
		var wtf = tempimg.get_image()
		var tempbuffer = wtf.save_png_to_buffer()
		var imgtesting=Image.new()
		imgtesting.load_png_from_buffer(tempbuffer)
		var tex=ImageTexture.create_from_image(imgtesting)
		mansaving[i].texture_normal=tex
		manloading[i].texture_normal=tex
		b+=1
	
	var total_time = Time.get_ticks_msec() - time_before
	print("Time taken to start code: " + str(total_time))

func _on_menu_button_pressed():
	Dialogic.paused = false
	Dialogic.end_timeline()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func visibler():
	var time_before = Time.get_ticks_msec()
	if is_visible()==true:
		menuanim.play("out")
		await  menuanim.animation_finished
		loadscreen.set_visible(false)
		savescreen.set_visible(false)
		set_visible(false)
		Dialogic.paused = false

		var total_time = Time.get_ticks_msec() - time_before
		print("Time taken to close overlay: " + str(total_time))
	else:
		set_visible(true)
		var img = get_viewport().get_texture().get_image()
		testingbuffer = img.save_png_to_buffer()
		img.save_png("res://savingpictures/savepictemp.png")
		Dialogic.paused = true
		menuanim.play("in")
		
		var total_time = Time.get_ticks_msec() - time_before
		print("Time taken to open overlay: " + str(total_time))

func _on_button_pressed():
	visibler()

func _on_continue_button_pressed():
	visibler()

func _on_save_button_pressed():
	contentanim.play("out")
	await contentanim.animation_finished
	loadscreen.set_visible(false)
	savescreen.set_visible(true)
	contentanim.play("in")


func _on_load_button_pressed():
	contentanim.play("out")
	await contentanim.animation_finished
	savescreen.set_visible(false)
	loadscreen.set_visible(true)
	contentanim.play("in")

#saving/loading buttons

func savebtn(data):
	var imgtesting=Image.new()
	imgtesting.load_png_from_buffer(testingbuffer)
	var tex=ImageTexture.create_from_image(imgtesting)
	#manloading[data-1].texture_normal=tex
	#mansaving[data-1].texture_normal=tex
	imgtesting.save_png('res://savingpictures/mansavepic'+str(data)+'.png')
	manloading[data-1].texture_normal=load('res://savingpictures/mansavepic'+str(data)+'.png')
	mansaving[data-1].texture_normal=load('res://savingpictures/mansavepic'+str(data)+'.png')
	var gameinfo=Dialogic.get_full_state()
	Dialogic.Save.save(str(data))
	#Dialogic.Save.save_file(str(data), 'GameData.txt', gameinfo)

func laodbtn(data):	
	Dialogic.Save.load(str(data))
	#visibler()
	#Loadingqazzz.loads=str(data)
	#Loadingqazzz.scener="res://scenes/game_load.tscn"
	#get_tree().change_scene_to_file("res://scenes/loadinganim.tscn")
	#Dialogic.Save.load_file(str(data), 'GameData.txt', {})

func _on_man_save_btn_1_pressed():
	savebtn(1)

func _on_man_save_btn_2_pressed():
	savebtn(2)

func _on_man_save_btn_3_pressed():
	savebtn(3)

func _on_man_save_btn_4_pressed():
	savebtn(4)

func _on_man_save_btn_5_pressed():
	savebtn(5)

func _on_man_load_btn_1_pressed():
	laodbtn(1)

func _on_man_load_btn_2_pressed():
	laodbtn(2)

func _on_man_load_btn_3_pressed():
	laodbtn(3)

func _on_man_load_btn_4_pressed():
	laodbtn(4)

func _on_man_load_btn_5_pressed():
	laodbtn(5)
