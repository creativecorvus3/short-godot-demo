extends Control


var data = ExampleData.new()
var saves_array = []


func _ready():
	DirAccess.make_dir_recursive_absolute('user://saves')
	check()


func _on_button_pressed():
	Autoload.section_0 = true
	SceneTransition.change_scene_to_file('res://scenes/Main.tscn')


func _on_save_1_pressed():
	ResourceSaver.save(data, 'user://saves/save1.tres')
	check()
func _on_load_1_pressed():
	data = ResourceLoader.load('user://saves/save1.tres')
	$PanelContainer/VBoxContainer/PanelContainer/VBoxContainer/HBoxContainer2/Slot.text = 'Slot: 1'
	set_values()
func _on_erase_1_pressed():
	$PanelContainer/VBoxContainer/PanelContainer/VBoxContainer/HBoxContainer3/VBoxContainer/Slot1/Load1.disabled = true
	$PanelContainer/VBoxContainer/PanelContainer/VBoxContainer/HBoxContainer3/VBoxContainer/Slot1/Erase1.disabled = true
	OS.move_to_trash(ProjectSettings.globalize_path('user://saves/save1.tres'))
	_on_reset_pressed()
	check()


func _on_save_2_pressed():
	ResourceSaver.save(data, 'user://saves/save2.tres')
	check()
func _on_load_2_pressed():
	data = ResourceLoader.load('user://saves/save2.tres')
	$PanelContainer/VBoxContainer/PanelContainer/VBoxContainer/HBoxContainer2/Slot.text = 'Slot: 2'
	set_values()
func _on_erase_2_pressed():
	$PanelContainer/VBoxContainer/PanelContainer/VBoxContainer/HBoxContainer3/VBoxContainer/Slot2/Load2.disabled = true
	$PanelContainer/VBoxContainer/PanelContainer/VBoxContainer/HBoxContainer3/VBoxContainer/Slot2/Erase2.disabled = true
	OS.move_to_trash(ProjectSettings.globalize_path('user://saves/save2.tres'))
	_on_reset_pressed()
	check()


func _on_save_3_pressed():
	ResourceSaver.save(data, 'user://saves/save3.tres')
	check()
func _on_load_3_pressed():
	data = ResourceLoader.load('user://saves/save3.tres')
	$PanelContainer/VBoxContainer/PanelContainer/VBoxContainer/HBoxContainer2/Slot.text = 'Slot: 3'
	set_values()
func _on_erase_3_pressed():
	$PanelContainer/VBoxContainer/PanelContainer/VBoxContainer/HBoxContainer3/VBoxContainer/Slot3/Load3.disabled = true
	$PanelContainer/VBoxContainer/PanelContainer/VBoxContainer/HBoxContainer3/VBoxContainer/Slot3/Erase3.disabled = true
	OS.move_to_trash(ProjectSettings.globalize_path('user://saves/save3.tres'))
	_on_reset_pressed()
	check()


func _on_line_edit_text_changed(new_text):
	data.dict.name = new_text
	$PanelContainer/VBoxContainer/PanelContainer/VBoxContainer/HBoxContainer2/Name.text = 'Name: ' + new_text


func _on_color_picker_button_color_changed(color):
	data.dict.color = color
	$PanelContainer/VBoxContainer/PanelContainer/VBoxContainer/HBoxContainer2/Color.add_theme_color_override('font_color', color)
	$PanelContainer/VBoxContainer/PanelContainer/VBoxContainer/HBoxContainer2/Color.text =  'Color: ' + str(color)


func _on_plus_pressed():
	data.dict.health += 10
	$PanelContainer/VBoxContainer/PanelContainer/VBoxContainer/HBoxContainer2/Health.text = 'Health: ' + str(data.dict.health)


func _on_minus_pressed():
	data.dict.health -= 10
	$PanelContainer/VBoxContainer/PanelContainer/VBoxContainer/HBoxContainer2/Health.text = 'Health: ' + str(data.dict.health)


func _on_reset_pressed():
	data = ExampleData.new()
	$PanelContainer/VBoxContainer/PanelContainer/VBoxContainer/HBoxContainer2/Slot.text = 'Slot: Empty'
	set_values()


