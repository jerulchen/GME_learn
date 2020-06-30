extends Node2D

const WORLD = preload("res://World.gd")

func _ready():
	var parrent = get_parent()
	if parrent is  WORLD:
		parrent.currentLevel = self
