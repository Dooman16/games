extends Node2D

const message_center := Vector2(399,276)
var player_message_1_pos := Vector2(170,276)
var player_message_2_pos := Vector2(610,276)

var player2 

@onready var mode := Singleton.pvp
@onready var poder1Name := "poder"+str(Singleton.poder_1)
@onready var poder1 : Node = load("res://scripts/habilities/"+poder1Name+".gd").new()

@onready var poder2Name := "poder"+str(Singleton.poder_2)
var poder2 : Node

func _ready() -> void:
	$game_sttings.hide()
	poder1.user1 = true
	poder1.key = "space"
	player2 = [
		preload("res://escenas/paleta2.tscn"),
		preload("res://escenas/paleta_3.tscn")
	][1 if mode else 0]
	player2 = player2.instantiate()
	add_child(player2)
	if mode:
		poder2 = load("res://scripts/habilities/"+poder2Name+".gd").new()
		poder2.key = "enter"
		$pelota.add_child(poder2)
		print("juego")
		player2.poder = poder2
		poder2.player2 = player2
	else:
		poder1.player2 = player2
	$pelota.add_child(poder1)
	$paleta.poder = poder1
	
func _process(delta: float) -> void:
	if Input.is_action_pressed("esc"):
		_pausa()
	
func terminar_juego(player) -> void:
	$pelota.set_process(false)
	$pelota.hide()
	$paleta.set_process(false)
	player2.set_process(false)
	print("gano: "+str(player))
	if(mode):
		$"winning message".show()
		$"loosing message".show()
		if player == 1:
			$"winning message".position = player_message_1_pos
			$"loosing message".position = player_message_2_pos
		else:
			$"winning message".position = player_message_2_pos
			$"loosing message".position = player_message_1_pos
	elif player == 1:
		$"winning message".show()
		$"winning message".position = message_center
	else:
		$"loosing message".show()
		$"loosing message".position = message_center
	await get_tree().create_timer(3.0).timeout
	get_tree().change_scene_to_file("res://escenas/menu.tscn")
	#mostrar efectos ganador EXTRA
	#mostrar texto winner
func _pausa():
	get_tree().paused = !get_tree().paused
	$game_sttings.visible = get_tree().paused
