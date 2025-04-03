extends Node

@onready var player := get_node("/root/map/tralalerotralala")
var target : Vector2

func _process(delta: float) -> void:
	if get_parent().mode == 2:
		target = player.global_position
