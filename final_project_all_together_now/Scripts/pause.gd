extends Control



func _process(delta: float) -> void:
	if Globals.paused == true:
		show()
	else:
		hide()
	
	if Input.is_action_just_pressed("pause"):
		Globals.paused = !Globals.paused
