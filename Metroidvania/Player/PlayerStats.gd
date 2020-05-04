extends Resource
class_name PlayerStats

var max_health = 4 setget set_max_health
var health = max_health setget set_health

signal player_died
signal health_changed
signal max_health_changed


func set_health(value):
	if value < health:
		Event.emit_signal("add_screenshake", 0.25, 0.5)
	health = clamp(value, 0, max_health)
	emit_signal("health_changed", health)
	if health == 0:
		emit_signal("player_died")


func set_max_health(value):
	max_health = max(value, 1)
	self.health = min(value, value)
	emit_signal("max_health_changed", max_health)
