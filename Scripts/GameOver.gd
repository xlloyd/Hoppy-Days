extends Control


func _on_TryAgain_pressed():
	get_tree().change_scene(Global.Level1)


func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		_on_TryAgain_pressed()