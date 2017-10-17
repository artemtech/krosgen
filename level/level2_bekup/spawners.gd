extends Position2D

export var timeDelay = 2.0;
var time = 0;

onready var bakteriE = load("res://level/enemy_e.tscn");

func _ready():
	time = timeDelay;
	set_process(true);
	
func _process(delta):
	time -= delta;
	if time <= 0:
		spawn();
		time = timeDelay;
		return;
		
func spawn():
	randomize();
	var rand = rand_range(0,3);
	var spawnObjects;
	if rand >= 0 and rand <= 3:
		spawnObjects = bakteriE.instance();
		
	add_child(spawnObjects);
	