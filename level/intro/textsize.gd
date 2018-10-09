extends RichTextLabel
var dialog = [
"ini Adalah Luna, adalah seorang petani tebu kecil di sebuah desa di pinggiran kota ",
"ia sudah lama menanan tebu milik orang tuanya yang kecil namun manis",
"dan bertepatan hari ini adalah hari panen , saat dimana ia menjual tebu ke mitra tani",
"lalu berangkatlah ia dan sampailah di mitra tani",
"namun , sesampainya disana tebu yang ia bawa ditolak karena mitra tani sudah membeli tebu jenis lain",
"Mitra tani kedatangan jenis tebu baru yang lebih besar dan lebih murah karena tidak seberapa manis",
"Jika dibandingkan , Mitra tani memilih tebu ini karena lebih menguntungkan untuk mereka",
"karena banyak perusahaan yang mementingkan volume dan menggunakan pemanis buatan sehingga tidak terlalu butuh yang manis",
"terkejut tebunya tidak laku, Luna merasa depresi , kemana ia akan bisa menjual tebunya sekarang ?",
"Terlamun dalam depresi ia menemukan sebuah lampu ajaib",
"Mungkin lampu ini dapat mengubah nasibku , Luna pikir"
,"Namun ........","BOOOOOOOM","Ternyata lampu itu adalah lampu iseng yang sedang populer belakangan ini",
"Hueeeeeeee , Luna menangis karena tidak tahan dengan kesialan dan stress yang ia rasakan hari ini",
"Namun Paman Luna sedang kebetulan ada di sekitar menghibur Luna dan mengajaknya ke suatu tempat untuk menyenangkannya",
"Satu Perjalanan Kemudian ...........", "Ternyata paman mengajak Luna ke laboratorium pertanian",
"Luna baru pertama kali datang ke tempat ini dan terkagum-kagum dengan apa yang ia lihat",
"Paman membawa Luna ke dalam dan menjelaskan bahwa ia sedang meneliti sesutu yang berhubungan dengan tebu yang bisa menyelamatkan pertanian Luna",
"Paman menjelaskan tentang Transgenik dimana Paman dapat memodifikasi sifat dari sebuah tanaman",
"Contohnya menggabungkan sifat tahan panas kaktus dengan jagung biasa untuk membuat jagung yang tahan kekeringan",
"Dalam hal ini paman memiliki sampel tebu ukuran besar , yang paman berusaha silangkan dengan tebu manis milik Luna",
"Luna sangat senang melihat kesempatan ini , akhirnya ia punya kesempatan untuk bisa bertani lagi",
"Jika Sudah paham apa yang akan dilakukan , ayo kita coba melakukannya !, kata paman",
"Dan Mereka Bersiap untuk mencoba melakukan percobaan transgenik.",
"Tahap Pertama adalah menemukan gen penentu manis dari tebu yang manis dan diberikan ke bakteri",
"Nantinya Bakteri bakteri akan mengambil sifat manis itu dan menjaganya dan susunan DNA nya , menghasilkan bakteri pembawa sifat manis",
"Dan untung saja kita sudah punya ekstrak DNA manis , ayo sekarang kita masukkan DNA ini ke bakteri !"
]
var page = 0;

func _ready():
#	print("panjangnya: ",dialog.size())
	set_bbcode(dialog[0])
	set_visible_characters(0)
	set_process_input(true)

func getPage():
	return page


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
	set_visible_characters(get_visible_characters()+5)

