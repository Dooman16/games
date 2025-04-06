extends Label

var start_text := "S C O R E: "

var score : int = 0

func _ready() -> void:
	add_points(0)
	
func add_points(points:int):
	score += points
	text = start_text + str(score)
