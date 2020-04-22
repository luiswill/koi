extends Node

var id : int = 0
var koi_name : String
var price : int
var speed : float
var rarity : int
var sceneUrl : String

class_name Koi, "res://assets/icons/koi-icon.png"


func _init(id: int, name : String, price : float, speed : float, rarity : int):
	self.id = id
	self.koi_name = name
	self.price = price
	self.speed = speed
	self.rarity = rarity
	self.sceneUrl = "res://scenes/Koi/kahoku"
	

func get_id(): 
	return self.id

func set_id(newId : int): 
	self.id = newId

func get_koi_name():
	return self.koi_name
	
func set_koi_name(newName: String):
	self.koi_name = newName
	
func get_price(): 
	return self.price;
	
func set_price(newPrice: int):
	self.price = newPrice
	
func get_rarity() -> int:
	return self.rarity
	
func set_rarity(newRarity : int) -> void:
	self.rarity = newRarity
	
func get_sceneUrl():
	return self.sceneUrl;
	
func set_sceneUrl(newSceneUrl : String): 
	self.sceneUrl = newSceneUrl
	
func _to_string():
	var s = "(" + str(self.id) + ") " + self.koi_name + " : " + str(self.price) + GAME.currency
	return s

