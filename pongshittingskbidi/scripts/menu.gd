extends Node2D

func _on_jugar_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/modo_juego.tscn") #cambiar luego a pvp/pve

func _on_configuracion_pressed() -> void:
	var seti = preload("res://escenas/sttings.tscn")
	add_child(seti.instantiate())

func _on_salir_pressed() -> void:
	get_tree().quit()  # Cierra la aplicación
