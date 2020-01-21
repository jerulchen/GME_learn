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
	var c = c_yellow;
	draw_text_transformed_colour(room_width / 2 , 100 , "SPACE ROCKS" , 3,3,0,c,c,c,c,1);
	draw_text(room_width / 2, 200, 
	@"Scroe 1,000 points to win!
	
	UP/W : move
	LEFT/RIGHT/A/D : change direction
	SPACE : shoot
	
	>>PRESS ENTER TO START<<");
	
	break;
	
	
case rm_win:
	break;
	
	
case rm_gameover:
	break;
}



