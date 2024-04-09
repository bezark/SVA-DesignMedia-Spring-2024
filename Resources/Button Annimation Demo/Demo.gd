extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_button_down():
	print("Button was pressed")
	#var annimationPlayer = get_node("AnimationPlayer")
	#annimationPlayer.play("move")
	$AnimationPlayer.play("move")
