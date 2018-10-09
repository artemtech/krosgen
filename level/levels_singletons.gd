extends Node
onready var blockCounts = 5;
onready var bakteriCounts = 4;
onready var bolehGanti = false;
onready var skor = 0;
var game_paused = false
var tanamanmati = true
onready var list_bgm = [
preload("res://assets/bgm/mainmenu_win_cerita_up10.ogg"), # main - percakapan 0
preload("res://assets/bgm/Puzzle/puzzle.ogg"),  # nganu puzle 1
preload("res://assets/bgm/Shoot/shooting_up10.ogg"), # nganu tembak-tembakan 2
preload("res://assets/bgm/garden action/garden_up10.ogg"), # nganu kebun 3
preload("res://assets/bgm/losing/Small Loss_up10.ogg"), # pas kalah 4
]
var pengaturan = {
musics = true,
sfx = true
}

func _ready():
	var current_options = SettingsManager.read_settings()
	pengaturan['musics'] = current_options['musics']
	pengaturan['sfx'] = current_options['soundeffect']
	
func get_bgm():
	return pengaturan['musics']
	
func get_sfx():
	return pengaturan['sfx']
	
func set_bgm(status):
	pengaturan['musics'] = status
	
func set_sfx(status):
	pengaturan['sfx'] = status
	
func play_bgm(scenes):
	if scenes.has_node("bgm"):
		scenes.call_deferred("remove_child","bgm")
	var stream_player = StreamPlayer.new()
	stream_player.set_name("bgm")
	stream_player.set_loop(true)
	# dialog2 
	if (scenes.get_name() == "intro") or (scenes.get_name().begins_with("antara")) or (scenes.get_name() == "tamat"):
		stream_player.set_stream(list_bgm[0])
		scenes.add_child(stream_player)
		scenes.get_node("bgm").play()
	elif (scenes.get_name() == "level1"): # puzzle
		stream_player.set_stream(list_bgm[1])
		scenes.add_child(stream_player)
		scenes.get_node("bgm").play()
	elif (scenes.get_name() == "level2") : # tembak-tembakan
		stream_player.set_stream(list_bgm[2])
		scenes.add_child(stream_player)
		scenes.get_node("bgm").play()
	elif (scenes.get_name() == "level3") :
		stream_player.set_stream(list_bgm[3]) # kebun
		scenes.add_child(stream_player)
		scenes.get_node("bgm").play()
	elif (scenes.get_name().begins_with("fail")) : # kalah
		stream_player.set_stream(list_bgm[4])
		scenes.add_child(stream_player)
		scenes.get_node("bgm").play()
		pass
	pass
	
func do_save(scenes):
	var current_options = SettingsManager.read_settings()
	current_options['musics'] = pengaturan['musics']
	current_options['soundeffect'] = pengaturan['sfx']
	SettingsManager.save_settings(current_options)
	if pengaturan['musics']:
		play_bgm(scenes)
	else:
		scenes.remove_child(scenes.get_node("bgm"))