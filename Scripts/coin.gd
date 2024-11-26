extends Area2D
@onready var coin_catcher = $".."


func _on_body_entered(body):
	if body.name == "Player":
		coin_catcher.count -= 1
		self.queue_free()
