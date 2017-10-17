extends KinematicBody2D

var a = Vector2();
export var speedGerak = 60;
onready var dragging = false
var onBakteri = false
var picked = false
var bakteri = null
var bakteriBox = null
onready var blockBox = get_node("innerCollision/CollisionShape2D")

func _ready():
	bakteri = get_parent().get_parent().get_node("bakteri1")
	a = get_global_pos();
	if self.get_name() == "trapesium":
		get_node("innerCollision").set_layer_mask(2);
#		bakteriBox = bakteri.find_node("trapesium")
	elif self.get_name() == "segi3":
		get_node("innerCollision").set_layer_mask(3);
#		bakteriBox = bakteri.find_node("segi3")
	elif self.get_name() == "segi6":
#		bakteriBox = bakteri.find_node("segi6")
		get_node("innerCollision").set_layer_mask(4);
	elif self.get_name() == "ketupat":
#		bakteriBox = bakteri.find_node("ketupat")
		get_node("innerCollision").set_layer_mask(5);
	set_process_input(true)
	set_process(true);

func _on_innerCollision_input_event(viewport, event, shape):
	if event.type == InputEvent.MOUSE_BUTTON:
		# Start dragging when the user presses the mouse button over the clickable area
		call_deferred("_setDragging", event.pressed)
#		dragging = event.pressed

func _setDragging(status):
	self.dragging = status

func _on_innerCollision_area_enter( area ):
	if get_node("innerCollision").overlaps_area(area):
		if area.get_child(0).get_name() == self.get_child(0).get_name():
			print("blok nabrak: ",area.get_child(0).get_name())
			onBakteri = true

func _input(event):
	if dragging:
		if event.type == InputEvent.MOUSE_MOTION:
			var motion = event.relative_pos
			var new_pos = get_global_mouse_pos()
			var prev_pos = new_pos - motion
			var center = get_global_pos()
			# Calculate the angular motion of the crank based on the arc made with the mouse
#			var angle = (prev_pos - center).angle_to(new_pos - center)
#			rotate(angle)
#			self.set_pos(new_pos) jangan dipakai, sebagai ganti, pakai move_to
			self.move_to(new_pos)
			set_process(false);
			picked = true
			get_child(0).get_node("AnimationPlayer").seek(0,true);
			get_child(0).get_node("AnimationPlayer").stop(true);
		
		elif event.type == InputEvent.MOUSE_BUTTON and event.pressed == false:
			# Stop dragging when the user releases the mouse button
			get_child(0).get_node("AnimationPlayer").seek(0,true);
			get_child(0).get_node("AnimationPlayer").stop(true);
			call_deferred("_setDragging",false)
			if onBakteri:
#				print("sudah masuk bakteri...")
				levels_singletons.blockCounts+=1; # tambah 1 ketika sudah masuk..
				queue_free();
			else:
				self.set_opacity(1)
				self.move_to(a)
				set_process(true);

func _on_outerCollision_input_event( viewport, event, shape_idx ):
	if event.type == InputEvent.MOUSE_BUTTON:
		if event.pressed:
			print("outerCollision sudah dihapus...")
			get_node("outerCollision").set_collision_mask_bit(0,false)
			get_node("outerCollision").set_layer_mask_bit(0,false)
			get_node("outerCollision").set_pickable(false)
			

func _process(delta):
	a = get_global_pos();
	move(Vector2(-1,0)*speedGerak*delta);

func isPicked():
	return picked;
