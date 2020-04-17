extends Node



func _ready() -> void:
	# Create new gdsqlite instance
	GLOBAL.allKois = DBMODEL.convert_kois_from_db(DB.load_kois_from_db())

func _on_Timer_timeout():
	print("New fish will maybe come ..")
	#choose_a_koi()
	
