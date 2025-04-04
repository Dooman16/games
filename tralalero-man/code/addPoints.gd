extends Node2D

@onready var game = get_parent()
var counter := 0 

func start() -> void:
	var dot = preload("res://scenes/dot.tscn")
	var superdot = preload("res://scenes/superdot.tscn")
	
	for y in Matrix.mat.size():
		for x in Matrix.mat[y].size():
			if(Matrix.mat[y][x] == 1):
				counter += 1
				var dot_instance = dot.instantiate()
				dot_instance.global_position = Vector2(x*15,y*15)
				add_child(dot_instance)
			elif(Matrix.mat[y][x] == 7):
				counter += 1
				var superdot_instance = superdot.instantiate()
				superdot_instance.global_position = Vector2(x*15,y*15)
				add_child(superdot_instance)
				Matrix.mat[y][x] = 1
			elif(Matrix.mat[y][x] == 9):
				Matrix.mat[y][x] = 1

func reduce():
	counter -= 1
	if(counter == 0):
		game.change_lvl()
