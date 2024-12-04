extends Control

const LEVEL_BTN = preload("res://Scenes/Gui/minigame_btn.tscn")

@export_dir var dir_path
@onready var grid = $Grid

func _ready():
	get_minigames(dir_path)

func get_minigames(path) -> void:
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			print(file_name)
			create_minigame_btn('%s/%s' % [dir.get_current_dir(), file_name], file_name)
			file_name = dir.get_next()
		dir.list_dir_end()
	else: print("An error has ocurred")
	
func create_minigame_btn(lvl_path: String, lvl_name: String)-> void:
	var btn = LEVEL_BTN.instantiate()
	btn.text = lvl_name.trim_suffix(".tscn").replace("_", " ")
	btn.level_path = lvl_path
	grid.add_child(btn)
