extends Position2D

export var timeDelay = 6
var timer = 0
onready var uret = load("res://level/level3/uret.tscn")
onready var king = load("res://level/level3/king.tscn")

var spawnObjects_v
func _ready():
	timer = timeDelay;
	#counts = levels_singletons.blockCounts;

func update_process(status):
	set_process(status)
	
func _process(delta):
	timer -= delta;
	if timer <= 0:
		spawn();
		#print(counts)
		timer = timeDelay;


func spawn():
	randomize();
	#var randY = rand_range(0,818);
	#var randX=rand_range(0,1274);
	var randX =rand_range(-get_pos().x,get_pos().x)
	randomize();
	var type = randi() % 2
	if type == 0 :
		spawnObjects_v= uret.instance();
	elif type == 1:
		spawnObjects_v= king.instance();
	
	spawnObjects_v.set_pos(Vector2(randX,-100));
	add_child(spawnObjects_v);

