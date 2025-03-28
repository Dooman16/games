extends Area2D

var speed_aux : float = 0
var direction_aux : Vector2 = Vector2.ZERO
@export var speed : float = 300
@onready var direction := Vector2(randf()*2-1,randf()*2-1)
var x_direction : bool = false #true -> right, false -> left
var on_ability : bool = false
var pelota_looser := 0 # -1 left 1 right
func _ready() -> void:
	reset()
	directionCorrection(5)
	
func _physics_process(delta: float) -> void:
	position += direction.normalized()*speed*delta
	
func ability(spd,dir) -> void:
	speed_aux = speed
	speed = spd
	direction = dir
	on_ability = true

func ability_2(spd,dir,str):
	speed_aux = spd*str
	direction = dir
	speed = spd
	on_ability = true

func af_ability() -> void:
	speed = speed_aux
	on_ability = false
	

func increase_speed(strenght) -> void:
	speed *= 1.05 * strenght
	
func reset() -> void:
	position = Vector2(576,324)
	speed = 300
	direction = Vector2(0,0)
	speed_aux = 300
	on_ability = false 
	await get_tree().create_timer(3.0).timeout
	direction = Vector2(-1 if randi()%2 == 0 else 1,randf()*2-1)
	x_direction = direction.x > 0
	
func directionCorrection(ratio) -> void:
	if(direction.y == 0):
		direction.y = direction.x
	if(abs(direction.x/direction.y)<(1/ratio)):
		direction.x = 1/ratio if direction.x > 0 else -1/ratio
		direction.y = ratio if direction.y > 0 else -1*ratio


func _on_area_entered(area: Area2D) -> void:
	if on_ability:
		af_ability()
