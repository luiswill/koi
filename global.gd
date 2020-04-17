extends Node

var user = preload("user.gd").new(1000)
var pond = preload("pond.gd").new()

var koi_instance
onready var koi_scene = preload("res://scenes/Koi/koi.tscn")

var animation_instance

var animation_scenes = []

onready var animationMove1_scene = preload("res://animations/move/animationMove1.tscn")
onready var animationMove2_scene = preload("res://animations/move/animationMove3.tscn")
onready var animationMove3_scene = preload("res://animations/move/animationMove4.tscn")



func _ready():
	animation_scenes.append(animationMove1_scene)
	animation_scenes.append(animationMove2_scene)
	animation_scenes.append(animationMove3_scene)
	
	
	
func buy_fish(koi: Koi):
	user.decrease_money(koi.get_price())
	pond.add_koi_to_pond(koi)
	create_new_koi_instance(koi)
	
func get_a_random_animation():
	var random_animation = animation_scenes[randi() % animation_scenes.size()]
	return random_animation
	
func create_new_koi_instance(koi):
	koi_instance = koi_scene.instance()
	koi_instance.set_name("Koi 2")
	
	animation_instance = get_a_random_animation().instance()
	
	koi_instance.add_child(animation_instance)
	
	
	add_child(koi_instance)
	
