extends CharacterBody3D

@onready var player = $"../Player"
@export var move_speed = 2.0
@export var sensor_directions = [Vector3(0,0,-1), Vector3(1,0,-1), Vector3(1,0,0), Vector3(1,0,1), Vector3(0,0,1), Vector3(-1,0,1), Vector3(-1,0,0), Vector3(-1,0,-1)]

func _physics_process(delta):
	## Directions to move to player's location, does not currently account for walls and such.
	var dir = player.global_position - global_position
	dir.y = 0.0
	dir = dir.normalized()
		
	velocity = dir * move_speed
	move_and_slide()
