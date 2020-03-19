/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(vk_up))
{
	x++;
}

if (keyboard_check_pressed(vk_down))
{
	x--;
}

y = x&~63;