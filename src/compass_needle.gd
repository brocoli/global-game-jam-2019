extends Node2D

export (bool) var broken = false
export (int) var rotation_speed = 10 # In degrees per frame

export (NodePath) onready var target

func _ready(): pass

func _process(delta):
	if broken:
		$Needle.rotation_degrees += rotation_speed * delta
	else:
		if target:
			var target_position = get_node(target).position
			var target_vector = Vector2(target_position.x, target_position.y)
			$Needle.look_at(target_vector)
		else:
			pass