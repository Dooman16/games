extends Control

@onready var mask_rect = $ColorRect
@onready var ending_time = $"ending timer"
const death_time = 10

func _ready() -> void:
	ending_time.start()

func _process(delta):
	var progress = 1.0 - ((ending_time.time_left -death_time )/ (ending_time.wait_time-death_time))
	var new_radius = lerp(1.0, 0.0, progress)
	mask_rect.material.set_shader_parameter("outer_radius", new_radius)
	if ending_time.is_stopped():
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
	if Input.is_action_pressed("esc"):
		_pausa()

func _pausa():
	get_tree().paused = !get_tree().paused
	$game_sttings.visible = get_tree().paused
