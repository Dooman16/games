extends Node

@onready var player := get_node("/root/map/tralalerotralala")
var target : Vector2
const edge : Vector2 = Vector2(45,540)

func _ready() -> void:
	get_node("/root/map/elCactoHipopotamo/Sprite2D").texture = load("res://sprites/orange.jpg")
	get_node("/root/map/elCactoHipopotamo/Sprite2D").global_scale = Vector2(1,1)*(0.035) 

func _process(delta: float) -> void:
	
	Cactos_mysterius_tactics()

func Cactos_mysterius_tactics():
	if get_parent().mode == 3:
		if security_device_verification() and get_parent().attack_mode != 1:
			target = player.global_position
		else:
			target = edge
		
func security_device_verification() -> bool:
	var pos = get_parent().global_position
	return sqrt((player.global_position.x - pos.x)**2 + (player.global_position.y - pos.y)**2) > 120.0
