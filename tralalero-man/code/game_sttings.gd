extends Control

func _ready() -> void:
	$VBoxContainer/master.value = db_to_linear(AudioServer.get_bus_volume_db(0))
	$VBoxContainer/sound.value = db_to_linear(AudioServer.get_bus_volume_db(1))
	$VBoxContainer/music.value = db_to_linear(AudioServer.get_bus_volume_db(2))

func _on_master_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0,linear_to_db(value))
	
func _on_sonido_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(1,linear_to_db(value))

func _on_musica_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(2,linear_to_db(value))

func _on_button_pressed() -> void:
	print("pene")
	get_parent()._pause()

func _on_button_2_pressed() -> void:
	$Button2/AudioStreamPlayer2D.play()
	await $Button2/AudioStreamPlayer2D.finished
	get_tree().paused = !get_tree().paused
	get_node("/root/map").end_game()
	
