extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_map_button_pressed():
	print("You clicked the Map!")
	$mapProgram/mapBkgd.show()
## todo - add mini map to window

func _on_power_supply_button_pressed():
	print("You clicked the Power Supply!")
	$powerSupplyProgram/powerSupplyBkgd.show()
## todo - add power on and off buttons for different port numbers 

func _on_passwords_button_pressed():
	print("You clicked the Passwords!")
	$passwordsProgram/passwordsBkgd.show()
## todo - add password input options

func _on_turning_button_pressed():
	print("You clicked the Turning Button!")
	$turningProgram/turningBkgd.show()
## todo - add turn controls/buttons

func _on_files_button_pressed():
	print("You clicked the Files!")
	$filesProgram/fileBkgd.show()
## todo - add file repository (saved/encountered passwords/codes/etc)

func _on_exit_button_pressed():
	print("You closed the program!")
	get_tree().call_group("Programs", "hide") 
