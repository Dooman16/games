extends Area2D

@export var enemy : String 
var movement : Node
var dir := Vector2.ZERO
var next_dir := Vector2.ZERO
var speed : = 90
var distance := 0.0
var jump : = 7.5
var matrix := Matrix.mat
var door := [Vector2(217.5,180),Vector2(217.5,225)]
var mode := 1
var attack_mode := 1
var time := 0.0
var max_time : float
@onready var animation : AnimatedSprite2D = $AnimatedSprite2D
var eaten: bool = false

func _ready() -> void:
	movement = load("res://code/resc/"+enemy+"Movement.gd").new()
	add_child(movement)
	reset()

func reset():
	global_position = Vector2(217.5,225)
	dir = Vector2.ZERO
	next_dir = Vector2.ZERO
	mode = 1
	attack_mode = 1
	movement.target = door[1]
	change_door(false)
	time = max_time
	set_process(true)

func _process(delta: float) -> void:
	if(position == movement.target and mode != 3 and time <= 0):
		change_target()
	else:
		time -= delta
	define_direction()
	move(delta)
	update_animations()
	if attack_mode == 2:
		animation.modulate = Color(0.15,0.15,1,1)
	elif mode == 0:
		animation.modulate = Color(1,1,1,0.6)
	else:
		animation.modulate = Color(1,1,1,1)

func move(delta):
	if dir != Vector2.ZERO:
		global_position += dir*speed*delta
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
		Vector2.UP:
			animation.play("up")
		Vector2.DOWN:
			animation.play("down")
		Vector2.ZERO:
			animation.play("side")
			animation.flip_h = false

func _round():
	var pos = global_position
	pos.x = round(pos.x / jump) * jump
	pos.y = round(pos.y / jump) * jump
	global_position = pos
	
func define_direction() -> void:
	if mode % 3 == 0:
		if is_aligned():
			manage_special_cases()
			if attack_mode != 2:
				choose_next_dir()
			else:
				random_dir()
			dir = next_dir
	elif mode != 1 or global_position.y < door[1].y :
		dir = Vector2.DOWN if movement.target == door[1] else Vector2.UP

func random_dir():
	var pos = global_position
	var aux_dirs = []
	for dire in [Vector2.LEFT, Vector2.RIGHT, Vector2.UP, Vector2.DOWN]:
		if check_wall(pos + dire*15) and dire*(-1) != dir:
			aux_dirs.push_front(dire)
	if aux_dirs.size() == 0:
		next_dir = dir
	else:
		next_dir = aux_dirs[randi() % aux_dirs.size()]	

func choose_next_dir():
	var pos = global_position
	var aux_dir = Vector2.ZERO
	for dire in [Vector2.LEFT, Vector2.RIGHT, Vector2.UP, Vector2.DOWN]:
		if check_wall(pos + dire*15) and dire*(-1) != dir:
			if distance_detection(pos+dire*15) < distance_detection(pos+aux_dir*15) or aux_dir == Vector2.ZERO:
				aux_dir = dire		
	next_dir = aux_dir	
	

func distance_detection(pos:Vector2) -> float:
	return sqrt((movement.target.x - pos.x)**2 + (movement.target.y - pos.y)**2)

func is_aligned() -> bool:
	var pos = global_position
	return (fmod(pos.x, jump*2) <= 0) and (fmod(pos.y, jump*2) <= 0)

func manage_special_cases() -> void: #checks right and left doors
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

func change_door(open : bool) -> void:#opens and closes de spawn door
	var door_value = 5 if open else 0
	matrix[13][14] = door_value
	matrix[13][15] = door_value
	matrix[14][14] = door_value
	matrix[14][15] = door_value

func change_target() -> void:#allows the enemy to change target
	if mode != 3:	
		if mode == 2:
			dir = Vector2(-1 if randi() % 2 == 0 else 1,0)
		mode = ((mode + 1) % 4)
	match mode:
		0:
			movement.target = door[0]
			attack_mode = 0
		1: 
			change_door(true)
			movement.target = door[1]
		2:
			movement.target = door[0]
		3:
			match attack_mode:
				0:
					change_door(false)
				2:
					attack_mode = 0
					dir *= -1

func _on_area_entered(area: Area2D) -> void:#manage collisions
	var points = 200
	if(mode == 3):
		if(attack_mode == 2):
			$gulp.play()
			eaten = true
			var power = get_parent().check_eaten_ghosts_amount()-1
			points *= pow(2,power)
			get_node("/root/map/score").add_points(points)
			$points.execute(points)
			mode = 7 # this is to change to mode = 0
			change_target()
		else:  
			get_node("/root/map").game_over()
