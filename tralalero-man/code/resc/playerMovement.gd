extends Node

var jump : = 7.5
var dir := Vector2.ZERO
var next_dir := Vector2.ZERO
var speed : = 120
var distance := 0.0
var matrix := Matrix.mat
var animation : AnimatedSprite2D

func _input(event: InputEvent) -> void:
	match event.as_text():
		"W":
			next_dir = Vector2.UP
		"A":
			next_dir = Vector2.LEFT
		"S":
			next_dir = Vector2.DOWN
		"D":
			
			next_dir = Vector2.RIGHT

func _process(delta: float) -> void:
	define_direction()
	move(delta)
	update_animations()

func move(delta):
	if dir != Vector2.ZERO:
		get_parent().global_position += dir*speed*delta
		distance += speed*delta
		if distance >= jump:
			_round()
			distance = 0

func update_animations():
	match dir:
		Vector2.RIGHT:
			animation.play("side")
			animation.flip_h = true
		Vector2.LEFT:
			animation.play("side")
			animation.flip_h =false

func define_direction() -> void:
	if is_aligned():
		if check_wall(true):
			dir = next_dir
		else:
			manage_special_cases()

func is_aligned() -> bool:
	var pos = get_parent().global_position
	var mode = next_dir.x == 0
	return (fmod(pos.x, jump*2) <= 0) if mode else (fmod(pos.y, jump*2) <= 0)

func _round():
	var pos = get_parent().global_position
	pos.x = round(pos.x / jump) * jump
	pos.y = round(pos.y / jump) * jump
	get_parent().global_position = pos

func check_wall(mode) -> bool:
	#mode reffers on which perspective we use the method if true we look to check if we can change to the next direction
	#if false we try to see if tralalero should stop (when reaching a wall)
	var direction = next_dir if mode else dir
	var pos = get_parent().global_position
	var condition = mode or (dir == Vector2.RIGHT or not fmod(pos.x,jump*2))
	#when checking if you should collide with the walls, when you're going to the left, we expect the wall in the left
	#but the int(pos.x/15) gives you the smallest value posible, which makes "x" be in the next "point" instead of being in the correct one
	#so we add 1 to compansate.
	var x = int(pos.x/15) if condition else int(pos.x/15) + 1
	condition = mode or (dir == Vector2.DOWN or not fmod(pos.y,jump*2))
	var y = int(pos.y/15) if condition else int(pos.y/15) + 1
	var chek = false
	#we check for each direction in the matriz
	match direction:
		Vector2.UP:
			chek = y+1 <= 32 and matrix[y-1][x] == 1
		Vector2.DOWN:	
			chek = y+1 >= 0  and matrix[y+1][x] == 1
		Vector2.LEFT:
			chek = x-1 >= 0 and matrix[y][x-1] % 2 == 1
		Vector2.RIGHT:
			chek = x+1 <= 29 and matrix[y][x+1] % 2 == 1
			
	return chek

func manage_special_cases() -> void:
	if(not check_wall(false)):
		dir = Vector2.ZERO
	var pos = get_parent().global_position
	var x = int(pos.x/15)
	var y = int(pos.y/15)
	if(matrix[y][x] == 3):
		if(x == 0):
			get_parent().global_position = Vector2(435,pos.y)
		else:
			get_parent().global_position = Vector2(0,pos.y)
