extends StaticBody2D

func _ready():
	$IdleCollisionShape2D.disabled = false
	$ExtendedCollisionShape2D.disabled = true
	$AnimatedSprite.play("Idle")


func _on_JumpArea2D_body_entered(body):
	body.boost()
	$ExtendedCollisionShape2D.disabled = false
	$IdleCollisionShape2D.disabled = true
	$AnimatedSprite.play("Extended")
	$AudioStreamPlayer.play()
	$Timer.start()


func _on_Timer_timeout():
	_ready()
