extends Control


func _ready():
	Autoload.is_playing = false


func _on_rich_text_label_meta_clicked(meta):
	match meta:
		'link1':
			Autoload.section_1 = true
			SceneTransition.change_scene_to_file('res://scenes/Section1.tscn')
		'link2':
			Autoload.section_2 = true
			SceneTransition.change_scene_to_file('res://scenes/Section2.tscn')
		'link3':
			Autoload.section_3 = true
			SceneTransition.change_scene_to_file('res://scenes/Section3.tscn')
		'link4':
			Autoload.section_4 = true
			SceneTransition.change_scene_to_file('res://scenes/Section4.tscn')
		'quit':
			get_tree().quit()


# >>> Coding Comment Line <<<
# 5 --- Check if game is "playing" if so don't allow game pausing
# 
# 8 --- Select the RichTextLabel node in the [Scene] > go to [Node] > [Signals] and connect meta_clicked to script 
# 9 --- As I have multiple "meta" I need a way to check which one was clicked on so I will be matching the given signal
# 10 --- If it is meta signal "link1" then activate its function
# 11 --- Autoload.section_1 exists as I have a single function to change scenes with a need to differentiate which one to change to
# 12 --- Calls an Autoloaded scene "SceneTransition" and its func "change_scene_to_file"
# 
# 23 --- Gets node tree and calls quit function closing the application
