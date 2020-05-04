extends Node
const SAVE_DATA_PATH = "res://save_data.json"

var default_save_data = {
	highscore = 0
}

func save_data_to_file(save_data):
	var json_string = to_json(save_data) #吧save_data转换成json格式的str
	var save_file = File.new()  #创建一个新文件
	save_file.open(SAVE_DATA_PATH, File.WRITE)   #打开指定路径的文件，（准备）写入
	save_file.store_line(json_string) #把内容写入成一行文本
	save_file.close() #关掉文件
	
func load_data_from_file():
	var save_file = File.new()
	if not save_file.file_exists(SAVE_DATA_PATH):  #读取前要前判断下文件是否存在，如果不存在就返回默认值
		return default_save_data
		
	save_file.open(SAVE_DATA_PATH, File.READ) #把指定路径的文件打开，（准备）读取
	var save_data = parse_json(save_file.get_as_text())  #get_as_text把json转成纯文本，再用parse_json转换成dict类型
	save_file.close()
	return save_data #返回dict格式的存档数据



