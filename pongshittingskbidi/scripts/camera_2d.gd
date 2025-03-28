extends Camera2D

var rotato_special_script_Thing_camera = false
@export var bocha : Area2D 
var speed := 300 


func _process(delta: float) -> void:
	if rotato_special_script_Thing_camera:
		speed = bocha.speed/1.5
		if bocha.direction == Vector2.ZERO:
			position = Vector2(576,324)
		else:
			if bocha.x_direction:
				position.x = clamp(position.x+speed*delta,324,828)
			else:
				position.x = clamp(position.x-speed*delta,324,828)
	else:
		position = Vector2(576,324)
