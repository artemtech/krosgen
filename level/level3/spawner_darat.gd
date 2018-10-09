extends Position2D


export var timeDelay = 10.0;

var timer = 0;


onready var siput = load("res://level/level3/siput.tscn");
onready var kumbang = load("res://level/level3/kumbang.tscn");

var spawnObjects_h;

func _ready():
	timer = timeDelay;
	#counts = levels_singletons.blockCounts;

func update_process(status):
	if utils.get_main_node().survival:
		timeDelay = 3.0
	if status == false:
		if get_children().size() > 0:
			for i in get_children():
				i.queue_free()
	set_process(status)
	print("Asdfasfe")
	
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
	var randX =rand_range(0,70)
	var randY = rand_range(-100,70)
	randomize();
	var type = randi() % 2
	if type == 0 :
		spawnObjects_h= siput.instance();
	elif type == 1:
		spawnObjects_h= kumbang.instance();
		randX = -1366 - randX
#	print("nilai rand x ",randX)
	spawnObjects_h.set_pos(Vector2(randX,randY));
	add_child(spawnObjects_h);

