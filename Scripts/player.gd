extends CharacterBody2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#Reference variables:----------------------------------
const BULLET = preload("res://Scenes/Objects/bullet.tscn")
@onready var anim = $AnimatedSprite2D

#movement var:-----------------------------------------
const SPEED = 270.0
var has_gravity = false
var direction = Vector2.ZERO

func _unhandled_input(event):
	if event.is_action_pressed("Up"):
		anim.play("l_up")
	elif event.is_action_pressed("Down"):
		anim.play("l_down")
	elif event.is_action_pressed("Right"):
		anim.play("l_right")
	elif event.is_action_pressed("Left"):
		anim.play("l_left")
	
func _physics_process(delta):
	# Add the gravity.
	if has_gravity:
		if not is_on_floor():
			velocity.y += gravity * delta

	var direction_x = Input.get_axis("Left", "Right")
	var direction_y = Input.get_axis("Up", "Down")
	
	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	move_and_slide()
