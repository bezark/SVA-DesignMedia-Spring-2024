extends RigidBody3D


func _on_button_button_down():
	apply_central_impulse(Vector3(0., 5, 0.))
