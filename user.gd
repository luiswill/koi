extends Node

var _money : int


class_name User

func _init(money):
	self._money = money
	

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
	

func set_money(newMoney):
	self._money = newMoney
	
func get_money():
	return self._money
	
func _ready():
	print("New user instance.")
