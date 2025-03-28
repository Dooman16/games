extends Area2D

@export var speed = 300
@onready var screen = get_viewport_rect().size.y
var poder
var direction = Vector2.ZERO
var strength = 1
var energy : float = 1
var spd_mult : float = 1	
var min_energy = 0.4
var lado : bool = true #true derecha false izquierda

func _process(delta: float) -> void:
	direction = Vector2.ZERO
	spd_mult = (speed/300)
	if (Input.is_action_pressed("w") or Input.is_action_pressed("a")) and not (Input.is_action_pressed("s") or Input.is_action_pressed("d")):
		direction = Vector2.UP 
		if(energy >0):
			energy *= -1
		energy -= delta*spd_mult
		energy = clamp(energy,-spd_mult-0.5,(-1)*min_energy)
	if (Input.is_action_pressed("s") or Input.is_action_pressed("d")) and not (Input.is_action_pressed("w") or Input.is_action_pressed("a")):
		direction = Vector2.DOWN
		if(energy <0):
			energy *= -1
		energy += delta*spd_mult
		energy = clamp(energy,min_energy,spd_mult+0.5)
	if direction == Vector2.ZERO:
		if energy < 0:
			energy -= 0.1*delta
			energy = clamp(energy,min_energy,spd_mult+0.5)
		elif energy > 0:
			energy += 0.1*delta
			energy = clamp(energy,-spd_mult-0.5,(-1)*min_energy)
	
	increase_speed(delta)
	position += direction*speed*delta
	position.y = clamp(position.y,45, screen - 45 - scale.y*120)

func increase_speed(delta) -> void:
	if Input.is_action_pressed("e"):
		speed *= 2**delta
	else:
		speed /= 3**delta 
	speed = clamp(speed,300,600)
	


func _on_area_entered(area: Area2D) -> void:
	get_node("/root/juego/palette").play()
	poder.piques += 1
	var random_number = randf()*2-1
	var variation = energy*area.speed/300
	var prepo1=area.position.x - 32.9 > position.x
	var prepo2 =area.position.x -7.1 < position.x
	if(prepo1 if lado else prepo2):
		area.direction = Vector2(area.direction.x*(-1),(area.direction.y + random_number * variation))
		area.increase_speed(strength*clamp(abs(energy),1,spd_mult+0.2))
	else:
		area.direction = Vector2(area.direction.x,area.direction.y*(-1))
	area.directionCorrection(4*variation)
	area.x_direction = true
