extends Node3D

var sceneStarted = false
@onready var player = $Player
@onready var animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_exited(body):
	print(body)
	if body.name == "Player" and not sceneStarted:
		print("starting")
		sceneStarted = true
		animation_player.play("AlleyEnter")
