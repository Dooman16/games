extends Node

#PETARDIUM
@onready var pelota : Area2D = get_parent()

var user1 : bool #true para player1 false para player2

var piques : int = 0

var player2

var player

var activated : bool = false

var key : String

func _ready() -> void:
	await get_tree().create_timer(0.1).timeout
	if user1:
		player = get_node("/root/juego/paleta")
	else:
		player = player2

func _process(delta: float) -> void:
	if Input.is_action_just_pressed(key) and piques >= 10:
		ability()
func ability() -> void:
	piques = 0
	var petardo = preload("res://escenas/petardo.tscn").instantiate()
	petardo.pelota = pelota
	petardo.player_dir = -1 if user1 else 1
	if user1:
		petardo.position = player.position + Vector2(40,60)
		if !Singleton.pvp:
			print(player2.position)
			player2.pelotas.push_back(petardo)
	else:
		petardo.position = player.position - Vector2(20,0)
	add_child(petardo)
	activated = true
	
