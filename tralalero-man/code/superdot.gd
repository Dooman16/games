extends Area2D

var count = 0

func _on_area_entered(area: Area2D) -> void:
	$CollisionShape2D.disabled = true
	count += 1
	if count == 1:
		get_node("/root/map/score").add_points(50)
		get_parent().reduce()
		queue_free()
		var time = 7
		var lvl = GameManager.level
		if(lvl < 5):
			time -= lvl
		elif(lvl < 8):
			time = 2
		elif(lvl < 10):
			time = 1
		else:
			time = 0.5		
		get_node("/root/map/TimerFrightened").set_timer(time)
		for e in get_parent().game.enemies:
			if e.mode == 3:
				e.attack_mode = 2
	
	
