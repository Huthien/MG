extends Area2D

@export var speed = 700
var direction : Vector2


func set_direction(bulletDirection):
	direction = bulletDirection
	rotation_degrees = deg_to_rad(global_position.angle_to_point(global_position + direction))
	
func _physics_process(delta):
	global_position += direction * speed * delta
