extends Control

onready var button = preload("res://ui/buttonKoiItem.gd")
onready var kois

onready var button_template = preload("res://ui/buttonKoiItem.tscn")
var button_instance : Button

var all_kois_container

func _ready():
	kois = GLOBAL.all_kois
	print("kois", kois)
	load_all_buttons()
	
	
func load_all_buttons():
	all_kois_container = get_node("all_kois_container")
	
	for koi in GLOBAL.all_kois:
		load_shop_button_for_koi(koi)
		
		


func load_shop_button_for_koi(koi : Koi):
		button_instance = button_template.instance()
		var button_texture_instance : TextureRect = button_instance.get_node("image")
		var button_label_name_instance : Label = button_instance.get_node("name")
		var button_label_price_instance : Label = button_instance.get_node("price")
		
		button_label_name_instance.text = koi.get_name()
		button_label_price_instance.text = str(koi.get_price()) + GAME.currency
		
		all_kois_container.add_child(button_instance)
