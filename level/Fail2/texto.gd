extends RichTextLabel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var dialog = [
"Waaaaaaaaaaa Kebakaran !!!!!!","Whua ... Cepat Panggil Pemadam Kebakaran","Aaaaaa bagaimana dengan tebunya ?","Itu Urusan Nanti , Padamkan Apinya dulu !!!","Seandainya waktu bisa diputar , ini tidak akan terjadi"
]

var page = 0;

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_node("../../Button").set_hidden(true)
	set_bbcode(dialog[0])
	set_visible_characters(0)
	set_process_input(true)
	set_process(true)

func getPage():
	return page

func _process(delta):
	set_bbcode(dialog[page])

func _input(event):
	if event.type==InputEvent.MOUSE_BUTTON && event.is_pressed():
		if get_visible_characters()>get_total_character_count():
			if page < dialog.size()-1:
				page +=1
				set_bbcode(dialog[page])
				set_visible_characters(0)
			elif page == dialog.size()-1:
				get_node("../../Button").set_hidden(false)
		else:
			set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+5)



func _on_Button_pressed():
	get_tree().change_scene("res://level/level2/game.tscn");
