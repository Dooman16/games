extends Node

var jump : = 7.5

var speed : = 90
var x = 0
var y = 0

func _process(delta: float) -> void:
	var dir = define_direction()
	move(delta,dir)
	
func move(delta,dir:Vector2):
	if dir != Vector2.ZERO:
		get_parent().global_position += dir*speed*delta

func define_direction() -> Vector2:
	if is_aligned():
		y = Input.get_axis("up","down") 
		print(get_parent().global_position.y)
		if( y == 0):
			x = Input.get_axis("left","right") 
	return Vector2(x,y)
	
func is_aligned() -> bool:
	var pos = get_parent().global_position
	return fmod(pos.x, jump) <= 0.00001 and fmod(pos.y, jump) <= 0.00001

#func round():
#	var pos = get_parent().global_position
#	pos.x = round(pos.x / jump) * jump
#	pos.y = round(pos.y / jump) * jump
#	get_parent().global_position = pos
