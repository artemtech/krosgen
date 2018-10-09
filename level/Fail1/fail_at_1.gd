extends Node

func _ready():
	if levels_singletons.get_bgm():
		levels_singletons.play_bgm(self)
	pass
