/// @description Insert description here
// You can write your code in this editor

if !go
{
	if keyboard_check_pressed(vk_space)
	{
		go  = true;
		speed = spd;
		direction = dir;
		with(obj_Control)
		{
		state = "GAMEING"
		}
	}

}