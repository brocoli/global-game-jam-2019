extends AnimatedSprite

func _ready():
	$AudioStreamPlayer.seek(10)
	$Timer.start()
	yield($Timer, "timeout")
	$Timer.start()
	yield($Timer, "timeout")
	play("1")
	$Timer.start()
	yield($Timer, "timeout")
	play("2")
	$Timer.start()
	yield($Timer, "timeout")
	play("3")
	$Timer.start()
	yield($Timer, "timeout")
	play("4")
	$Timer.start()
	yield($Timer, "timeout")
	play("1")
	$Timer.start()
	yield($Timer, "timeout")
	$Timer.start()
	yield($Timer, "timeout")
	get_tree().change_scene("res://scenes/Credits.tscn")
