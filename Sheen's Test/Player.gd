extends KinematicBody2D

const MAXSPEED = 80
const ACC = 500
const FRICTION = 650

onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")


var velocity = Vector2.ZERO

func _process(delta):
	var input_speed = Vector2.ZERO
	input_speed.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_speed.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_speed = input_speed.normalized()
	if input_speed != Vector2.ZERO:
		animationTree.set("parameters/Walk/blend_position", input_speed)
		animationTree.set("parameters/Idle/blend_position", input_speed)
		animationState.travel("Walk")
		velocity = velocity.move_toward(input_speed * MAXSPEED, ACC * delta)
		
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	
	
	velocity = move_and_slide(velocity)
