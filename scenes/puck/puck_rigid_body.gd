extends RigidBody2D

@export var _speed: float = 300.0

var velocity: Vector2
var speed_increase: float = 1.1  # Increase speed by 10% per hit
var min_speed: float = 200.0

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	
	var material = PhysicsMaterial.new()
	
	material.bounce = 1.0
	material.friction = 0.0
	physics_material_override = material
	
	set_random_direction()

func set_random_direction():
	var angle = randf_range(0, PI * 2)
	angle = 1.5
	velocity = Vector2(cos(angle), sin(angle)) * _speed
	linear_velocity = velocity

func _on_ball_body_entered(body):
	print(body)
	# Increase the velocity slightly each time it hits a player or wall
	velocity = velocity.normalized() * (velocity.length() * speed_increase)
	linear_velocity = velocity

func _integrate_forces(state):
	# Constantly update the velocity to ensure no energy loss
	state.linear_velocity = state.linear_velocity.normalized() * max(min_speed, state.linear_velocity.length())
