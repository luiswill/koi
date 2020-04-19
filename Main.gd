extends Node

var db = preload("database.gd").new()

onready var AppearingModule = preload("res://modules/AppearingModule.gd").new()
var user : User
var pond = preload("pond.gd").new()

func _enter_tree():
	DB.load_db()
	user = DBMODEL.convert_user_from_db(DB.load_user())
	GLOBAL.all_kois = DBMODEL.convert_kois_from_db(DB.load_kois_from_db())
	GLOBAL.user = user

func _ready() -> void:
	# Create new gdsqlite instance
	pass

	

func _on_Timer_timeout():
	GLOBAL.user.increase_money(10)
	AppearingModule.check_if_koi_will_come_visit_pond()
	
	
