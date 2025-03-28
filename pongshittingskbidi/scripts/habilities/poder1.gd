extends Node

#VALENGER
@onready var pelota : Area2D = get_parent()

var piques : int = 0

var user1 : bool #true para player1 false para player2

var activated : bool = false

var player2

var key : String

func _process(delta: float) -> void:
	if Input.is_action_just_pressed(key) and piques >= 3:
		ability()
	if activated and piques > 0:
		activated = false
		piques = 0
		if user1:
			pelota.ability(pelota.speed*2,pelota.direction)
		else:
			pelota.ability(pelota.speed*2,pelota.direction)
func ability() -> void:
	piques = 0
	activated = true
	
