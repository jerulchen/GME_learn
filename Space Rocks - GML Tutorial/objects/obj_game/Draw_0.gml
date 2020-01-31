/// @description Insert description here
// You can write your code in this editor

switch(room)
{

case rm_game:
	draw_text(20,  20,  "SCORE: " + string(score));
	draw_text(20,  60,  "LIVES: " + string(lives));
	
	if (instance_exists(obj_ship))
	{
	draw_text(20,  180, "SPEED: " + string(obj_ship.speed));
	draw_text(20,  220, "ATK SPD: " + string(shootspd));
	}
	draw_set_halign(fa_right);
	draw_text(room_width - 20 ,20, "LEVEL :" + string(shiplevel));
	draw_text(room_width - 20 ,60, "TIME :" + string(floor(gametime/room_speed)));
	draw_set_halign(fa_left);

	
	draw_text(20,  100, "GUN: " + string(gun));
	if (alarm [2] >0)
	{
	draw_text(20,  140, "GUN TIME: " + string(alarm[2] / room_speed)); 
	}
	if (lives >=1 && !instance_exists(obj_ship) && alarm[1] > 0)
	{
	var c = c_yellow;
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed_color(room_width/2 , 20, "SHIP WILL RESPAWN IN " + string(floor(alarm[1]/room_speed)) + " S",1.5,1.5,0,c,c,c,c,1);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	}
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

case rm_boss:

	draw_text(20,  20,  "SCORE: " + string(score));
	draw_text(20,  60,  "LIVES: " + string(lives));
	
	if (instance_exists(obj_ship))
	{
	draw_text(20,  180, "SPEED: " + string(obj_ship.speed));
	draw_text(20,  220, "ATK SPD: " + string(shootspd));
	}
	draw_set_halign(fa_right);
	draw_text(room_width - 20 ,20, "LEVEL :" + string(shiplevel));
	draw_text(room_width - 20 ,60, "TIME :" + string(floor(gametime/room_speed)));
	draw_set_halign(fa_left);

	
	draw_text(20,  100, "GUN: " + string(gun));
	if (alarm [2] >0)
	{
	draw_text(20,  140, "GUN TIME: " + string(alarm[2] / room_speed)); 
	}
	if (lives >=1 && !instance_exists(obj_ship) && alarm[1] > 0)
	{
	var c = c_yellow;
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed_color(room_width/2 , 20, "SHIP WILL RESPAWN IN " + string(floor(alarm[1]/room_speed)) + " S",1.5,1.5,0,c,c,c,c,1);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	}



	if (alarm[4] > 0)
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		var c = c_red;
		draw_text_transformed_color(room_width / 2 , room_height * 0.3 , "BOSS WILL COME IN",3,3,0,c,c,c,c,1);
		draw_text_transformed_color(room_width / 2 , room_height  / 2  , string(floor(alarm[4] / room_speed)) + "S",5,3,0,c,c,c,c,1);
		
	
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
	}
	if (instance_exists(obj_boss_01))
	{
	var lifebar_width = 300 ; 
	var lifebar_height = 5 ; 
	var lifebar_dis = obj_boss_01.sprite_height / 2;

	var bosslivesper = bosslives / bossmaxlives ;



	var c1 = c_red;
	var c2 = c_yellow;

	draw_rectangle_color(obj_boss_01.x - lifebar_width /2 , obj_boss_01.y  - lifebar_dis - lifebar_height, obj_boss_01.x + lifebar_width / 2 , obj_boss_01.y - lifebar_dis + lifebar_height,c1,c1,c1,c1,true);
	draw_rectangle_color(obj_boss_01.x - lifebar_width /2 , obj_boss_01.y  - lifebar_dis - lifebar_height, obj_boss_01.x - lifebar_width / 2  + lifebar_width * bosslivesper, obj_boss_01.y - lifebar_dis + lifebar_height,c2,c2,c2,c2,false);


		}
	break;
}

