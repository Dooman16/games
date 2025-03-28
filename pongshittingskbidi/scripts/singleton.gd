extends Node

var poder_1 : int
var poder_2 : int = 11
var enemy
var player2

var actual_player = 1

var pvp : bool = false

var dificulty : int = 1

func reset():
	dificulty = 1
	pvp = false
	actual_player = 1
	player2 = null
	enemy = null
	poder_2 = 11
	poder_1 = 11




signal puntuacion_1
signal puntuacion_2
