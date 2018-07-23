extends AnimatedSprite


func _ready():
	randomize()
	$AudioStreamPlayer.pitch_scale += rand_range(-0.5, 0.5)
	play("default")
	
func _on_Area2D_body_entered(body):
	Global.GameState.coin_up()
	$AnimationPlayer.play("Die")
	$AudioStreamPlayer.play()


func die():
	queue_free()