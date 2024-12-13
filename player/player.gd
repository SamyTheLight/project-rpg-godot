extends CharacterBody2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

@export var speed = 300
var is_moving = false
var direction = ""

func _process(delta):
	var input_velocity = Vector2.ZERO
	
	# Detectar entradas de movimiento acumulativamente
	if Input.is_action_pressed("move_left"):
		input_velocity.x -= 1
		direction = "move_left"
	if Input.is_action_pressed("move_right"):
		input_velocity.x += 1
		direction = "move_right"
	if Input.is_action_pressed("move_up"):
		input_velocity.y -= 1
		if input_velocity.x == 0:  # Priorizar horizontal sobre vertical
			direction = "move_up"
	if Input.is_action_pressed("move_down"):
		input_velocity.y += 1
		if input_velocity.x == 0:  # Priorizar horizontal sobre vertical
			direction = "move_down"
	
	# Determinar si el personaje está en movimiento
	is_moving = input_velocity != Vector2.ZERO
	
	# Normalizar velocidad y asignar a la propiedad "velocity"
	velocity = input_velocity.normalized() * speed
	move_and_slide()
	
	# Control de animaciones
	if is_moving:
		if direction == "move_left":
			anim.play("walking")
			anim.flip_h = true
		elif direction == "move_right":
			anim.play("walking")
			anim.flip_h = false
		elif direction == "move_up":
			anim.play("walking_up")
		elif direction == "move_down":
			anim.play("walking_down")
	else:
		# Animación de "idle" según la última dirección
		if direction == "move_left":
			anim.play("idle")
			anim.flip_h = true
		elif direction == "move_right":
			anim.play("idle")
			anim.flip_h = false
		elif direction == "move_up":
			anim.play("idle_up")
		elif direction == "move_down":
			anim.play("idle_down")
