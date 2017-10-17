extends RichTextLabel
var bialog = [
"Akhirnya selesai jugaaaaaaa , apakah ini sudah selesai paman ?",
"Tentu tidak",
"Tahap selanjutnya dalah menembakkan zat pengaktivasi ke bakteri yang sudah diberi sifat tersebut di sampel tebu",
"nantinya sifat yang dibawa bakteri itu akan berubah dan melebur jadi satu dengan sel tebu asli.",
"Menghasilkan tebu dengan sifat manis!",
"dan alat yang akan kita gunakan adalah GENE GUN ini , Ayo kita mulai Menembak !"
]
var page = 0;

func _ready():
	set_bbcode(bialog[0])
	set_visible_characters(0)
	set_process_input(true)

func getPage():
	return page


func _input(event):
	if event.type==InputEvent.MOUSE_BUTTON && event.is_pressed():
		if get_visible_characters()>get_total_character_count():
			if page < bialog.size()-1:
				page +=1
				set_bbcode(bialog[page])
				set_visible_characters(0)
		else:
			set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)

