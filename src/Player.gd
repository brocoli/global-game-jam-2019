extends KinematicBody2D

export (bool) var is_inside_well = false
export (bool) var is_happy = false
var story_index = 0
var old_position_index = 0
var old_position_capacity = 100
var old_positions_x = Array()
var old_positions_y = Array()
var number_of_npcs = 5

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
	$Light2D.scale += Vector2(0.1,0.1)
	if amount_npcs_following >= number_of_npcs and is_inside_well:
		get_tree().change_scene("res://scenes/EndingDoor.tscn")
	return amount_npcs_following * 18

func is_stopped():
	return $Movement.velocity.length_squared() == 0
	
func set_looking_right():
	$PersonagemWalk.scale.x = 1
	
func set_looking_left():
	$PersonagemWalk.scale.x = -1
	
func play_move():
	if is_happy:
		$PersonagemWalk.play("andando_feliz")
	else:
		$PersonagemWalk.play()

func play_idle():
	if is_happy:
		$PersonagemWalk.play("feliz")
	else:
		$PersonagemWalk.stop()
