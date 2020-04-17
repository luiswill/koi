extends Node

const KoiClass = preload("Koi.gd")

func convert_kois_from_db(koisData : Array):
	var kois : Array = []
	
	for koi in koisData:
		kois.append(convert_to_koi(koi))
	return kois
		


func convert_to_koi(koiData):
	var koi = KoiClass.new(koiData.id, koiData.name, koiData.price, koiData.speed, koiData.rarity)
	return koi
