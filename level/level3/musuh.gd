extends KinematicBody2D

enum ListMusuh {SIPUT,KUMBANG,URET,KING}
var attack_rate
export var start_x = 0
export var start_y = 0
export var speed = 10
export var type = ListMusuh.SIPUT

func _ready():
	if type == ListMusuh.SIPUT:
		attack_rate = 5
	elif type == ListMusuh.KUMBANG:
		attack_rate = 2
	elif type == ListMusuh.URET:
		attack_rate = 3
	elif type == ListMusuh.KING:
		attack_rate = 20

func kill():
	self.queue_free()
