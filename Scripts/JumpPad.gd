extends RigidBody2D


func _on_JumpPad_body_entered(body):
	print(str(name, " - ", body.name))
