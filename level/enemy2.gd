extends KinematicBody2D

var degPutar= 0;

func _ready():
	set_fixed_process(true);

func _fixed_process(delta):
	degPutar+= 90 * delta;
	print(degPutar);