extends Node3D

var canbepressed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	press()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func press():
	if canbepressed:
		$AnimationPlayer.play("press")


func _on_area_3d_body_entered(body):
	print(body.first_name)
	body.object_to_press = self
	print(body.object_to_press)
	$Label3D.show()
	canbepressed = true


func _on_area_3d_body_exited(body):
	canbepressed = false
	$Label3D.hide()
