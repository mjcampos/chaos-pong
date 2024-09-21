extends Node2D

@export var playerScore: int = 0
@export var enemyScore: int = 0

@onready var player_score = $PlayerScore
@onready var enemy_score = $EnemyScore

func _on_player_goal_entered(body):
	if body is Puck:
		playerScore += 1
		player_score.text = str(playerScore)
		
		reset_puck(body)

func _on_enemy_goal_entered(body):
	if body is Puck:
		enemyScore += 1
		enemy_score.text = str(enemyScore)
		
		reset_puck(body)

func reset_puck(body):
	await get_tree().create_timer(1.0).timeout
	body.reset_location()
