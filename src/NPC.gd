extends Node

var is_following_player = false
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if is_following_player:
		var player = get_tree().get_nodes_in_group("player")[0]
		var parent = get_parent()
		parent.position.x = player.x
		parent.position.y = player.y

func _on_Area2D_body_entered(body):
	if not is_following_player and body.is_in_group("player"):
		is_following_player = true
