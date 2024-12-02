extends Node2D

@onready var time = $UI/Time
@onready var timer = $Timer
@onready var spawner = $Spawner
@onready var count_label = $UI/count_label

var difficulty
# Called when the node enters the scene tree for the first time.
func _ready():
	difficulty = randi_range(1,5)
	randomize()
	match difficulty:
		1:
			spawner.count = 10
			timer.wait_time = 15
		2:
			spawner.count = 20
			timer.wait_time = 20
		3:
			spawner.count = 30
			timer.wait_time = 25
		4: 
			spawner.count = 40
			timer.wait_time = 30
		5: 
			spawner.count = 45
			timer.wait_time = 35
		_:  
			pass
	spawner.spawn_coin()
	timer.start()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	time.text = str(int(timer.time_left))
	count_label.text = " " + str(int(spawner.count))
	if spawner.count == 0:
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
	
func _on_timer_timeout():
	if spawner.count > 0:
		get_tree().reload_current_scene()
