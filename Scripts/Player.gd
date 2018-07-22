extends KinematicBody2D

signal player_died

const SPEED = 800
const GRAVITY = 5000
const UP = Vector2(0,-1)
const JUMP_SPEED = -1600
const JUMP_BOOST = 2

var motion = Vector2()
var can_be_hurt = true
export var world_limit = 1250


func _ready():
	Global.Player = self


func _physics_process(delta):
	restart()
	update_motion(delta)


func update_motion(delta):
	fall(delta)
	run()
	jump()
	move_and_slide(motion, UP)


func _process(delta):
	update_animation(motion)


func update_animation(motion):
	$AnimatedSprite.update(motion)


func fall(delta):
	if is_on_floor() or is_on_ceiling():
		motion.y = 0
	else:
		motion.y += GRAVITY * delta
	
	if position.y > world_limit:
		emit_signal("player_died")


func run():
	if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		motion.x = -SPEED
	else:
		motion.x = 0


func jump():
	if Input.is_action_pressed("ui_up") and is_on_floor():
		$JumpAudio.play()
		motion.y = JUMP_SPEED


func boost():
	motion.y = JUMP_SPEED * JUMP_BOOST


func restart():
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().reload_current_scene()


func hurt():
	motion.y = JUMP_SPEED
	$AnimationPlayer.play("hurt_flash")
	$PainAudio.play()
	can_be_hurt = false
	$HurtTimer.start()


func _on_HurtTimer_timeout():
	can_be_hurt = true
	$PainAudio.stop()