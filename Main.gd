extends Node

const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns");

var item_list = [];

func _ready() -> void:
	# Create new gdsqlite instance
	var db = SQLite.new();
	
	# Open item database
	if (!open_database(db, "res://databases/kois/items.db")):
		print("Failed opening database.");
		return;
	
	# Get item list from db
	var pots = db.fetch_array("SELECT * FROM potion ORDER BY id ASC")
	
	for pot in pots:
		# Create new item from database
		var item = {
			'id': pot['id'],
			'name': pot['name'],
			'price': pot['price'],
			'heals': pot['heals']
		};
		
		# Add to item list
		item_list.append(item);
	
	# Print all item
	for i in item_list:
		print("Item ", i.id, " (", i.name, ") $", i.price, " +", i.heals, "hp");

func open_database(db : SQLite, path : String) -> bool:
	if (path.begins_with("res://")):
		# Open packed database
		var file = File.new();
		if (file.open(path, file.READ) != OK):
			return false;
		var size = file.get_len();
		var buffers = file.get_buffer(size);
		return db.open_buffered(path, buffers, size);
	
	# Open database normally
	return db.open(path);
	


func _on_Timer_timeout():
	print("New fish will maybe come ..")
	#choose_a_koi()
	
