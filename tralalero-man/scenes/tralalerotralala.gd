extends CharacterBody2D

func _ready() -> void:
	add_child(load("res://code/resc/playerMovement.gd").new())
	
