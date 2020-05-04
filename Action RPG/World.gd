extends Node2D

onready var navi = $Navigation2D
onready var lulu = $YSort/TestRotation
onready var player = $Ysort/Player

var player_position = Vector2.ZERO



func _on_Player_player_moved(value):
	if lulu == null:
		return
	player_position = value
	var new_path = navi.get_simple_path(lulu.global_position, player_position)
	lulu.path = new_path
	
