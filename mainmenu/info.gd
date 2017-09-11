extends Control

export(float) var screen_move_speed = 350

onready var konten = get_node("konten")
var xPos = 0

func _ready():
	konten.set_region_rect(Rect2(Vector2(0,0),Vector2(1000,441)))
	get_node("prev").set_disabled(true)
	for node in get_children():
		if node extends BaseButton and node.get_name() != "tutupButton":
			node.connect("pressed", self, "_target", [node.get_name()])

func _target(var nama):
	if  nama == "next" and xPos < 2000:
		xPos += 1000
		get_node("prev").set_disabled(false)
	elif nama == "prev" and xPos > 0:
		xPos -= 1000
		get_node("next").set_disabled(false)
	konten.set_region_rect(Rect2(Vector2(xPos,0),Vector2(1000,441)))
	checkIt()
	
func checkIt():
	if xPos >= 2000:
		get_node("next").set_disabled(true)
		return false
	elif xPos <= 0:
		get_node("prev").set_disabled(true)
		return false
	else:
		return true