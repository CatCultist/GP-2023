extends Node3D
var spaget_index= AudioServer.get_bus_index("spaghetto")
var rotato = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _on_cam_press(note):
	if note == name:
		print(name+"works")
		print(rotation.z)
		if rotato != 22:
			rotato=rotato+1
			rotate_z(PI/15)
		AudioServer.set_bus_volume_db(spaget_index, (-60+rotato*3))
		
func _on_cam_dial(note):
	if note == name:
		print(name+"works")
		print(rotation.z)
		if rotato != 0:
			rotato=rotato-1
			rotate_z(-PI/15)
		AudioServer.set_bus_volume_db(spaget_index, (-60+rotato*3))
	pass # Replace with function body.
