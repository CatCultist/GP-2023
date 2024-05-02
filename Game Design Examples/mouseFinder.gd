extends Camera3D

var ray_lenght =2000
signal press
signal dial
signal slider 
var right_click=false
var release = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
func _input(event):
	if event.is_action_pressed("left_mouse"):
		getcamcollision()
	if event.is_action_released("left_mouse"):
	
		print("hi")
	if event.is_action_pressed("Rotate"):
		right_click= true
		getcamcollision()
		pass
	
func getcamcollision():
	var centre = get_viewport().get_size()/2
	centre = get_viewport().get_mouse_position()
	var ray_origin = project_ray_origin(centre)
	var ray_end = ray_origin +project_local_ray_normal(centre)*ray_lenght
	
	var new_intersection= PhysicsRayQueryParameters3D.create(ray_origin, ray_end)
	var intersect = get_world_3d().direct_space_state.intersect_ray(new_intersection)
	
	if not intersect.is_empty():
		print(intersect.position)
		var pos = intersect.position
		var note = intersect.collider.name
		if right_click == false:
			print(note)
			if note == "slider_body":
				slider.emit(pos)
				
			
			press.emit(note)
		else:
			dial.emit(note)
			right_click = false
		
		
		
	else:
		print("nothing")
		right_click = false
