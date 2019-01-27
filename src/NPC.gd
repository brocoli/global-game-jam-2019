extends Node

var player_position_history_offset = 1
var is_following_player = false

func _ready():
	pass

func _process(delta):
	if is_following_player:
		var player = get_player()
		if not player.is_stopped():
			var parent = get_parent()
			parent.position.x = player.get_old_position_x(player_position_history_offset)
			parent.position.y = player.get_old_position_y(player_position_history_offset)

func get_player():
	return get_tree().get_nodes_in_group("player")[0]

func _on_Area2D_body_entered(body):
	if not is_following_player and body.is_in_group("player"):
		follow_the_player()

func follow_the_player():
	if not is_following_player:
		is_following_player = true
		var player = get_player()
		player_position_history_offset = player.add_player_following()
		$Compass.target = player.get_path()
		$Compass.broken = false
