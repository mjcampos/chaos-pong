extends CharacterBody2D

@export var _speed: float = 300.0

var speed_increase: float = 1.1  # Increase speed by 10% per hit
var min_speed: float = 200.0

# Called when the node enters the scene tree for the first time.
func _ready():
	set_random_direction()

func set_random_direction():
	randomize()
	
	var angle = randf_range(0, PI * 2)
	
	velocity = Vector2(cos(angle), sin(angle)) * _speed
	
func _physics_process(delta):
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	
	if collision:
		velocity = collision.get_normal() * (velocity.length() * speed_increase)
