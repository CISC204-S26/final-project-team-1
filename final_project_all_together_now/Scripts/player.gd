extends CharacterBody3D

@onready var camera_pivot = $CameraPivot

@onready var turn = $CameraPivot/TurnCtrl

@export var move_speed = 500
@export var jump_impulse = 15

@export var gravity = -30

func cam_up():
	turn.look_vert(5)

func cam_down():
	turn.look_vert(30)

func _physics_process(delta):
	#print(camera_pivot.rotation.x)
	move_and_slide() ## Move and Slide
	
	if Input.is_action_just_pressed("camera_left"):
		turn.turn_left()

	if Input.is_action_just_pressed("camera_right"):
		turn.turn_right()
	
	## Gets Movement Input ########################################################################
	var input_vector := Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_forward") - Input.get_action_strength("move_back")
	)
	
	
	if input_vector != Vector2.ZERO: ## If move input detected
		input_vector = input_vector.normalized()
		
		## Orients directions based on camera rotation ############################################
		var camera_basis = camera_pivot.global_transform.basis
		
		var forward = camera_basis.z
		forward = forward.normalized()
		
		var right = -camera_basis.x
		right = right.normalized()
		
		## Moves according to new orientation and given input #####################################
		var move_direction = (input_vector.x * right + input_vector.y * forward).normalized()
		
		velocity.x = move_direction.x * move_speed * delta
		velocity.z = move_direction.z * move_speed * delta
	
	else: ## Dont move if not moving ##############################################################
		velocity.x = 0
		velocity.z = 0
	
	velocity.y += gravity * delta
	
	var is_starting_jump = Input.is_action_just_pressed("jump") and is_on_floor()
	
	if is_starting_jump:
		velocity.y += jump_impulse


func _on_inteactable_area_inter_area_entered(area: Area3D) -> void:
	if $"../Enemy/EnemyCollisionArea":
		print("you dead")
		die()
		
func die():
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
