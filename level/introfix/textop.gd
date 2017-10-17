extends RichTextLabel
var dialog = ["ini Adalah Luna, adalah seorang petani tebu kecil di sebuah desa di pinggiran kota "
,"ia sudah lama menanan tebu milik orang tuanya yang kecil namun manis",
"dan perteoatan hari ini adalah hari panen , saat dimana ia menjual tebu ke mitra tani"]
var page = 0;

func _ready():
	set_bbcode(dialog[0])
	set_visible_characters(0)
	set_process_input(true)


func _input(event):
	if event.type==InputEvent.MOUSE_BUTTON && event.is_pressed():
		if get_visible_characters()>get_total_character_count():
			if page < dialog.size()-1:
				page +=1
				set_bbcode(dialog[page])
				set_visible_characters(0)
		else:
			set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)

