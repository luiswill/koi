extends Control

var carpeKoi = preload("res://scripts/Koi.gd").new(1, "Carpe Koi", 10, 1, 1)

func _ready():
#	load_ui_with_user_infos()
	
#	$topUI.connect("update_ui", self, "load_ui_with_user_infos")
	
	EVENTS.connect("updated_user", self, "_on_user_updated")
	
	
func _on_user_updated():
	load_ui_with_user_infos()
	
	

func load_ui_with_user_infos():
	$topUI/money.text = str	(GAME.currency + str(GLOBAL.user.get_money()))
	$topUI/LevelScene/level.text = str(GLOBAL.user.get_level())
	$topUI/experience.value = GLOBAL.user.get_experience()
	$topUI/experience.max_value = GAME.LEVEL_XPS[GLOBAL.user.get_level()]
	
func _process(delta):
	if Input.is_key_pressed(KEY_S):
		show_shop()
		
	if Input.is_key_pressed(KEY_ESCAPE):
		hide_shop()

func _on_Button_pressed():
	GLOBAL.buy_fish(carpeKoi)


func _on_buttonShop_pressed():
	show_shop()
	
	
func show_shop():
	$shop.show()
	$returnButton.show()
	
	$mainButtons.hide()


func hide_shop():
	$shop.hide()
	$returnButton.hide()
	
	$mainButtons.show()

func _on_returnButton_pressed():
	hide_shop()
	
	
