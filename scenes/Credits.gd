extends Control

var is_creditos_1 = true

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if is_creditos_1:
			$creditos1.visible = false
			$creditos2.visible = true
			is_creditos_1 = false
		else:
			get_tree().change_scene("res://scenes/Menu.tscn")
