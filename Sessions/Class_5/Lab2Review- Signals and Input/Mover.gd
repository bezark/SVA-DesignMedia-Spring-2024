extends MeshInstance3D

signal movingLeft

@onready var animation_player = $"../Bedroom/AnimationPlayer"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("left"):
		position.x -= 0.1
		emit_signal("movingLeft", position)
	if Input.is_action_pressed("right"):
		position.x += 0.1
		animation_player.play("new_animation")


func _on_timer_timeout():
	position.z -= 0.5
