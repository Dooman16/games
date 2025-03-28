extends Node2D

var x : int = 0
var y : int = 0
@onready var buttons: Array[Array] = [[$valenger,$beloved,$challenger,$archero,$petardium],[$magica,$frozen,$rotato,$phase,$revenger]]
@onready var button_elected : Button

var nombre : Array[String] = ["Valenger","Beloved","Challenger","Archero","Petardium","Magica","Frozen","Rotato","Phase","Revenger"]
var desc : Array[String] = ["3 piques, al usar la habilidad
aumenta el rebote","3 piques, al usar la habilidad
aumenta el rebote con menos potencia,
mayor hitbox","6 piques, dispara la pelota rapidamente
al lado enemigo","6 piques, cambia de direccion a la pelota","10 piques, invoca una pelota mas desde la paleta","8 piques, intercambia lugares","3 piques, congela la pelota","8 piques, rota la cancha","8 piques, posee una sombra 
que le sigue con 1.5 seg de retraso,
al activar vuelve para atras 
bloqueando todo a su paso","5 piques, despues de perder aumenta su fuerza 
al activar la habilidad, 
su poder aumenta aun mas 
pero la fuerza del enemigo 
se duplica por 2"]

var mouse_mode := false
var chouse : bool = false
var player = Singleton.actual_player

func _ready() -> void:
	button_elected = buttons[0][0]
	button_elected.add_theme_stylebox_override("normal",load("res://personaje_hover.tres"))
	_cambiar_descripcion()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		go_back()
	if Input.is_action_just_pressed("d") or Input.is_action_just_pressed("right"):
		x += 1 if x < 4 else -4
		update_button()
	if Input.is_action_just_pressed("a") or Input.is_action_just_pressed("left"):
		x -= 1 if x > 0 else -4
		update_button()
	if Input.is_action_just_pressed("w") or Input.is_action_just_pressed("up"):
		y -= 1 if y == 1  else -1
		update_button()
	if Input.is_action_just_pressed("s") or Input.is_action_just_pressed("down"):
		y += 1 if y == 0 else -1
		update_button()

func update_button() -> void:
	if not mouse_mode and not chouse:
		button_elected.add_theme_stylebox_override("normal",load("res://personaje estilo.tres"))
		button_elected = buttons[y][x]
		button_elected.add_theme_stylebox_override("normal",load("res://personaje_hover.tres"))
		_cambiar_descripcion()

func _button_mouse_entered(pos) -> void:
	if not chouse:
		button_elected.add_theme_stylebox_override("normal",load("res://personaje estilo.tres"))
		mouse_mode = true
		y=pos[1]
		x=pos[0]
		button_elected = buttons[y][x]
		_cambiar_descripcion()
		button_elected.add_theme_stylebox_override("normal",load("res://personaje_hover.tres"))
	
func _button_mouse_exited() -> void:
	mouse_mode = false

func _button_pressed() -> void:
	button_elected.add_theme_stylebox_override("normal",load("res://personaje_selected.tres"))
	button_elected.add_theme_stylebox_override("focus",load("res://personaje_selected.tres"))
	for buton in buttons[0]:
		buton.disabled = true
	for buton in buttons[1]:
		buton.disabled = true
	$seguir.disabled = false
	chouse = true

func go_back():
	if chouse:
		button_elected.add_theme_stylebox_override("normal",load("res://personaje_hover.tres"))
		button_elected.add_theme_stylebox_override("focus",load("res://personaje estilo.tres"))
		button_elected.release_focus()
		for buton in buttons[0]:
			buton.disabled = false
		for buton in buttons[1]:
			buton.disabled = false
		$seguir.disabled = true
		chouse = false
	else:
		get_tree().change_scene_to_file("res://escenas/modo_juego.tscn")
		Singleton.reset()
func _on_seguir_pressed() -> void:
	var power = (x if y == 0 else (x + 5)) +1
	if Singleton.pvp:
		if player == 1:
			Singleton.poder_1 = power
			Singleton.actual_player = 2
			get_tree().change_scene_to_file("res://escenas/menu_personajes.tscn")
		else:
			Singleton.poder_2 = power
			get_tree().change_scene_to_file("res://escenas/juego.tscn")
	else:
		Singleton.poder_1 = power
		get_tree().change_scene_to_file("res://escenas/juego.tscn")

func _cambiar_descripcion() -> void:
	$nombre.text = nombre[x if y == 0 else (x + 5)]
	$descripcion.text = desc[x if y == 0 else (x + 5)]
