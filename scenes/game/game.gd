extends Node2D

@export var playerScore: int = 0
@export var enemyScore: int = 0

func _on_player_goal_entered(body):
	if body is Puck:
		playerScore += 1
		
		body.reset_location()

func _on_enemy_goal_entered(body):
	if body is Puck:
		enemyScore += 1
		
		body.reset_location()
