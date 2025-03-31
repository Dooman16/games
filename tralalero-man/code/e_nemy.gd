extends Area2D

@export var enemy : String 
var movement : Node
var dir := Vector2.ZERO
var next_dir := Vector2.ZERO
var speed : = 90
var distance := 0.0
var jump : = 7.5
var matrix := Matrix.mat

func _ready() -> void:
	global_position = Vector2(217.5,225)
	movement = load("res://code/resc/"+enemy+"Movement.gd").new()
	add_child(movement)
	movement.target = movement.door[1]
	change_door()
	
func _process(delta: float) -> void:
	if(position == movement.target):
		movement.change_target()
	define_direction()
	move(delta)

func move(delta):
	if dir != Vector2.ZERO:
		global_position += dir*speed*delta
		distance += speed*delta
		if distance >= jump:
			_round()
			distance = 0

func _round():
	var pos = global_position
	pos.x = round(pos.x / jump) * jump
	pos.y = round(pos.y / jump) * jump
	global_position = pos
	
func define_direction() -> void:
	if movement.mode == 0 or movement.mode % 4 > 1:
		if is_aligned():
			manage_special_cases()
			movement.choose_next_dir()
			dir = next_dir
	else:
		dir = Vector2.DOWN if movement.target == movement.door[1] else Vector2.UP

func is_aligned() -> bool:
	var pos = global_position
	return (fmod(pos.x, jump*2) <= 0) and (fmod(pos.y, jump*2) <= 0)

func manage_special_cases() -> void:
	var pos = global_position
	if(not check_wall(pos + dir*15)):
		var x = int(pos.x/15)
		var y = int(pos.y/15)
		if(matrix[y][x] == 3):
			if(x == 0):
				global_position = Vector2(435,pos.y)
			else:
				global_position = Vector2(0,pos.y)

func check_wall(pos:Vector2) -> bool:	
	var x = pos.x/15
	var y = pos.y/15
	return (x>= 0 and x <= 29 and y >= 0 and y <= 31) and matrix[y][x] % 2 == 1

func change_door() -> void:
	var door_value = 5 if matrix[13][14] == 0 else 0
	matrix[13][14] = door_value
	matrix[13][15] = door_value
	matrix[14][14] = door_value
	matrix[14][15] = door_value
