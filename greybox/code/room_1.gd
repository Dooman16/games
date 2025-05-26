extends Control



func _on_carpet_2_pressed() -> void:
	$carpet2.hide()
	$carpet.hide()
	$RolledCarpet.show()
	$key.show()


func _on_drawer_pressed() -> void:
	$drawer.hide()
	$DrawerDoorClosed.hide()
	$DrawerDoorOpen.show()
	
	


func _on_key_pressed() -> void:
	$key.hide()
	$keyblock.show()
	$keyhole.show()
	print($keyhole.visible)


func _on_keyhole_pressed() -> void:
	print("holar")
	$keyhole.hide()
	$keydrop.show()
	$door.show()
	$door2.show()


func _on_door_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/school.tscn")
