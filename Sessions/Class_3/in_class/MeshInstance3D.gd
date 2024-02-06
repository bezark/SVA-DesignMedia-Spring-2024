extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("forwards"):
		position.z -= 0.1
	if Input.is_action_pressed("backwards"):
		position.z += 0.1
	if Input.is_action_pressed("left"):
		position.x -= 0.1
	if Input.is_action_pressed("right"):
		position.x += 0.1


