extends Node

@onready var pelota : Area2D = get_parent()

var piques : int = 0

var user1 : bool #true para player1 false para player2

var activated : bool = false

var player2

var key : String

func _process(delta: float) -> void:
	if Input.is_action_just_pressed(key) and piques >= 3:
		ability()
func ability() -> void:
	piques = 0
	pelota.ability(0,pelota.direction)
	await get_tree().create_timer(1.0).timeout
	pelota.af_ability()
	
