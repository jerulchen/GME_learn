/// @description Insert description here
// You can write your code in this editor

if (keyboard_check(vk_left) || keyboard_check(ord("A")))
{
	if (x > sprite_get_xoffset(sprite_index) + spd)
	{
		x -= spd;
	}
	else
	{
		x = sprite_get_xoffset(sprite_index);
	}
}

if (keyboard_check(vk_right) || keyboard_check(ord("D")))
{
	if (x < room_width - sprite_get_xoffset(sprite_index) - spd)
	{
		x += spd;
		
	}
	else
	{
		x = room_width - sprite_get_xoffset(sprite_index);
	}
}

with (obj_Ball)
{
	if !go x = other.x;
}