extends Node

var _name : String
var _money : int
var _level : int
var _exp :  int
var _kois_unlocked_ids : Array = []
var _plants_unlocked_ids : Array = []

onready var UI_instance = load("res://ui/UI.tscn").new()

class_name User

func _ready(): 
	pass
	
func _init(name : String, money : int, level : int, experience : int, koisUnlocked : Array, plantsUnlocked : Array):
	self._name = name
	self._money = money
	self._exp = experience
	self._level = level
	self._kois_unlocked_ids = koisUnlocked
	self._plants_unlocked_ids = plantsUnlocked
	
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
	
func get_exp():
	return self._exp
	
func set_exp(newExp : int):
	self._exp = newExp
	update_user_ui()

func get_level():
	return self._level
	
func set_level(newLevel : int):
	self._level = newLevel
	update_user_ui()

func increment_level(amount : int):
	set_level(get_level() + amount)
	update_user_ui()
	
func increment_exp(amount : int):
	var newXP = amount + get_exp()
	if(newXP > GAME.LEVEL_XPS[get_level()]):
		var remainXP = fmod(newXP, GAME.LEVEL_XPS[get_level()])
		increment_level(1)
		set_exp(remainXP)
	else:
		set_exp(get_exp() + amount)
	
	update_user_ui()

func set_money(newMoney):
	self._money = newMoney
	update_user_ui()
	
func get_money():
	return self._money
	
func add_koi_unlocked(koi : Koi) -> void:
	var arr = get_kois_ids_unlocked()
	#https://github.com/godotengine/godot/issues/34161
	
	# WTF ACHTUNG !

	arr.append(koi.get_id())
	
	
	set_kois_ids_unlocked(arr)
	
	
func get_kois_unlocked():
	return DBMODEL.convert_kois_from_db(DB.load_kois_with_ids(self._kois_unlocked_ids))
	
func get_kois_ids_unlocked():
	return self._kois_unlocked_ids
	 
func set_kois_ids_unlocked(new : Array = []):
	self._kois_unlocked_ids = new
	
func update_user_ui() -> void:
	#why not animated ? 		
	
	EVENTS.emit_signal("updated_user")
