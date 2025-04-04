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
	for i in enemies:
		i.reset()
	$points.start()
	$tralalerotralala.reset()

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
	Cacto.max_time = 10
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
	
	#animacion ganar
	GameManager.level += 1
	await get_tree().create_timer(2.0).timeout
	Matrix.reset()
	
	set_up()
