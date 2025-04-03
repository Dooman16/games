extends Area2D

var movement : Node

func _ready() -> void:
	movement = load("res://code/resc/playerMovement.gd").new()
	movement.name = "movement"
	add_child(movement)
	
func reset():
	global_position = Vector2(217.5,360)
	if GameManager.level > 1:
		get_node("movement").dir = Vector2.ZERO
		get_node("movement").next_dir = Vector2.ZERO
