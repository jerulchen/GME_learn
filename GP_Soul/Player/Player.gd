extends KinematicBody2D

export(int) var max_speed = 100
export(int) var acceleration = 500
export(float) var friction = 0.2
export(int) var MAX_SLOPE_ANGLE = 45
export(int) var gravity = 200

onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

var motion = Vector2.ZERO
var snap_vector = Vector2.ZERO

func _ready():
	 animationTree.active = true

func _physics_process(delta):
	var input_vector = get_input_vector()
	apply_animation(input_vector)
	apply_h_move_force(input_vector, delta)
	apply_gravity(delta)
	apply_friction(input_vector)
	apply_snap_vector()
	move()

func apply_animation(input_vector):
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationState.travel("Run")
	else:
		animationState.travel("Idle")

func get_input_vector():
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	return input_vector

func apply_h_move_force(input_vector, delta):
	if input_vector.x != 0:
		motion.x += input_vector.x * acceleration * delta
		motion.x = clamp(motion.x, -max_speed, max_speed)

func apply_gravity(delta):
	if not is_on_floor():
		motion.y += gravity * delta
		#这里以后加一个max/min限制（如果有跳跃的话）

func apply_friction(input_vector):
	if input_vector.x == 0 and is_on_floor():
		motion.x = lerp(motion.x, 0, friction)

func apply_snap_vector():
	if is_on_floor():
		snap_vector = Vector2.DOWN
		

func move():
	motion = move_and_slide_with_snap(motion, snap_vector * 4, Vector2.UP, true, 4, deg2rad(MAX_SLOPE_ANGLE))
	
