extends Node

export (int) var movement_speed = 250
export (bool) var enabled = true

var velocity = Vector2()

func get_input():
	var parent = get_parent()
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
		parent.set_looking_right()
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
		parent.set_looking_left()
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	velocity = velocity.normalized() * movement_speed
	
	if velocity.length_squared() == 0:
		get_parent().play_idle()
	else:
		get_parent().play_move()

func _physics_process(delta):
	if enabled:
		get_input()
		get_parent().move_and_slide(velocity)

func enable():
	enabled = true

func set_player_moving():
	velocity = Vector2(1,1)
