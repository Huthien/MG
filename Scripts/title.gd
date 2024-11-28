extends PathFollow2D

@onready var title_pos = $"../titlePos"
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var has_gravity = true
var velocity: Vector2 = Vector2.ZERO

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if has_gravity && self.position.y != title_pos.position.y:
		velocity.y += gravity * delta
	else: has_gravity = false

