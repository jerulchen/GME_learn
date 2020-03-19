/// @description Insert description here
// You can write your code in this editor

var _dir = direction - 180;
while (place_meeting(x, y, other))
{
	x += lengthdir_x(1, _dir);
	y += lengthdir_y(1, _dir);
}
move_bounce_all(true);

global.player_score += 15;

if (speed < 12)
{
speed += 0.1;
}

instance_destroy(other);
