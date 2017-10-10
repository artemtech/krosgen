extends KinematicBody2D

# Track if we're dragging a sprite
var dragging = false;
var picked = false;
onready var outerCollision = get_node("outerCollision")
# These are the width and height of the sprite

var degPutar= 0;
var collide = false;
export var speedGerak = 60;

func _ready():
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
#			if has_node("outerCollision"):
#				remove_outer_collision();
#				update();
			
			var motion = event.relative_pos
			var new_pos = get_global_mouse_pos()
			var prev_pos = new_pos - motion
			var center = get_global_pos()
#			if is_colliding():
			self.move_to(new_pos)
				
#			set_z(99);
			get_node("Sprite/AnimationPlayer").seek(0,true);
			get_node("Sprite/AnimationPlayer").stop(true);
			set_process(false);
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

func _process(delta):
	move(Vector2(-1,0)*speedGerak*delta);
#	degPutar= fmod(degPutar+180 * delta,360);

func remove_outer_collision():
	remove_child(outerCollision);

func is_picked():
	return picked;