extends Control


var savedata = ExampleData.new()


func change_scene_to_file(_scene):
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED_HIDDEN
	$AnimationPlayer.play('RESET')
	await $AnimationPlayer.animation_finished
	if Autoload.section_0 == true:
		get_tree().change_scene_to_file('res://scenes/Main.tscn')
	if Autoload.section_1 == true:
		get_tree().change_scene_to_file('res://scenes/Section1.tscn')
		Autoload.is_playing = true
	if Autoload.section_2 == true:
		get_tree().change_scene_to_file('res://scenes/Section2.tscn')
		Autoload.is_playing = true
	if Autoload.section_3 == true:
		get_tree().change_scene_to_file('res://scenes/Section3.tscn')
		Autoload.is_playing = true
	if Autoload.section_4 == true:
		get_tree().change_scene_to_file('res://scenes/Section4.tscn')
		Autoload.is_playing = true
	reset_scene()
	$AnimationPlayer.play_backwards('RESET')
	await $AnimationPlayer.animation_finished
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED


func reset_scene():
	Autoload.section_0 = false
	Autoload.section_1 = false
	Autoload.section_2 = false
	Autoload.section_3 = false
	Autoload.section_4 = false


# >>> Coding Comment Line <<<
# 4 --- Create var of dictionary
# 
# 7 --- SceneTransition.change_scene_to_file(_scene aka 'res://scenes/Scene.tscn')
# 8 --- Hide & capture mouse cursor
# 9 --- Play animation "RESET"
# 10 --- Wait until animation is finished before continuing code
# 11 --- Since I have only a single function I need a way to differentiate which scene to transition to. That is where the Autoload.section_0 comes in
# 12 --- Gets tree node call function to specific scene ('res://scenes/Main.tscn')
# 
# 15 --- Check if game is_playing (to see if pausing game is available)
# 
# 26 --- Play animation "RESET" backwards
# 27 --- Wait until animation is finished before continuing code
# 28 --- Shows mouse cursor
