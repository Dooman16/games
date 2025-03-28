extends Node

#BELOVED
@onready var pelota : Area2D = get_parent()

var user1 : bool #true para player1 false para player2

var piques : int = 0

var player2

var activated : bool = false

var key : String

func _ready() -> void:
	print("hello?")
	await get_tree().create_timer(0.1).timeout
	if user1:
		get_node("/root/juego/paleta").scale.y=1.5
	else:
		if Singleton.pvp:
			player2.scale.y=1.5
		else:
			pass
			player2.scale.y=1.5

func _process(delta: float) -> void:
	if Input.is_action_just_pressed(key) and piques >= 3:
		ability()
	if activated and piques > 0:
		activated = false
		piques = 0
		if user1:
			pelota.ability(pelota.speed*1.5,pelota.direction)
		else:
			pelota.ability(pelota.speed*1.5,pelota.direction)
func ability() -> void:
	piques = 0
	activated = true
	
