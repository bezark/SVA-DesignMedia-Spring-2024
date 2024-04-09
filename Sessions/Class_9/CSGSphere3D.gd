extends CSGSphere3D

@export var size = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	print(" read function happened")
	update_size()

func update_size():
	scale= Vector3(size, size,size)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func whateveryouwant():
	print("we did it")
	
func move_x_towards(amount):
	position.x += amount
