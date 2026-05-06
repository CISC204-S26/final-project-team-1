extends CharacterBody3D

@onready var turn = $Node3D/TurnCtrl

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@export var speed = 2
@export var fall_acceleration = 10

var target_velocity = Vector3.ZERO


func _physics_process(delta: float):
	if Input.is_action_just_pressed("camera_left"):
		turn.turn_left()

	if Input.is_action_just_pressed("camera_right"):
		turn.turn_right()
	#local variable to store input direction
	var direction = Vector3.ZERO
	
	##Handles movement 
	if Input.is_action_pressed("moveRight"):
		direction.x += 1
	if Input.is_action_pressed("moveLeft"): 
		direction.x -= 1
	if Input.is_action_pressed("moveBack"): 
		direction.z += 1
	if Input.is_action_pressed("moveForward"): 
		direction.z -= 1

	if direction != Vector3.ZERO: 
		direction = direction.normalized()
		$Character.basis = Basis.looking_at(direction)
		
	#ground velocity
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed

		#vertical velocity
	if not is_on_floor(): 
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)
		
		#moving the character
		velocity = target_velocity
		move_and_slide()
		
