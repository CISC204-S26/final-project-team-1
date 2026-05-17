extends Control

@onready var title = $Title
@onready var buttons = $MenuAlignment/ButtonMargin
@onready var chef_mirage = $MenuAlignment/Chef/MirageMargin/ChefMirage

@onready var music = $Music
@onready var swoosh = $Title/Swoosh
@onready var wind = $Title/Wind
@onready var beep = $Title/Beeps

func _ready() -> void:
	title.position = Vector2(1250,240)
	title.modulate.a = 0
	buttons.modulate.a = 0
	chef_mirage.modulate.a = 0
	
	var title_pos_tween = get_tree().create_tween()
	title_pos_tween.tween_property(title,"position", Vector2(780, 240), 2.75).set_trans(Tween.TRANS_QUAD)
	
	var title_vis_tween = get_tree().create_tween()
	title_vis_tween.tween_property(title, "modulate:a", 1, 3).set_trans(Tween.TRANS_QUAD)
	
	swoosh.play()
	await get_tree().create_timer(.5).timeout
	beep.play()
	await get_tree().create_timer(.2).timeout
	wind.play()
	
	
	await title_pos_tween.finished
	
	var button_vis_tween = get_tree().create_tween()
	button_vis_tween.tween_property(buttons, "modulate:a", 1, 5).set_trans(Tween.TRANS_QUAD)
	
	var chef_vis_tween = get_tree().create_tween()
	chef_vis_tween.tween_property(chef_mirage, "modulate:a", .25, 7.5).set_trans(Tween.TRANS_QUAD)
	
	await get_tree().create_timer(.7).timeout
	music.play()

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/desktop_scene.tscn")
