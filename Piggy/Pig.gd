extends Area2D

#const SPEED = 100
export(int) var SPEED = 50
var moving = false

onready var animationPlayer = $AnimationPlayer
onready var sprite = $Sprite

#func _ready():
#	pass

func _process(delta):
	moving = false
	
	if Input.is_action_pressed("ui_right"):
		move(SPEED, 0, delta)
		sprite.flip_h = false
	if Input.is_action_pressed("ui_left"):
		move(-SPEED, 0, delta)
		sprite.flip_h = true
	if Input.is_action_pressed("ui_up"):
		move(0, -SPEED, delta)
	if Input.is_action_pressed("ui_down"):
		move(0, SPEED, delta)
	
	if moving == true:
		animationPlayer.play("Run")
	else:
		animationPlayer.play("Idle")
		
#	var areas = get_overlapping_areas() #返回所有碰撞的nodeid，array1d类型
#	for area in areas:
#		area.queue_free()

func move(xspeed, yspeed, delta):
	position.x += xspeed * delta
	position.y += yspeed * delta
	
	moving = true


func _on_Pig_area_entered(area):
	area.queue_free()
	scale *= 1.1
