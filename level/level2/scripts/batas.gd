extends Area2D


func _ready():
	connect("body_enter",self,"on_body_enter");

func on_body_enter(body):
	#print(body,"sampai batas");
	body.queue_free();
