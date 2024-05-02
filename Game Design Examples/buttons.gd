extends MeshInstance3D
var notes = GPUParticles3D
@export var sound = AudioStream
var reset = self.position
signal timeout
var pop =0
# Called when the node enters the scene tree for the first time.
func _ready():
	notes = get_node("../Saxaphone/GPUParticles3D")
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if pop > 0:
		pop=pop-1
	elif self.position != reset:
		self.position=reset
		print("reseti")
	pass
func _on_cam_press(note):
	if note == name:
		print(name+"works")
		print(reset)
		var player = AudioStreamPlayer.new()
		player.bus = "spaghetto"
		player
		add_child(player)
		player.stream = sound
		player.play()
		if player.playing==true:
			notes.set_emitting(true)
		
		if self.position == reset:
			self.position.z = self.position.z-.15
			pop =40




			

	
	
