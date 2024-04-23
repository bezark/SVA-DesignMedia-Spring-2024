extends Node3D

const SPHERE = preload("res://sphere.tscn")
@export var number_of_spheres = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	for sphere in number_of_spheres:
		var new_sphere = SPHERE.instantiate()
		add_child(new_sphere)
		
		var new_material = StandardMaterial3D.new()
		new_material.albedo_color = Color(randf(), randf(),randf())
		new_sphere.set_surface_override_material(0, new_material)
		
		
		
		new_sphere.position.x = randf_range(-10.,10.)
		new_sphere.position.y = randf_range(-10.,10.)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
