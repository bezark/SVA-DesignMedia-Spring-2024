extends Area3D

@onready var sun = $"../../Level/Sun"

func _on_body_entered(body):
	sun.light_energy = 50.
