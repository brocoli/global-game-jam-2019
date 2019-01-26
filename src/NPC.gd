extends Node

var is_following_player = false
var playerDistX = 0
var playerDistY = 0

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if is_following_player:
		var player = get_player()
		var parent = get_parent()
		parent.position.x = player.position.x - playerDistX
		parent.position.y = player.position.y - playerDistY

func get_player():
	return get_tree().get_nodes_in_group("player")[0]

func _on_Area2D_body_entered(body):
	if not is_following_player and body.is_in_group("player"):
		is_following_player = true
		var player = get_player()
		var parent = get_parent()
		playerDistX = player.position.x - parent.position.x
		playerDistY = player.position.y - parent.position.y

