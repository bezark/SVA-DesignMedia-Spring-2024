extends CSGBox3D

@onready var score = $"../../Player/Score"

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = randf_range(-20., 20)
	position.z = randf_range(-20., 20)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	hide()
	print("you found me")
	score.text = str(int(score.text)+1)
