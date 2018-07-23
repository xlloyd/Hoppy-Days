extends AnimatedSprite

func update_animation(motion):
	if motion.y < 0:
		flip_h = false
		play("jump")
	elif motion.x > 0:
		flip_h = false
		play("run")
	elif motion.x < 0:
		flip_h = true
		play("run")
	else:
		flip_h = false
		play("idle")