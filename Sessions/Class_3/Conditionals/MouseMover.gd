extends MeshInstance3D

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		
		position.x += event.relative.x*0.01
		position.y -= event.relative.y*0.01
		
		
