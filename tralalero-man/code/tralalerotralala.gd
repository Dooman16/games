extends Area2D

var movement : Node

func _ready() -> void:
	movement = load("res://code/resc/playerMovement.gd").new()
	movement.name = "movement"
	add_child(movement)
	
func reset():
	global_position = Vector2(217.5,360)
	if GameManager.level > 1:
		var mov = get_node("movement")
		mov.dir = Vector2.ZERO
		mov.next_dir = Vector2.ZERO
		mov.set_process(true)
