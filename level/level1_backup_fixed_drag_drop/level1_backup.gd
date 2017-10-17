extends Node2D

var blok = null;

func _ready():
	blok = get_node("bakteri1").blocks;
	set_fixed_process(true);
	
func _fixed_process(delta):
	blok = get_node("bakteri1").blocks;
	if !blok.empty():
		for elements in blok:
			if elements!=null:
				get_node("spawners").remove_child(elements);
				add_child(elements);
				print(elements.get_children());
				get_node(elements.get_name()).move_to(get_local_mouse_pos());
				blok.pop_front();
