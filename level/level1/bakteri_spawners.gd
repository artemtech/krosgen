extends Position2D

onready var bakteri1 = load("res://level/level1/bakteri1.tscn");
onready var bakteri2 = load("res://level/level1/bakteri2.tscn");
onready var bakteri3 = load("res://level/level1/bakteri3.tscn");
onready var bakteri4 = load("res://level/level1/bakteri4.tscn");
var counts = 4;

func _ready():
	levels_singletons.bakteriCounts = counts;
	print("bakteri yang harus diselesaikan: ",levels_singletons.bakteriCounts);
	spawn();
	levels_singletons.bakteriCounts -= 1;
	print("bakteri yang harus diselesaikan: ",levels_singletons.bakteriCounts);
	set_fixed_process(true);

func _fixed_process(delta):
#	_update_jumlah_bakteri();
	if levels_singletons.bolehGanti:
#		print("bakteri yang harus diselesaikan: ",counts);
		levels_singletons.bolehGanti = false;
		get_child(0).queue_free()
		spawn();
		levels_singletons.bakteriCounts -= 1;
		utils.get_main_node().get_node("Control").update_labels()
		print("bakteri yang harus diselesaikan: ",levels_singletons.bakteriCounts);
#		print("bakteri yang harus diselesaikan: ",counts);
#		time = timeDelay;
		return;

#func _update_jumlah_bakteri():
#	counts = levels_singletons.bakteriCounts

func spawn():
	if levels_singletons.bakteriCounts > 0:
		randomize();
		var rand = rand_range(0,4);
		var spawnObjects;
		if rand >= 0 and rand <= 1:
			spawnObjects = bakteri1.instance();
			print("bakteri1!!")
		elif rand >= 1 and rand <= 2:
			spawnObjects = bakteri2.instance();
			print("bakteri2!!")
		elif rand >= 2 and rand <= 3:
			spawnObjects = bakteri3.instance();
			print("bakteri3!!")
		else:
			spawnObjects = bakteri4.instance();
			print("bakteri4!!")
	
		add_child(spawnObjects);