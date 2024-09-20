extends CharacterBody2D

@export var _speed: int = 150

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction: int = Input.get_axis("ui_up", "ui_down")

	velocity.y += _speed * delta * direction
	
	move_and_slide()
