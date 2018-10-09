extends "musuh.gd"
onready var timer = get_node("Timer")
var collided = false
func _ready():
	type = ListMusuh.URET
	if utils.get_main_node().survival:
		speed = 90
	else:
		speed = 60
	print("tipe: ",type," serangan: ",attack_rate,"speed: ",speed)
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	var gl_pos = get_global_pos();
	gl_pos.y+= speed*delta;
	#gl_pos.y=start_y+(sin(deg2rad(deg))*50);
	move_to(gl_pos);
	if is_colliding():
		collided = true
		timer.start()
		set_fixed_process(false)
		set_process(true)
	pass

var t = 1
func _process(delta):
	if t >= 1:
		t -= 1
		if collided:
			get_node("sprites").play("uret_attack")
			if get_collider() != null and get_collider().is_in_group("tanaman"):
				get_collider().decrease_water(self)
			else:
				collided = false
		else:
			get_node("sprites").play("uret")
			timer.stop()
			set_process(false)
			set_fixed_process(true)
		pass
	t += delta