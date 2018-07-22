extends RigidBody2D

var JumpPad_collision_shape_settings = [
		{"animation_name": "Idle", "animation_frame": 0, "position":Vector2(0,27), "extents": Vector2(74,28)},
		{"animation_name": "Idle", "animation_frame": 1, "position":Vector2(0,17), "extents": Vector2(74,38)},
		{"animation_name": "Extended", "animation_frame": 0, "position":Vector2(0,0), "extents": Vector2(74,55)}]

func _ready():
	$JumpArea2D/CollisionShape2D.disabled = false
	$AnimatedSprite.play("Idle")


func _on_JumpArea2D_body_entered(body):
	print(body.name)
	if body == Global.Player:
		body.boost()
		$AnimatedSprite.play("Extended")
		$JumpArea2D/CollisionShape2D.disabled = true
		$Timer.start()


func _on_AnimatedSprite_frame_changed():
	for i in JumpPad_collision_shape_settings:
		if $AnimatedSprite.animation == i.animation_name and $AnimatedSprite.frame == i.animation_frame:
			$CollisionShape2D.set_position(i.position)
			$CollisionShape2D.get_shape().set_extents(i.extents)


func _on_Timer_timeout():
	$JumpArea2D/CollisionShape2D.disabled = false
	$AnimatedSprite.play("Idle")
