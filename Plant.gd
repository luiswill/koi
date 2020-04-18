extends Node

var _id : int
var _name : String
var _price : int
var _rarity : int
var _sceneUrl : String

class_name Plant, "res://assets/icons/koi-icon.png"


func _init(id: int, name : String, price : float, rarity : int):
	self._id = id
	self._name = name
	self._price = price
	self._rarity = rarity
	self._sceneUrl = "res://scenes/algae/algae.tscn"
	
	
func get_name():
	return self._name
	
func set_name(newName: String):
	self._name = newName
	
func get_price(): 
	return self._price;
	
func set_price(newPrice: int):
	self._price = newPrice
	
	
func get_sceneUrl():
	return self._sceneUrl;
	
func set_sceneUrl(newSceneUrl : String): 
	self._sceneUrl = newSceneUrl
	
func _to_string():
	var s = self._name + " : " + str(self._price) + GAME.currency
	return s

