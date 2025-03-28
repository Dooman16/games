extends Node2D

func swap():
	var auxpos = $Der.position
	$Der.position = $Izq.position
	$Izq.position = auxpos
