extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var sequence := ''
var active_cheats = {}
var codes = {
	run = 'runrunrun',
	jump = 'jumpjumpjump',
	nozats = 'nozatsab'
}

# Called when the node enters the scene tree for the first time.
func _input(event):
	while len(sequence) > 100:
		sequence = sequence.substr(len(sequence) - 100, 100)
	var key_event = event as InputEventKey
	if key_event && key_event.pressed:
		sequence = sequence + OS.get_scancode_string(event.scancode) 
		for code in codes:
			if sequence.ends_with(codes[code].to_upper()):
				active_cheats[code] = !is_active(code)

func is_active(code: String):
	return code in active_cheats && active_cheats[code]

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
