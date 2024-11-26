extends Node2D

@onready var time = $UI/Time
@onready var timer = $Timer
@onready var spawner = $Spawner

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#10 COINS --> 15s
	#20 COINS --> 30s
	#30 COINS --> 45s
	time.text = str(int(timer.time_left))
	if spawner.count == 0:
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
	
func _on_timer_timeout():
	if spawner.count > 0:
		get_tree().reload_current_scene()
