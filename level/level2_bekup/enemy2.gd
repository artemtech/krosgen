extends KinematicBody2D

var degPutar= 0;
export var speedGerak = 100;

func _ready():
	set_fixed_process(true);

func _fixed_process(delta):
	move(Vector2(0,-1)*speedGerak*delta);
	degPutar= fmod(degPutar+180 * delta,360);
	#print(degPutar);