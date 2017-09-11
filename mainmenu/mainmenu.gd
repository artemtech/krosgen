extends Control

export(float) var screen_move_speed = 1500

var current_screen = "start"
var old_size = Vector2()

onready var pengaturan = get_node("settings")
onready var informasi = get_node("info")
onready var tween = get_node("tween")

func _ready():
	informasi.set_hidden(true)
	pengaturan.set_hidden(true)
	for components in get_node("main/buttons").get_children():
		if components extends BaseButton:
			if components.get_name() == "exitButton" :
				components.connect("pressed", self, "_exitAction")
			else:
				#print(components.get_name())
				components.connect("pressed", self, "_targets", [components.get_name()])
	
	for node in get_children():
		if node.has_node("tutupButton"):
			node.get_node("tutupButton").connect("pressed", self, "_targets", ["start"])

func _targets(var screen = "start"):
	current_screen = screen
	
	var target_coordinates = Vector2(0, 0) # By default, use the 0, 0 coordinates
	if has_node(screen):
		target_coordinates = get_node(screen).get_pos() # If possible, use the coordinates of the target
		get_node(screen).set_hidden(false)
	
	var current_coordinates = get_pos()
	var distance = current_coordinates.distance_to(target_coordinates)
	var time = distance/screen_move_speed
	
	if time > 0:
		tween.interpolate_property(self, "rect/pos", current_coordinates, -target_coordinates, time, Tween.TRANS_EXPO, Tween.EASE_OUT, 0)
		tween.start()
	

func _exitAction():
	get_tree().quit()