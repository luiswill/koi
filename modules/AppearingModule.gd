extends Node

func choose_random_koi():
	print("New fish will maybe come ..")
	
	var random_koi = calculate_and_get_random_koi()
	if random_koi:
		print("Random Koi ", random_koi)
		var animationMove1_instance = load(GAME.koiVisitingAnimation).instance()
		GLOBAL.create_new_koi_instance_with_animation(random_koi, animationMove1_instance)
		check_if_koi_will_get_tamed(random_koi)
	else:
		print("Sorry bro, no koi")
		
		
		
		
func calculate_and_get_random_koi():
	var koiWillCome = GLOBAL.random_int(1, GAME.APPEARING_PROB)
	if koiWillCome == 1:
		var rarityChosen = GAME.rarityArr[randi() % GAME.rarityArr.size()]
		print("rarity chosen : ", rarityChosen)
		var koisToChooseFrom : Array = DBMODEL.convert_kois_from_db(DB.load_kois_from_db_with_condition("rarity == " + str(rarityChosen)))
		
		return koisToChooseFrom[randi() % koisToChooseFrom.size()]
		
	else:
		return false
		
func check_if_koi_will_get_tamed(koi : Koi): 
	
	var plants : Array = DBMODEL.which_plants_do_this_koi_like(koi)
	print("Koi likes theses plants ", plants)
	
	
