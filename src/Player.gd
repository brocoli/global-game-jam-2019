extends KinematicBody2D

export (bool) var is_inside_well = false
var story_index = 0
var old_position_index = 0
var old_position_capacity = 20
var old_positions_x = Array()
var old_positions_y = Array()

var amount_npcs_following = 0

func _ready():
	for i in range(old_position_capacity):
		old_positions_x.append(position.x)
		old_positions_y.append(position.y)

func _process(delta):
	if not is_stopped():
		old_positions_x[old_position_index] = position.x
		old_positions_y[old_position_index] = position.y
		old_position_index = (old_position_index + 1) % old_position_capacity

func get_old_position_x(old_position_history_offset):
	return old_positions_x[(old_position_index - old_position_history_offset) % old_position_capacity]
	
func get_old_position_y(old_position_history_offset):
	return old_positions_y[(old_position_index - old_position_history_offset) % old_position_capacity]

func add_player_following():
	amount_npcs_following += 1
	if amount_npcs_following >= 4 and is_inside_well:
		get_tree().change_scene("res://scenes/EndingDoor.tscn")
	return amount_npcs_following * 4

func is_stopped():
	return $Movement.velocity.length_squared() == 0
	
func set_looking_right():
	$PersonagemWalk.scale.x = 1
	
func set_looking_left():
	$PersonagemWalk.scale.x = -1
	
func play_move():
	$PersonagemWalk.play()

func play_idle():
	$PersonagemWalk.stop()
