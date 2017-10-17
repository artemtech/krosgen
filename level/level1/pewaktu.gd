extends Control
onready var nextScene = "res://level/antara1dan2/antara.tscn"
onready var label = get_node("labelWaktu")
onready var waktu = get_node("Timer")
func _ready():
	set_process(true)
	
func _process(delta):
	if levels_singletons.skor == 10:
		get_tree().change_scene(nextScene)
	label.set_text(String(int(waktu.get_time_left())))

func _on_Timer_timeout():
	get_tree().change_scene(nextScene)
	
