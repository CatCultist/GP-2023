extends MeshInstance3D
var rotating = false
var prev_mouse:Vector2
var next_mouse: Vector2
var rotato = .4

# Called when the node enters the scene tree for the first time.
func _ready():
	prev_mouse = (Vector2.ZERO)
	next_mouse = (Vector2.ZERO)
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	next_mouse = get_viewport().get_mouse_position()
	if (Input.is_action_just_pressed("Rotate")):
		rotating= true
	if(Input.is_action_just_released("Rotate")):
		rotating= false
	if(rotating):
		print_debug(next_mouse.x-prev_mouse.x)
		
		rotate_y(((next_mouse.x-prev_mouse.x)*pow(abs((next_mouse.x-prev_mouse.x)),rotato))*.1* delta)
		rotate_x(((next_mouse.y-prev_mouse.y)*pow(abs((next_mouse.y-prev_mouse.y)),rotato))*.1* delta)
		

	prev_mouse=next_mouse
		
		
	pass
