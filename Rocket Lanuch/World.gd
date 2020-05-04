extends Node2D

#onready var animationPlayer = get_node("AnimationPlayer")
#equal to 
onready var animationPlayer : AnimationPlayer = $AnimationPlayer

#func _ready():
#	animationPlayer.play("Launch")


func _on_LaunchButton_pressed():
	animationPlayer.play("Launch")
