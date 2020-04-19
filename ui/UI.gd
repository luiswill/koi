extends Control

var carpeKoi = preload("res://Koi.gd").new(1, "Carpe Koi", 10, 1, 1)

func _ready():
	load_ui_with_user_infos()


func load_ui_with_user_infos():
	$topUI/money.text = str(GAME.currency + str(GLOBAL.user.get_money()))
	$topUI/LevelScene/level.text = str(GLOBAL.user.get_level())
	
func _on_Button_pressed():
	GLOBAL.buy_fish(carpeKoi)
	update_money()
	
func update_money():
	$money.text = str(GAME.currency + GLOBAL.user.get_money())


func _on_buttonShop_pressed():
	$shop.show()
	$returnButton.show()
	
	$mainButtons.hide()


func _on_returnButton_pressed():
	$shop.hide()
	$returnButton.hide()
	
	$mainButtons.show()
