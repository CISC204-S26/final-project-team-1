extends Node3D

@onready var player = $Player


func _on_button_area_body_entered(_body: Node3D) -> void:
	player.cam_up()


func _on_button_area_body_exited(_body: Node3D) -> void:
	player.cam_down()
