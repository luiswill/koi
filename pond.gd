extends Node

var _pond_kois : Array = []
var _pond_plants : Array = []

var plant = preload("Plant.gd").new(1, "Brennes", 10, 1)
var plant2 = preload("Plant.gd").new(2, "Brennes2", 10, 1)


class_name Pond

func _init():
	print("Pond initiated")
	
	self._pond_plants.append(plant)
	self._pond_plants.append(plant2)
	
	
func get_arr_of_kois_in_pond():
	return self._pond_kois
	
func get_arr_of_plants_in_pond():
	return self._pond_plants
	
func add_koi_to_pond(koi : Koi):
	print("Added following koi to pond : ", koi)
	self._pond_kois.append(koi)
	
func remove_koi_from_pond(koi):
	pass
	
func add_plant_to_pond(plant : Plant):
	self._pond_plants.append(plant)
	print("Appended following plant : ", plant)
	
func remove_plant_from_pond(plant: Plant):
	pass

func _ready():
	print("New pond instancied")
