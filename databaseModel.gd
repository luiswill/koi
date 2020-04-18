extends Node

const KoiClass = preload("Koi.gd")
const PlantClass = preload("Plant.gd")

func convert_kois_from_db(koisData : Array):
	var kois : Array = []
	
	for koi in koisData:
		kois.append(convert_to_koi(koi))
	return kois
		
		
func convert_plants_from_db(plants_data : Array):
	var plants : Array = []
	
	for plant in plants_data:
		plants.append(convert_to_plant(plant))
	return plants
		

func convert_to_koi(koiData):
	var koi = KoiClass.new(koiData.id, koiData.name, koiData.price, koiData.speed, koiData.rarity)
	return koi

func convert_to_plant(plant_data):
	var plant = Plant.new(plant_data.id, plant_data.name, plant_data.price, plant_data.rarity)
	return plant

func which_plants_do_this_koi_like(koi : Koi):
	var plants : Array = DBMODEL.convert_plants_from_db(DB.load_plant_attractions_of_koi(koi))
	
	return plants
	
