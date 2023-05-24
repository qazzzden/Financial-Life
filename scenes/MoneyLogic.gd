extends ColorRect

@onready var save_file = Loadingqazzz.game_data

@onready var moneylabel= get_node("../HBoxContainer2/Money")

@onready var monthlabel:Label=find_child("month")
@onready var salarylabel:Label=find_child("salary")
@onready var flatlabel:Label=find_child("flat")
@onready var foodlabel:Label=find_child("food")

@onready var gainslabel:Label=find_child("gains")
@onready var totallabel:Label=find_child("total")
@onready var btn:Button=find_child("Button")

@onready var moneyover=get_node("../monhandler")

var montharr=[]

# Called when the node enters the scene tree for the first time.
func _ready():
	set_visible(false)
	Dialogic.connect("signal_event", _dialogic_eventt)
	Dialogic.VAR.TempMoney=50
	print("Money now: "+str(Dialogic.VAR.TempMoney))
	print("")

func _process(delta):
	moneylabel.text=str(Dialogic.VAR.TempMoney)

func _dialogic_eventt(argument : String):
	Dialogic.paused = true
	match argument:
		"stageup":
			save_file.GameStage+=1
			Loadingqazzz.save_data()
		"work":
			save_file.GameEnding=argument
			Loadingqazzz.save_data()
		"skill":
			save_file.GameEnding=argument
			Loadingqazzz.save_data()
		"KEY_APRIL":
			montharr=[800,500,100,200]
			gainscalc(argument)
			pass
		"May":
			pass

func gainscalc(argument):
	monthlabel.text=argument
	salarylabel.text=str(montharr[0])
	flatlabel.text="-"+str(montharr[1])
	foodlabel.text="-"+str(montharr[2])
	if montharr[3]>0:
		totallabel.set("theme_override_colors/font_color", Color(0, 210, 0))
		gainslabel.set("theme_override_colors/font_color", Color(0, 210, 0))
		totallabel.text=str(montharr[3])
		gainslabel.text="+"+str(montharr[3])
	elif montharr[3]<0:
		totallabel.label_settings.set_font_color(Color("f31400"))
		gainslabel.label_settings.set_font_color(Color("f31400"))
		totallabel.text="-"+str(montharr[3])
		gainslabel.text="-"+str(montharr[3])
	set_visible(true)
	print("Scene is visible")
	moneyover.play("moneyhandler")
	await moneyover.animation_finished
	Dialogic.VAR.TempMoney += montharr[3]
	moneyover.play("awaitng")
	await moneyover.animation_finished
	set_visible(false)
	Dialogic.paused = false
	print("")


func _on_button_pressed():
	set_visible(false)
	Dialogic.paused = false
