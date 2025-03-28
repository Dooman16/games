extends Node

#ARCHERO
@onready var pelota : Area2D = get_parent()

var user1 : bool #true para player1 false para player2

var player2

var piques : int = 0

var key : String

func _process(delta: float) -> void:
	if Input.is_action_just_pressed(key) and piques >=6:
		ability()
	
func ability() -> void:
	piques = 0
	if user1:
		pelota.ability(pelota.speed, Vector2(1,randf()))
	else:
		pelota.ability(pelota.speed,Vector2(-1,randf()))
