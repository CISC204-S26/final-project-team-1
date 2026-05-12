class_name TurnCtrl
extends Node

#Clarabelle Wuz Here
@export var target: Node
@export var rotation_speed = .45
@export var turn_div = 4

var turn_rotation: float

func turn_left():
	## Adds 45 degrees to target rotation
	var tween = get_tree().create_tween()
	if Input.is_action_just_pressed("camera_left"):
		turn_rotation -= PI/turn_div
	
	## Interpolates to target rotation from current
	tween.tween_property(target, "rotation", Vector3(target.rotation.x,turn_rotation, target.rotation.z), rotation_speed).set_trans(Tween.TRANS_SINE)
	
	
func turn_right():
	## Adds 45 degrees to target rotation
	var tween = get_tree().create_tween()
	if Input.is_action_just_pressed("camera_right"):
		turn_rotation += PI/turn_div
	
	## Interpolates to target rotation from current
	tween.tween_property(target, "rotation", Vector3(target.rotation.x,turn_rotation, target.rotation.z), rotation_speed).set_trans(Tween.TRANS_SINE)
