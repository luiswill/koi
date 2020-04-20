extends Node

var db = preload("database.gd").new()

onready var AppearingModule = preload("res://scripts/modules/AppearingModule.gd").new()


var user : User
var pond = preload("res://scripts/pond.gd").new()

func _enter_tree():
	DB.load_db()
	GLOBAL.all_kois = DBMODEL.convert_kois_from_db(DB.load_kois_from_db())
	GLOBAL.user = DBMODEL.convert_user_from_db(DB.load_user())
	
	
func _on_GestureDetector_double_tap(pos):
	print("DOUBLE TAP")
	
	
func _ready():
	EVENTS.emit_signal("updated_user")
	pass


	

func _on_Timer_timeout():
	print("TIMER")
	AppearingModule.check_if_koi_will_come_visit_pond()
