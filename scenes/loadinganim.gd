extends Control

#@onready var loading_scene=preload("res://scenes/loadinganim.tscn")
@onready var progbar:ProgressBar=find_child("Progressgo")
var progress=[]
var scene_laod_status=0
var scene = Loadingqazzz.scener
var backgroundimg=[]

func _ready():
	ResourceLoader.load_threaded_request(scene)
	print(scene)

func _process(delta):
	scene_laod_status=ResourceLoader.load_threaded_get_status(scene,progress)
	progbar.value=progress[0]*100
	if scene_laod_status==ResourceLoader.THREAD_LOAD_LOADED:
		get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get(scene))
		queue_free()
