extends Node

var username : String
var money : int
var level : int
var experience :  int
var kois_unlocked_ids : Array = []
var plants_unlocked_ids : Array = []

class_name User

func _ready(): 
	pass
	
func _init(username : String, money : int, level : int, experience : int, koisUnlocked : Array, plantsUnlocked : Array = []):
	self.username = username
	self.money = money
	self.experience = experience
	self.level = level
	self.kois_unlocked_ids = koisUnlocked
	
	update_user_ui()

func increase_money(amount: int):
	if(amount > 0):
		set_money(get_money() + amount)
		update_user_ui()
		
	else:
		print("Amount should not be negative")
	
	
func decrease_money(amount : int):
	if(amount > 0):
		set_money(get_money() - amount)	
		update_user_ui()
	else:
		print("Amount should not be negative")
	
func get_experience():
	return self.experience
	
func set_experience(newExperience: int):
	self.experience = newExperience
	update_user_ui()

func get_level():
	return self.level
	
func set_level(newLevel : int):
	self.level = newLevel
	update_user_ui()

func increment_level(amount : int):
	set_level(get_level() + amount)
	update_user_ui()
	
func increment_experience(amount : int):
	var newXP = amount + get_experience()
	if(newXP > GAME.LEVEL_XPS[get_level()]):
		var remainXP = fmod(newXP, GAME.LEVEL_XPS[get_level()])
		increment_level(1)
		set_experience(remainXP)
	else:
		set_experience(get_experience() + amount)
	
	update_user_ui()

func set_money(newMoney):
	self.money = newMoney
	update_user_ui()
	
func get_money():
	return self.money
	
func add_koi_unlocked(koi : Koi) -> void:
	var arr = get_kois_ids_unlocked()
	#https://github.com/godotengine/godot/issues/34161
	
	# WTF ACHTUNG !

	arr.append(koi.get_id())
	
	
	set_kois_ids_unlocked(arr)
	
	
func get_kois_unlocked():
	return DBMODEL.convert_kois_from_db(DB.load_kois_with_ids(self.kois_unlocked_ids))
	
func get_kois_ids_unlocked():
	return self.kois_unlocked_ids
	 
func set_kois_ids_unlocked(new : Array = []):
	self.kois_unlocked_ids = new
	
func update_user_ui() -> void:
	#why not animated ? 		
	
	EVENTS.emit_signal("updated_user")


func _to_string():
	print("(" + self.username + ") : " + str(self.money) + GAME.currency + ", level " + str(self.level))


