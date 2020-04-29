extends Spatial

export var id : int
export var plant_name : String
export var price : int
export var rarity : int
export var sceneUrl : String
export var animation_speed = 1


func get_plant_name():
	return plant_name
	
func set_plant_name(newName: String):
	plant_name = newName
	
func get_price(): 
	return price;
	
func set_price(newPrice: int):
	price = newPrice
	
	
func get_sceneUrl():
	return sceneUrl;
	
func set_sceneUrl(newSceneUrl : String): 
	sceneUrl = newSceneUrl
	
func _to_string():
	var s = "(" + plant_name + ") : " + str(price) + GAME.currency
	return s
	


func _on_StaticBody_input_event():
	print("STATIC body input PLant Template")


func _on_Area_input_event(camera, event, click_position, click_normal, shape_idx):
	if Input.is_action_just_pressed("mouse_left_click"):
		print("Mouse left click Area PlantTemplate")
		$AnimationPlayer.play("ClickedPlantEffect")
		
