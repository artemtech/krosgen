extends Control
onready var nextScene = "res://level/antara1dan2/antara.tscn"
onready var lostScene = "res://level/Fail1/fail_at_1.tscn"
onready var label = get_node("labelWaktu")
onready var waktu = get_node("Timer")
onready var jmlBakteri = get_node("bakteri_counts")
onready var progressBakteri = get_node("progress_bakteri")
func _ready():
	label.set_text(str(round(waktu.get_time_left())))
	jmlBakteri.set_text("4")
	progressBakteri.set_value(0)
	set_fixed_process(true)
	
func _fixed_process(delta):
	label.set_text(str(round(waktu.get_time_left())))
	if levels_singletons.bakteriCounts < 0:
		get_tree().change_scene(nextScene)

func _on_Timer_timeout():
	get_tree().change_scene(lostScene)

var i = 0

func update_labels():
	i+=1
	jmlBakteri.set_text(str(levels_singletons.bakteriCounts + 1))
	progressBakteri.set_value(i)
	pass