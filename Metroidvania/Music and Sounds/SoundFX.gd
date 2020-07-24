extends Node

var sounds_path = "res://Music and Sounds/"

var sounds = {
	"Bullet" : load(sounds_path + "Bullet.wav"),
	"Click" : load(sounds_path + "Click.wav"),
	"EnemyDie" : load(sounds_path + "EnemyDie.wav"),
	"Explosion" : load(sounds_path + "Explosion.wav"),
	"Hurt" : load(sounds_path + "Hurt.wav"),
	"Jump" : load(sounds_path + "Jump.wav"),
	"Music" : load(sounds_path + "Music.wav"),
	"Pause" : load(sounds_path + "Pause.wav"),
	"Powerup" : load(sounds_path + "Powerup.wav"),
	"Step" : load(sounds_path + "Step.wav"),
	"Unpause" : load(sounds_path + "Unpause.wav") 
	
}

onready var soundPlayers = get_children()

func play(sound_string, pitch_scale = 1 , volume = 0):
	for soundPlayer in soundPlayers:
		if not soundPlayer.playing:
			soundPlayer.pitch_scale = pitch_scale
			soundPlayer.volume_db = volume
			soundPlayer.stream = sounds[sound_string]
			soundPlayer.play()
			return
	print("Too many sounds playing at once")


