extends CharacterBody2D
class_name Puck

@export var _speed: float = 400.0
@export var min_time: float = 2.0  # Minimum time between direction changes
@export var max_time: float = 5.0  # Maximum time between direction changes

@onready var timer = $Timer

var speed_increase: float = 1.2  # Increase speed by 20% per hit
var puck_starting_pos: Vector2
var max_velocity: float = 2000.0

# Called when the node enters the scene tree for the first time.
func _ready():
	puck_starting_pos = position
	
	randomize()
	set_random_direction()
	start_random_timer()

func set_random_direction():
	var angle = randf_range(0, PI * 2)
	
	velocity = Vector2(cos(angle), sin(angle)) * _speed
	
func _physics_process(delta):
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	
	if collision:
		velocity = collision.get_normal() * (velocity.length() if (velocity.length() > max_velocity) else (velocity.length() * speed_increase))

func start_random_timer():
	timer.wait_time = randf_range(min_time, max_time)
	timer.start()
	
func _on_timer_timeout():
	set_random_direction()  # Change the direction randomly
	start_random_timer()  # Restart the timer with a new random interval

func reset_location():
	position = puck_starting_pos
	velocity = Vector2.ZERO  # Reset velocity
	
	set_random_direction()
