extends Node

var samples:Array
var pads:Dictionary

@export var path_str = "res://sounds" 
@export var pad_scene:PackedScene
@export var num_pads = 8

func make_pads():
	var w
	var g
	for i in range(num_pads):
		var pad = pad_scene.instantiate()
		w = pad.transform.get_scale().x
		g = w * 0.1
		
		var p = Vector2((i * (w + g)), 0)
		pad.position = p
		add_child(pad)
		
func load_samples():
	var dir = DirAccess.open(path_str)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			elif file_name.ends_with(".wav"):				
				var stream
				var file = FileAccess.open(path_str + "/" + file_name, FileAccess.READ)
				var buffer = file.get_buffer(file.get_length())
				stream = AudioStreamWAV.new()
				stream.format = AudioStreamWAV.FORMAT_16_BITS		
				stream.data = buffer
				stream.stereo = true
				file.close() 
				samples.push_back(stream)
			file_name = dir.get_next()

func _ready():	
	make_pads()
	load_samples()
