extends Sprite

var texture = [preload("res://assets/levels/intro/sc23.png"),
preload("res://assets/levels/intro/sc24.png"),
preload("res://assets/levels/intro/sc25.png"),
]

var g=0;
var g1=0;
func cari():
	g = get_node("../text_field").get_child(0).getPage()

func klarifikasi(g):
	if g>=5:
		get_parent().get_node("Button").set_hidden(false);
		g1=2
	elif g<6 && g >2:
		g1=1
	else:
		g1=0
	set_texture(texture[g1])

func _process(delta):
	cari()
	klarifikasi(g)
	print (g)

func _ready():
	set_process(true)
