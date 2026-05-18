extends Control



func _process(delta: float) -> void:
	if Globals.paused == true:
		show()
		$CanvasLayer.show()
	else:
		hide()
		$CanvasLayer.hide()
	
	if Input.is_action_just_pressed("pause"):
		Globals.paused = !Globals.paused
