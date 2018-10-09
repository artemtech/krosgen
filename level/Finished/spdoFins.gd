extends Sprite

var texture = [preload("res://assets/levels/intro/sc30.png"),
preload("res://assets/levels/intro/sc31.png"),
preload("res://assets/levels/intro/sc32.png"),
preload("res://assets/levels/intro/sc33.png"),
preload("res://assets/levels/intro/sc34.png"),
preload("res://assets/levels/intro/sc35.png")
]

var g=0;
var g1=0;
func cari():
	g = get_node("../Polygon2D").get_child(0).getPage()

func klarifikasi(g):
	if g>=8:
		g1=5
	elif g<8 && g >5:
		g1=4
	elif g<6 && g >4:
		g1=3
	elif g<5 && g >3:
		g1=2
	elif g<4 && g >1:
		g1=1
	else:
		g1=0
	set_texture(texture[g1])
	
func _process(delta):
	cari()
	klarifikasi(g)
	if g >=11:
		get_parent().get_node("Button").set_hidden(false);
#	print (g)

func _ready():
	set_process(true)
