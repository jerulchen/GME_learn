/// @description Insert description here
// You can write your code in this editor
if (instance_number(obj_Brick) <= 0)
	{
	room_restart();
	}
else
	{
	if (state == "GAMEOVER")
		{
		if keyboard_check(vk_anykey)
			{
			global.player_score = 0;
			global.player_lives = 3;
			room_restart();
			}
		}
	}
	
	
