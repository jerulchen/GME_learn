extends KinematicBody2D

const EnemyDeathEffect = preload("res://Effects/EnemyDeathEffect.tscn")

export(int) var MAX_SPEED = 15
var motion = Vector2.ZERO

onready var stats = $EnemyStats

func _on_Hurtbox_hit(damage):
	stats.health -= damage


func _on_EnemyStats_ememy_died():
	queue_free()

func _exit_tree():
	Utils.instance_scene_on_main(EnemyDeathEffect, global_position)
