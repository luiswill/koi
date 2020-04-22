extends Node

var id : int
var plant_name : String
var price : int
var rarity : int
var sceneUrl : String

class_name Plant, "res://assets/icons/koi-icon.png"


func _init(id: int, name : String, price : float, rarity : int):
	self.id = id
	self.plant_name = name
	self.price = price
	self.rarity = rarity
	self.sceneUrl = "res://scenes/algae/algae.tscn"
	
	
func get_plant_name():
	return self.plant_name
	
func set_plant_name(newName: String):
	self.plant_name = newName
	
func get_price(): 
	return self.price;
	
func set_price(newPrice: int):
	self.price = newPrice
	
	
func get_sceneUrl():
	return self.sceneUrl;
	
func set_sceneUrl(newSceneUrl : String): 
	self.sceneUrl = newSceneUrl
	
func _to_string():
	var s = "(" + self.plant_name + ") : " + str(self.price) + GAME.currency
	return s

