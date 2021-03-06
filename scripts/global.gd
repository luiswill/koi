extends Node



var all_kois_plants_attractions : Array = []

var user : User
var pond : Pond

var koi_instance
onready var koi_scene = load("res://assets/koi_meshes/koi_base/koi_base.tscn")

var animation_instance

var animation_scenes = []

onready var animationMove1_scene = preload("res://assets/animations/move/animationMove1.tscn")
onready var animationMove2_scene = preload("res://assets/animations/move/animationMove3.tscn")
onready var animationMove3_scene = preload("res://assets/animations/move/animationMove4.tscn")



func _ready():
	animation_scenes.append(animationMove1_scene)
	animation_scenes.append(animationMove2_scene)
	animation_scenes.append(animationMove3_scene)
	
	


func buy_fish(koi: Koi):
	user.decrease_money(koi.get_price())
#	pond.add_koi_to_pond(koi)
	create_new_koi_instance(koi)
	
func get_a_random_animation():
	var random_animation = animation_scenes[randi() % animation_scenes.size()]
	return random_animation

func create_new_koi_instance(koi : Koi):
	koi_instance = koi_scene.instance()
	koi_instance.set_name("Koi 2")
	
	add_child(koi_instance)
	
	return koi_instance

func create_new_koi_instance_with_random_animation(koi : Koi):
	var koi_instance = create_new_koi_instance(koi)

	animation_instance = get_a_random_animation().instance()

	return koi_instance.add_child(animation_instance)


func create_new_koi_instance_with_animation(koi : Koi, animation : AnimationPlayer):
	var koi_instance = create_new_koi_instance(koi)

	return koi_instance.add_child(animation)

func add_animation_to_koi(animation : AnimationPlayer, koi : Koi):
	koi.add_child(animation.play("GO_IN_POND"))
	return animation
	
func random_int(min_value,max_value):
	max_value += 1
	var range_size = max_value - min_value
	return (randi() % range_size) + min_value
	


