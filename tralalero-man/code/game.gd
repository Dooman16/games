extends Node2D

var bombardillo : Area2D = preload("res://scenes/eNemy.tscn").instantiate()
var laVacaSaturnita : Area2D = preload("res://scenes/eNemy.tscn").instantiate()
var trulimeroTrulichina : Area2D = preload("res://scenes/eNemy.tscn").instantiate()
var Cacto : Area2D = preload("res://scenes/eNemy.tscn").instantiate()
@onready var enemies := [
	bombardillo,
	laVacaSaturnita,
	trulimeroTrulichina,
	Cacto
]

func _ready() -> void:
	$sttings.hide()
	instantiateEnemies()
	
	set_up()

func _process(delta: float) -> void:
	if Input.is_action_pressed("esc"):
		_pause()

func set_up():
	GameManager.index = 0
	for i in enemies:
		i.reset()
	$points.start()
	$tralalerotralala.reset()
	$TimerScatter.set_timer(GameManager.get_time())

func instantiateEnemies():
	bombardillo.name = "bombardilo"
	bombardillo.enemy = "bombardiloCrocodilo"
	bombardillo.max_time = 0
	laVacaSaturnita.name = "laVacaSaturnita"
	laVacaSaturnita.enemy = "laVacaSaturnoSaturnita"
	laVacaSaturnita.max_time = 5
	trulimeroTrulichina.name = "trulimeroTrulichina"
	trulimeroTrulichina.enemy = "trulimeroTrulichina"
	trulimeroTrulichina.max_time = 2
	Cacto.name = "elCactoHipopotamo"
	Cacto.enemy = "elCactoHipopotamo"
	Cacto.max_time = 6
	add_child(bombardillo)
	add_child(laVacaSaturnita)
	add_child(trulimeroTrulichina)
	add_child(Cacto)
	var stt = $sttings
	remove_child(stt)
	add_child(stt)
	
func game_over():
	for i in enemies:
		i.set_process(false)
	#animacion muerte?
	$tralalerotralala/movement.set_process(false)
	print($tralalerotralala/movement.is_processing())
	await get_tree().create_timer(2.0).timeout
	end_game()
	
func end_game():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
	Matrix.reset()
	GameManager.reset()
	
func change_lvl():
	
	for i in enemies:
		i.set_process(false)
	$tralalerotralala.get_child(2).set_process(false)
	$bombardilo.get_child(4).emergency = false
	#animacion ganar
	GameManager.level += 1
	await get_tree().create_timer(2.0).timeout
	Matrix.reset()
	$level.change_level()
	set_up()
	



func _on_timer_timeout() -> void:
	for e in enemies:
		e.eaten = false
		if e.mode == 3:
			e.change_target()


func _on_timer_scatter_timeout() -> void:
	for e in enemies:
		if e.attack_mode != 2:
			e.attack_mode = (GameManager.index) % 2
	print(GameManager.index)
	GameManager.index += 1
	if GameManager.index < 7:
		$TimerScatter.set_timer(GameManager.get_time())

func _pause():
	get_tree().paused = !get_tree().paused
	$sttings.visible = get_tree().paused

func check_eaten_ghosts_amount():
	var count = 0
	for e in enemies:
		if e.eaten:
			count += 1
	return count
