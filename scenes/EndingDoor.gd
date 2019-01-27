extends Node2D

var pog_max = 30
var pog = 0
var unpogged = false

func _ready():
	$YSort.get_node("NPCBlue/NPC").follow_the_player()
	$YSort.get_node("NPCYellow/NPC").follow_the_player()
	$YSort.get_node("NPCJourney/NPC").follow_the_player()
	$YSort.get_node("NPCRed/NPC").follow_the_player()

func _process(delta):
	if pog < pog_max:
		pog += 1
		var player = $YSort.get_node("Player")
		player.get_node("Movement").set_player_moving()
		player.move_and_slide(Vector2(1200,0))
	elif not unpogged:
		stop_blackout()
	else:
		unpogged = true

func stop_blackout():
	$PogBlackout.visible = false
	$YSort.get_node("Player").get_node("Movement").enable()