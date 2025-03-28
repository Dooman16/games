extends Node

#CHALLENGER
@onready var pelota : Area2D = get_parent()

var user1 : bool #true para player1 false para player2

var player2

var piques : int = 0

var key : String

func _process(delta: float) -> void:
	if Input.is_action_just_pressed(key) and piques >=5:
		ability()
	
func ability() -> void:
	piques = 0
	if user1:
		pelota.ability(pelota.speed * 10/3,Vector2.RIGHT)
	else:
		pelota.ability(pelota.speed * 10/3,Vector2.LEFT)
