extends Control

@onready var title = $MenuAlignment/Menu/VBoxContainer/Title


func _ready() -> void:
	title.position = Vector2(2000,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
