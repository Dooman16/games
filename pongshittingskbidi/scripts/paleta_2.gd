extends Area2D

@export var speed = 250 * Singleton.dificulty
@onready var screen = get_viewport_rect().size.y
var direction = Vector2.ZERO
var strength = 1
@onready var pelota = get_node("/root/juego/pelota")
@onready var pelotas := [pelota]
var lado := true
var pelotaorig
var energy : float = 0
var min_energy = 0.2

func _ready() -> void:
	position = Vector2(994,324)
	pelotaorig = pelota

func _process(delta: float) -> void:
	if pelotaorig.direction == Vector2.ZERO:
		pelotas = [pelota]
		pelota = pelotaorig
	if pelotas.size() > 1:
		choose_closest_ball()
	if pelota.position.y < position.y:
		direction = Vector2.UP
		energy -= 2*delta
		energy = clamp(energy,-1.5,min_energy*(-1))
	if pelota.position.y > position.y:
		direction = Vector2.DOWN
		energy += 2*delta 
		energy = clamp(energy,min_energy,1.5)
	if abs(pelota.position.y - position.y) < 3 :
		direction = Vector2.ZERO
		if energy < 0:
			energy -= 0.1*delta
			energy = clamp(energy,min_energy,1.5)
		elif energy > 0:
			energy += 0.1*delta 
			energy = clamp(energy,-1.5,min_energy*(-1))
	position += direction*speed*delta
	position.y = clamp(position.y,45 + 60*scale.y, screen - 45 - scale.y*60)

func _on_area_entered(area: Area2D) -> void:
	get_node("/root/juego/palette").play()
	var random_number = randf()*2 -1
	var variation = energy*area.speed/300
	if randi()  % 2 == 0 and variation > 1:
		variation = 1/variation
	var prepo1 = area.position.x + 12.9 < position.x
	var prepo2 = area.position.x -12.9 > position.x
	print(position.x)
	print(area.position.x)
	if(prepo1 if lado else prepo2):
		area.direction = Vector2(area.direction.x*(-1),(area.direction.y + random_number * variation))
		area.increase_speed(strength*clamp(abs(energy),1,1.2))
	else:
		area.direction = Vector2(area.direction.x,area.direction.y*(-1))
	area.directionCorrection(4*variation)
	area.x_direction = false

func choose_closest_ball():
	for bal in pelotas:
		if not bal.is_queued_for_deletion():
			if(abs(bal.position.x - position.x) < abs(pelota.position.x - position.x)):
				pelota = bal
