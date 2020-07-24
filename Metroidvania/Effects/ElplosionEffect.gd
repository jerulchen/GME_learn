extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	SoundFx.play("Explosion", rand_range(0.6, 1.0))
