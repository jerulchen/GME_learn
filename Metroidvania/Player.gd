extends KinematicBody2D

const DustParticle = preload("res://Effects/DustEffect.tscn")
const PlayerBullet = preload("res://Player/PlayerBullet.tscn")
const JumpEffect = preload("res://Effects/JumpEffect.tscn")
const WallDustEffect = preload("res://Effects/WallDustEffect.tscn")
const PlayerMissile = preload("res://Player/PlayerMissile.tscn")

var PlayerStats = ResourceLoader.PlayerStats
var MainInstances = ResourceLoader.MainInstances


export(int) var ACCELERATION = 512
export(int) var MAX_SPEED = 64
export(float) var FRICTION = 0.25
export(int) var GRAVITY = 200
export(int) var JUMP_FORCE = 128
export(int) var MAX_SLOPE_ANGLE = 46
export(int) var BULLET_SPEED = 250
export(int) var MISSILE_BULLET_SPEED = 150
export(int) var WALL_SLIDE_SPEED = 48
export(int) var MAX_WALL_SLIDE_SPEED = 128


enum{
	MOVE,
	WALL_SLIDE
}

var state = MOVE


var invincible = false setget set_invincible #用于角色受到伤害后，无敌一段时间
var motion = Vector2.ZERO
var snap_vector = Vector2.ZERO
var just_jumped = false
var double_jump = true

onready var sprite = $Sprite
onready var spriteAnimator = $SpriteAnimator
onready var coyoteJumpTimer = $CoyoteJumpTimer
onready var muzzle = $Sprite/PlayerGun/Sprite/Muzzle
onready var gun = $Sprite/PlayerGun
onready var fireBulletTimer = $FireBulletTimer
onready var BlinkAnimator = $BlinkAnimator

func set_invincible(value):
	invincible = value
	
func _ready():
	PlayerStats.connect("player_died", self, "_on_died")
	MainInstances.Player = self
	
func _exit_tree():
	MainInstances.Player = null

func _physics_process(delta):
	just_jumped = false
	
	match state:
		MOVE:
			var input_vector = get_input_vector()
			apply_horizontal_force(input_vector, delta)
			apply_friction(input_vector)
			update_snap_vector()
			jump_check()
			apply_gravity(delta)
			update_animtaions(input_vector)
			move()
			wall_slide_check()
			
		WALL_SLIDE:
			spriteAnimator.play("Wall Skide")
			
			var wall_axis = get_wall_axis()
			if wall_axis != 0:
				sprite.scale.x = wall_axis
			
			wall_slide_jump_check(wall_axis)
			wall_slide_drop_check(delta)
#			wall_slide_fast_slide_check(delta)
			move()
			wall_detach(delta, wall_axis)
	
	
	
	if Input.is_action_pressed("fire") and fireBulletTimer.time_left  == 0:
		fire_bullet()
	if Input.is_action_pressed("fire_missile") and fireBulletTimer.time_left ==0:
		if PlayerStats.missiles > 0:
			fire_missile()
			
	
func fire_bullet():
	var bullet = Utils.instance_scene_on_main(PlayerBullet, muzzle.global_position)
	bullet.velocity = Vector2.RIGHT.rotated(gun.rotation) * BULLET_SPEED   #从正右.RIGHT方开始转，是因为节点的rotation值，是从正右方开始算，这样刚好枪的rotation就等于向量方向了，有点666
	bullet.velocity.x *= sprite.scale.x #因为角色的sprite会根据面向翻转（rotation不会变），所以子弹速度的也要跟着转一下面向
	bullet.rotation = bullet.velocity.angle() #用最终的速度角度，旋转子弹的方向（角度已经包含了flip的效果），sprite不能用是因为sprite没有方向
	fireBulletTimer.start()

func fire_missile():
	var missile = Utils.instance_scene_on_main(PlayerMissile, muzzle.global_position)
	missile.velocity = Vector2.RIGHT.rotated(gun.rotation) * MISSILE_BULLET_SPEED
	missile.velocity.x *= sprite.scale.x
	motion -= missile.velocity * 0.25
	missile.rotation = missile.velocity.angle()
	fireBulletTimer.start()
	PlayerStats.missiles -= 1

func create_dust_effect():
	var dust_position = global_position
	dust_position.x += rand_range(-4, 4)
	Utils.instance_scene_on_main(DustParticle, dust_position) #调用自建脚本的func，创建实例
#	var dustEffect = DustParticle.instance()
#	get_tree().current_scene.add_child(dustEffect)
#	dustEffect.global_position = dust_position
	
	
	
func get_input_vector():
	# get the input vector
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	return input_vector
	
func apply_horizontal_force(input_vector, delta):
	if input_vector.x != 0:
		motion.x += input_vector.x * ACCELERATION * delta
		motion.x = clamp(motion.x, -MAX_SPEED, MAX_SPEED)
	
func apply_friction(input_vector):
	if input_vector.x == 0 and is_on_floor():
		motion.x = lerp(motion.x, 0, FRICTION)
	
