extends Area2D

func _on_area_entered(area: Area2D) -> void:
	Singleton.puntuacion_2.emit()
	get_node("/root/juego/pelota").pelota_looser = -1
	area.reset()
	get_node("/root/juego/score").play()
	
