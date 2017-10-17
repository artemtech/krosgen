extends Area2D
var shooting=false
var target = Vector2();

func _ready():
	set_process_input(true);
	set_fixed_process(true);
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _input(ie):
	if ie.type == InputEvent.MOUSE_MOTION:
		var pos = ie.pos;
		set_pos(pos);
	elif ie.type==InputEvent.MOUSE_BUTTON:
		if ie.pressed && ie.button_index==BUTTON_LEFT:
			target=ie.global_pos;
			shooting=true
		
		
func _fixed_process(delta):
	if shooting:
		var space_state = global.space_state;
		#var target = get_viewport().get_mouse_pos();
		#var result = space_state.intersect_ray(target,target-Vector2(1,1));
		
		#if not result.empty():
			#print("target di",result.position);
		print("target = ",target);
		print(space_state);
	
		shooting=false
		
		
	
