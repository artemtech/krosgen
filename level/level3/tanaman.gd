#extends Node2D
extends KinematicBody2D

onready var timer = get_node("Timer")
#onready var tanaman_collision = get_node("tanaman_collision")
onready var tanaman_sprites = get_node("sprites")
onready var water_popup = get_node("water_need")
onready var water_indicator = get_node("water_need_indicator")

# timer awal
export (float, 0.0, 100.0) var start_time = 0
export (float, 0.0, 100.0) var end_time   = 20

# variabel untuk tumbuh dan nyawa
var NYAWA = 150
var water_need = 0
const WATER_TIME = [10,25,40,60]
const CRIT_TIME = 10
const ADDITIONAL_WATER_TIME = [10,20,30]


func _ready():
	utils.get_main_node().update_tanaman_counts(1)
	_update_sprites()
	water_indicator.set_max(end_time)
	water_indicator.set_value(end_time)
	get_node("Label").set_hidden(false)
	get_node("Label").set_text(str(water_indicator.get_value()))
	water_indicator.set_rounded_values(true)
	timer.set_timer_process_mode(Timer.TIMER_PROCESS_FIXED)
	timer.set_wait_time(end_time - start_time)
	timer.set_one_shot(true)
	timer.connect("timeout", self, "gameover")
	timer.start()
	set_process(true)

func gameover():
	utils.get_main_node().update_tanaman_counts(-1)
	print("GAME OVER - TIME RAN OUT")
	set_process(false)
	queue_free()

var t = 1

func _process(delta):
	#survival !
	if water_need >= 9:
		water_indicator.set_max(NYAWA)
		water_indicator.set_value(NYAWA)
		timer.stop()
		set_process(false)
	if(t >= 1):
		t -= 1
#		print(get_name()," ",water_indicator.get_value())
		water_indicator.set_value(timer.get_time_left())
		# benih
		if water_need < 2:
			if water_indicator.get_value() < WATER_TIME[0]:
				water_popup.set_hidden(false)
#				cek_status(get_collider())
		# kecil
		elif water_need >= 2 and water_need < 4:
			if water_indicator.get_value() < WATER_TIME[1]:
				water_popup.set_hidden(false)
		# sedang
		elif water_need >= 4 and water_need < 7:
			if water_indicator.get_value() < WATER_TIME[2]:
				water_popup.set_hidden(false)
		# besar
		elif water_need >=7 and water_need < 9:
			if water_indicator.get_value() < WATER_TIME[3]:
				if water_indicator.get_value() < CRIT_TIME:
					tanaman_sprites.set_frame(4)
				water_popup.set_hidden(false)
				
	get_node("Label").set_text(str(water_indicator.get_value()))
	t += delta


func _on_tanaman_collision_area_enter( area ):
	if area.get_name() == "siraman" and water_popup.is_visible():
		print("Collision siraman!!")
		area.set_on_tanaman(true)
	pass


func _on_tanaman_collision_area_exit( area ):
	pass
#	if area.get_name() == "siraman":
#		area.set_on_tanaman(false)
		
func update_watering():
	var new_time
	water_need += 1
	# benih
	if water_need < 2:
		new_time = timer.get_time_left() + ADDITIONAL_WATER_TIME[0]
	# kecil
	elif water_need >= 2 and water_need < 4:
		new_time = timer.get_time_left() + ADDITIONAL_WATER_TIME[1]
	# sedang
	elif water_need >= 4 and water_need < 7:
		new_time = timer.get_time_left() + ADDITIONAL_WATER_TIME[2]
	# besar
	elif water_need >=7:
		new_time = timer.get_time_left() + ADDITIONAL_WATER_TIME[2]
	if water_need == 4:
		utils.get_main_node().update_sedang()
	if water_need == 9:
		utils.get_main_node().update_besar()
	set_process(false)
	timer.stop()
	_update_sprites()
	timer.set_wait_time(new_time)
	timer.start()
	set_process(true)
	water_popup.set_hidden(true)
	pass

func _update_sprites():
	# benih
	if water_need < 2:
		tanaman_sprites.set_frame(0)
	# kecil
	elif water_need >= 2 and water_need < 4:
		water_indicator.set_max(50)
		tanaman_sprites.set_frame(1)
	# sedang
	elif water_need >= 4 and water_need < 7:
		water_indicator.set_max(75)
		tanaman_sprites.set_frame(2)
	# besar
	elif water_need >=7 and water_need < 9:
		water_indicator.set_max(100)
		tanaman_sprites.set_frame(3)
	else:
		tanaman_sprites.set_animation("tanaman_y")
		tanaman_sprites.set_frame(0)
		tanaman_sprites.play()
	print(water_need)
	pass
	
func decrease_water(type):
	if utils.get_main_node().survival == false :
		if water_need < 9 :
			var new_time
			if timer.get_time_left() < 2 :
				type.collided = false
				return
			new_time = timer.get_time_left() - type.attack_rate
			timer.stop()
			timer.set_wait_time(new_time)
			timer.start()
		else:
			if NYAWA > 0:
				NYAWA -= type.attack_rate
				if NYAWA < 50:
					tanaman_sprites.stop()
					tanaman_sprites.set_animation("tanaman")
					tanaman_sprites.set_frame(4)
			else:
				utils.get_main_node().update_besar(-1)
				gameover()
			water_indicator.set_value(NYAWA)
			get_node("Label").set_text(str(water_indicator.get_value()))
	else:
		if NYAWA > 0:
			NYAWA -= type.attack_rate
			if NYAWA < 50:
				tanaman_sprites.stop()
				tanaman_sprites.set_animation("tanaman")
				tanaman_sprites.set_frame(4)
		else:
			gameover()
		water_indicator.set_value(NYAWA)
		get_node("Label").set_text(str(water_indicator.get_value()))
		
