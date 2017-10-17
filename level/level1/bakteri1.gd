extends Node2D

var collided = false;
export var skorSeharusnya = 10;
var skorBakteriSekarang = 0;
#menampung hasil drag dari spawners
onready var blocks;
var masuk = false;
var dragging = true;
var blokSaatIni = null;

func _ready():
	set_process_input(true)
	for areas in get_children():
		if areas.get_type() == "Area2D":
				if areas.has_node("Sprite"):
					areas.get_node("Sprite").set_hidden(true)
	set_fixed_process(true)

func _fixed_process(delta):
	if dragging == false:
		if blokSaatIni != null:
			print("oh yeah...",blokSaatIni.is_monitoring_enabled()," ",blokSaatIni.is_monitorable())
			blokSaatIni.set_enable_monitoring(false);
			blokSaatIni.set_monitorable(false);
			blokSaatIni = null;

func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON and event.pressed == false:
		if blokSaatIni == null:
			print("dragging di set TRUE")
			dragging = true
		else:
			print("dragging di set FALSE")
			dragging = false

func _on_area_enter( area ):
	for komponen in get_children():
		if komponen.get_type() == "Area2D":
			if komponen.overlaps_area( area ):
				blokSaatIni = komponen;
				print("komponen bakteri yang nabrak: ",blokSaatIni)
				if komponen.has_node("Sprite"):
					komponen.get_node("Sprite").set_hidden(false)
					komponen.get_node("Sprite").set_opacity(9)
				print("Entered!, ",area," ",area.get_layer_mask());
				area.get_parent().set_opacity(0.4)
#				print("area parent: ",area.get_parent().get_name())
				area.get_parent().move_to(area.get_global_pos()+(get_global_mouse_pos()-area.get_global_pos()))
#			blokSaatIni = null;


func _on_area_exit( area ):
	if not dragging:
		print("out tapi kliknya dilepas")
		area.get_overlapping_areas()[0].get_node("Sprite").set_hidden(false)
		skorBakteriSekarang+=1;
		levels_singletons.skor = skorBakteriSekarang;
		print("skor saat ini: ",levels_singletons.skor)
		dragging = true;
	else:
		dragging = true;
		blokSaatIni = null;
		print("out tapi kliknya DITAHANN")
		area.get_parent().onBakteri = false
		area.get_overlapping_areas()[0].get_node("Sprite").set_hidden(true)
#	print(area.get_overlapping_areas()[0].get_node("Sprite").get_name())
	print("meninggalkan area...")
	return