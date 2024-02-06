extends CSGSphere3D

@export var speed = 0.1
@export var hot_dogs = "Yummy"

# Called when the node enters the scene tree for the first time.
func _ready():
	print(position)
	hide()
	#position.z = -10
	#print(position)


# Called every frame. 
func _process(delta):
	position.z = position.z - speed
	scale.y = scale.y + speed
	
	rotation_degrees.x= rotation_degrees.x - 0.1
	#rotate_x(0.15708)
	#print(x)


func _on_timer_timeout():
	show()
