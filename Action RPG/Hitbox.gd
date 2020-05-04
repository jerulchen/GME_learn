extends Area2D

export(int) var damage = 1
var knockback_vector = Vector2.ZERO


func _on_Hitbox_area_entered(hurtbox):
	hurtbox.emit_signal("hit", damage, knockback_vector)
