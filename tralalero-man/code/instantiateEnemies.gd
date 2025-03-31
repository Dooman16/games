extends Node2D

var bombardillo : Area2D = preload("res://scenes/eNemy.tscn").instantiate()
var laVacaSaturnita : Area2D = preload("res://scenes/eNemy.tscn").instantiate()

func _ready() -> void:
	bombardillo.name = "bombardilo"
	bombardillo.enemy = "bombardiloCrocodilo"
	laVacaSaturnita.name = "laVacaSaturnita"
	laVacaSaturnita.enemy = "laVacaSaturnoSaturnita"
	add_child(bombardillo)
	add_child(laVacaSaturnita)
	print()
