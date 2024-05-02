extends Node3D
@export var upper_limit = Node3D
@export var lower_limit = Node3D
@export var slider = Node3D
var spaget_index= AudioServer.get_bus_index("spaghetto")
var PitchShift= AudioServer.get_bus_effect(spaget_index,0)


var pitch
var slider_lenght

# Called when the node enters the scene tree for the first time.
func _ready():
	#AudioServer.set_bus_layout(load(bus_layout))
	pass # Replace with function body.
	slider_lenght = (upper_limit.position.y -lower_limit.position.y)
	print(slider_lenght)
	print(upper_limit.position, to_local(upper_limit.position))
	slider.position.y = lower_limit.position.y+slider_lenght/2
	pitchChange()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_cam_slider(pos):
	var localpos= to_local(pos)
	slider.position.y = localpos.y
	
	print(localpos.y," shouldnt change")
	pitchChange()
	pass # Replace with function body.
func pitchChange():
	pitch = (((slider.position.y-lower_limit.position.y)/slider_lenght)-.5)
	#effect.set_pitch_scale(1)
	PitchShift.set_pitch_scale(1+pitch)
