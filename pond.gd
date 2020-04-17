extends Node

var _pond : Array = []

class_name Pond

func _init():
	print("Pond initiated")


func add_koi_to_pond(koi : Koi):
	self._pond.append(koi)
	print("Appended following koi : ", koi)
	
func remove_koi_from_pond(koi):
	_pond.remove(koi)

func _ready():
	print("New pond instancied")
