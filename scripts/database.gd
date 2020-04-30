extends Node


const FIXED_DATA_FILE = "res://databases/fixed-data.json"
const GAME_DATA_FILE = "res://databases/game-data.json"

var userClass = preload("res://scripts/user.gd")
var koiClass = preload("res://scenes/Koi/KoiTemplate.gd")


func _exit_tree():
	save_user()
	

func get_all_kois_with_condition(property_name : String, condition):
	var kois_to_return : Array = []
	for koi in GLOBAL.all_kois:
		if koi[property_name] == condition:
			kois_to_return.append(koi)
		
	return kois_to_return
	
func load_game_data():
	Kois.all_kois = get_kois_from_ingame()
	
	var file = File.new()
	if file.file_exists(FIXED_DATA_FILE):
		file.open(FIXED_DATA_FILE, File.READ)
		var data = parse_json(file.get_as_text())
		file.close()
		if typeof(data) == TYPE_DICTIONARY:
			pass
#			Kois.all_kois = convert_kois_from_db(data.kois)
#			Plants.all_plants = convert_plants_from_db(data.plants)
#			GLOBAL.all_kois_plants_attractions = data.koisAttractions
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
	
	var f = File.new()
	if f.file_exists(GAME_DATA_FILE):
		pass
	else:
		print("DOESN't EXIST")
	
	var file = File.new()
	var user : User
	if file.file_exists(GAME_DATA_FILE):
		file.open(GAME_DATA_FILE, File.READ)
		
		var json : Dictionary = JSON.parse(file.get_as_text()).result
	
		GLOBAL.user = userClass.new(json.username, json.money, json.level, json.experience, json.kois_unlocked_ids, json.plants_unlocked_ids)

		file.close()
			
	else:
		printerr("No saved data!")

	
func get_kois_from_ingame():
	var kois : Array = []
	
	var kois_folder = "res://scenes/Koi/Kois/"
	
	var kois_files : Array = get_kois_instance_scenes_files(kois_folder)


	for koi_file in kois_files:
		var koi : Koi = load(koi_file).instance()
		

		kois.append(koi)
	
	return kois
	
func get_kois_instance_scenes_files(scan_dir : String) -> Array:
	var my_files : Array = []
	var dir := Directory.new()
	if dir.open(scan_dir) != OK:
		printerr("Warning: could not open directory: ", scan_dir)
		return []
	
	if dir.list_dir_begin(true, true) != OK:
		printerr("Warning: could not list contents of: ", scan_dir)
		return []
	
	var file_name := dir.get_next()
	while file_name != "":
		if dir.current_is_dir():
			my_files += get_kois_instance_scenes_files(dir.get_current_dir() + "/" + file_name)
		else:
			if ".tscn" in file_name:		
				my_files.append(dir.get_current_dir() + "/" + file_name)
	
		file_name = dir.get_next()
	
	return my_files

func convert_plants_from_db(plants_data : Array):
	var plants : Array = []
	
	for plant in plants_data:
		plants.append(convert_to_plant(plant))
	return plants
		

func convert_to_plant(plant_data):
	var plant = Plant.new(plant_data.id, plant_data.name, plant_data.price, plant_data.rarity)
	return plant

