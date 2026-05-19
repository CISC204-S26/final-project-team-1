extends Area3D

var player_in_range = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if player_in_range:
		Globals.unlocked = true

func _on_area_entered(area: Area3D) -> void:
	player_in_range = true
	print("Area entered: ", area.name, " - Player in range.")
	

func _on_area_exited(area: Area3D) -> void:
	player_in_range = false
	Globals.color = ""
	print("Area exited: ", area.name, " - Player left range.")
