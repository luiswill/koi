extends Node

var user = preload("user.gd").new(1000)
var pond = preload("pond.gd").new()


func _ready():
	pass
	
	
func buy_fish(koi: Koi):
	user.decrease_money(koi.get_price())
	pond.add_koi_to_pond(koi)
