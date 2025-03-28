extends Control

func _ready() -> void:
	$VBoxContainer/master.value = db_to_linear(AudioServer.get_bus_volume_db(0))
	$VBoxContainer/sonido.value = db_to_linear(AudioServer.get_bus_volume_db(1))
	$VBoxContainer/musica.value = db_to_linear(AudioServer.get_bus_volume_db(2))

func _on_master_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0,linear_to_db(value))
	
func _on_sonido_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(1,linear_to_db(value))

func _on_musica_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(2,linear_to_db(value))

func _on_button_pressed() -> void:
	queue_free()
