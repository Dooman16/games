extends Area2D

func _on_area_entered(area: Area2D) -> void:
	get_parent().reduce()
	queue_free()
	for e in get_parent().game.enemies:
		if e.mode == 2:
			e.attack_mode = 2
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
	await get_tree().create_timer(time).timeout
	for e in get_parent().game.enemies:
		if e.mode == 2:
			e.change_target()
	
