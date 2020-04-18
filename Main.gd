extends Node

onready var AppearingModule = preload("res://modules/AppearingModule.gd").new()

func _enter_tree():
	GLOBAL.all_kois = DBMODEL.convert_kois_from_db(DB.load_kois_from_db())

func _ready() -> void:
	# Create new gdsqlite instance
	pass
	

func _on_Timer_timeout():
	AppearingModule.check_if_koi_will_come_visit_pond()
	
	
