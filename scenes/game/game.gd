extends Node2D

@export var playerScore: int = 0
@export var enemyScore: int = 0

@onready var player_score = $PlayerScore
@onready var enemy_score = $EnemyScore
@onready var final_message_display = $FinalMessage
@onready var homer_woohoo_audio: AudioStreamPlayer = $HomerWoohooAudio
@onready var homer_i_am_so_smart_audio: AudioStreamPlayer = $HomerIAmSoSmartAudio

var playerHasAChoice = false

func _ready():
	get_tree().paused = false
	final_message_display.visible = false
	
func _process(delta):
	if playerHasAChoice:
		if Input.is_key_pressed(KEY_ENTER):
			get_tree().reload_current_scene()
			
		if Input.is_key_pressed(KEY_ESCAPE):
			get_tree().quit()

func _on_player_goal_entered(body: Node2D):
	if body is Puck:
		homer_woohoo_audio.play()
		enemyScore += 1
		enemy_score.text = str(enemyScore)
		
		if enemyScore >= 3:
			reset_game(body)
		else:
			reset_puck(body)

func _on_enemy_goal_entered(body: Node2D):
	if body is Puck:
		homer_woohoo_audio.play()
		playerScore += 1
		player_score.text = str(playerScore)
		
		if playerScore >= 3:
			reset_game(body)
		else:
			reset_puck(body)

func reset_puck(body: Node2D):
	await get_tree().create_timer(1.0).timeout
	body.reset_location()

func reset_game(body: Node2D):
	# 1. Pause the game
	pause_game()
	
	# 2. Player Homer message if player won
	homerMessagePlay()
	
	# 3. Display message
	display_final_message()
	
	# 4. Give player UI control to make a choice
	playerHasAChoice = true

func pause_game():
	get_tree().paused = true
	self.process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	
func display_final_message():
	var final_message = ""
	
	if playerScore > enemyScore:
		final_message = "Congratulations! You won! Want to play again?"
	else:
		final_message = "You lost. Want to try again?"
		
	final_message_display.text = final_message
	final_message_display.visible = true

func homerMessagePlay():
	await get_tree().create_timer(0.5).timeout
	
	if playerScore > enemyScore:
		homer_i_am_so_smart_audio.play()
