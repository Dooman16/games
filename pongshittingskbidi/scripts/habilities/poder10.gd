extends Node

#REVENGER
@onready var pelota : Area2D = get_parent()

var piques : int = 0

var piques2 : int = 0

var user1 : bool #true para player1 false para player2

var revenge : bool = false

var activated : bool = false

var stopper : bool = false

var player2

var key : String

func _process(delta: float) -> void:
	if piques > piques2:
		stopper = true
		piques2 = piques
	if pelota.direction == Vector2.ZERO and pelota.pelota_looser == -1 if user1 else 1:
		revenge = true
	if Input.is_action_just_pressed(key) and piques >= 5:
		ability()
	if activated and piques > 0:
		activated = false
		piques = 1
		piques2 = 0
		pelota.ability_2(pelota.speed*1.7,pelota.direction,2)
	elif revenge and stopper:
		pelota.ability(pelota.speed*1.2,pelota.direction)
		stopper = false
	
func ability() -> void:
	piques = 0
	activated = true
