extends CharacterBody2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

@export var speed = 250
var is_moving = false
var direction = ""

func _ready():
	# Configure initial state of player
	anim.play("idle_down")
	anim.flip_h = false

func _process(_delta):
	var input_velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_left"):
		input_velocity.x -= 1
		direction = "move_left"
	if Input.is_action_pressed("move_right"):
		input_velocity.x += 1
		direction = "move_right"
	if Input.is_action_pressed("move_up"):
		input_velocity.y -= 1
		if input_velocity.x == 0:
			direction = "move_up"
	if Input.is_action_pressed("move_down"):
		input_velocity.y += 1
		if input_velocity.x == 0:
			direction = "move_down"
	
	# Determine if character is moving
	is_moving = input_velocity != Vector2.ZERO
	
	# Normalize velocity and assign to propiety velocity
	velocity = input_velocity.normalized() * speed
	move_and_slide()
	
	# Animation control
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
		# Idle animation according to the last direction
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
