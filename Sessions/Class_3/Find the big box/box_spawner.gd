extends Node3D

@export var boxes_to_spawn = 10
const BOX = preload("res://Find the big box/box.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	for box in boxes_to_spawn:
		var new_box = BOX.instantiate()
		add_child(new_box)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
