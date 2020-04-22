extends Node

const KoiClass = preload("res://scripts/Koi.gd")
const PlantClass = preload("res://scripts/Plant.gd")
const UserClass = preload("res://scripts/user.gd")




func which_plants_do_this_koi_like(koi : Koi) -> Array:
	var kois_likes_theses_plants_ids : Array =  []
	
	for koi_plant_attraction in GLOBAL.all_kois_plants_attractions:
		if koi_plant_attraction.koiId == koi.get_id():
			kois_likes_theses_plants_ids.append(koi_plant_attraction.plantId)
			
		
	return get_plants_from_ids(kois_likes_theses_plants_ids)


func get_plants_from_ids(plants_ids : Array) -> Array:
	var plants : Array = []	
	
	for plant_id in plants_ids:
		plants.append(GLOBAL.all_plants[plant_id - 1 ])
		
	return plants

func get_all_kois_of_rarity(rarity : int):
	return DB.get_all_kois_with_condition("rarity",  rarity)


