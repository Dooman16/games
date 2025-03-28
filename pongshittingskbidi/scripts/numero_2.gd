extends Label

signal win

var score := 0

func _ready() -> void:
	Singleton.puntuacion_2.connect(add_point)
	
func add_point() -> void:
	score +=1
	text = str(score)
	if score == 5:
		win.emit(2)
