extends Label3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_area_3d_area_entered(area):
	text= "PINCH"
	$Timer.start()



func _on_timer_timeout():
	text = ""
