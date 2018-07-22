extends Control

func _ready():
	pass


func _on_TryAgain_pressed():
	get_tree().change_scene("res://Scenes/Level1.tscn")
