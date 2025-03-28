extends Label

func _ready() -> void:
	for n in range(4):
		text = str(3-n)
		await get_tree().create_timer(1.0).timeout
	hide()
