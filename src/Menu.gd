extends Control

func _ready():
	$PlayButton.grab_focus()


func _on_PlayButton_pressed():
	get_tree().change_scene("res://scenes/Intro/Intro1.tscn")


func _on_CreditsButton_pressed():
	get_tree().change_scene("res://scenes/Credits.tscn")

func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		$Dinger.play()
	if Input.is_action_just_pressed("ui_down"):
		$Dinger.play()