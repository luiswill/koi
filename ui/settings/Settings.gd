extends Control

func _ready():
	pass


func _on_creditButton_pressed():
	get_tree().change_scene("")

func _on_buttonShop_pressed():
	show_shop()
	
func show_shop():
	$shop.show()
	$returnShopButton.show()
	
	$mainButtons.hide()

func _on_returnShopButton_pressed():
	hide_shop()
	
func hide_shop():
	$shop.hide()
	$returnShopButton.hide()
	
	$mainButtons.show()
