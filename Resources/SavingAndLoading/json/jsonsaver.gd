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
	if data:
		var json = JSON.new()
		json.parse(data.get_as_text())
		var json_data = json.data
		print(json_data)
		$CharacterBody3D.position = Vector3(json_data.position.x,json_data.position.y,json_data.position.z)
	

func save_game():
	var file = FileAccess.open("user://save.json", FileAccess.WRITE)
	var position_data = {
		"x": $CharacterBody3D.position.x,
		"y": $CharacterBody3D.position.y,
		"z": $CharacterBody3D.position.z
	}
	var data = {"position": position_data}
	var json_data = JSON.stringify(data)
	file.store_string(json_data)

func quit():
	
	save_game()
	get_tree().quit()
