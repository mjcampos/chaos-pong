extends CharacterBody2D

@export var _speed: float = 300.0
@export var min_time: float = 1.0  # Minimum time between direction changes
@export var max_time: float = 5.0  # Maximum time between direction changes

@onready var timer = $Timer

var speed_increase: float = 1.1  # Increase speed by 10% per hit

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	set_random_direction()
	start_random_timer()

func set_random_direction():
	var angle = randf_range(0, PI * 2)
	
	velocity = Vector2(cos(angle), sin(angle)) * _speed
	
func _physics_process(delta):
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	
	if collision:
		print("Increase speed")
		velocity = collision.get_normal() * (velocity.length() * speed_increase)

func start_random_timer():
	timer.wait_time = randf_range(min_time, max_time)
	timer.start()
	
func _on_timer_timeout():
	set_random_direction()  # Change the direction randomly
	start_random_timer()  # Restart the timer with a new random interval
