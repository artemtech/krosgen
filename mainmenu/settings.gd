extends Control

var scene_config = {
fullscreen = TYPE_BOOL,
musics = TYPE_BOOL,
soundeffect = TYPE_BOOL
}

onready var settings = get_node("setting-items")

func _ready():
	var curset = SettingsManager.read_settings()
	print("Status saat ini ",curset)
	for item in curset:
		set_pengaturan(item, curset[item])
	for optName in scene_config:
		var settingsControl = settings.get_node(optName)
		settingsControl.connect("toggled",self,"option_item_selected", [optName])

func option_item_selected(ID, setting):
	print("Status saat ini ",setting," ",ID)
	var current_options = SettingsManager.read_settings()
	current_options[setting] = settings.get_node(setting).is_pressed()
	set_pengaturan(setting, current_options[setting])
	SettingsManager.save_settings(current_options)

func set_pengaturan(setting, value):
	if setting == "fullscreen":
		OS.set_window_fullscreen(value)
		settings.get_node(setting).set_pressed(value)
	elif setting == "musics":
		settings.get_node(setting).set_pressed(value)
	else:
		settings.get_node(setting).set_pressed(value)