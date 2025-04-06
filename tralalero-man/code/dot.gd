extends Area2D

func _on_area_entered(area: Area2D) -> void:
	get_node("/root/map/score").add_points(10)
	get_parent().reduce()
	queue_free()
