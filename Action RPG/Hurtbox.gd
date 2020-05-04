extends Area2D



const HitEffect = preload("res://Effects/HitEffect.tscn")

var invincible = false setget set_invencible

onready var timer = $Timer

signal hit(damage, knockback_vector)
signal invincibility_started
signal invincibility_ended

func set_invencible(value):
	invincible = value
	if invincible == true:
		emit_signal("invincibility_started")
	else:
		emit_signal("invincibility_ended")
		
func start_invincibility(duration):
	self.invincible = true
	timer.start(duration)

func create_hit_effect():
	var effect = HitEffect.instance()
	var main = get_tree().current_scene
	main.add_child(effect)
	effect.global_position = global_position


func _on_Timer_timeout():
	self.invincible = false


func _on_Hurtbox_invincibility_started():
	set_deferred("monitorable", false)
#	monitorable = false  在physics_process中，不允许直接改变碰撞检查开关，使用set_deferred方法，在所有运算结束后再改变


func _on_Hurtbox_invincibility_ended():
	set_deferred("monitorable", true)
