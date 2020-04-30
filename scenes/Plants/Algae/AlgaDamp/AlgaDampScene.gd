extends "res://scenes/Plants/Algae/AlgaeTemplate.gd"



func _ready():
	print(get_plant_name() + " is ready.")


func _on_Area_input_event(camera, event, click_position, click_normal, shape_idx):
	if Input.is_action_pressed("mouse_left_click"):
		._on_Area_input_event(camera, event, click_position, click_normal, shape_idx)
	
