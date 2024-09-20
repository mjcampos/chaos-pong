extends CharacterBody2D

@export var _speed: int = 200

var fixed_x_position: float

func _ready():
	fixed_x_position = position.x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction: int = Input.get_axis("ui_up", "ui_down")

	velocity.y += _speed * delta * direction
	move_and_slide()
	
	position.x = fixed_x_position
