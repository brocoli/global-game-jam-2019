extends AnimatedSprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	play()
	$AnimationTimer.start()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Timer_timeout():
	play("floor")
	$NextSceneTimer.start()


func _on_NextSceneTimer_timeout():
		get_tree().change_scene("res://scenes/InsideWell.tscn")
