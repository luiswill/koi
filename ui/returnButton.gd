extends Button

export var path = ""

func _ready():
	pass

func _on_returnButton_pressed():
	get_tree().change_scene(path)
