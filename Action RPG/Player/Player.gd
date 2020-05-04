extends KinematicBody2D

export var MAX_SPEED = 80
export var ACCELERATION = 600
export var FRICTION = 500
export var ROLL_SPEED = 115

signal player_moved(value)

enum {
	MOVE,
	ROLL,
	ATTACK
}

var state = MOVE
var velocity = Vector2.ZERO
var roll_vector = Vector2.LEFT
var stats = PlayerStats

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback") #获取动画的播放状态（注意，不是数值，还是类似对象的东西）
onready var swordHitbox = $HitboxPivot/SwordHitbox
onready var hurtbox = $Hurtbox

func _ready():
	randomize()
	stats.connect("no_health", self, "queue_free")
	animationTree.active = true  #方便调试动画，否则就需要在编辑器里设置active，这样编辑动画就会锁定帧
	swordHitbox.knockback_vector = roll_vector
	

func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
		
		ROLL:
			roll_state(delta)
			
		ATTACK:
			attack_state(delta)
	
	

func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")  #get_action_strength可以获取0~1的方向值
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized() #标准化矢量，半径统一为1（避免斜方向较长）
#	print(input_vector)
	
	if input_vector != Vector2.ZERO:  #移动中状态判断——矢量不等于ZERO
		roll_vector = input_vector
		swordHitbox.knockback_vector = input_vector
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		animationTree.set("parameters/Roll/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)  #类似lerp，让矢量以b的每帧速度靠近a
		#		velocity += input_vector * ACCELERATION * delta
	
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta) #用这个方式做摩擦力惯性效果
	
	move()
	
	if Input.is_action_just_pressed("attack"):
		state = ATTACK
	if Input.is_action_just_pressed("roll"):
		state = ROLL

func attack_state(delta):
	velocity = Vector2.ZERO
	animationState.travel("Attack")

func move():
	velocity = move_and_slide(velocity)  #move_and_slide进行时可以返回速度值，用返回的速度值重新赋值，放置边角抖动
	emit_signal("player_moved", global_position)

func roll_state(delta):
	velocity = roll_vector * ROLL_SPEED
	animationState.travel("Roll")
	move()

func roll_animation_finished():
	velocity *= 0.8
	state = MOVE

func attack_animation_finished():
	state = MOVE







func _on_Hurtbox_hit(damage, knockback_vector):
	stats.health -= damage
	hurtbox.start_invincibility(0.5)
	hurtbox.create_hit_effect()
