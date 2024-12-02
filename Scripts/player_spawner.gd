extends Marker2D

const PLAYER = preload("res://Scenes/player.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var player = PLAYER.instantiate()
	add_child(player)
	player.global_position = self.global_position
