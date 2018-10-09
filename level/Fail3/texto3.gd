extends RichTextLabel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var dialog = [
"Paman !! Bibit Tebunya Rusak Semua!",
"Huh , Sepertinya Serangga ini yang paling banyak menyerang bibit Kita",
"Bukannya Paman sudah beberapa kali memukulnya ? Kenapa ia tidak pergi ?",
"Sepertinya dia marah , bahkan sekarang dia tidak kabur lagi",
"Sepertinya sekarang saatnya gantian Kita yang Kabur ~"
]
var dialog_tanaman = [
"Paman !! Bibit Tebunya Rusak Semua!",
"Seharusnya kita tetap memperhatikan kebutuhan bibit-bibit ini..."
]

var page = 0;

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_node("../../Button").set_hidden(true)
	if levels_singletons.tanamanmati:
		var tex = preload("res://assets/levels/intro/sc28.png")
		get_node("../../COM").set_texture(tex)
		set_bbcode(dialog_tanaman[0])
	else:
		var tex = preload("res://assets/levels/intro/sc29.png")
		get_node("../../COM").set_texture(tex)
		set_bbcode(dialog[0])
	set_visible_characters(0)
	set_process_input(true)
	set_process(true)

func getPage():
	return page

func _process(delta):
	if levels_singletons.tanamanmati:
		set_bbcode(dialog_tanaman[page])
	else:
		set_bbcode(dialog[page])

func _input(event):
	if event.type==InputEvent.MOUSE_BUTTON && event.is_pressed():
		if get_visible_characters()>get_total_character_count():
			if levels_singletons.tanamanmati:
				if page < dialog_tanaman.size()-1:
					page +=1
					set_bbcode(dialog_tanaman[page])
					set_visible_characters(0)
				elif page == dialog_tanaman.size()-1:
					get_node("../../Button").set_hidden(false)
			else:
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
	levels_singletons.tanamanmati = true
	get_tree().change_scene("res://level/level3/level3.tscn");
