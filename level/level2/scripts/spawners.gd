extends Position2D


export var timeDelay = 3.0;

var timer = 0;


onready var enemy_h = load("res://scene/enemy_h.tscn");
onready var enemy_v = load("res://scene/enemy_v.tscn");

var spawnObjects_h;
var spawnObjects_v;

func _ready():
	timer = timeDelay;
	#counts = levels_singletons.blockCounts;
	set_process(true);
	
func _process(delta):
	timer -= delta;
	if timer <= 0:
		spawn();
		#print(counts)
		timer = timeDelay;
		return;

	
	

func spawn():
	randomize();
	#var randY = rand_range(0,818);
	#var randX=rand_range(0,1274);
	var randY = rand_range(0,600);
	var randX=rand_range(0,900);
	
	spawnObjects_h= enemy_h.instance();
	spawnObjects_v=enemy_v.instance();
	spawnObjects_h.set_pos(Vector2(900,randY));
	spawnObjects_v.set_pos(Vector2(randX,600));
	
	add_child(spawnObjects_h);
	add_child(spawnObjects_v);
	

