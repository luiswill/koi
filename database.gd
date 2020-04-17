extends Node

const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns");

var db
#var db_name = "user://test"
var db_name : String = "res://databases/kois/koi_db"
#var db_name = "test"
var table_name : String = "Kois"

func load_kois_from_db():
	db = SQLite.new()
	db.path = db_name
	db.verbose_mode = true
	# Open the database using the db_name found in the path variable
	db.open_db()
	
	# Select the id and age of the employees that are older than 30
	var select_condition : String = ""
	var selected_array : Array = db.select_rows(table_name, select_condition, ["*"])
	
	db.close_db()
	
	return selected_array


func load_kois_from_db_with_condition(condition : String):
	# Select the id and age of the employees that are older than 30
	db = SQLite.new()
	db.path = db_name
	db.verbose_mode = true
	# Open the database using the db_name found in the path variable
	db.open_db()
	

	var selected_array : Array = db.select_rows(table_name, condition, ["*"])
	
	db.close_db()
	
	return selected_array
	
