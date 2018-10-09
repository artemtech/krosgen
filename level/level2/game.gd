extends Node
var totalKill=0;
const MUST_KILL = 40
onready var sfx = get_node("sfx")
onready var sfx_list = [
preload("res://assets/bgm/Shoot/hit and dead.ogg"),
preload("res://assets/bgm/Shoot/laser shot.ogg"),
]

func _ready():
	if levels_singletons.get_bgm():
		levels_singletons.play_bgm(self)
		get_node("tutorial/musikButton").set_pressed(true)
	else:
		get_node("tutorial/musikButton").set_pressed(false)
	if levels_singletons.get_sfx():
		get_node("tutorial/sfxButton").set_pressed(true)
	else:
		get_node("tutorial/sfxButton").set_pressed(false)
	get_node("tutorial").set_hidden(false)
	if get_node("tutorial").is_visible():
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().set_pause(true)
	set_process(true);
	set_process_input(true);
	

func _input(ie):
	if ie.type==InputEvent.MOUSE_BUTTON:
		if ie.pressed && ie.button_index==BUTTON_LEFT:
			shoot();
func shoot():
	var collided_bodies = get_node("env/cursor").get_overlapping_bodies();
	if !collided_bodies.empty() && totalKill<=MUST_KILL:
		if levels_singletons.get_sfx():
			sfx.set_stream(sfx_list[0])
			sfx.play()
		get_node("env/cursor/AnimatedSprite").set_animation("laser hit")
		get_node("env/cursor/AnimatedSprite").play("laser hit")
		get_node("env/cursor/AnimatedSprite").set_frame(0)
		for i in collided_bodies :
			if i in get_tree().get_nodes_in_group("enemy"):
				print(i.get_name()," killed");
#				yield(get_node("env/cursor/AnimatedSprite"),"finished")
				i.queue_free();
				totalKill+=1;
				get_node("env/Control/lblKill").set_text(str(MUST_KILL-totalKill))
				get_node("env/Control/progress").set_value(totalKill)
				print(totalKill);
	elif collided_bodies.empty():
		if levels_singletons.get_sfx():
			sfx.set_stream(sfx_list[1])
			sfx.play()
		get_node("env/cursor/AnimatedSprite").set_animation("laser miss")
		get_node("env/cursor/AnimatedSprite").play("laser miss")
		get_node("env/cursor/AnimatedSprite").set_frame(0)
		yield(get_node("env/cursor/AnimatedSprite"),"finished")
	

func _process(delta):
	var waktu = int(get_node("env/Control/Timer").get_time_left());
	get_node("env/Control/lblTimer").set_text(String(waktu));
	if totalKill == 40 :
		get_tree().change_scene("res://level/winning/win.tscn")

func _on_Timer_timeout():
	get_tree().change_scene("res://level/Fail2/fail2.tscn")


func _on_pauseButton_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_node("tutorial").set_hidden(false)
	get_tree().set_pause(true)
