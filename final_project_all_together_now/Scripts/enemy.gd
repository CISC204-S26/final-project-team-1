extends CharacterBody3D

var global = "res://Scripts/globals.gd"
@export var move_speed = 2.0
@onready var player : CharacterBody3D = $"../Player"
@export var sensor_directions = [Vector3(0,0,-1), Vector3(1,0,-1), Vector3(1,0,0), Vector3(1,0,1), Vector3(0,0,1), Vector3(-1,0,1), Vector3(-1,0,0), Vector3(-1,0,-1)]

func _physics_process(delta):
		pass
	
	

	
	
func track_player(delta):
	## Directions to move to player's location, does not currently account for walls and such.
	var dir = player.global_position - global_position
	dir.y = 0.0
	dir = dir.normalized()
	if global.game_over == true:
		print("game over!")
	
	
	velocity = dir * move_speed
	move_and_slide()

func _on_enemy_collision_area_area_entered(area: Area3D) -> void:
	if area == $InteactableAreaInter:
		global.game_over = true
	else:
		pass


func _on_enemy_sensor_area_area_entered(area: Area3D) -> void:
	if area == $InteactableAreaInter:
		track_player
		
		


func _on_enemy_sensor_area_area_exited(area: Area3D) -> void:
	pass # Replace with function body.
