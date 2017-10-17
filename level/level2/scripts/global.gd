extends CanvasLayer

var space_state;
func _ready():
	space_state=get_world_2d().get_direct_space_state();
	