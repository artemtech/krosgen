extends Node
var survival = false
var gameover = false
var tanaman_count = 0
var tanaman_besar = 0
var tanaman_sedang = 0
const GAMEOVER = 3
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
	get_tree().set_pause(true)
	set_process(true)
	pass
	
func _process(delta):
	if tanaman_count < GAMEOVER:
		gameover = true
		tampilkanPesan()
	
	if tanaman_sedang == check_tanaman_count():
		get_node("musuh darat").update_process(true)
		tanaman_sedang += 1
	if tanaman_besar == check_tanaman_count():
#	if survival :
		get_node("musuh darat").update_process(false)
		get_node("pesan").set_hidden(false)
		get_node("HUD/time_label").set_hidden(false)
		get_node("HUD/survival_progress").set_hidden(false)
		set_process(false)
		
		get_tree().set_pause(true)
		get_node("musuh darat").update_process(true)
		get_node("musuh udara").update_process(true)
		set_fixed_process(true)
		survival = true
	if survival:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		pass
	pass

func check_tanaman_count():
	var a = 0
	for nodes in get_node("game").get_children():
		if nodes.get_name().begins_with("tanaman"):
			a+=1
	return a

var t = 1
func _fixed_process(delta):
	if tanaman_count <= GAMEOVER:
		if survival:
			levels_singletons.tanamanmati = false
		game_over() 
	if t >= 1:
		t-=1
		update_time()
	t += delta

func update_sedang():
	tanaman_sedang+=1
#	print("tanaman sedang ada : ",tanaman_sedang)
	
func update_besar(var a=1):
	tanaman_besar+=a
#	print("tanaman besar ada : ",tanaman_besar)

func update_tanaman_counts(number):
	tanaman_count+=number
	get_node("HUD/tanaman_counts").set_text(str(tanaman_count))

func update_time():
		get_node("HUD/time_label").set_text(str(round(get_node("Timer").get_time_left())))
		get_node("HUD/survival_progress").set_value(get_node("Timer").get_time_left())

func game_over():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	queue_free()
	get_tree().change_scene("res://level/Fail3/fail3.tscn")

func tampilkanPesan():
	get_node("pesan/Label").set_text("SURVIVAL TIME!")
	get_node("pesan/RichTextLabel").set_text("Jaga tanaman tebumu dalam waktu 100 detik! Jangan biarkan mereka memakannya!")
	get_node("pesan/Sprite2").set_hidden(false)
	get_node("pesan/Sprite3").set_hidden(false)
	get_node("pesan/Sprite4").set_hidden(false)
	if gameover:
		get_node("pesan").set_hidden(false)
		get_node("pesan/Label").set_text("YOU LOSE!")
		get_node("pesan/RichTextLabel").set_text("Terlalu banyak tanamanmu yang mati...\nLain kali jaga tanamanmu minimal 3 yang hidup!")
		get_node("pesan/Sprite2").set_hidden(true)
		get_node("pesan/Sprite3").set_hidden(true)
		get_node("pesan/Sprite4").set_hidden(true)
		get_tree().set_pause(true)

func _on_Timer_timeout():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	queue_free()
	get_tree().change_scene("res://level/Finished/finished.tscn")
	pass # replace with function body
