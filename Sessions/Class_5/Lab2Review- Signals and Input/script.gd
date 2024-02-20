extends Node3D



func _on_timer_timeout():
	print("timer is done!")


func _on_mesh_instance_3d_moving_left(my_position):
	print("We're moving to the left!")
	print(my_position)
