extends Node

@onready var player := get_node("/root/map/tralalerotralala")
var target : Vector2
var edge

func _ready() -> void:
	get_node("/root/map/trulimeroTrulichina/Sprite2D").texture = load("res://sprites/pink.png")
	get_node("/root/map/trulimeroTrulichina").global_scale = Vector2(1,1)*(0.36)

func _process(delta: float) -> void:
	if get_parent().mode == 2:
		trulimeros_strategy_localizer()

func trulimeros_strategy_localizer() -> void:	
	if(player.movement.dir != Vector2.ZERO):
		target = player.global_position + player.movement.dir*45
