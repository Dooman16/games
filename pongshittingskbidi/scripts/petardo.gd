extends Area2D

@export var speed : float = 300
@onready var direction := Vector2.ZERO
var player_dir : int
var x_direction : bool
var pelota : Area2D

func _ready() -> void:
	speed = 300
	direction = Vector2(player_dir,randf()*2-1)
	directionCorrection(5)
	
func _physics_process(delta: float) -> void:
	position += direction.normalized()*speed*delta
	if pelota.direction == Vector2.ZERO:
		queue_free()
	

func increase_speed(strenght) -> void:
	speed *= 1.05 * strenght
	
func reset() -> void:
	pelota.reset()
	
func directionCorrection(ratio) -> void:
	if(direction.y == 0):
		direction.y = direction.x
	if(abs(direction.x/direction.y)<(1/ratio)):
		direction.x = 1/ratio if direction.x > 0 else -1/ratio
		direction.y = ratio if direction.y > 0 else -1*ratio
