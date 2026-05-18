extends Area2D

var mouse_in_range = false

func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	
	input_event.connect(_on_input_event)

func _process(_delta: float) -> void:
		pass

func _on_mouse_entered() -> void:
	mouse_in_range = true
	print("Mouse entered")

func _on_mouse_exited() -> void:
	mouse_in_range = false
	print("Mouse exited")

func _on_input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if Globals.active: 
			if Globals.correct:
				Globals.pressed += 1
				print(Globals.pressed)
			else:
				print("ded")
		print("Left mouse button clicked on the area")
	if Globals.pressed == 3:
		queue_free()
