extends Node2D

var collided = false;
#menampung hasil drag dari spawners
onready var blocks;
var masuk = false;
var dragging = false;
#var statusGhost = false;

func _ready():
	set_process_input(true)
	for areas in get_children():
		if areas.get_type() == "Area2D":
				if areas.has_node("Sprite"):
					areas.get_node("Sprite").set_hidden(true)
#	set_fixed_process(true)
#	connect("area_enter", self, "on_body_enter");

func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON and event.pressed == false:
		dragging = false
		print("mouse dilepassss")

func _on_area_enter( area ):
	for komponen in get_children():
		if komponen.get_type() == "Area2D":
			if komponen.overlaps_area( area ):
				if komponen.has_node("Sprite"):
					komponen.get_node("Sprite").set_hidden(false)
					komponen.get_node("Sprite").set_opacity(9)
				print("Entered!, ",area," ",area.get_layer_mask());
				area.get_parent().set_opacity(0.4)
				print("area parent: ",area.get_parent().get_name())
#				area.get_parent().move_to(area.get_global_pos()+(get_global_mouse_pos()-area.get_global_pos()))


func _on_area_exit( area ):
	area.get_parent().onBakteri = false
	area.get_overlapping_areas()[0].get_node("Sprite").set_hidden(true)
	print(area.get_overlapping_areas()[0].get_node("Sprite").get_name())
	print("meninggalkan area...")
	
