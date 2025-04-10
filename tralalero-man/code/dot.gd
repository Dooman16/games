extends Area2D

var count :int = 0 

func _on_area_entered(area: Area2D) -> void:
	if count == 0:
		hide()
		$AudioStreamPlayer2D.play()
		$CollisionShape2D.disabled = true
		get_node("/root/map/score").add_points(10)
		get_parent().reduce()
		await $AudioStreamPlayer2D.finished
		queue_free()
