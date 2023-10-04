extends Resource


class_name ExampleData


@export var dict = {
	'name': 'Player',
	'color': Color('#000000'),
	'health': 100,
 }


# >>> Coding Comment Line <<<
# 1 --- To use Godot's inbuilt ResourceSaver & ResourceLoader we extend Resource
# 
# 4 --- To access this resource we give it a class_name
# 
# 7 --- To access the variables we @export the dictionary
# 8 --- String variable named "Name" set to value of "Player"
# 9 --- Color variable named "Color" set to value of "#000000"
# 10 --- Integer variable named "Health" set to value of "100"
