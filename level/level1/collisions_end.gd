extends Area2D

func _ready():
	pass

func _on_spawners_boundaries_area_enter( area ):
	area.get_parent().queue_free()
	levels_singletons.blockCounts+=1