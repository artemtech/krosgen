extends KinematicBody2D

var degPutar= 0;
export var speedGerak = 100;

func _ready():
	set_fixed_process(true);

func _fixed_process(delta):
	move(Vector2(1,0)*speedGerak*delta);
	degPutar= fmod(degPutar+90 * delta,360);
	print(degPutar);