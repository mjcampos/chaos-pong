extends Node2D

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://scenes/game/game.tscn")


func _on_instructions_button_pressed():
	get_tree().change_scene_to_file("res://scenes/instructions/instructions.tscn")
