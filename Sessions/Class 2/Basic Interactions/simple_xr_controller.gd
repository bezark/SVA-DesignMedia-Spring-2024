extends XROrigin3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_left_controller_button_pressed(name):
	print(name)


func _on_right_controller_button_pressed(name):
	print(name)
