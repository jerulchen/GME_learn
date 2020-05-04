extends KinematicBody2D

const EnemyDeathEffect = preload("res://Effects/EnemyDeathEffect.tscn")

onready var playerDetectionZone = $PlayerDetectionZone

export(int) var ACCELERATION = 300
export(int) var MAX_SPEED = 40
export(int) var FRICTION = 200


enum {
	IDLE,
	WANDER,
	CHASE
}

var state = CHASE

var velocity = Vector2.ZERO
var knockback = Vector2.ZERO

onready var stats = $Stats
onready var sprite = $AnimatedSprite
onready var hurtbox = $Hurtbox
onready var softCollision = $SoftCollision
onready var wanderController = $WanderController

func _ready():
	state = pick_random_state([IDLE, WANDER])

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, FRICTION * delta)
	knockback = move_and_slide(knockback)
	
	match state:
		IDLE:
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
			seek_player()
			
			if wanderController.get_time_left() == 0:
				update_wander()
			
		WANDER:
			seek_player()
			
			if wanderController.get_time_left() == 0:
				update_wander()
				
			accelerate_towards_point(wanderController.target_position, delta)
		
			
			if global_position.distance_to(wanderController.target_position) <= MAX_SPEED * delta:
				update_wander()
		CHASE:
			var player = playerDetectionZone.player
			if player != null:
				accelerate_towards_point(player.global_position, delta)
				
			else:
				state = IDLE
	if softCollision.is_colliding():
		velocity += softCollision.get_push_vector() * delta * 400
	velocity = move_and_slide(velocity)

func update_wander():
	state = pick_random_state([IDLE, WANDER])
	wanderController.start_wander_timer(rand_range(1, 3))
	

func accelerate_towards_point(point, delta):
	var direction = global_position.direction_to(point).normalized()
	velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
	sprite.flip_h = velocity.x < 0  #true == 1 小于0就翻转

func seek_player():
	if playerDetectionZone.can_see_player():
		state = CHASE
	
func pick_random_state(state_list):
	state_list.shuffle()
	return state_list.pop_front()
	

func _on_Hurtbox_hit(damage, knockback_vector):
	stats.health -= damage
	knockback = knockback_vector* 150
	hurtbox.create_hit_effect()


func _on_Stats_no_health():
	queue_free()
	var enemyDeathEffect = EnemyDeathEffect.instance()
	get_parent().add_child(enemyDeathEffect)
	enemyDeathEffect.global_position = global_position
