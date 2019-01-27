extends AudioStreamPlayer

func _ready():
	pass


func _on_SoundTimer_timeout():
	play()
	$FufufufuSound.stop()