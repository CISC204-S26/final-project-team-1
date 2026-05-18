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


func _on_start_button_pressed():
	print("You clicked start! Ready?")
	$BlueStartupScreen/startButton.hide()
	$BlueStartupScreen/passwordBox.show()


func _on_enter_button_pressed():
	print("You clicked to submit a password!")
	if $BlueStartupScreen/passwordBox.text == "Password": 
		$BlueStartupScreen.hide()
		$loreScreen.show()
		await get_tree().create_timer(10).timeout
		$loreScreen/playbutton.show()
		
	else: if $BlueStartupScreen/passwordBox.text == "password": 
		$BlueStartupScreen.hide()
		$loreScreen.show()
		await get_tree().create_timer(10).timeout
		$loreScreen/playbutton.show()
		
	else: 
		$BlueStartupScreen/passwordBox.add_theme_color_override("background_color", "red")
		await get_tree().create_timer(.25).timeout 
		$BlueStartupScreen/passwordBox.add_theme_color_override("background_color", Color(0, 0, 0, 0))


func _on_playbutton_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_q_1_button_pressed() -> void:
	if Globals.active: 
		if Globals.correct:
			Globals.pressed += 1
			print(Globals.pressed)
			Globals.correct = false
		else:
			print("ded")
	print("Left mouse button clicked on the area")
	if Globals.pressed == 3:
		$powerSupplyProgram/powerSupplyBkgd/q1Instructions.hide()
		$powerSupplyProgram/powerSupplyBkgd/q2Instructions.show()

func _on_orange_button_button_down() -> void:
	Globals.powered = false
	Globals.color = "orange"
	print("Mouse held down - ", Globals.powered, Globals.color)
func _on_orange_button_button_up() -> void:
	Globals.powered = true
	Globals.color = ""
	print("Mouse released - ", Globals.powered, Globals.color)

func _on_red_button_button_down() -> void:
	Globals.powered = false
	Globals.color = "red"
	print("Mouse held down - ", Globals.powered, Globals.color)
func _on_red_button_button_up() -> void:
	Globals.powered = true
	Globals.color = ""
	print("Mouse released - ", Globals.powered, Globals.color)
	
func _on_purple_button_button_down() -> void:
	Globals.powered = false
	Globals.color = "purple"
	print("Mouse held down - ", Globals.powered, Globals.color)
func _on_purple_button_button_up() -> void:
	Globals.powered = true
	Globals.color = ""
	print("Mouse released - ", Globals.powered, Globals.color)

func _on_greenbutton_button_down() -> void:
	Globals.powered = false
	Globals.color = "green"
	print("Mouse held down - ", Globals.powered, Globals.color)
func _on_greenbutton_button_up() -> void:
	Globals.powered = true
	Globals.color = ""
	print("Mouse released - ", Globals.powered, Globals.color)

func _on_final_enter_button_pressed():
	print("You clicked to submit the last password!")
	if $passwordsProgram/passwordsBkgd/enterPassword/passwordBoxFinal.text == "Password":
		get_tree().change_scene_to_file("")

	else: if $passwordsProgram/passwordsBkgd/enterPassword/passwordBoxFinal.text == "password":
		get_tree().change_scene_to_file("")

	else: 
		$passwordsProgram/passwordsBkgd/enterPassword/passwordBoxFinal.add_theme_color_override("background_color", "red")
		await get_tree().create_timer(.25).timeout 
		$passwordsProgram/passwordsBkgd/enterPassword/passwordBoxFinal.add_theme_color_override("background_color", Color(0, 0, 0, 0))
