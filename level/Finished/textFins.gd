extends RichTextLabel
var bialog = [
"Silaunya .....",
"Berhasil .. Ini Yang Kita Cari..",
"Bibit Tebu Transgenik Pertama Kita.",
"Bibit ini akan menjadi awal mula lahan tebumu yang baru",
"Akhirnya.. Akan aku rawat kamu baik baik",
"Beberapa Minggu Kemudian",
"Sekarang Luna dibantu Pamannya mengelola kebun tebu transgenik",
"Kebunnya merangkap menjadi Sebuah Lahan Penelitian Performa Bibit Transgenik bagi Pamannya",
"Bagi Luna , Yang Penting adalah Mata Pencaharaiannya sekarang terjamin",
"Ia mencari pengepul baru untuk tebunya , dan tebunya sangat laku",
"Sekarang ia menjadi salah satu petani Tebu yang bisa dibilang sukses di daerahnya",
"Sampai Jumpa Di Penelitian Selanjutnya Selanjutnya !"
]
var page = 0;

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
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
	set_visible_characters(get_visible_characters()+5)

