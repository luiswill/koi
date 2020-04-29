extends Node

export var MIN_SPAWN_X = -10
export var MAX_SPAWN_X = 10

export var MIN_SPAWN_Z = -10
export var MAX_SPAWN_Z = 10


func _on_Timer_timeout():
	instance_new_algae()


func instance_new_algae():
	var algae = load("res://scenes/Plants/Algae/AlgaDamp/AlgaDampScene.tscn").instance()
	
	print("Algae name is ", algae.get_plant_name())
	var random_x = GLOBAL.random_int(MIN_SPAWN_X, MAX_SPAWN_X)
	var random_z = GLOBAL.random_int(MIN_SPAWN_Z, MAX_SPAWN_Z)
	
	var random_position : Vector3 = Vector3(random_x, 0, random_z)
	algae.translation = random_position
	add_child(algae)
	
