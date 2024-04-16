extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	load_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		quit()

func load_game():
	var data = FileAccess.open("user://save.json", FileAccess.READ)
	print(data.get_var())
	

func save_game():
	var file = FileAccess.open("user://save.json", FileAccess.WRITE)
	file.store_var($CharacterBody3D.position)

func quit():
	print("bye")
	save_game()
	get_tree().quit()
