extends Node2D

export (bool) var broken = false
export (bool) var crushed = false
export (int) var rotation_speed = 10 # In degrees per frame

export (NodePath) onready var target

func _ready(): pass

func _process(delta):
	if crushed:
		if $Needle.visible or $Body.visible:
			$Crushed.visible = true
			$Needle.visible = false
			$Body.visible = false
	elif broken:
		if not $Needle.visible or not $Body.visible:
			$Needle.visible = true
			$Body.visible = true
		if $Crushed.visible:
			$Crushed.visible = false
		$Needle.rotation_degrees += rotation_speed * delta
	else:
		if target:
			var target_position = get_node(target).position
			var target_vector = Vector2(target_position.x, target_position.y)
			$Needle.look_at(target_vector)
		else:
			pass