extends Node3D

@onready var csg_sphere_3d = $CSGSphere3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	$CSGSphere3D.move_x_towards(4.)
	csg_sphere_3d.size = 0.1
	csg_sphere_3d.update_size()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


		
