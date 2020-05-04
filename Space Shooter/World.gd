extends Node


var score = 0 setget set_score

onready var scoreLable = $ScoreLabel

func set_score(value):
	score = value
	update_score_label()

func _on_Enemy_score_up():
	self.score += 10
	
	
func update_score_label():
	scoreLable.text = "Score = " + str(score)
	
func update_save_data():
	var save_data = SaveAndLoad.load_data_from_file() #因为SaveAndLoad脚本是Singleton的，所以可以直接读取，不需要提前预载,直接执行读取文件的func，得到dict格式数据
	if score > save_data.highscore:
		save_data.highscore = score
		SaveAndLoad.save_data_to_file(save_data)

func _on_Ship_player_death():
	update_save_data()
	yield(get_tree().create_timer(1), "timeout")  #yield--等待收到对象信号后，继续执行
	get_tree().change_scene("res://GameOverScreen.tscn")
