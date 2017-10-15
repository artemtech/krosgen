extends KinematicBody2D

# Track if we're dragging a sprite
var dragging = false;
var picked = false;
onready var outerCollision = get_node("outerCollision")
var currentParent;
onready var rootParent = get_tree().get_root().get_node("game").get_child(0);
# These are the width and height of the sprite

var degPutar= 0;
var collide = false;
export var speedGerak = 60;

func _ready():
	currentParent = get_parent();
	connect("input_event", self, "_on_area_input_event")
	set_process_input(true);
	set_process(true);

func _on_area_input_event(viewport, event, shape):
	if event.type == InputEvent.MOUSE_BUTTON:
		# Start dragging when the user presses the mouse button over the clickable area
		dragging = event.pressed



func _input(event):
	if dragging:
		if event.type == InputEvent.MOUSE_MOTION:
			var motion = event.relative_pos
			var new_pos = get_global_mouse_pos()
			var prev_pos = new_pos - motion
			var center = get_global_pos()
			self.move_to(new_pos)
				
			get_node("Sprite/AnimationPlayer").seek(0,true);
			get_node("Sprite/AnimationPlayer").stop(true);
			set_process(false);
			remove_outer_collision();
			update();
			reparent();
			# Calculate the angular motion of the crank based on the arc made with the mouse
#			var angle = (prev_pos - center).angle_to(new_pos - center)
#			rotate(angle)
#			self.set_pos(new_pos)
		
		elif event.type == InputEvent.MOUSE_BUTTON and event.pressed == false:
			# Stop dragging when the user releases the mouse button
#			set_z(99);
			get_node("Sprite/AnimationPlayer").seek(0,true);
			get_node("Sprite/AnimationPlayer").stop(true);
			set_process(false);
			dragging = false;
			picked = true;
#			set_z(0);

func reparent():
	if(currentParent.get_name() == "spawners"):
		currentParent.remove_child(self);
		print('apa ini self: ',self.get_name());
#		print("parent: ",rootParent.get_name())
		rootParent.add_child(self);

func _process(delta):
	move(Vector2(-1,0)*speedGerak*delta);
#	degPutar= fmod(degPutar+180 * delta,360);

func remove_outer_collision():
	if self.has_node("outerCollision"):
		outerCollision.queue_free()

func is_picked():
	return picked;
