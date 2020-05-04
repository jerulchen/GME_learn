extends Control
var playerStats = ResourceLoader.PlayerStats

onready var empty = $Empty
onready var full = $Full

var health_bar_max = playerStats.max_health setget set_health_bar_max
var health_bar = 1 setget set_health_bar

func _ready():
	health_bar = health_bar_max
	playerStats.connect("health_changed", self, "set_health_bar")
	playerStats.connect("max_health_changed", self, "set_health_bar_max")

func set_health_bar(value):
	health_bar = clamp(value, 0, health_bar_max)
	if full != null:
		full.rect_size.x = full.texture.get_width() * health_bar

func set_health_bar_max(value):
	health_bar_max = max(value, 1)
	self.health_bar = min(value, health_bar)
	if empty != null:
		empty.rect_size.x = empty.texture.get_width() * health_bar_max

	
	
