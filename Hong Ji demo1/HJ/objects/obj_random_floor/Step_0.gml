/// @description Insert description here
// You can write your code in this editor

var _tmp;

if (keyboard_check_pressed(ord("1")))
{
	scr_map_int();
	repeat(timer)scr_random_floor_a();
	scr_creat_floor();
}


if (keyboard_check_pressed(ord("2")))
{
	scr_map_int();
	scr_tiles_fill();
	repeat(timer)scr_random_floor_b();
}

