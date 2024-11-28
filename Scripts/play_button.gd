extends Button

@onready var random_level = $Randomize
@onready var level_selector = $"Level Selector"
@onready var random_anim = $Randomize/random_anim
@onready var level_anim = $"Level Selector/level_anim"

func _ready():
	random_level.hide()
	level_selector.hide()
	toggle_mode = false

func _on_pressed():
	if !toggle_mode:
		random_level.visible = true
		level_selector.visible = true
		random_anim.play("move")
		level_anim.play("move")
		toggle_mode = true
	else:
		button_courutine()
		toggle_mode = false

func button_courutine():
	random_anim.play_backwards("move")
	level_anim.play_backwards("move")
	await random_anim.animation_finished 
	await level_anim.animation_finished 
	random_level.hide()
	level_selector.hide()
