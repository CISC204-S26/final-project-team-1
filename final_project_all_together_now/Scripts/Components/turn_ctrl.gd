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
	turn_rotation -= PI/turn_div
	
	## Interpolates to target rotation from current
	tween.tween_property(target, "rotation", Vector3(target.rotation.x,turn_rotation, target.rotation.z), rotation_speed).set_trans(Tween.TRANS_SINE)

func turn_right():
	## Adds 45 degrees to target rotation
	var tween = get_tree().create_tween()
	turn_rotation += PI/turn_div
	
	## Interpolates to target rotation from current
	tween.tween_property(target, "rotation", Vector3(target.rotation.x,turn_rotation, target.rotation.z), rotation_speed).set_trans(Tween.TRANS_SINE)

func look_vert(look_angle):
	var tween = get_tree().create_tween()
	tween.tween_property(target, "rotation", Vector3(deg_to_rad(look_angle),target.rotation.y, target.rotation.z), rotation_speed).set_trans(Tween.TRANS_SINE)
