extends Control
var screws_down = 0

func _on_screw_pressed(id) -> void:
	print(id)
	screws_down +=1
	get_node("b"+id).show()
	get_node("screw"+id).hide()
	if screws_down == 2:
		$deco2.hide()
		$deco3.show()
		$b1.hide()
		$b2.hide()
		$cube.show()


func _on_cube_pressed() -> void:
	$deco4.hide()
	$cube.hide()
	$key2.show()




func _on_key_2_pressed() -> void:
	$key2.hide()
	$key.hide()
	$keyhole.show()


func _on_keyhole_pressed() -> void:
	$keyhole.hide()
	$Keyhole.hide()
	$door.show()
	$door2.show()
	



func _on_door_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/room_1.tscn")
