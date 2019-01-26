extends Light2D

var flick = 0

func _ready():
	pass

func _on_Timer_timeout():
	if flick == 0:
		scale += Vector2(0.003, 0.003)
		$Timer.start()
		flick = 1
	elif flick == 1:
		scale += Vector2(-0.003, -0.003)
		$Timer.start()
		flick = 0