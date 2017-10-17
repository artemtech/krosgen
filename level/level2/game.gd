extends Node
var totalKill=0;
func _ready():
	set_process(true);
	set_process_input(true);
	

func _input(ie):
	if ie.type==InputEvent.MOUSE_BUTTON:
		if ie.pressed && ie.button_index==BUTTON_LEFT:
			shoot();
func shoot():
	var collided_bodies = get_node("env/cursor").get_overlapping_bodies();
	if !collided_bodies.empty() && totalKill<=15:
		for i in collided_bodies :
			if i in get_tree().get_nodes_in_group("enemy"):
				print(i.get_name()," killed");
				i.queue_free();
				totalKill+=1;
				print(totalKill);

func _process(delta):
	var waktu = int(get_node("env/Timer").get_time_left());
	get_node("env/lblTimer").set_text(String(waktu));
	if totalKill>3 or waktu <= 0:
		get_tree().change_scene("res://level/level2/end.tscn")

func _on_Timer_timeout():
	print();
