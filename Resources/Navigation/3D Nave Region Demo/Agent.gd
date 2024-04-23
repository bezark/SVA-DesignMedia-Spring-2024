extends CharacterBody3D

@onready var navigation_agent= $NavigationAgent3D
@onready var marker_3d = $"../Marker3D"
@export var movement_speed = 2.

var arrived = false

# Called when the node enters the scene tree for the first time.
func _ready():
	navigation_agent.target_position = marker_3d.position
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var current_agent_position: Vector3 = global_position
	if not arrived:
		var next_path_position: Vector3 = navigation_agent.get_next_path_position()
		look_at(next_path_position)
		var new_velocity: Vector3 = next_path_position - current_agent_position
		new_velocity = new_velocity.normalized()*movement_speed
		velocity = new_velocity
		move_and_slide()


func _on_navigation_agent_3d_target_reached():
	arrived = true
