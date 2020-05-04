extends Node2D

const GrassEffect = preload("res://Effects/GrassEffect.tscn")


		
func create_grass_effect():
	var parent = get_parent()
	var grassEffect = GrassEffect.instance()
	parent.add_child(grassEffect)
	grassEffect.global_position = global_position


func _on_Hurtbox_hit(damage, knockback_vector):
	create_grass_effect()
	queue_free()
