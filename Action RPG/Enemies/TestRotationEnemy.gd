extends KinematicBody2D

export(int) var SPEED_NEAR = 5
export(int) var SPEED_NORMAL = 50
export(int) var SPEED_FAR = 100
export(float) var ACCLERATION = 0.02

var Player = preload("res://Player/Player.tscn")
onready var animatedSprite = $AnimatedSprite
onready var playerNear = $PlayerNear
onready var playerMiddle = $PlayerMiddle
var direction = Vector2.ZERO
var speed = SPEED_NEAR
var path = null

func _physics_process(delta):
	if get_node("../Player") != null:
		var player = get_node("../Player")
#		rotation = global_position.direction_to(player_node.global_position).angle()
		
#		sprite.flip_h = player.global_position < global_position
		animatedSprite.flip_h = player.global_position < global_position
		direction = global_position.direction_to(player.global_position)
		direction = direction.normalized()
		if playerNear.can_see_player():
			speed = lerp(speed, SPEED_NEAR, ACCLERATION)
			animatedSprite.set_speed_scale(1)
		elif playerMiddle.can_see_player() and not playerNear.can_see_player():
			speed = lerp(speed, SPEED_NORMAL, ACCLERATION)
			animatedSprite.set_speed_scale(1.5)
		else:
			speed = lerp(speed, SPEED_FAR, ACCLERATION)
			animatedSprite.set_speed_scale(2)
			
		
		move_and_slide(direction * speed, Vector2.ZERO, false, 10, deg2rad(90), true)
		
