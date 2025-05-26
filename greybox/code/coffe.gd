extends Control

var button_list: Array = []
var correct_list := ["(2,5)","(4,3)","(5,5)","(3,5)","(1,1)"]


func _on_coffe_door_pressed() -> void:
	$first_letter.show()


func _on_green_door_pressed() -> void:
	$second_letter.show()


func _on_exit_pressed() -> void:
	$first_letter.hide()
	


func _on_exit2_pressed() -> void:
	$second_letter.hide()

func _on__pressed(coord: String) -> void:
	button_list.push_back(coord)
	get_node(coord).modulate = Color(255,0,255)
	get_node(coord).disabled = true
	if button_list.size() == 5:
		var correct_buttons = 0
		for index in range(5):
			if button_list[index] == correct_list[index]:
				correct_buttons +=1 
		await get_tree().create_timer(1.0).timeout
		for b in button_list:
			if correct_buttons == 5:
				get_node(b).modulate = Color(255,255,0)
			else:
				get_node(b).modulate = Color(1,1,1,0)
				get_node(b).disabled = false
		button_list = []
		if correct_buttons == 5:
			$plank.show()
				


func _on_plank_pressed() -> void:
	$big_plank.hide()
	$plank.hide()
	$final_exit.show()


func _on_final_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
