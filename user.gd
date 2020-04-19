extends Node

var _name : String
var _money : int
var _level : int
var _exp :  int
var _koisUnlocked : Array
var _plantsUnlocked : Array

class_name User

func _init(name : String, money : int, level : int, experience : int, koisUnlocked : Array, plantsUnlocked : Array):
	self._name = name
	self._money = money
	self._exp = experience
	self._level = level
	self._koisUnlocked = koisUnlocked
	self._plantsUnlocked = plantsUnlocked

func increase_money(amount: int):
	if(amount > 0):
		set_money(get_money() + amount)	
	else:
		print("Amount should not be negative")
	
	
func decrease_money(amount : int):
	if(amount > 0):
		set_money(get_money() - amount)	
	else:
		print("Amount should not be negative")
	
func get_exp():
	return self._exp
	
func set_exp(newExp : int): 
	self._exp = newExp

func get_level():
	return self._level
	
func set_level(newLevel : int):
	self._level = newLevel

func increment_level(amount : int):
	set_level(get_level() + amount)

func set_money(newMoney):
	self._money = newMoney
	
func get_money():
	return self._money
	
func _ready():
	print("New user instance.")
