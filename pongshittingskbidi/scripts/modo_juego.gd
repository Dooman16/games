extends Node2D



func _on_button_2_pressed() -> void:
	Singleton.pvp = true
	get_tree().change_scene_to_file("res://escenas/menu_personajes.tscn")


func _on_button_pressed() -> void:
	Singleton.pvp = false
	get_tree().change_scene_to_file("res://escenas/menu_personajes.tscn")
