extends Node


var algae_instance
#onready var algae_template = preload("res://algae2.tscn")
onready var koi_scene = load("res://assets/koi_meshes/koi_base/koi_base.tscn")

var timer : Timer

var tree : SceneTree
var environment : Spatial

func _enter_tree():
	print("ENtering tree")


	
	
	

func _ready():
	print("ALGEA MODULE READY")

	
	tree = get_tree()
	environment = get_node("/root/Main/environment")
	
	print("Tree ::: ", tree)
	print("Environmment  ::: ", environment)
	
	
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(5)
	timer.connect("timeout", self, "on_timeout")
	add_child(timer)
	timer.start()
	


#	AppearingModule.check_if_koi_will_come_visit_pond()

func on_timeout():
	print("TIMER")
	AlgaeModule.spawn_random_algae()
	pass


func spawn_random_algae():
#	algae_instance = koi_scene.instance()
#	var algae_instance : Spatial = load("res://assets/algae/dae/algae.dae").instance()
#	add_child(algae_instance)
	
	print("ENvinrommmnentttt now : ", environment)
#	var basis : Basis = algae_instance.global_transform.basis
#	basis.x = Vector3(2, 0, 0)
#	algae_instance.translate_object_local(Vector3(2, 0, 0))
	
#	print("ALGAE instancied at place", algae_instance.global_transform.basis)
#	print("ALGAE instancied at place", algae_instance.transform.basis)
