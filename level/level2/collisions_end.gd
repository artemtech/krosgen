extends Area2D

func _ready():
	connect("body_enter",self,"on_end_collision");
	
func on_end_collision(body):
	body.queue_free();