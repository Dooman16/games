extends Control

var locks_unlocked := 0
var yellow_unlocked : bool = false

func _process(delta: float) -> void:
	if Input.is_action_pressed("esc"):
		_pausa()

func _on_red_key_pressed() -> void:
	$redkey.hide()
	$red_key.hide()
	$red_lock.show()
	$table.show()



func _on_green_key_pressed() -> void:
	$greenkey.hide()
	$green_key.hide()
	$green_lock.show()
	$table.show()


func _on_blue_key_pressed() -> void:
	$bluekey.hide()
	$blue_key.hide()
	$blue_lock.show()


func _on_yellow_key_pressed() -> void:
	$yellowkey.hide()
	$yellow_key.hide()
	$yellow_lock.show()
	yellow_unlocked = true


func _on_table_pressed() -> void:
	if $greenkey.visible :
		$green_key.show()
	if $"workRoom table".position.x == 0:
		$"workRoom table".position.x += 200
		$yellow_lock.hide()
		$table.hide()
	else:
		$"workRoom table".position.x -= 200
		if yellow_unlocked:
			$yellow_lock.show()
			



func _on_big_wall_pressed() -> void:
	$hide_blue.hide()
	$hide_red.hide()
	$hide_yellow.hide()
	$hide_green.hide()
	$big_wall.hide()
	$wall.hide()
	$ending_time.start()
	await $ending_time.timeout
	get_tree().change_scene_to_file("res://scenes/final_room.tscn")


func _on_draw_board_pressed() -> void:
	$draw_board.hide()
	$hide_drawboard.show()
	$droppe_rawboard.show()
	$blue_key.show()
	$bluekey.show()


func _on_lamp_bt_pressed() -> void:
	$lamp.hide()
	$lamp_bt.hide()
	$yellow_key.show()


func _on_lock_pressed(color : String) -> void:
	get_node(color+"_lock").hide()
	get_node("hide_"+color).show()
	locks_unlocked += 1
	if locks_unlocked == 4:
		$big_wall.show()

func _pausa():
	get_tree().paused = !get_tree().paused
	$game_sttings.visible = get_tree().paused
