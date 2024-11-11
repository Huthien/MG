extends CharacterBody2D

@onready var anim = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var has_gravity = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _unhandled_input(event):
	if event.is_action_pressed("Right"):
		anim.play("l_right")
	elif event.is_action_pressed("Left"):
		anim.play("l_left")
	elif event.is_action_pressed("Down"):
		anim.play("l_down")
	elif event.is_action_pressed("Up"):
		anim.play("l_up")
	
func _physics_process(delta):
	# Add the gravity.
	if has_gravity:
		if not is_on_floor():
			velocity.y += gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
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