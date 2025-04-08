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
	
	instantiateEnemies()
	set_up()

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
	
func game_over():
	for i in enemies:
		i.set_process(false)
	#animacion muerte?
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
	Matrix.reset()
	
func change_lvl():
	
	for i in enemies:
		i.set_process(false)
	$tralalerotralala.get_child(2).set_process(false)
	$bombardilo.get_child(2).emergency = false
	#animacion ganar
	GameManager.level += 1
	await get_tree().create_timer(2.0).timeout
	Matrix.reset()
	
	set_up()
	



func _on_timer_timeout() -> void:
	for e in enemies:
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
