extends MeshInstance3D

@export var moving = false
@export var speed = 0.1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if moving:
		position.z -= speed
	
	if Input.is_action_just_pressed("ui_left"):
		position.x -= speed
	
	#if Input.is_action_pressed("ui_left"):
		#position.x -= abs(speed)
#
	#if Input.is_action_pressed("ui_right"):
		#position.x += abs(speed)
	if Input.is_action_just_pressed("ui_left") and not moving:
		position.y += 5
