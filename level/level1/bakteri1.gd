extends Area2D

var collided = false;
#menampung hasil drag dari spawners
var blocks = []

func _ready():
#	set_fixed_process(true);
	connect("body_enter", self, "on_body_enter");

func on_body_enter(body):
	print("Entered!");

func _fixed_process(delta):
	if get_parent().get_node("spawners").getPickedObject() != null:
		if collided:
			_spawn_overlapping_objects();
			blocks.append(get_parent().get_node("spawners").getPickedObject())
		#collided = get_parent().get_node("spawners").getPickedObject().is_colliding()
#		print(blocks)

func _spawn_overlapping_objects():
	#print(get_overlapping_bodies())
	print("body overlapped!!!");