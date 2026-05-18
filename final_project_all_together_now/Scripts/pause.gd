extends Control

@export var master_bus_name: String
@export var music_bus_name: String
@export var sfx_bus_name: String

var master_bus_id = AudioServer.get_bus_index(master_bus_name)
var music_bus_id = AudioServer.get_bus_index(music_bus_name)
var sfx_bus_id = AudioServer.get_bus_index(sfx_bus_name)

func _ready():
	master_bus_id = AudioServer.get_bus_index(master_bus_name)
	music_bus_id = AudioServer.get_bus_index(music_bus_name)
	sfx_bus_id = AudioServer.get_bus_index(sfx_bus_name)

func _process(delta: float) -> void:
	if Globals.paused == true:
		show()
		$CanvasLayer.show()
	else:
		hide()
		$CanvasLayer.hide()
	
	if Input.is_action_just_pressed("pause"):
		Globals.paused = !Globals.paused


func _on_master_slider_value_changed(value: float) -> void:
	var db = linear_to_db(value)
	AudioServer.set_bus_volume_db(master_bus_id, db)


func _on_music_slider_value_changed(value: float) -> void:
	var db = linear_to_db(value)
	AudioServer.set_bus_volume_db(music_bus_id, db)

func _on_sfx_slider_value_changed(value: float) -> void:
	var db = linear_to_db(value)
	AudioServer.set_bus_volume_db(sfx_bus_id, db)


func _on_reconnect_pressed() -> void:
	Globals.paused = !Globals.paused


func _on_shut_down_pressed() -> void:
	get_tree().quit()
