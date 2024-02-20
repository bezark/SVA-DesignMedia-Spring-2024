extends CSGSphere3D
var timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	print(position)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += 1
	prints(timer, delta)
	

func _input(event):
	if event is InputEventMouseMotion:
		position.x += event.relative.x*0.01
		position.y -= event.relative.y*0.01
		if position.x >= 5:
			position.x = 5
		elif position.x <= -5:
			position.x = -5.
