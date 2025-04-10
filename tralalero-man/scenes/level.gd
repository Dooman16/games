extends Label

var start_text := "Level: "

var lvl : int = 0

func _ready() -> void:
	change_level()
	
func change_level():
	lvl += 1
	text = start_text + str(lvl)
