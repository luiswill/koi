extends Node



func check_if_koi_will_come_visit_pond():
	print("New fish will maybe come ..")
	
	var random_koi = calculate_and_get_random_koi()
	if random_koi:
		print("Random Koi ", random_koi)
		var animation_instance : AnimationPlayer = load(GAME.koi_visiting_animation).instance()
		GLOBAL.create_new_koi_instance_with_animation(random_koi, animation_instance)
		
		
		
		if check_if_koi_will_get_tamed(random_koi):	
			print("Koi will get tamed.")
			taming_process(random_koi)
		else:
			print("Koi will not get tamed.")
			
		
		
	else:
		print("Sorry bro, no koi")
		
		
		
func play_next_anim(): 
	print("PLAYING ANIM!")
	
func calculate_and_get_random_koi():
	if koi_will_come():
		var rarityChosen = choose_rarity()
		print("Koi will appear of rarity : ", rarityChosen)
		var kois : Array = DBMODEL.get_all_kois_of_rarity(rarityChosen)
		
		return kois[randi() % kois.size()]
	else:
		return false
		
func check_if_koi_will_get_tamed(koi : Koi): 
	var plants : Array = DBMODEL.which_plants_do_this_koi_like(koi)
	print("Koi likes theses plants ", plants)
	return check_if_koi_stays_in_pond_with(plants)
	
	
	
func check_if_koi_stays_in_pond_with(plants_he_likes : Array):
	print("Let's check if the pond already has these plants")
	var probability_of_being_tamed : int = GAME.STARTING_PROBABILITY_OF_BEING_TAMED
	
	for plant in plants_he_likes: 
		if plant in POND.get_arr_of_kois_in_pond():
			print("Plant that he likes is in the pond : ", plant.get_name())
			print("Adding probabilty that he gets tamed : +", GAME.PROBABILITY_ADDED_TO_GET_TAMED_IF_PLANT_EXISTS)
			probability_of_being_tamed += GAME.PROBABILITY_ADDED_TO_GET_TAMED_IF_PLANT_EXISTS
			
	return GLOBAL.random_int(1, 100) <= probability_of_being_tamed

func taming_process(koi : Koi):
	POND.add_koi_to_pond(koi) # don't forget
	var animation_taming : AnimationPlayer = load(GAME.koi_taming_animation).instance()
	GLOBAL.add_animation_to_koi(animation_taming, koi)
	
func koi_will_come():
	return GLOBAL.random_int(1, 100) <= GAME.PROB_APPEARING
	
func choose_rarity():
	var random_int = GLOBAL.random_int(1, 100)
	
	if random_int <= GAME.PROB_1:
		return 1
	if random_int <= GAME.PROB_2:
		return 2
	if random_int <= GAME.PROB_3:
		return 3
	if random_int <= GAME.PROB_4:
		return 4
	if random_int <= GAME.PROB_5:
		return 5
		
	
	
	
	
	
	
	
