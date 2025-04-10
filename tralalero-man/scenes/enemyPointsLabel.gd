extends Label

var aux_pos

func execute(points:int):
	
	match  points:
		200:
			add_theme_color_override("font_color",Color.html("3770fb"))
			add_theme_font_size_override("font_size",10)
		400:
			add_theme_color_override("font_color",Color.html("cc70fb"))
			add_theme_font_size_override("font_size",10)
		800:
			add_theme_color_override("font_color",Color.html("a22aff"))
			add_theme_font_size_override("font_size",12)
		1600:
			add_theme_color_override("font_color",Color.html("5eaffb"))
			add_theme_font_size_override("font_size",15)
	text = str(points)
	show()
	aux_pos = global_position
	set_process(true)
	await get_tree().create_timer(1.5).timeout
	hide()

func _process(delta: float):
	if is_visible_in_tree():
		global_position = aux_pos
	else:
		global_position = get_parent().position - Vector2(17.5,12)
		set_process(false)
		
	
