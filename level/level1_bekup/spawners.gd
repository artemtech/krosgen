extends Position2D

export var timeDelay = 2.0;
var isPicked = false;
var pickedObjects;
var time = 0;
var counts;

onready var segi6 = load("res://level/level1/segi6.tscn");
onready var segi3 = load("res://level/level1/segi3.tscn");
onready var trapesium = load("res://level/level1/trapesium.tscn");
onready var ketupat = load("res://level/level1/ketupat.tscn");

func _ready():
	time = timeDelay;
	counts = levels_singletons.blockCounts;
	set_fixed_process(true);
	
func _fixed_process(delta):
	time -= delta;
	if time <= 0 and counts > 0:
		spawn();
		print(counts)
		time = timeDelay;
		return;
	if not isPicked and counts > -1:
		checkPicked(get_children());
		
	isPicked = not isPicked;
#	if pickedObjects != null:
#		pickedObjects = null

func spawn():
	randomize();
	var rand = rand_range(0,4);
	var spawnObjects;
	if rand >= 0 and rand <= 1:
		spawnObjects = segi6.instance();
	elif rand >= 1 and rand <= 2:
		spawnObjects = segi3.instance();
	elif rand >= 2 and rand <= 3:
		spawnObjects = trapesium.instance();
	else:
		spawnObjects = ketupat.instance();
	
	counts -= 1;
	add_child(spawnObjects);
	
# lakukan pengecekan untuk setiap objek yang belum di drag/drop
func checkPicked(objects):
	for eachChild in objects:
		if eachChild.get_type() == "KinematicBody2D":
			if eachChild.is_picked(): #method is_picked diambil dari script blocks.gd
				isPicked = true;
				pickedObjects = eachChild;

	
	
# ambil objek untuk dispawn ke puzzle stage bakteri
func getPickedObject():
	return pickedObjects;
