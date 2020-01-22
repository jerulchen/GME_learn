/// @description Insert description here
// You can write your code in this editor

switch(room)
{

case rm_game:
	draw_text(20,  20,  "SCORE: " + string(score));
	draw_text(20,  60,  "LIVES: " + string(lives));
	break;
	
case rm_start:
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	var c = c_yellow;
	draw_text_transformed_colour(room_width / 2 , room_height *0.3 , "SPACE ROCKS" , 3,3,0,c,c,c,c,1);
	draw_text(room_width / 2, room_height / 2, 
	@"Scroe 1,000 points to win!

UP/W : move
LEFT/RIGHT/A/D : change direction
SPACE : shoot

>>PRESS ENTER TO START<<");
	draw_set_halign(fa_left);
	draw_set_valign(fa_top)
	break;
	
	
case rm_win:
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	var c = c_lime;
		draw_text_transformed_colour(room_width / 2 , room_height * 0.3, "YOU WIN!",3,3,0,c,c,c,c,1);
		draw_text(room_width / 2 , room_height / 2,"PRESS ENTER TO RESTART");
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	break;
	
	
case rm_gameover:
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	var c = c_red;
		draw_text_transformed_color(room_width / 2 , room_height * 0.3 , "GAME OVER",3,3,0,c,c,c,c,1);
		draw_text(room_width / 2, room_height / 2, "FINAL SCORE : " + string(score));
		draw_text(room_width / 2 , room_height * 0.66, "PRESS ENTER TO RESTART");
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	break;
}



