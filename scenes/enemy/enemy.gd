extends CharacterBody2D

@export var _speed: float = 100.0  # Speed of the AI paddle
@export var puck: NodePath  # Reference to the puck node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	# Get the puck's position
	var puck_position = get_node(puck).position
	
	# Only move along the y-axis towards the puck
	if puck_position.y > position.y:
		velocity.y = _speed  # Move downwards
	elif puck_position.y < position.y:
		velocity.y = -_speed  # Move forward
	else:
		velocity.y = 0  # Stop moving if aligned with the puck
		
	# Move the paddle using the calcuated velocity
	move_and_slide()
