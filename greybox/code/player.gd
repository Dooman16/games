extends Node2D

@export var size = 1

var direction :bool = true

@export var leftArmAngle = 0
@export var rightArmAngle = 0
@export var leftLegAngle = 0
@export var rightLegAngle = 0

@export var body : Texture2D 
@export var stick : Texture2D

@onready var leftArm : Sprite2D = $leftArm
@onready var rightArm : Sprite2D= $rightArm
@onready var leftLeg : Sprite2D= $leftLeg
@onready var rightLeg : Sprite2D= $rightLeg

func _ready() -> void:
	leftArm.rotation_degrees = leftArmAngle
	rightArm.rotation_degrees = rightArmAngle
	leftLeg.rotation_degrees = leftLegAngle
	rightLeg.rotation_degrees = rightLegAngle
	$body.texture = body
	leftArm.texture = stick
	rightArm.texture = stick
	leftLeg.texture = stick
	rightLeg.texture = stick
	var y_offset = stick.get_size().y / 2
	leftArm.offset.y = y_offset
	rightArm.offset.y = y_offset
	leftLeg.offset.y = y_offset
	rightLeg.offset.y = y_offset
	if size == 1:
		
		$body.position.y = 60
		
		leftArm.position = Vector2(30,33)
		
		rightArm.position = Vector2(-30,33)
		
		leftLeg.position = Vector2(28.5,87)
		
		rightLeg.position = Vector2(-28.5,87)
	if size == 2:
		$body.position.y = 74
		
		leftArm.position = Vector2(20,40)
		
		rightArm.position = Vector2(-20,40)
		
		leftLeg.position = Vector2(20,109)
		
		rightLeg.position = Vector2(-20,109)
	if size == 3:
		$body.position.y = 80
		
		leftArm.position = Vector2(23,40)
		
		rightArm.position = Vector2(-23,40)
		
		leftLeg.position = Vector2(23,132)
		
		rightLeg.position = Vector2(-23,132)
	if size == 4:
		$body.position.y = 81
		
		leftArm.position = Vector2(21,40)
		
		rightArm.position = Vector2(-21,40)
		
		leftLeg.position = Vector2(21,127)
		
		rightLeg.position = Vector2(-21,127)
		
		
		
