extends Area2D

var collided = false;
#menampung hasil drag dari spawners
onready var blocks = []

func _ready():
	set_fixed_process(true);
	connect("body_enter", self, "on_body_enter");

func on_body_enter(body):
	blocks.append(body);
	print("Entered!");