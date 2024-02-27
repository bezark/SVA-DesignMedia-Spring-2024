extends Node3D
@export var threshhold = 5
var myarray

# Called when the node enters the scene tree for the first time.
func _ready():
	myarray = get_children()
	for child in myarray:
		print(child.name)
		child.position.x = randf_range(-5.,5)


# Called every frame. 'delta' is the elapsed time since the previous frame.
var counter = 0
func _process(delta):
	counter += 1
	if counter >= threshhold:
		for child in myarray:
			child.position.x = randf_range(-5.,5)
		counter = 0
