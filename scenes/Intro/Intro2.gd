extends AnimatedSprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	play()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_AnimatedSprite_animation_finished():
	$Timer.start()
	yield($Timer, "timeout")
	get_tree().change_scene("res://scenes/Main.tscn")
