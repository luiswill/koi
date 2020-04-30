extends Control

onready var button = preload("res://ui/buttonKoiItem.gd")
onready var kois : Array

onready var button_template = preload("res://ui/buttonKoiItem.tscn")
var button_instance : Button

var all_kois_container

func _ready():
	kois = Kois.all_kois

	load_all_buttons()
	
	
func load_all_buttons():
	all_kois_container = get_node("all_kois_container")
	
	for koi in kois:
		load_shop_button_for_koi(koi)


func load_shop_button_for_koi(koi : Koi):
		#Design a button for every koi
		button_instance = button_template.instance()
		
		var button_texture_instance : Sprite = button_instance.get_node("canvas/image")
		var button_label_name_instance : Label = button_instance.get_node("name")
		var button_label_price_instance : Label = button_instance.get_node("price")
		
		if!(koi.get_id() in GLOBAL.user.get_kois_ids_unlocked()):
			button_texture_instance.set_modulate(Color("#000000"))
		button_label_name_instance.text = koi.get_name()
		button_label_price_instance.text = str(koi.get_price()) + GAME.currency
		
		all_kois_container.add_child(button_instance)
