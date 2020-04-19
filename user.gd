extends Node

var _name : String
var _money : int
var _level : int
var _exp :  int
var _kois_unlocked : Array
var _plantsUnlocked : Array

onready var UI_instance = load("res://ui/UI.tscn").new()

class_name User

func _ready(): 
	pass
	
func _init(name : String, money : int, level : int, experience : int, koisUnlocked : Array, plantsUnlocked : Array):
	self._name = name
	self._money = money
	self._exp = experience
	self._level = level
	self._kois_unlocked = koisUnlocked
	self._plantsUnlocked = plantsUnlocked
	
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

func set_money(newMoney):
	self._money = newMoney
	update_user_ui()
	
func get_money():
	return self._money
	
func get_kois_unlocked():
	return self._kois_unlocked
	
func set_kois_unlocked(newKois : Array) -> void:
	self._kois_unlocked = newKois
	
func update_user_ui() -> void:
	#why not animated ? 		
	
	EVENTS.emit_signal("updated_user")
