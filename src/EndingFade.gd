extends ColorRect

func _ready():
	$Tween.interpolate_property(
		self, "color",
		Color(0,0,0,0), Color(0,0,0,1),
		4,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT,
		6)
	$Tween.start()
	yield($Tween, "tween_completed")
	get_tree().change_scene("res://scenes/Ending/Ending.tscn")