extends RayCast3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if is_colliding():
		print_debug("colliding")
	var mouse_pos = (get_viewport().get_mouse_position())-(get_viewport().get_visible_rect().size)/2
	
	position = Vector3(mouse_pos.x,mouse_pos.y,-20)
	print_debug(position)
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")*.01
	position = position+ Vector3(input_dir.x,input_dir.y,0)


	


