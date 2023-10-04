extends Control


func _process(_delta):
	if Input.is_action_just_pressed('ESC'):
		Autoload.is_paused = false
		get_node('.').queue_free()


func _on_resume_pressed():
	Autoload.is_paused = false
	get_node('.').queue_free()


func _on_main_pressed():
	Autoload.section_0 = true
	Autoload.is_paused = false
	SceneTransition.change_scene_to_file('res://scenes/Main.tscn')


func _on_quit_pressed():
	get_tree().quit()


# >>> Coding Comment Line <<<
# 7 --- Removes self from scene
