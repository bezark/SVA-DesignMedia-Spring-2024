extends Area3D

var sceneStarted = false

@onready var animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



@onready var audio_stream_player_3d = $"../AudioStreamPlayer3D"

func _on_body_entered(body):
	print(body)
	if body.name == "Player" and not sceneStarted:
		print("starting")
		sceneStarted = true
		animation_player.play("AlleyEnter")
		audio_stream_player_3d.pitch_scale= 10.
		$"../AudioStreamPlayer3D/Timer".start()

func _on_timer_timeout():
	audio_stream_player_3d.stop()
