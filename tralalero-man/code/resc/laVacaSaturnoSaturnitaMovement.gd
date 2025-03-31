extends Node

var mode := 0
@onready var bombardillo := get_node("/root/map/bombardilo")
var door := [Vector2(217.5,180),Vector2(217.5,225)]
var target : Vector2
			
func _ready() -> void:
	get_node("/root/map/laVacaSaturnita/Sprite2D").texture = load("res://sprites/bluee.jpg")
	get_node("/root/map/laVacaSaturnita").global_scale = Vector2(1,1)*0.1125

func _process(delta: float) -> void:
	if mode == 2:
		target = bombardillo.global_position

func choose_next_dir():
	var pos = get_parent().global_position
	var aux_dir = Vector2.ZERO
	for dire in [Vector2.LEFT, Vector2.RIGHT, Vector2.UP, Vector2.DOWN]:
		if get_parent().check_wall(pos + dire*15) and dire*(-1) != get_parent().dir:
			if bombardillo_high_iq_distance_detection(pos+dire*15) < bombardillo_high_iq_distance_detection(pos+aux_dir*15) or aux_dir == Vector2.ZERO:
				aux_dir = dire		
	get_parent().next_dir = aux_dir	
	

func bombardillo_high_iq_distance_detection(pos:Vector2) -> float:
	return sqrt((target.x - pos.x)**2 + (target.y - pos.y)**2)
	
func change_target() -> void:
	mode = (mode % 4) + 1
	match mode:
		1: 
			target = door[0]
		2:
			get_parent().change_door()
			get_parent().dir = Vector2(-1 if randi() % 2 == 0 else 1,0)
			target = bombardillo.global_position
		3:
			target = door[0]
		4:
			get_parent().change_door()
			target = door[1]
	
