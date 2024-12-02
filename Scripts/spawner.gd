extends Node2D

const COIN = preload("res://Scenes/Objects/coin.tscn")

var rand_x = 0
var rand_y = 0
var count = 0

func spawn_coin():
	randomize()
	for i in range(count,0,-1):
		rand_x = randi_range(128, 1152)  # Adjust these values based on your grid size
		rand_y = randi_range(128, 576)  # Adjust these values based on your grid size
		var new_coin = COIN.instantiate()
		add_child(new_coin)
		new_coin.global_position = Vector2(rand_x, rand_y)
		i -= 1
