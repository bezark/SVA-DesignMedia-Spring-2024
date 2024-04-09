extends Node3D

const BALL = preload("res://ball.tscn")
@onready var left_controller = $"../XROrigin3D/LeftController"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_left_controller_button_released(name):
	$Label3D.text = name
	if name == "trigger_click":
		var new_ball = BALL.instantiate()
		new_ball.position = left_controller.position
		add_child(new_ball)
