extends CSGBox3D

@export var button_group = 0
@export var button_number = 0
@export var target = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Button", button_number, " Group", button_group)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("KEY_" + str(button_number)):
		print(str(button_number) + " pressed")
		Globals.active = true
		Globals.active_group = button_group
		
		if target:
			Globals.correct = true
		else:
			Globals.correct = false
