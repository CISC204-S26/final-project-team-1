extends Area2D

@export var switch_color = ""
var mouse_in_range = false
var mouse_button_held = false

func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	print(Globals.powered)
	
func _process(_delta: float) -> void:
	if mouse_in_range:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			if not mouse_button_held:
				mouse_button_held = true
				_on_mouse_held_down()
		else:
			if mouse_button_held:
				mouse_button_held = false
				_on_mouse_released()
	if Globals.completed == 4:
		queue_free()

func _on_mouse_held_down() -> void:
	Globals.powered = false
	Globals.color = switch_color
	print("Mouse held down - ", Globals.powered, Globals.color)

func _on_mouse_released() -> void:
	Globals.powered = true
	Globals.color = ""
	print("Mouse released - ", Globals.powered, Globals.color)

func _on_mouse_entered() -> void:
	mouse_in_range = true
	print("Mouse entered")

func _on_mouse_exited() -> void:
	mouse_in_range = false
	mouse_button_held = false  
	print("Mouse exited")
