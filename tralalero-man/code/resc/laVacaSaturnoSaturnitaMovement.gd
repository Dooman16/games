extends Node


@onready var bombardillo := get_node("/root/map/bombardilo")
@onready var player := get_node("/root/map/tralalerotralala")

var target : Vector2
var godot
const edge : Vector2 = Vector2(390,540)

func _ready() -> void:
	get_node("/root/map/laVacaSaturnita/AnimatedSprite2D").sprite_frames = load("res://animation/VacaSaturnita.tres")

func _process(delta: float) -> void:
	if get_parent().mode == 3:
		saturnita_saturnos_high_iq_targetitia()

func saturnita_saturnos_high_iq_targetitia() -> void:	
	var player_target = player.global_position + player.movement.dir*30
	target = 2*player_target-bombardillo.global_position
