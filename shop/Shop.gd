extends Control

onready var button = preload("res://ui/buttonKoiItem.gd")
onready var kois

onready var button_template = preload("res://ui/buttonKoiItem.tscn")
var button_instance

var all_kois_container

func _ready():
	kois = GLOBAL.all_kois
	print("kois", kois)
	load_all_buttons()
	
	
func load_all_buttons():
	all_kois_container = get_node("all_kois_container")
	
	
	for koi in GLOBAL.all_kois:
		button_instance = button_template.instance()
		button_instance.text = koi.get_name()
		all_kois_container.add_child(button_instance)
		
		