func update_snap_vector():
	if is_on_floor():
		snap_vector = Vector2.DOWN
	
func jump_check():
	if is_on_floor() or coyoteJumpTimer.time_left > 0:
		if Input.is_action_just_pressed("jump") :
			Utils.instance_scene_on_main(JumpEffect, global_position)
			jump(JUMP_FORCE)
			just_jumped = true
	else:
		if Input.is_action_just_released("jump") and motion.y < -JUMP_FORCE/2: #确保还在往上跳，且速度没有超过一半，不判断的话会有奇怪的事情发生
			motion.y = -JUMP_FORCE / 2
		if Input.is_action_just_pressed("jump") and double_jump == true:
			jump(JUMP_FORCE * .75)
			double_jump = false
			
func jump(force):
	motion.y = -force
	snap_vector = Vector2.ZERO


func apply_gravity(delta):
	if not is_on_floor():
		motion.y += GRAVITY * delta
		motion.y = min(motion.y, JUMP_FORCE)   #确保下落速度不会超过跳跃最高速
	
func update_animtaions(input_vector):
	var facing = sign(get_local_mouse_position().x)
	if facing !=0:
		sprite.scale.x = facing  #根据鼠标和节点的x相对位置的正负来决定面向
	
	if input_vector.x != 0:
#		sprite.scale.x = sign(input_vector.x)  #仅在移动时判断面向，这样停下来的时候会面朝正确的方向
		spriteAnimator.play("Run")
		spriteAnimator.playback_speed = input_vector.x * sprite.scale.x  #移动方向 * 面对方向（相同时正放，不同时倒放）用手柄输入的话，这里似乎还会降低动画播放速度
	else:
		spriteAnimator.playback_speed = 1
		spriteAnimator.play("Idle")
		
	if not is_on_floor():
		spriteAnimator.play("Jump")
	
	
func move():
	var was_in_air = not is_on_floor()
	var was_on_floor = is_on_floor()
	var last_motion = motion
	var last_position = position
	
	motion = move_and_slide_with_snap(motion, snap_vector * 4, Vector2.UP, true, 4, deg2rad(MAX_SLOPE_ANGLE))
	
	#landing
	if was_in_air and is_on_floor():  #刚才在空中，现在在地上==降落
		motion.x = last_motion.x
		Utils.instance_scene_on_main(JumpEffect, global_position)
		double_jump = true
		
	
	
	#just left ground
	if was_on_floor and not is_on_floor() and not just_jumped:   #刚才在地上，现在在空中，但是没有跳
		motion.y = 0
		position.y = last_position.y
		coyoteJumpTimer.start()
	
	#prevent sliding (hack)
	if is_on_floor() and get_floor_velocity().length() == 0 and abs(motion.x) < 1:  #这里判断了地面没有动（防止以后，运动型地面会没法带着人走）
		position.x = last_position.x

func wall_slide_check():
	if not is_on_floor() and is_on_wall():
		state = WALL_SLIDE
		double_jump = true
		create_dust_effect()
	
func get_wall_axis():
	#用test_move方法来和获取在墙的那一边，注意test_move返回true代表这个方向有碰撞（类似 is_colliding 之类的）
	var is_right_wall = test_move(transform, Vector2.RIGHT)
	var is_left_wall = test_move(transform, Vector2.LEFT)
#	墙在右边，返回向左的方向；反之，墙在左边，返回向右的方向
	return int(is_left_wall) - int(is_right_wall)
	
func wall_slide_jump_check(wall_axis):
	if Input.is_action_just_pressed("jump"):
		motion.x = wall_axis * MAX_SPEED
		motion.y = -JUMP_FORCE / 1.25
		state = MOVE
		var dust_position = global_position + Vector2(wall_axis * 4, -1) #根据当前贴的墙的方向，让动画向反方向偏移
		var dust = Utils.instance_scene_on_main(WallDustEffect, dust_position )
		dust.scale.x = wall_axis  #根据当前贴的墙的方向，调整动画的方向
		
func wall_slide_drop_check(delta):
	var max_slide_speed = WALL_SLIDE_SPEED
	if Input.is_action_pressed("ui_down"):
		max_slide_speed = MAX_WALL_SLIDE_SPEED
	motion.y = min(motion.y + GRAVITY * delta, max_slide_speed)



	motion.y = min(motion.y + GRAVITY * delta, max_slide_speed)
	
func wall_detach(delta, wall_axis):
	if Input.is_action_just_pressed("ui_right"):
		motion.x = ACCELERATION * delta
		state = MOVE
		
	if Input.is_action_just_pressed("ui_left"):
		motion.x = - ACCELERATION * delta
		state = MOVE
	if wall_axis == 0 or is_on_floor():
		state = MOVE

func _on_Hurtbox_hit(damage):
	if not invincible:
		PlayerStats.health -= damage
		BlinkAnimator.play("Blink")


func _on_died():
	queue_free()
