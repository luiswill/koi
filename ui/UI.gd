extends Control

var carpeKoi = preload("res://Koi.gd").new(1, "Carpe Koi", 10, 1, 1)

func _ready():
	pass

func _on_Button_pressed():
	GLOBAL.buy_fish(carpeKoi)
	update_money()
	
func update_money():
	$money.text = str("$" + GLOBAL.user.get_money())
	


func _on_buttonShop_pressed():
	$shop.show()
	$returnButton.show()
	
	$mainButtons.hide()


func _on_returnButton_pressed():
	$shop.hide()
	$returnButton.hide()
	
	$mainButtons.show()
