extends Node2D
@onready var play = $mainMenu/Buttons/Play
@onready var title = $mainMenu/TitlePath/TitleIcon/Title

func _on_quit_pressed():
	get_tree().quit()

func _on_level_selector_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_selector.tscn")

func _on_title_pressed():
	title.title_btn()

func _on_play_pressed():
	play.play_mode()
