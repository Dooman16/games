extends Node

#MAGICA
@onready var pelota : Area2D = get_parent()

var user1 : bool #true para player1 false para player2

var piques : int = 0

var player1

var player2

var activated : bool = false

var key : String

func _ready() -> void:
	player1 = get_node("/root/juego/paleta")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed(key) and piques >= 8:
		ability()
func ability() -> void:
	piques = 0
	var aux_pos = player2.position.x
	get_node("/root/juego/cancha").swap()
	player2.position.x = player1.position.x + 20
	player1.position.x = aux_pos - 20
	player2.position.y += 60
	player1.position.y -= 60 
	player1.lado = !player1.lado
	player2.lado = !player2.lado
	aux_pos = get_node("/root/juego/numero1").position
	get_node("/root/juego/numero1").position = get_node("/root/juego/numero2").position
	get_node("/root/juego/numero2").position = aux_pos
	aux_pos = get_node("/root/juego").player_message_1_pos
	get_node("/root/juego").player_message_1_pos = get_node("/root/juego").player_message_2_pos
	get_node("/root/juego").player_message_2_pos = aux_pos
	
	
