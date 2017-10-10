extends ReferenceFrame

func _ready():
	get_node("tutupButton").connect("pressed",self,"onBack")