extends Node

var level := 1

var times := [[7,20,7,20,5,20,5],[7,20,7,20,5,1033.14,0.01],[5,20,5,20,5,1037.14,0.01]]

var index = 0

func get_time():
	return times[0 if level < 2 else (1 if level < 5 else 2)][index]

func reset():
	level = 1
	index = 0
