extends Node

@onready var player := get_node("/root/map/tralalerotralala")
var target : Vector2
var emergency : bool = false

func _process(delta: float) -> void:
	if get_parent().mode == 3:
		target = player.global_position
	if not emergency:
		bombardillos_emergency_agression()
	
func bombardillos_emergency_agression():
	var counter = get_node("/root/map/points").counter
	var lvl = GameManager.level
	if lvl == 1:
		emergency = counter <= 20
	elif lvl == 2 :
		emergency = counter <= 30
	elif lvl < 6:
		emergency = counter <= 40
	elif lvl < 9:
		emergency = counter <= 50
	elif lvl < 12:
		emergency = counter <= 60
	elif lvl < 15:
		emergency = counter <= 80
	elif lvl < 19:
		emergency = counter <= 100
	else:
		emergency = counter <= 120
	
		
