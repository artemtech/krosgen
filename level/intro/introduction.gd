extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	if(levels_singletons.get_bgm()):
		levels_singletons.play_bgm(self)
	pass


func _on_button_akhir_pressed():
	get_tree().change_scene("res://level/level1/levels.tscn")


