extends Sprite


var texture = [preload("res://assets/levels/intro/sc1.png"),
preload("res://assets/levels/intro/sc2.png"),
preload("res://assets/levels/intro/sc3.png"),
preload("res://assets/levels/intro/sc4.png"),
preload("res://assets/levels/intro/sc5.png"),
preload("res://assets/levels/intro/sc6.png"),
preload("res://assets/levels/intro/sc7.png"),
preload("res://assets/levels/intro/sc8.png"),
preload("res://assets/levels/intro/sc9.png"),
preload("res://assets/levels/intro/sc10.png"),
preload("res://assets/levels/intro/sc11.png"),
preload("res://assets/levels/intro/sc12.png"),
preload("res://assets/levels/intro/sc13.png"),
preload("res://assets/levels/intro/sc14.png"),
preload("res://assets/levels/intro/sc15.png"),
preload("res://assets/levels/intro/sc16.png"),
preload("res://assets/levels/intro/sc17.png"),
preload("res://assets/levels/intro/sc18.png"),
preload("res://assets/levels/intro/sc19.png"),
preload("res://assets/levels/intro/sc20.png"),
preload("res://assets/levels/intro/sc21.png"),
preload("res://assets/levels/intro/sc22.png")]

var g=0;
var g1=0;
func cari():
	g = get_node("../text_field").get_child(0).getPage()
	print(g)

func klarifikasi(g):
	if g == 28:
		get_parent().get_node("button akhir").set_hidden(false)
	if g<29 && g>27:
		 g1=21
	elif g<28 && g>25:
		g1=20
	elif g<26 && g>23:
		g1=19
	elif g<24 && g >20:
		g1=18
	elif g<21 && g >19:
		g1=17
	elif g<20 && g >18:
		g1=16
	elif g<19 && g >17:
		g1=15
	elif g<18 && g >16:
		g1=14
	elif g<17 && g >15:
		g1=13
	elif g<16 && g >14:
		g1=12
	elif g<15 && g >12:
		g1=11
	elif g<13 && g >11:
		g1=10
	elif g<12 && g >11:
		g1=9
	elif g<12 && g >10:
		g1=8
	elif g<11 && g >8:
		g1=7
	elif g<9 && g >7:
		g1=6
	elif g<8 && g >5:
		g1=5
	elif g<6 && g >4:
		g1=4
	elif g<5 && g >3:
		g1=3
	elif g<4 && g >2:
		g1=2
	elif g<3 && g >0:
		g1=1
	else:
		g1=0
	set_texture(texture[g1])
	

func _process(delta):
	cari()
	klarifikasi(g)
	print (g)

func _ready():
	get_parent().get_node("button akhir").set_hidden(true);
	set_process(true)
