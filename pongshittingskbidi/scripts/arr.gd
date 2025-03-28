extends Area2D

func _on_area_entered(area: Area2D) -> void:
	area.direction = Vector2(area.direction.x,area.direction.y*(-1))
	get_node("/root/juego/wall").play()
