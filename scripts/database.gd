extends Node


const FIXED_DATA_FILE = "res://databases/fixed-data.json"
const GAME_DATA_FILE = "res://databases/game-data.json"

var userClass = preload("res://scripts/user.gd")
var koiClass = preload("res://scripts/Koi.gd")


func _exit_tree():
	save_user()
	

func get_all_kois_with_condition(property_name : String, condition):
	var kois_to_return : Array = []
	for koi in GLOBAL.all_kois:
		if koi[property_name] == condition:
			kois_to_return.append(koi)
		
	return kois_to_return
	
func load_game_data():
	var file = File.new()
	if file.file_exists(FIXED_DATA_FILE):
		file.open(FIXED_DATA_FILE, File.READ)
		var data = parse_json(file.get_as_text())
		file.close()
		if typeof(data) == TYPE_DICTIONARY:
			GLOBAL.all_kois = convert_kois_from_db(data.kois)
			GLOBAL.all_plants = convert_plants_from_db(data.plants)
			GLOBAL.all_kois_plants_attractions = data.koisAttractions
		else:
			printerr("Corrupted data!")
	else:
		printerr("No saved data!")
	
func save_user():
	var file = File.new()
	file.open(GAME_DATA_FILE, File.WRITE)
	var user_to_save : Dictionary = inst2dict(GLOBAL.user)
	user_to_save.erase("@subpath")
	user_to_save.erase("@path")
	user_to_save.erase("UI_instance")
	
	file.store_string(JSON.print(user_to_save))
	file.close()


func load_user():
	var file = File.new()
	var user : User
	print("test")
	if file.file_exists(GAME_DATA_FILE):
		file.open(GAME_DATA_FILE, File.READ)
		
		var json : Dictionary = JSON.parse(file.get_as_text()).result
	
		GLOBAL.user = userClass.new(json.username, json.money, json.level, json.experience, json.kois_unlocked_ids, json.plants_unlocked_ids)

		file.close()
			
	else:
		printerr("No saved data!")


func convert_kois_from_db(koisData : Array):
	var kois : Array = []
	
	for koi in koisData:
		kois.append(convert_to_koi(koi))
	return kois
	
	

func convert_to_koi(koiData):
	var koi = koiClass.new(koiData.id, koiData.name, koiData.price, koiData.speed, koiData.rarity)
	return koi



func convert_plants_from_db(plants_data : Array):
	var plants : Array = []
	
	for plant in plants_data:
		plants.append(convert_to_plant(plant))
	return plants
		

func convert_to_plant(plant_data):
	var plant = Plant.new(plant_data.id, plant_data.name, plant_data.price, plant_data.rarity)
	return plant

