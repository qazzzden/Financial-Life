extends Control

func _on_start_button_pressed():
	Loadingqazzz.scener="res://scenes/load_startnew.tscn"
	get_tree().change_scene_to_file("res://scenes/loadinganim.tscn")

func _on_settings_button_pressed():
	Loadingqazzz.scener="res://scenes/settings.tscn"
	get_tree().change_scene_to_file("res://scenes/settings.tscn")

func _on_credits_pressed():
	get_tree().change_scene_to_file("res://scenes/credits.tscn")

func _on_exit_button_pressed():
	get_tree().quit()
