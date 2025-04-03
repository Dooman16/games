extends Node

@onready var player := get_node("/root/map/tralalerotralala")
var target : Vector2

func _ready() -> void:
	get_node("/root/map/elCactoHipopotamo/Sprite2D").texture = load("res://sprites/orange.jpg")
	get_node("/root/map/elCactoHipopotamo").global_scale = Vector2(1,1)*(0.35) 

func _process(delta: float) -> void:
	Cactos_mysterius_tactics()

func Cactos_mysterius_tactics():
	if get_parent().mode == 2:
		if security_device_verification():
			target = player.global_position
		else:
			target = Vector2(-60,540)
		
func security_device_verification() -> bool:
	var pos = get_parent().global_position
	return sqrt((player.global_position.x - pos.x)**2 + (player.global_position.y - pos.y)**2) > 120.0
