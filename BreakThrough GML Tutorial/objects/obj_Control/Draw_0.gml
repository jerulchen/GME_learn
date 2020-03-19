/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white);
draw_set_font(fnt_Game);
draw_set_halign(fa_left);
draw_text(20,10, "Score :" + string(global.player_score));
draw_set_halign(fa_right);
draw_text(room_width - 20, 10, "HI SCORE :" + string(global.high_score));
var _x = (room_width / 2) -  ((sprite_get_width(spr_Bat) / 2) * (global.player_lives - 1));
repeat (global.player_lives)
{
draw_sprite_ext(spr_Bat, 0, _x, room_height - (sprite_get_height(spr_Bat) * 1) , 0.75, 0.75, 1, c_white, 0.5);
_x += sprite_get_width(spr_Bat);
}

if (state == "START")
	{
	var c = c_red;
	var a = random(1);
	draw_set_halign(fa_center);
	draw_text_transformed_color(room_width / 2, room_height * 0.65,"按 **空格键** 来发射",2,2,0,c,c,c,c,a);
	}