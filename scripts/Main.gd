extends Node



onready var AppearingModule = preload("res://scripts/modules/AppearingModule.gd").new()


var user : User
#var pond = preload("res://scripts/pond.gd").new()

func _enter_tree():
#	DB.save_user()
	print("ENTERING TREE")
	DB.load_user()
	DB.load_game_data()
	print(GLOBAL.all_plants)

	
func _ready():
	EVENTS.emit_signal("updated_user")
	pass


	

func _on_Timer_timeout():
#	print("TIMER")
#	print("PLayer ", DATA.player.level)
#	DATA.player.level += 1
	AppearingModule.check_if_koi_will_come_visit_pond()
	pass
