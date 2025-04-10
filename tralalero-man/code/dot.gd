extends Area2D

var count :int = 0 

func _on_area_entered(area: Area2D) -> void:
	$CollisionShape2D.disabled = true
	count += 1
	if count == 1:
		hide()
		$AudioStreamPlayer2D.play()
		get_node("/root/map/score").add_points(10)
		get_parent().reduce()
		await $AudioStreamPlayer2D.finished
		queue_free()
