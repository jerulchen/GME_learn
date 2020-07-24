extends "res://Player/Projectile.gd"





func _ready():
	SoundFx.play("Bullet", rand_range(0.6, 1.1))
	set_process(false)

