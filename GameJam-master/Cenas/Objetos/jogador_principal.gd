extends CharacterBody2D

const SPEED = 400.0
const JUMP_VELOCITY = -900.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var lifepoints: Array[Node] = []

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jump_count = 0
var vida = 3

func reduzir_vida():
	vida -= 1
	print(vida)
	if (animated_sprite_2d.vida > 3):
		
		animated_sprite_2d.animation = "hit"

func jump():
	velocity.y = JUMP_VELOCITY
	
func jump_side(x):
	velocity.y = JUMP_VELOCITY
	velocity.x = x

func _physics_process(delta: float) -> void:

	# Add the gravity.
	if is_on_floor():
		jump_count = 0
			#Animations
		if (velocity.x > 1 || velocity.x < -1):
			animated_sprite_2d.animation = "run"
		else: 
			animated_sprite_2d.animation = "idle"
			
	else:
		velocity += get_gravity() * delta
		if (jump_count == 2): 
			animated_sprite_2d.animation = "double_jump"
		else: 
			animated_sprite_2d.animation = "jump"


	# Detecta ação de pulo
	if Input.is_action_just_pressed("jump") and jump_count < 2:
		velocity.y = JUMP_VELOCITY
		jump_count += 1

	# Movimento horizontal
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 40)

	move_and_slide()

	# Orienta o sprite baseado na direção
	var is_left = velocity.x < 0
	animated_sprite_2d.flip_h = is_left
