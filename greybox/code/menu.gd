extends Control

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/baby_room.tscn")


func _on_button_2_pressed() -> void:
	var seti = preload("res://scenes/sttings.tscn")
	add_child(seti.instantiate())



func _on_button_3_pressed() -> void:
	get_tree().quit()
