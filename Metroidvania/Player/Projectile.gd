extends Node2D

const ElplosionEffect = preload("res://Effects/ElplosionEffect.tscn")

var velocity = Vector2.ZERO

func _process(delta):
	position += velocity * delta

# warning-ignore:unused_argument
func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()


# warning-ignore:unused_argument
func _on_Hitbox_body_entered(body):
	Utils.instance_scene_on_main(ElplosionEffect, global_position)
	queue_free()


# warning-ignore:unused_argument
func _on_Hitbox_area_entered(area):
	Utils.instance_scene_on_main(ElplosionEffect, global_position)
	queue_free()