func set_values():
	$PanelContainer/VBoxContainer/PanelContainer/VBoxContainer/HBoxContainer2/Name.text = 'Name: ' + data.dict.name
	$PanelContainer/VBoxContainer/PanelContainer/VBoxContainer/HBoxContainer3/VBoxContainer2/ChangeName/LineEdit.text = data.dict.name
	$PanelContainer/VBoxContainer/PanelContainer/VBoxContainer/HBoxContainer2/Color.text =  'Color: ' + str(data.dict.color)
	$PanelContainer/VBoxContainer/PanelContainer/VBoxContainer/HBoxContainer2/Color.add_theme_color_override('font_color', data.dict.color)
	$PanelContainer/VBoxContainer/PanelContainer/VBoxContainer/HBoxContainer3/VBoxContainer2/ChangeColor/ColorPickerButton.color = data.dict.color
	$PanelContainer/VBoxContainer/PanelContainer/VBoxContainer/HBoxContainer2/Health.text = 'Health: ' + str(data.dict.health)


func check():
	saves_array = []
	var dir = DirAccess.open('user://saves')
	dir.list_dir_begin()
	while true:
		var file = dir.get_next()
		if file == '':
			break
		saves_array.append(file)
	dir.list_dir_end()
	if saves_array.has('save1.tres'):
		$PanelContainer/VBoxContainer/PanelContainer/VBoxContainer/HBoxContainer3/VBoxContainer/Slot1/Load1.disabled = false
		$PanelContainer/VBoxContainer/PanelContainer/VBoxContainer/HBoxContainer3/VBoxContainer/Slot1/Erase1.disabled = false
	if saves_array.has('save2.tres'):
		$PanelContainer/VBoxContainer/PanelContainer/VBoxContainer/HBoxContainer3/VBoxContainer/Slot2/Load2.disabled = false
		$PanelContainer/VBoxContainer/PanelContainer/VBoxContainer/HBoxContainer3/VBoxContainer/Slot2/Erase2.disabled = false
	if saves_array.has('save3.tres'):
		$PanelContainer/VBoxContainer/PanelContainer/VBoxContainer/HBoxContainer3/VBoxContainer/Slot3/Load3.disabled = false
		$PanelContainer/VBoxContainer/PanelContainer/VBoxContainer/HBoxContainer3/VBoxContainer/Slot3/Erase3.disabled = false


# >>> Coding Comment Line <<<
# 4 --- Access Dict.gd variables in our script by creating a var (data)
# 5 --- Array to store our existing save files
# 
# 9 --- Create folder named (saves) within user's device
# 10 --- Check() function to update and see our save files within folder
# 
# 19 --- In-built Saving our var (data) as a .tres file !!! important its a .tres
# 20 --- We know we added a save file into our directory therefore we call Check() to update saves_array
# 22 --- Replace (data) dict with the one in file by loading values w/ ResourceLoader.load("")
# 23 --- Update to show which slot is loaded
# 24 --- Call func set_values() to update the loaded values from the file
# 26 & 27 --- Disable Load & Erase buttons
# 28 --- Move "deleted" file to user's recycling bin much faster and doesn't create pauses as it isn't trying to delete it now (useful for large saves or use a loading animation)
# 29 --- set (data) to default, text to Empty and call func() set_values with the default values essentially resetting
# 30 --- Clear the saves_array so that the button is not re-enabled falsely
# 
# 63 --- LineEdit node with signal (text_changed)
# 
# 65 --- Update Label of name
# 
# 68 --- ColorPickerButton node with signal (color_changed) <If you have more than one nodes this signal is changing it might slow performances>
# 69 --- Set dict.color value with the current color of the button
# 70 --- Overrides Label text color with the color of the button
# 71 --- Update Label of color
# 
# 75 --- Set dict.health value +10
# 76 --- Update Label of health
# 
# 85 --- Replace (data) dict with default values
# 86 --- Update Label of slot
# 87 --- Call func set_values to reset Label's
# 
# 100 --- Everytime we Check() reset saves_array to empty
# 101 --- DirAccess.open folder (saves)
# 102 --- Initializes stream to list files and directory
# 103 --- while loop that continues if = true
# 104 --- Set var (file) to get next file within DirAccess
# 105 --- if file == empty meaning no more files exist
# 106 --- break ends the loop
# 107 --- append file add to array to know which file exists
# 108 --- Stop stream listing files and directory
# 109 --- Check if array has file ('save1.tres')
# 110 & 111 --- Enable Load & Erase buttons
