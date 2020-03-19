/// @description Insert description here
// You can write your code in this editor

if (bbox_left <0  || bbox_right > room_width)
{
	x = clamp(x, sprite_get_xoffset(sprite_index), room_width - sprite_get_xoffset(sprite_index));
	hspeed *= -1;
}

if (bbox_top < 0)
{
	vspeed *= -1;
	
	
}

else
{
	if (bbox_bottom > room_height)
	{
		global.player_lives -= 1;
		if (global.player_lives <= 0)
			{
			if (global.player_score > global.high_score)
				{
				global.high_score = global.player_score;
				}
			with (obj_Control)
				{
				state = "GAMEOVER";
				}
			}
	else
		{
		instance_create_layer(xstart, ystart, layer, obj_Ball);
		
		}
		
		instance_destroy();
	}
}

if (speed < 12)
{
	speed += 0.1;
	
}

direction += 2 - random(4);