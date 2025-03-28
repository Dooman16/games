extends Node

#ROTATO
@onready var pelota : Area2D = get_parent()

var user1 : bool #true para player1 false para player2

var player2

var piques : int = 0

var key : String

func _process(delta: float) -> void:
	if Input.is_action_just_pressed(key) and piques >=8:
		ability()
	
func ability() -> void:
	piques = 0
	get_node("/root/juego/Camera2D").rotato_special_script_Thing_camera = !get_node("/root/juego/Camera2D").rotato_special_script_Thing_camera
	get_node("/root/juego/Camera2D").rotation += PI/2
