/// @description Insert description here
// You can write your code in this editor

switch (image_index)
	{
	case 0:
		with (obj_Bat)
			{
			image_xscale = 1.5;
			alarm[0] = room_speed * 10;
			}
		break;
	case 1:
		{
		with(obj_Ball)
			{
			speed = spd;
			}
		break;
		}
	
	}
instance_destroy();
