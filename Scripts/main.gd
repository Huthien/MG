extends Node2D

func _on_quit_pressed():
	get_tree().quit()

func _on_level_selector_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_selector.tscn")
