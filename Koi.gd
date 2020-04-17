extends Node

var _name : String
var _price : int
var _speed : float
var _rarity : int
var _age : int

class_name Koi, "res://assets/icons/koi-icon.png"


func _init(name : String, price : float, speed : float, rarity : int, age : int):
	self._name = name
	self._price = price
	self._speed = speed
	self._rarity = rarity
	self._age = age
	
	
func get_name():
	return self._name
	
func set_name(newName: String):
	self._name = newName
	
func get_price(): 
	return self._price;
	
func set_price(newPrice: int):
	self._price = newPrice
	
func _to_string():
	var s = self._name + " : " + str(self._price) + GAME.currency
	return s
