extends Spatial

export var id : int = 0
export var koi_name : String
export var price : int
export var speed : float
export var rarity : int
export var sceneUrl : String

class_name Koi, "res://assets/icons/koi-icon.png"
	

func get_id(): 
	return id

func set_id(newId : int): 
	id = newId

func get_koi_name():
	return koi_name
	
func set_koi_name(newName: String):
	koi_name = newName
	
func get_speed():
	return speed
	
func get_price(): 
	return price
	
func set_price(newPrice: int):
	price = newPrice
	
func get_rarity() -> int:
	return rarity
	
func set_rarity(newRarity : int) -> void:
	rarity = newRarity
	
func get_sceneUrl():
	return sceneUrl;
	
func set_sceneUrl(newSceneUrl : String): 
	sceneUrl = newSceneUrl
	
func _to_string():
	print("KOI ID : ", get_id())
	var s = "(" + str(id) + ") " + koi_name + " : " + str(price) + GAME.currency
	return s

func convert_to_dict() -> Dictionary:
	var koi : Dictionary = {}

	
	koi["id"] = get_id()
	koi["scene_url"] = get_sceneUrl()
	koi["koi_name"] = get_koi_name()
	koi["price"] = get_price()
	koi["rarity"] = get_rarity()
	koi["speed"] = get_speed()

	
	return koi
	
	
	
