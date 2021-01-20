extends KinematicBody2D

var velocity = Vector2.ZERO

const MAX_SPEED = 80
const ACCELERATION = 500
const FRICTION = 500

# Called when the node enters the scene tree for the first time.
# func _ready():
	# print("Hello World!")
	# pass # Replace with function body.

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	# print(input_vector)
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	print(velocity)
		
	move_and_collide(velocity * delta)
