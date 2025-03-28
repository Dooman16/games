extends Area2D

@export var speed = 300
@onready var screen = get_viewport_rect().size.y
var direction = Vector2.ZERO
var strength = 1
var lado := true
var energy : float = 1
var spd_mult : float = 1	
var min_energy = 0.2
var poder

func _ready() -> void:
	position = Vector2(994,324)

func _process(delta: float) -> void:
	direction = Vector2.ZERO
	spd_mult = (speed/300)
	if (Input.is_action_pressed("up") or Input.is_action_pressed("right")) and not (Input.is_action_pressed("down") or Input.is_action_pressed("left")):
		direction = Vector2.UP 
		if(energy >0):
			energy *= -1
		energy -= delta*spd_mult
		energy = clamp(energy,-spd_mult-0.5,(-1)*min_energy)
	if (Input.is_action_pressed("down") or Input.is_action_pressed("left")) and not (Input.is_action_pressed("up") or Input.is_action_pressed("right")):
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
	position.y = clamp(position.y,105, screen - 105)

func increase_speed(delta) -> void:
	if Input.is_action_pressed("shift"):
		speed *= 2**delta
	else:
		speed /= 3**delta 
	speed = clamp(speed,300,600)
	


func _on_area_entered(area: Area2D) -> void:
	get_node("/root/juego/palette").play()
	poder.piques +=1
	var random_number = randf()*2-1
	var variation = abs(energy)*area.speed/300
	print(variation)
	if randi()  % 2 == 0 and variation > 1:
		variation = 1/variation
	var prepo1 = area.position.x + 12.9 < position.x
	var prepo2 = area.position.x -27.1 > position.x
	if(prepo1 if lado else prepo2):
		area.direction = Vector2(area.direction.x*(-1),(area.direction.y + random_number * variation))
		area.increase_speed(strength*clamp(abs(energy),1,spd_mult+0.2))
	else:
		area.direction = Vector2(area.direction.x,area.direction.y*(-1))
	area.directionCorrection(4*variation)
	area.x_direction = false
