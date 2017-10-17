extends KinematicBody2D

export var enemy_type=1;
var start_y=0.0;
var speed = 200.0;
var deg = 0.0;


func _ready():
	add_to_group("enemy");
	start_y = get_global_pos().y;
	set_process(true);
	set_fixed_process(true);
	
	
func _process(delta):
	deg = fmod(deg+180*delta, 360.0);



	
func _fixed_process(delta):
	
	var gl_pos = get_global_pos();
	gl_pos.x-= speed*delta;
	#gl_pos.y=start_y+(sin(deg2rad(deg))*50);
	move_to(gl_pos);

