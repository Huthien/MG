extends Button

@onready var play = $"../../../Buttons/Play"
@onready var options = $"../../../Buttons/Options"
@onready var credits = $"../../../Buttons/Credits"
@onready var quit = $"../../../Buttons/Quit"

@onready var title_anim = $"../title_anim"
@onready var play_anim = $"../../../Buttons/Play/play_anim"
@onready var opt_anim = $"../../../Buttons/Options/opt_anim"
@onready var cred_anim = $"../../../Buttons/Credits/cred_anim"
@onready var quit_anim = $"../../../Buttons/Quit/quit_anim"

# Called when the node enters the scene tree for the first time.
func _ready():
	disabled = true
	title_courutine()
	play.hide()
	options.hide()
	credits.hide()
	quit.hide()
	toggle_mode = false

func title_courutine():
	await title_anim.animation_finished
	disabled = false

func title_btn():
	if !toggle_mode:
		play.visible = true
		options.visible = true
		credits.visible = true
		quit.visible = true
	
		play_anim.play("move")
		opt_anim.play("move")
		cred_anim.play("move")
		quit_anim.play("move")
		
		toggle_mode = true
	else:
		button_courutine()
		toggle_mode = false

func button_courutine():
	play_anim.play_backwards("move")
	opt_anim.play_backwards("move")
	cred_anim.play_backwards("move")
	quit_anim.play_backwards("move")
	
	await play_anim.animation_finished
	await opt_anim.animation_finished
	await cred_anim.animation_finished
	await quit_anim.animation_finished
	
	play.hide()
	play.random_level.hide()
	play.level_selector.hide()
	play.toggle_mode = false
	
	options.hide()
	credits.hide()
	quit.hide()
