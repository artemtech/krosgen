extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	get_node("Button").set_hidden(true);


func _on_Button_pressed():
	utils.get_main_node().queue_free()
	get_tree().change_scene("res://mainmenu/mainmenu.tscn")
