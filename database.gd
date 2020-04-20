extends Node

const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns");

var db : SQLite
#var db_name = "user://test"
var db_name : String = "res://databases/kois/koi_db.db"
#var db_name = "test"
var table_kois_name : String = "Kois"
var table_kois_plants_attractions_name : String = "KoisAttractions"
var table_plants_name : String = "Plants"


	
func _exit_tree():
	print("Closed SQLite DB.")
	save_user_to_database(GLOBAL.user)
	db.close_db()	
	
func load_db():
	db = SQLite.new()	
	db.path = db_name
#	db.verbose_mode = true
	# Open the database using the db_name found in the path variable
	db.open_db()
	print("Opened SQLite DB")
	
func load_user():
	db.query("SELECT * FROM User;")
	return db.query_result[0]
	

func load_kois_from_db():

	# Select the id and age of the employees that are older than 30
	var select_condition : String = ""
	var selected_array : Array = db.select_rows(table_kois_name, select_condition, ["*"])
	
	
	return selected_array


func load_kois_from_db_with_condition(condition : String):
	
	var selected_array : Array = db.select_rows(table_kois_name, condition, ["*"])
	
	return selected_array
	
	
func load_plant_attractions_of_koi(koi : Koi):
	var koiId = koi.get_id()

	var condition : String = "koiId == " + str(koiId) 
	
	var plants_ids_db_result : Array = db.select_rows(table_kois_plants_attractions_name, condition, ["plantId"])
	
	var plants_ids : Array;
	
	for plantItem in plants_ids_db_result:
		plants_ids.append(plantItem.plantId)


	return load_plants_with_ids(plants_ids)
	
	
func load_plants_with_ids(plants_id : Array):
	
	var condition : String = ("id IN " + str(plants_id)).replace("[", "(").replace("]", ")")
	
	var selected_array : Array = db.select_rows(table_plants_name, condition, ["*"])
	#db.query("SELECT * FROM " + table_plants_name + " WHERE id in [1,2,3];")
	#print("There are ", db.query_result[0])
	
	return selected_array
	
	
func load_kois_with_ids(kois_id : Array):
	print("Loading kois with id ", kois_id)
	
	var condition : String = ("id IN " + str(kois_id)).replace("[", "(").replace("]", ")")
	
	var selected_array : Array = db.select_rows(table_kois_name, condition, ["*"])
	#db.query("SELECT * FROM " + table_plants_name + " WHERE id in [1,2,3];")
	#print("There are ", db.query_result[0])
	
	return selected_array
	
	
func save_user_to_database(user : User) -> void:
	var kois_ids_formatted : String = str(user.get_kois_ids_unlocked()).replace("[", "").replace("]", "").replace(" ", "")

	
	print("KOIS IDS formatted", kois_ids_formatted)
	
	
	var query : String = "UPDATE USER SET "
	query += "'money' = " + str(user.get_money())
	query += ", 'level' = " + str(user.get_level())
	query += ", 'exp' = " + str(user.get_exp())
	query += ", 'koisUnlocked' = '" + kois_ids_formatted + "'"
	query += ";"
	
	print("query", query)
	db.query(query)	
	

