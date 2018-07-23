extends Node2D

export(int) var starting_lives = 3
export(int) var coin_target = 3

var lives
var coins = 0
var life_up_repeat = 5

func _ready():
	Global.GameState = self
	if OS.get_name() == "HTML5":
		OS.set_window_maximized(true)
	lives = starting_lives
	update_GUI()


func update_GUI():
	Global.GUI.update_GUI(coins, lives)


func hurt():
	if Global.Player.can_be_hurt:
		Global.Player.hurt()
		lives -= 1
		if lives < 0:
			end_game()
		else:
			update_GUI()


func end_game():
	get_tree().change_scene(Global.GameOver)


func _on_Player_player_died():
	end_game()


func coin_up():
	coins += 1
	if coins % coin_target == 0:
		life_up()
	update_GUI()


func life_up():
	lives += 1
	$LifeUpPlayer.play()
	update_GUI()


func screenshot():
	# start screen capture
	get_viewport().queue_screen_capture()
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	
	# get screen capture
	var capture = get_viewport().get_screen_capture()
	# save to a file
	capture.save_png("user://screenshot.png")