extends Control

var level = 0

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if level == 0:
			$creditos1.visible = false
			$creditos2.visible = true
			$creditos3.visible = false
			level += 1
		elif level == 1:
			$creditos1.visible = false
			$creditos2.visible = false
			$creditos3.visible = true
			level += 1
		else:
			get_tree().change_scene("res://scenes/Menu.tscn")
