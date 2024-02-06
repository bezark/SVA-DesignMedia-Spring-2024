extends MeshInstance3D

@export var condition_to_check = true

# Called when the node enters the scene tree for the first time.
func _ready():
	print("starting")
	if 4 >= 4 or condition_to_check:
		print("true!")
	else:
		print("it was false!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if condition_to_check: 
		position.z -= 0.05
		if position.z < -20:
			scale.y = 100
	else:
		scale.y = 1
		position.z += 0.05
