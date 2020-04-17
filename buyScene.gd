extends Control



var carpeKoi = preload("Koi.gd").new("Carpe Koi", 10, 1, 1, 0)

func _ready():
	pass



func _on_Button_pressed():
	
	GLOBAL.buy_fish(carpeKoi)
	update_money()
	
func update_money():
	get_node("Label").text = str(GLOBAL.user.get_money())
