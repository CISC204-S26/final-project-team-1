extends Control

@onready var title = $Title
@onready var buttons = $MenuAlignment/ButtonMargin
@onready var chef_mirage = $MenuAlignment/Chef/MirageMargin/ChefMirage

@onready var music = $AudioStreamPlayer2D

func _ready() -> void:
	title.position = Vector2(1250,240)
	title.modulate.a = 0
	buttons.modulate.a = 0
	chef_mirage.modulate.a = 0
	
	var title_pos_tween = get_tree().create_tween()
	title_pos_tween.tween_property(title,"position", Vector2(800, 240), 2.75).set_trans(Tween.TRANS_QUAD)
	
	var title_vis_tween = get_tree().create_tween()
	title_vis_tween.tween_property(title, "modulate:a", 1, 3).set_trans(Tween.TRANS_QUAD)
	
	await title_pos_tween.finished
	
	music.play()
	
	var button_vis_tween = get_tree().create_tween()
	button_vis_tween.tween_property(buttons, "modulate:a", 1, 3).set_trans(Tween.TRANS_QUAD)
	
	var chef_vis_tween = get_tree().create_tween()
	chef_vis_tween.tween_property(chef_mirage, "modulate:a", .25, 5).set_trans(Tween.TRANS_QUAD)
