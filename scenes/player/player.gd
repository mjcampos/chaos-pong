extends CharacterBody2D

@export var _speed: int = 200

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction: int = Input.get_axis("ui_up", "ui_down")

	velocity.y += _speed * delta * direction
	move_and_slide()
