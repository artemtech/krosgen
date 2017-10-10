extends Sprite

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN);
	set_process_input(true);

func _input(event):
	if event.type == InputEvent.MOUSE_MOTION:
		var pos = event.pos;
		set_pos(pos);
