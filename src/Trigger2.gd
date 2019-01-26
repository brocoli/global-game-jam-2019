extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Trigger2_body_entered(body):
	if body.is_in_group("player") and body.story_index == 1:
		body.story_index = 2
		get_tree().change_scene("res://scenes/FallingInWell.tscn")
