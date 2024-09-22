extends Node2D

func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/mainMenu/mainMenu.tscn")
