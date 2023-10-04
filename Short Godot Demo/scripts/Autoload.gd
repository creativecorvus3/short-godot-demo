extends Node


var section_0 = false
var section_1 = false
var section_2 = false
var section_3 = false
var section_4 = false


var is_playing = false
var is_paused = false
var pause_menu = preload('res://scenes/PauseMenu.tscn')


func _process(_delta):
	if Input.is_action_just_pressed('ESC') and Autoload.is_playing == true and Autoload.is_paused == false:
		Autoload.is_paused = true
		var x = pause_menu.instantiate()
		get_tree().current_scene.add_child(x)


# >>> Coding Comment Line <<<
# 4 --- Check to see which SceneTransition to activate (this only exists as we have multiple scenes to transition in a single function)
# 
# 11 --- Check if game is_playing
# 12 --- Check if game is_paused
# 13 --- Set var to preload scene
# 
# 17 --- Pause Check > If 'ESC' key pressed  &  is_playing = true  &  is_paused = false we don't want to open pause in main menu & we don't want to open more than one pause menu
# 18 --- Don't allow for more pause menu's to be instanced so set is_game_paused = true
# 19 --- Var x = preload('res://scenes/PauseMenu.tscn').instantiate()
# 20 --- Get root node of current_scene add child (x)
