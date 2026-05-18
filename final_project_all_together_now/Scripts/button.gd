extends Area3D

@export var button_number = 0
@export var target = false

var player_in_range = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)
	print("Button", button_number)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if player_in_range:
		if Input.is_action_just_pressed("KEY_" + str(button_number)):
			print(str(button_number) + " pressed")
			Globals.active = true
			if target:
				Globals.correct = true
			else:
				Globals.correct = false
			print(Globals.correct)
	if Globals.pressed == 3:
		get_parent().queue_free()

func _on_area_entered(area: Area3D) -> void:
	player_in_range = true
	print("Area entered: ", area.name, " - Player in range.")
	

func _on_area_exited(area: Area3D) -> void:
	player_in_range = false
	Globals.color = ""
	print("Area exited: ", area.name, " - Player left range.")
