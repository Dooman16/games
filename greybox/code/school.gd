extends Control

var right_ans : int = 0;

func _process(delta: float) -> void:
	if Input.is_action_pressed("esc"):
		_pausa()

func _on_test_pressed() -> void:
	$test_paper.show()
	$AudioStreamPlayer2D.stream = load("res://music/DANGANRONPA OST_ -2-11- Flashing Anagram.mp3")
	$AudioStreamPlayer2D.play()


func _on__pressed(button : String) -> void:
	get_node("test_paper/"+button).modulate = Color(0,255,0)
	right_ans += 1
	if right_ans == 3:
		get_tree().change_scene_to_file("res://scenes/coffe.tscn")


func wrong_ans(button : String) -> void:
	get_node("test_paper/"+button).modulate = Color(255,0,0)

func _pausa():
	get_tree().paused = !get_tree().paused
	$game_sttings.visible = get_tree().paused
