extends RigidBody2D

func _ready():
	$AnimationPlayer.play("idle")


func _on_AnimationPlayer_animation_finished(anim_name):
	$AnimationPlayer.play(anim_name)
	set_position(get_position())
