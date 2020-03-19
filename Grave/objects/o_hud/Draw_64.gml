

var hp_x = 8;
var hp_y = 8;
var hp_width = 198;
var hp_height = 6;

if instance_exists(o_skeleton)
{
	draw_hp = lerp (draw_hp, o_skeleton.hp, 0.1);
	draw_max_hp = o_skeleton.max_hp;

}
else
{
	draw_hp = lerp(draw_hp, 0, 0.1);  //当前血量的显示缓动
	
}

//当前血量缓动部分
var hp_percent = draw_hp / draw_max_hp;
draw_rectangle_color(hp_x,hp_y, hp_x + hp_width * hp_percent, hp_y + hp_height,
				c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
				
				
				

if instance_exists(o_skeleton)
{
	var hp_percent = o_skeleton.hp / draw_max_hp;

}
else
{
	var hp_percent = 0;
	
}		
//当前血量真实部分

draw_rectangle_color(hp_x,hp_y, hp_x + hp_width * hp_percent, hp_y + hp_height,
				c_white, c_white, c_white, c_white, false);

//血槽外框上下
draw_line_width_color(hp_x - 1, hp_y - 1, hp_x + hp_width, hp_y - 1, 1, c_dkgray, c_dkgray);
draw_line_width_color(hp_x - 1, hp_y + hp_height, hp_x + hp_width, hp_y +hp_height, 1, c_dkgray, c_dkgray);

//血槽外框左右
draw_line_width_color(hp_x - 1, hp_y - 1, hp_x - 1, hp_y + hp_height,1,c_dkgray, c_dkgray);
draw_line_width_color(hp_x + hp_width, hp_y - 1, hp_x + hp_width, hp_y + hp_height, 1, c_dkgray, c_dkgray);


if !instance_exists(o_skeleton) exit;

draw_set_font(f_one); //设置字体

//显示击杀数量
var text = "Kills: " + string(o_skeleton.kills);
var text_width = string_width(text);
var text_height = string_height(text);
var start_x = 8;
var start_y = 20;
var padding_x = 6;
var padding_y = 4;
draw_rectangle_color(start_x, start_y, start_x + text_width + padding_x, start_y + text_height + padding_y, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
draw_text(start_x+padding_x/2, start_y+padding_y, text);


//显示等级，根据击杀数量宽度自适应
var text = "Level: " + string(o_skeleton.level);
start_x += text_width + padding_x * 2;
var text_width = string_width(text);
var text_height = string_height(text);
var padding_x = 6;
var padding_y = 4;
draw_rectangle_color(start_x, start_y, start_x + text_width + padding_x, start_y + text_height + padding_y, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
draw_text(start_x+padding_x/2, start_y+padding_y, text);