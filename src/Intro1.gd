extends Sprite

func _ready():
	$Tween.interpolate_property(
		self, "position",
		position, Vector2(position) - Vector2(524.549,0),
		4,
		Tween.TRANS_SINE, Tween.EASE_IN_OUT,
		2)
	$Tween.start()
	yield($Tween, "tween_completed")
	$Timer.start()
	yield($Timer, "timeout")
	get_tree().change_scene("res://scenes/Intro/Intro2.tscn")

func _on_Tween_tween_completed(object, key):
	pass # replace with function body
