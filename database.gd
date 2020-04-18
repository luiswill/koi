extends Node

const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns");

var db
#var db_name = "user://test"
var db_name : String = "res://databases/kois/koi_db.db"
#var db_name = "test"
var table_kois_name : String = "Kois"
var table_kois_plants_attractions_name : String = "KoisAttractions"
var table_plants_name : String = "Plants"

func load_kois_from_db():
	db = SQLite.new()
	db.path = db_name
#	db.verbose_mode = true
	# Open the database using the db_name found in the path variable
	db.open_db()
	
	# Select the id and age of the employees that are older than 30
	var select_condition : String = ""
	var selected_array : Array = db.select_rows(table_kois_name, select_condition, ["*"])
	
	db.close_db()
	
	return selected_array


func load_kois_from_db_with_condition(condition : String):
	db = SQLite.new()
	db.path = db_name

	# Open the database using the db_name found in the path variable
	db.open_db()
	

	var selected_array : Array = db.select_rows(table_kois_name, condition, ["*"])
	
	db.close_db()
	
	return selected_array
	
	
func load_plant_attractions_of_koi(koi : Koi):
	print("koi : ", koi)
	var koiId = koi.get_id()
	
	db = SQLite.new()
	db.path = db_name
#	db.verbose_mode = true
	# Open the database using the db_name found in the path variable
	db.open_db()
	
	var condition : String = "koiId == " + str(koiId) 
	
	print("Condition ", condition)
	
	var plants_ids_db_result : Array = db.select_rows(table_kois_plants_attractions_name, condition, ["plantId"])
	
	var plants_ids : Array;
	
	for plantItem in plants_ids_db_result:
		plants_ids.append(plantItem.plantId)

	print("Plant ids : ", str(plants_ids))
	
	db.close_db()


	return load_plants_with_ids(plants_ids)
	
	
func load_plants_with_ids(plants_id : Array):
	print("Loading plants with id : ", plants_id)
	db = SQLite.new()
	db.path = db_name
#	db.verbose_mode = true
	# Open the database using the db_name found in the path variable
	db.open_db()
	
	
	var condition : String = ("id IN " + str(plants_id)).replace("[", "(").replace("]", ")")
	
	
	print("condition ", str(condition))
	
	var selected_array : Array = db.select_rows(table_plants_name, condition, ["*"])
	#db.query("SELECT * FROM " + table_plants_name + " WHERE id in [1,2,3];")
	#print("There are ", db.query_result[0])
	
	
	print("selected array  ", selected_array)
	
	db.close_db()
	
	return selected_array

