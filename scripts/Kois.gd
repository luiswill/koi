extends Node

var all_kois : Array = []


func get_all_kois_of_rarity(rarity : int):
	return get_all_kois_with_condition("rarity",  rarity)

func get_all_kois_with_condition(property_name : String, condition):
	var kois_to_return : Array = []
	for koi in GLOBAL.all_kois:
		if koi[property_name] == condition:
			kois_to_return.append(koi)
		
	return kois_to_return
	
	
