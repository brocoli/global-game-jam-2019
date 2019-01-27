extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var fade = get_node("FGs/ColorRect")
	var tween = fade.get_node("Tween")
	tween.interpolate_property()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
