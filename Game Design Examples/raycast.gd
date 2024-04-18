extends RayCast3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if is_colliding():
		print_debug("colliding")


