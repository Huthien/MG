extends Button

@onready var random_level = $"../Randomize"
@onready var level_selector = $"../Level Selector"

func _ready():
	random_level.hide()
	level_selector.hide()
	toggle_mode = false

func _on_pressed():
	if !toggle_mode:
		random_level.visible = true
		level_selector.visible = true
		toggle_mode = true
	else:
		random_level.hide()
		level_selector.hide()
		toggle_mode = false
