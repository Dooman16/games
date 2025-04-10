extends Node

@onready var player := get_node("/root/map/tralalerotralala")
var target : Vector2
const edge : Vector2 = Vector2(45,-60)

func _ready() -> void:
	get_node("/root/map/trulimeroTrulichina/AnimatedSprite2D").sprite_frames = load("res://animation/trulimeroTrulichina.tres")

func _process(delta: float) -> void:
	var parent = get_parent()
	if parent.mode == 3:
		if parent.attack_mode == 0:
			trulimeros_strategy_localizer()
		else:
			target = edge

func trulimeros_strategy_localizer() -> void:	
	if(player.movement.dir != Vector2.ZERO):
		target = player.global_position + player.movement.dir*45
