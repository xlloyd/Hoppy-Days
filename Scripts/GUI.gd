extends CanvasLayer

func _ready():
	Global.GUI = self


func update_GUI(coins, lives):
	if int($Banner/HBoxContainer/CoinCount.text) < coins:
		$CoinIconAnimationPlayer.play("CoinPulse")
	if int($Banner/HBoxContainer/LifeCount.text) > lives:
		$LifeIconAnimationPlayer.play("BunnyHurt")
	elif int($Banner/HBoxContainer/LifeCount.text) < lives:
		$LifeIconAnimationPlayer.play("GainLife")
		
	$Banner/HBoxContainer/CoinCount.text = str(coins)
	$Banner/HBoxContainer/LifeCount.text = str(lives)