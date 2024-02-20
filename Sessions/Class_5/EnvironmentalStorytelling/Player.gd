extends CharacterBody3D

var mouse_captured = false

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var look_dir: Vector2
@onready var camera = $Camera3D
@export var camera_sensitivity = 50

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	if Input.is_action_just_pressed("pause"):
		mouse_captured = !mouse_captured
		
		if mouse_captured:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	rotate_camera(delta)
	
	move_and_slide()

func _input(event):
	if event is InputEventMouseMotion:
		look_dir = event.relative*0.01

func rotate_camera(delta: float, sensitivity_modifier: float = 1.0):
	rotation.y -= look_dir.x * camera_sensitivity* delta
	camera.rotation.x = clamp(camera.rotation.x - look_dir.y *camera_sensitivity*sensitivity_modifier*delta, -1.5, 1.5)
	look_dir = Vector2.ZERO
